/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package kr.quantumsoft.koreasurvey.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.quantumsoft.koreasurvey.model.Answers;
import kr.quantumsoft.koreasurvey.model.Options;
import kr.quantumsoft.koreasurvey.model.Questions;
import kr.quantumsoft.koreasurvey.model.Tradings;
import kr.quantumsoft.koreasurvey.model.Users;
import kr.quantumsoft.koreasurvey.service.AnswersService;
import kr.quantumsoft.koreasurvey.service.OptionsService;
import kr.quantumsoft.koreasurvey.service.QuestionsService;
import kr.quantumsoft.koreasurvey.service.SurveysService;
import kr.quantumsoft.koreasurvey.service.TradingsService;
import kr.quantumsoft.koreasurvey.service.UsersService;
import kr.quantumsoft.koreasurvey.utils.ProjectConstants;
import kr.quantumsoft.koreasurvey.vo.QuestionVO;
import kr.quantumsoft.koreasurvey.vo.RequestArrayVO;

/**  
 * @Class Name : SurveysController.java
 * @Project Name : koreasurvey
 * @Description : 
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 5. 15.                     최초생성
 * 
 * @author QuantumSoft Inc.
 * @since 2015. 8.
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by QuantumSoft Inc. All right reserved.
 */
@Controller
@RequestMapping(value="surveys")
public class SurveysController {
	private static final Logger logger = LoggerFactory.getLogger(SurveysController.class);
	
	@Autowired
	SurveysService surveyService;
	
	@Autowired
	QuestionsService questionService;
	
	@Autowired
	OptionsService optionService;
	
	@Autowired
	AnswersService answerService;
	
	@Autowired
	UsersService userService;
	
	@Autowired
	TradingsService tradingService;
	
	@RequestMapping(value={"", "/"})
	public String index(Model model, Authentication auth, Integer surveyId) {
		Users user = (Users)auth.getPrincipal();
		Users dbUser = userService.selectUserById(user.getId());
		user.setPoint(dbUser.getPoint());
		
		model.addAttribute("surveyInfo", surveyService.selectSurveysById(surveyId));
		
		List<Questions> questions = questionService.selectQuestionsBySurveyId(surveyId);
		
		/*for (Questions questionItem : tmpquestions) {
			QuestionVO tmpVO = new QuestionVO();
			
			tmpVO.setQuestionModel(questionItem);
			
			if(tmpVO.getType() == 0) {
				List<Options> itemOptions = optionService.selectOptionsByQuestionId(tmpVO.getId());
				
				tmpVO.setListOption(itemOptions);
			}
			
			questions.add(tmpVO);
		}*/
		
		model.addAttribute("listQuestions", questions);
		
		return "survey";
	}
	
	@ResponseBody
	@RequestMapping(value="submitAnswer", method=RequestMethod.POST)
	public void submitAnswer(/*RequestArrayVO req, List<Answers> answer, */String reqJson, Authentication auth) {
		Users user = (Users)auth.getPrincipal();
		Integer totalAmount = 0;
		
		ObjectMapper objMapper = new ObjectMapper();
		List<Answers> answer = null;
		try {
			answer = Arrays.asList(objMapper.readValue(reqJson, Answers[].class));
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(answer != null) {
			// Answer에 기록함.
			for (Answers answerItem : answer) {
				answerItem.setUserid(user.getId());
				answerService.insertAnswers(answerItem);
				
				totalAmount += answerItem.getRewardpoint();
			}
			
			// 배당함.
			Integer myPoint = (int) Math.floor((totalAmount/10)*ProjectConstants.MY_POINT_RATE);
			Integer parentPoint = (int) Math.floor((totalAmount/10)*ProjectConstants.PARENT_POINT_RATE);
			Tradings trading = new Tradings();
			trading.setType(2);
			
			user.setPoint(user.getPoint()+myPoint);
			userService.updateUser(user);
			
			trading.setAmount(myPoint);
			trading.setUserid(user.getId());
		
			tradingService.insertTradings(trading);
			
			if(user.getRecommanderid() == 0) return;
			
			// 첫번째 윗사람
			Users firstParent = userService.selectUserById(user.getRecommanderid());
			firstParent.setPoint(firstParent.getPoint()+parentPoint);
			userService.updateUser(firstParent);
			
			trading.setAmount(parentPoint);
			trading.setUserid(firstParent.getId());
			
			tradingService.insertTradings(trading);
			
			if(firstParent.getRecommanderid() == 0) return;
			
			// 두번째 윗사람
			Users secondParent = userService.selectUserById(firstParent.getRecommanderid());
			secondParent.setPoint(secondParent.getPoint()+parentPoint);
			userService.updateUser(secondParent);
			
			trading.setUserid(secondParent.getId());
			
			tradingService.insertTradings(trading);
		}
	}
}

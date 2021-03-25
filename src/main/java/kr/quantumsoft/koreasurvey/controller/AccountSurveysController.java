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
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.quantumsoft.koreasurvey.model.Options;
import kr.quantumsoft.koreasurvey.model.Questions;
import kr.quantumsoft.koreasurvey.model.Surveys;
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
import kr.quantumsoft.koreasurvey.vo.SurveyVO;

/**  
 * @Class Name : SurveysController.java
 * @Project Name : koreasurvey
 * @Description : 
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 4. 13.                     최초생성
 * 
 * @author QuantumSoft Inc.
 * @since 2015. 8.
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by QuantumSoft Inc. All right reserved.
 */
@Controller
@RequestMapping(value="/m/account/surveys")
public class AccountSurveysController {
	private static final Logger logger = LoggerFactory.getLogger(AccountSurveysController.class);
	private static final Integer COUNTS_ITEMS = 20;
	
	@Autowired
	SurveysService surveyService;
	
	@Autowired
	QuestionsService questionService;
	
	@Autowired
	OptionsService optionService;
	
	@Autowired
	AnswersService answerService;
	
	@Autowired
	UsersService usersService;
	
	@Autowired
	TradingsService tradingService;
	
	@RequestMapping(value={"", "/"})
	public String index(Model model, Authentication auth) {
		Users user = (Users)auth.getPrincipal();
		Users dbUser = usersService.selectUserById(user.getId());
		user.setPoint(dbUser.getPoint());
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("userid", user.getId());
		param.put("offset", 0);
		param.put("limit", COUNTS_ITEMS);
		
		List<Surveys> listSurveys = surveyService.selectSurveysByUserId(param);
		
		for(Surveys surveyItem : listSurveys) {
			Integer countUsers = answerService.countAnswersUsers(surveyItem.getId());
			if(countUsers == null) countUsers = 0;
			surveyItem.setAnswerUserCount(countUsers);
		}
		
		model.addAttribute("user", user);
		model.addAttribute("list", listSurveys);
		return "surveyList";
	}
	
	@RequestMapping(value="/new")
	public String getInsert(Model model, Authentication auth) {
		Users user = (Users)auth.getPrincipal();
		Users dbUser = usersService.selectUserById(user.getId());
		user.setPoint(dbUser.getPoint());
		
		model.addAttribute("new", new Surveys());
		model.addAttribute("user", user);
		return "surveyNew";
	}
	
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String postInsert(Surveys survey, Authentication auth) {
		Users user = (Users)auth.getPrincipal();
		
		survey.setUseremail(user.getEmail());
		survey.setUserid(user.getId());
		
		surveyService.insertSurveys(survey);
		
		return "redirect:/account/surveys";
	}
	
	@ResponseBody
	@RequestMapping(value="/saveSurveyDoc", method=RequestMethod.POST)
	public Integer saveSurveyDoc(String strObject, Authentication auth) {
		Users user = (Users)auth.getPrincipal();
		
		ObjectMapper om = new ObjectMapper();
		
		SurveyVO newSurvey = null;
		try {
			newSurvey = om.readValue(strObject, SurveyVO.class);
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
		
		newSurvey.setUseremail(user.getEmail());
		newSurvey.setUserid(user.getId());
		
		surveyService.insertSurveys(newSurvey);
		
		Integer newId = newSurvey.getId();
		
		// 문항을 등록합니다.
		for (QuestionVO qItem : newSurvey.getListQuestions()) {
			qItem.setSurveyid(newId);
			
			questionService.insertQuestions(qItem);
			
			Integer newQId = qItem.getId();
			
			if(qItem.getType() == 0) {
				for (Options oItem : qItem.getListOption()) {
					oItem.setQuestionid(newQId);
					optionService.insertOptions(oItem);
				}
			}
		}
		
		user.setPoint(user.getPoint()-newSurvey.getTotalcost());
		usersService.updateUser(user);
		
		Tradings tradingData = new Tradings();
		tradingData.setAmount(newSurvey.getTotalcost()*-1);
		tradingData.setUserid(user.getId());
		tradingData.setType(ProjectConstants.TRADING_USE);
		
		tradingService.insertTradings(tradingData);
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value="updateSurveyDoc", method=RequestMethod.POST)
	public Integer updateSurveyDoc(String strObject, Authentication auth) {
		Users user = (Users)auth.getPrincipal();
		
		ObjectMapper om = new ObjectMapper();
		
		SurveyVO targetSurvey = null;
		try {
			targetSurvey = om.readValue(strObject, SurveyVO.class);
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
		
		// 배당금 정산을 위해 이전 설문 정보를 읽음.
		Surveys previousSurvey = surveyService.selectSurveysById(targetSurvey.getId());
		
		// 새로운 데이터의 문제를 업데이트하기 위해 기존 데이터를 받음.
		List<Questions> listQuestions = questionService.selectQuestionsBySurveyId(targetSurvey.getId());
		
		// 설문 메인을 업데이트 함.
		surveyService.updateSurveys(targetSurvey);
		
		List<Integer> remainQId = new ArrayList<Integer>();
		
		for(QuestionVO qItem : targetSurvey.getListQuestions()) {
			if(qItem.getId() != null) {
				// 종전에 있던 문항을 변경
				questionService.updateQuestions(qItem);
				remainQId.add(qItem.getId());
				
				if(qItem.getType() == 0) {
					// 객관식
					for(Questions oldQuestion : listQuestions) {
						// 이전 문항 찾기
						if(oldQuestion.getId() == qItem.getId()) {
							if(oldQuestion.getType() == 0) {
								// 같은 객관식이면 보기 업데이트 및 추가
								List<Integer> remainId = new ArrayList<Integer>();
								
								for(Options option : qItem.getListOption()) {
									option.setQuestionid(qItem.getId());
									if(option.getId() == null) {
										// 새로 추가된 보기
										optionService.insertOptions(option);
									} else {
										// 종전의 보기
										optionService.updateOptions(option);
										remainId.add(option.getId());
										
										// 종전 문항 객체에서 보기 삭제... 추후 종전 문항 객체의 남은 보기들은 삭제할 것임.
										/*for(int i=0; i<oldQuestion.getOptions().size();i++) {
											if(option.getId() == oldQuestion.getOptions().get(i).getId()) {
												oldQuestion.getOptions().remove(i);
												break;
											}
										}*/
									}
								}
								
								// 종전의 문항 객체에서 남은 보기는 삭제. 남은 보기들은 삭제된 보기임.
								for(Options deletedOption : oldQuestion.getOptions()) {
									if(!remainId.contains(deletedOption.getId())) {
										optionService.deleteOptionsById(deletedOption.getId());
									}
								}
							} else {
								// 이전 문항이 주관식이면 새로운 보기 추가
								for(Options option : qItem.getListOption()) {
									option.setQuestionid(qItem.getId());
									optionService.insertOptions(option);
								}
							}
							break;
						}
					}
				} else {
					// 주관식
					for(Questions oldQuestion : listQuestions) {
						// 이전 문항 찾기
						if(oldQuestion.getId() == qItem.getId()) {
							if(oldQuestion.getType() == 0) {
								// 주관식으로 변경되었으니 이전 보기들 삭제
								for(Options deletedOption : oldQuestion.getOptions()) {
									optionService.deleteOptionsById(deletedOption.getId());
								}
							}
							
							break;
						}
					}
				}
			} else {
				// 새로 추가된 문항
				qItem.setSurveyid(targetSurvey.getId());
				
				questionService.insertQuestions(qItem);
				
				Integer newQId = qItem.getId();
				
				if(qItem.getType() == 0) {
					for (Options oItem : qItem.getListOption()) {
						oItem.setQuestionid(newQId);
						optionService.insertOptions(oItem);
					}
				}
			}
		}
		
		// 삭제된 문항 삭제하기
		for(Questions oldQuestion : listQuestions) {
			if(!remainQId.contains(oldQuestion.getId())) {
				if(oldQuestion.getType() == 0) {
					// 객관식이면 보기 모두 삭제
					optionService.deleteOptionsByQuestionId(oldQuestion.getId());
				}
				questionService.deleteQuestionById(oldQuestion.getId());
			}
		}
		
		
		Integer diffCost = previousSurvey.getTotalcost() - targetSurvey.getTotalcost();
		if(diffCost != 0) {
			// 배당금의 변화가 있음.
			user.setPoint(user.getPoint()+diffCost);
			usersService.updateUser(user);
			
			Tradings updateTrading = new Tradings();
			updateTrading.setAmount(diffCost);
			updateTrading.setType(ProjectConstants.TRADING_USE);
			updateTrading.setUserid(user.getId());
			
			tradingService.insertTradings(updateTrading);
		}
		
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value="saveQuestion", method=RequestMethod.POST)
	public Integer saveQuestion(Questions question) {
		questionService.insertQuestions(question);
		
		return question.getId();
	}
	
	@ResponseBody
	@RequestMapping(value="updateQuestion", method=RequestMethod.POST)
	public Integer updateQuestion(Questions question) {
		questionService.updateQuestions(question);
		
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value="saveOption", method=RequestMethod.POST)
	public Integer saveOption(Options option) {
		optionService.insertOptions(option);
		
		return option.getId();
	}
	
	@ResponseBody
	@RequestMapping(value="updateOption", method=RequestMethod.POST)
	public Integer updateOption(Options option) {
		optionService.updateOptions(option);
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteOptions", method=RequestMethod.POST)
	public Integer deleteOptions(Integer questionId) {
		optionService.deleteOptionsByQuestionId(questionId);
		return 0;
	}
	
	@RequestMapping(value="edit")
	public String editSurvey(Model model, Integer surveyId, Authentication auth) {
		Users user = (Users)auth.getPrincipal();
		Users dbUser = usersService.selectUserById(user.getId());
		user.setPoint(dbUser.getPoint());
		
		Surveys selectItem = surveyService.selectSurveysById(surveyId);
		List<Questions> listQuestions = questionService.selectQuestionsBySurveyId(surveyId);
		
		model.addAttribute("survey", selectItem);
		model.addAttribute("listQuestions", listQuestions);
		model.addAttribute("user", user);
		return "surveyEdit";
	}
	
	@ResponseBody
	@RequestMapping(value="deleteSurveys", method=RequestMethod.POST)
	public String deleteSurvey(String listSurveyId, Authentication auth) {
		Users user = (Users)auth.getPrincipal();
		ObjectMapper objMapper = new ObjectMapper();
		Integer refundAmount = 0;
		
		try {
			Integer[] listItem = objMapper.readValue(listSurveyId, Integer[].class);
			
			for(Integer itemIndex : listItem) {
				Surveys itemSurvey = surveyService.selectSurveysById(itemIndex);
				
				Integer countUsers = answerService.countAnswersUsers(itemIndex);
				
				refundAmount += itemSurvey.getTotalcost()-(itemSurvey.getUnitcost()*countUsers);
				
				surveyService.deleteSurveyById(itemIndex);
			}
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
		
		user.setPoint(user.getPoint()+refundAmount);
		usersService.updateUser(user);
		
		Tradings deleteTrading = new Tradings();
		deleteTrading.setAmount(refundAmount);
		deleteTrading.setType(ProjectConstants.TRADING_USE);
		deleteTrading.setUserid(user.getId());
		
		tradingService.insertTradings(deleteTrading);
		
		return "";
	}
}

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

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.quantumsoft.koreasurvey.utils.ProjectConstants;
import kr.quantumsoft.koreasurvey.utils.SpringSecurityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.quantumsoft.koreasurvey.model.Answers;
import kr.quantumsoft.koreasurvey.model.Surveys;
import kr.quantumsoft.koreasurvey.model.Tradings;
import kr.quantumsoft.koreasurvey.model.Users;
import kr.quantumsoft.koreasurvey.service.AnswersService;
import kr.quantumsoft.koreasurvey.service.SurveysService;
import kr.quantumsoft.koreasurvey.service.TradingsService;
import kr.quantumsoft.koreasurvey.service.UsersService;
import kr.quantumsoft.koreasurvey.utils.CommonUtils;
import kr.quantumsoft.koreasurvey.utils.ProjectUtils;

/**  
 * @Class Name : AccountController.java
 * @Project Name : koreasurvey
 * @Description : 
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2019. 12. 19.                     최초생성
 * 
 * @author QuantumSoft Inc.
 * @since 2015. 8.
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by QuantumSoft Inc. All right reserved.
 */
@Controller
@RequestMapping(value="/account")
public class AccountController {
	
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@Autowired
	private UsersService userService;
	
	@Autowired
	private TradingsService tradingService;
	
	@Autowired
	private SurveysService surveyService;
	
	@Autowired
	private AnswersService answersService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "account/login";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String getJoin(Model model, @RequestParam(value = "email", required = false) String email) {
		model.addAttribute("join", new Users());
		model.addAttribute("email", email);
		return "account/join";
	}

	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyUserInfo(Users user, Authentication authentication) {
		Users selectuser = userService.selectUserById(SpringSecurityUtil.getUserFromAuth(authentication).getId());
		selectuser.setAge(user.getAge());
		selectuser.setArea(user.getArea());
		selectuser.setGender(user.getGender());
		userService.updateUser(selectuser);
		return "redirect:/account/modify";
	}

	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String getModify(Model model, Authentication authentication) {
		model.addAttribute("join", new Users());
		model.addAttribute("areaList", ProjectConstants.REGION_STRINGS);
		model.addAttribute("ageList", ProjectConstants.AGE_RANGES);


		model.addAttribute("user", userService.selectUserById(SpringSecurityUtil.getUserFromAuth(authentication).getId()));
		return "account/modify";
	}


	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String postJoin(Users user) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		
		// 추천인 추가.
		if(!user.getRecommanderemail().isEmpty()) {
			Users recommanderUser = userService.selectUserByEmail(user.getRecommanderemail());
			
			if(recommanderUser != null) {
				user.setRecommanderid(recommanderUser.getId());
			}
		}
		
		userService.insertUsers(user);
		
		return "account/joinComplete";
	}
	
	@ResponseBody
	@RequestMapping(value="/searchEmail")
	public List<String> searchEmail(String term) {
		List<String> listEmail = new ArrayList<String>();
		List<Users> userList = userService.searchUsersByEmail(term);
		
		for(int i=0;i<userList.size();i++) {
			if(i<6) {
				listEmail.add(userList.get(i).getEmail());
			} else {
				break;
			}
		}
		
		return listEmail;
	}

	@ResponseBody
	@RequestMapping("/tradings")
	public List<Tradings> tradings(Authentication auth, @RequestParam("page") int page) {
		Users user = SpringSecurityUtil.getUserFromAuth(auth);
		return tradingService.selectTradingsByUserId(user.getId(), page, 5);
	}
	
	@RequestMapping(value={"", "/"})
	public String index(Model model, Authentication auth) {
		Users user = (Users)auth.getPrincipal();
		Users dbUser = userService.selectUserById(user.getId());
		user.setPoint(dbUser.getPoint());
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("userid", user.getId());
		param.put("from", CommonUtils.getDateString(-7));
		param.put("to", CommonUtils.getDateString(0)+" 23:00:00");
		
		List<Tradings> tradings = tradingService.selectTradingsByUserId(param);
		
		Integer diff = ProjectUtils.calcDiffrential(tradings);
		
		//LIMIT #{offset}, #{limit}
		param.put("offset", 0);
		param.put("limit", 5);
		
		List<Answers> joinedList = answersService.selectAnswersByUserIdGroupBySurveyId(user.getId());
				
		List<Surveys> joinedSurveys = new ArrayList<Surveys>();
		
		for(Answers answerItem : joinedList) {
			joinedSurveys.add(surveyService.selectSurveysById(answerItem.getSurveyid()));
		}
		
		model.addAttribute("diff", diff);
		model.addAttribute("tradings", tradings);
		model.addAttribute("joined", joinedSurveys);
		model.addAttribute("user", user);
		return "account";
	}
	
	@RequestMapping(value="/charge")
	public String getCharge(Model model, Authentication auth) {
		Users user = (Users)auth.getPrincipal();
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("userid", user.getId());
		param.put("from", CommonUtils.getDateString(-7));
		param.put("to", CommonUtils.getDateString(0)+" 23:00:00");
		
		List<Tradings> tradings = tradingService.selectTradingsByUserId(param);
		
		Integer diff = ProjectUtils.calcDiffrential(tradings);
		
		model.addAttribute("diff", diff);
		model.addAttribute("user", user);
		return "charge";
	}
	
	@RequestMapping(value="/charge", method=RequestMethod.POST)
	public String postCharge(Integer amount, Authentication auth) {
		Users user = (Users)auth.getPrincipal();
		
		Tradings trading = new Tradings();
		trading.setUserid(user.getId());
		trading.setType(1);
		trading.setAmount(amount);
		
		tradingService.insertTradings(trading);
		
		user.setPoint(user.getPoint()+amount);
		
		userService.updateUser(user);
		
		return "redirect:/account";
	}
}

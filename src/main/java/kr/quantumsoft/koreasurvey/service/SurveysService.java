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
package kr.quantumsoft.koreasurvey.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.quantumsoft.koreasurvey.model.SurveyExclude;
import kr.quantumsoft.koreasurvey.model.Surveys;
import kr.quantumsoft.koreasurvey.model.Users;
import kr.quantumsoft.koreasurvey.repository.AnswersSessionRepository;
import kr.quantumsoft.koreasurvey.repository.SurveyExcludeRepository;
import kr.quantumsoft.koreasurvey.repository.SurveysSessionRepository;
import kr.quantumsoft.koreasurvey.utils.ProjectConstants;

/**  
 * @Class Name : SurveysService.java
 * @Project Name : koreasurvey
 * @Description : 
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 5. 13.                     최초생성
 * 
 * @author QuantumSoft Inc.
 * @since 2015. 8.
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by QuantumSoft Inc. All right reserved.
 */
@Service
public class SurveysService {
	@Autowired
	SurveysSessionRepository repo;
	
	@Autowired
	SurveyExcludeRepository surveyExcludeRepository;

	@Autowired
	private UsersService usersService;

	@Autowired
	private AnswersSessionRepository answersSessionRepository;
	
	private static final Logger logger = LoggerFactory.getLogger(SurveysService.class);
	
	public List<SurveyExclude> getSurveyExcludeListBySurveyId(Integer surveyId) {
		return surveyExcludeRepository.getSurveyExcludeListBySurveyId(surveyId);
	}
	
	public Integer insertSurveys(Surveys survey) {
		return repo.insertSurveys(survey);
	}
	
	public Integer updateSurveys(Surveys survey) {
		return repo.updateSurveys(survey);
	}
	
	public List<Surveys> selectSurveysByUserId(HashMap<String, Object> param) {
		//return repo.selectSurveysByUserId(param);
		List<Surveys> listSurveys = repo.selectSurveysByUserId(param);
		for(Surveys surveyItem : listSurveys) {
			Integer countUsers = answersSessionRepository.countAnswersUsers(surveyItem.getId());
			if(countUsers == null) countUsers = 0;
			surveyItem.setAnswerUserCount(countUsers);
		}
		return listSurveys;
	}
	
	public List<Surveys> selectSurveysforAjax(HashMap<String, Object> param) {
		return repo.selectSurveysforAjax(param);
	}
	
	public Surveys selectSurveysById(Integer id) {
		//return repo.selectSurveysById(id);
		Surveys survey = repo.selectSurveysById(id);
		if (survey == null) {
			return null;
		}

		Integer countUsers = answersSessionRepository.countAnswersUsers(survey.getId());
		if(countUsers == null) countUsers = 0;
		survey.setAnswerUserCount(countUsers);

		return survey;
	}
	
	public Integer deleteSurveyById(Integer id) {
		return repo.deleteSurveyById(id);
	}
	
	public void exitSurvey(int surveyId, Users auth) {
		Surveys survey = this.selectSurveysById(surveyId);
		//TODO : 이 서베이가 이 사람이 만든게 맞는지 확인한다.
		if (!survey.getUserid().equals(auth.getId())) {
			throw new RuntimeException("권한이 없습니다");
		}
		Integer countUsers = answersSessionRepository.countAnswersUsers(surveyId);
		if(countUsers == null) countUsers = 0;
		survey.setAnswerUserCount(countUsers);
		//TODO : 반환 되어야 하는 포인트를 가져온다.
		int point = survey.getTotalcost()-survey.getQcount()*survey.getUnitcost()*survey.getAnswerUserCount();
		logger.debug("[exit-survey] Target Point (total, survey-id) : {}, {}", point, surveyId);

		//TODO:  유저에게 다시 돌려준다.
		usersService.addPoint(auth.getId(), point, ProjectConstants.TRADING_USE);
		//TODO : 서베이 정보를 업데이트 한다.
		survey.setStatus(ProjectConstants.SURVEY_STATE_SUSPEND);
		this.updateSurveys(survey);
    }

    public List<Surveys> search(HashMap<String, Object> param) {
		List<Surveys> surveys = repo.search(param);
		for (Surveys survey : surveys) {
			Integer countUsers = answersSessionRepository.countAnswersUsers(survey.getId());
			if(countUsers == null) countUsers = 0;
			survey.setAnswerUserCount(countUsers);

		}
		return surveys;
	}

    public void inspection(Surveys surveys) {
		repo.inspectionSurveyById(surveys.getId());
    }
}

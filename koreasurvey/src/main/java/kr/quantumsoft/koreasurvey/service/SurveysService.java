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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.quantumsoft.koreasurvey.model.Surveys;
import kr.quantumsoft.koreasurvey.repository.SurveysSessionRepository;

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
	
	public Integer insertSurveys(Surveys survey) {
		return repo.insertSurveys(survey);
	}
	
	public Integer updateSurveys(Surveys survey) {
		return repo.updateSurveys(survey);
	}
	
	public List<Surveys> selectSurveysByUserId(HashMap<String, Object> param) {
		return repo.selectSurveysByUserId(param);
	}
	
	public List<Surveys> selectSurveysforAjax(HashMap<String, Object> param) {
		return repo.selectSurveysforAjax(param);
	}
	
	public Surveys selectSurveysById(Integer id) {
		return repo.selectSurveysById(id);
	}
	
	public Integer deleteSurveyById(Integer id) {
		return repo.deleteSurveyById(id);
	}
}

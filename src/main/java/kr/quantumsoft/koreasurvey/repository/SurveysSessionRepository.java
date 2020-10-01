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
package kr.quantumsoft.koreasurvey.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.quantumsoft.koreasurvey.model.Surveys;

/**  
 * @Class Name : SurveysSessionRepository.java
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
@Repository
public class SurveysSessionRepository {
	@Autowired
	private SqlSessionTemplate session;
	
	private final String namespace = "kr.quantumsoft.koreasurvey.SurveysMapper";
	
	public Integer insertSurveys(Surveys survey) {
		return session.insert(String.format("%s.insertSurveys", namespace), survey);
	}
	
	public Integer updateSurveys(Surveys survey) {
		return session.update(String.format("%s.updateSurveys", namespace), survey);
	}
	
	public List<Surveys> selectSurveysByUserId(HashMap<String, Object> param) {
		return session.selectList(String.format("%s.selectSurveysByUserId", namespace), param);
	}
	
	public List<Surveys> selectSurveysforAjax(HashMap<String, Object> param) {
		return session.selectList(String.format("%s.selectSurveysforAjax", namespace), param);
	}
	
	public Surveys selectSurveysById(Integer id) {
		return session.selectOne(String.format("%s.selectSurveysById", namespace), id);
	}
	
	public Integer deleteSurveyById(Integer id) {
		return session.update(String.format("%s.deleteSurveyById", namespace), id);
	}
	public List<Surveys> search(HashMap<String, Object> param) {
		return session.selectList(String.format("%s.search", namespace), param);
	}


	public Integer inspectionSurveyById(Integer id) {
		return session.update(String.format("%s.inspectionSurveyById", namespace), id);
	}
}

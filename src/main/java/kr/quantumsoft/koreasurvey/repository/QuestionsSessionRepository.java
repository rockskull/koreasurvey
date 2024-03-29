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

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.quantumsoft.koreasurvey.model.Questions;

/**  
 * @Class Name : QuestionsSessionRepository.java
 * @Project Name : koreasurvey
 * @Description : 
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 5. 27.                     최초생성
 * 
 * @author QuantumSoft Inc.
 * @since 2015. 8.
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by QuantumSoft Inc. All right reserved.
 */
@Repository
public class QuestionsSessionRepository {
	@Autowired
	private SqlSessionTemplate session;
	
	private final String namespace = "kr.quantumsoft.koreasurvey.QuestionsMapper";
	
	public Integer insertQuestions(Questions question) {
		return session.insert(String.format("%s.insertQuestions", namespace), question);
	}
	
	public Integer updateQuestions(Questions question) {
		return session.update(String.format("%s.updateQuestions", namespace), question);
	}
	
	public List<Questions> selectQuestionsBySurveyId(Integer id) {
		return session.selectList(String.format("%s.selectQuestionsBySurveyId", namespace), id);
	}
	
	public Questions selectQuestionsById(Integer id) {
		return session.selectOne(String.format("%s.selectQuestionsById", namespace), id);
	}
	
	public Integer deleteQuestionBySurveyId(Integer id) {
		return session.delete(String.format("%s.deleteQuestionBySurveyId", namespace), id);
	}

	public Integer deleteQuestionById(Integer id) {
		return session.delete(String.format("%s.deleteQuestionById", namespace), id);
	}
}

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

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.quantumsoft.koreasurvey.model.Questions;
import kr.quantumsoft.koreasurvey.repository.OptionsSessionRepository;
import kr.quantumsoft.koreasurvey.repository.QuestionsSessionRepository;

/**  
 * @Class Name : QuestionsService.java
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
@Service
public class QuestionsService {
	@Autowired
	private QuestionsSessionRepository repo;
	
	@Autowired
	private OptionsSessionRepository optionsSessionRepository;
	
	public Integer insertQuestions(Questions question) {
		return repo.insertQuestions(question);
	}
	
	public Integer updateQuestions(Questions question) {
		return repo.updateQuestions(question);
	}
	
	public List<Questions> selectQuestionsBySurveyId(Integer id) {
		return repo.selectQuestionsBySurveyId(id);
	}
	
	public Questions selectQuestionsById(Integer id) {
		//return repo.selectQuestionsById(id);
		Questions questions = repo.selectQuestionsById(id);
		if (questions == null) {
			return null;
		}
		questions.setOptions(
				optionsSessionRepository.selectOptionsByQuestionId(id)
		);
		return questions;
	}
	
	public Integer deleteQuestionBySurveyId(Integer id) {
		return repo.deleteQuestionBySurveyId(id);
	}
	
	public Integer deleteQuestionById(Integer id) {
		return repo.deleteQuestionById(id);
	}
}

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

import kr.quantumsoft.koreasurvey.model.Answers;
import kr.quantumsoft.koreasurvey.repository.AnswersSessionRepository;

/**  
 * @Class Name : AnswersService.java
 * @Project Name : koreasurvey
 * @Description : 
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 5. 28.                     최초생성
 * 
 * @author QuantumSoft Inc.
 * @since 2015. 8.
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by QuantumSoft Inc. All right reserved.
 */
@Service
public class AnswersService {
	@Autowired
	private AnswersSessionRepository repo;
	
	public Integer insertAnswers(Answers answer) {
		return repo.insertAnswers(answer);
	}
	
	public List<Answers> selectAnswersByUserId(Integer userid) {
		return repo.selectAnswersByUserId(userid);
	}
	
	public List<Answers> selectAnswersByUserIdGroupBySurveyId(Integer userid) {
		return repo.selectAnswersByUserIdGroupBySurveyId(userid);
	}
	
	public Integer countAnswersUsers(Integer surveyid) {
		return repo.countAnswersUsers(surveyid);
	}

	public List<Answers> selectCountBySurveyIdGroupByQuestion(Answers answers) {
		return repo.selectCountBySurveyIdGroupByQuestion(answers);
	}
}

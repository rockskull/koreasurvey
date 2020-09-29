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

import kr.quantumsoft.koreasurvey.model.Notice;
import kr.quantumsoft.koreasurvey.model.SurveyExclude;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SurveyExcludeRepository {
	@Autowired
	private SqlSessionTemplate session;
	
	private final String namespace = "kr.quantumsoft.koreasurvey.SurveyExcludeMapper";

	public Integer insertExclude(SurveyExclude exclude) {
		return session.insert(String.format("%s.insertSurveyExclude", namespace), exclude);
	}

	public List<SurveyExclude> getSurveyExcludeListBySurveyId(Integer surveyId) {
		return session.selectList(String.format("%s.getSurveyExcludeListBySurveyId", namespace), surveyId);
	}

	public void deleteExcludeBySurveyId(int surveyId) {
		session.delete(String.format("%s.deleteExcludeBySurveyId", namespace), surveyId);
	}

}

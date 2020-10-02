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

import kr.quantumsoft.koreasurvey.model.Options;

/**  
 * @Class Name : OptionsSessionRepository.java
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
public class OptionsSessionRepository {
	@Autowired
	private SqlSessionTemplate session;
	
	private final String namespace = "kr.quantumsoft.koreasurvey.OptionsMapper";
	
	public Integer insertOptions(Options question) {
		return session.insert(String.format("%s.insertOptions", namespace), question);
	}
	
	public Integer updateOptions(Options question) {
		return session.update(String.format("%s.updateOptions", namespace), question);
	}
	
	public List<Options> selectOptionsByQuestionId(Integer questionid) {
		return session.selectList(String.format("%s.selectOptionsByQuestionId", namespace), questionid);
	}
	
	public Options selectOptionsById(Integer id) {
		return session.selectOne(String.format("%s.selectOptionsById", namespace), id);
	}
	
	public Integer deleteOptionsByQuestionId(Integer questionid) {
		return session.delete(String.format("%s.deleteOptionsByQuestionId", namespace), questionid);
	}

	public Integer deleteOptionsById(Integer oId) {
		return session.delete(String.format("%s.deleteOptionsById", namespace), oId);
	}
}

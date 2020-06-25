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

import java.util.Date;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**  
 * @Class Name : MetropolitanSessionRepository.java
 * @Project Name : koreasurvey
 * @Description : 
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2019. 12. 26.                     최초생성
 * 
 * @author QuantumSoft Inc.
 * @since 2015. 8.
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by QuantumSoft Inc. All right reserved.
 */
@Repository
public class MetropolitanSessionRepository {
	@Autowired
	SqlSessionTemplate session;
	
	private final String namespace = "kr.quantumsoft.koreasurvey.MetropolitanMapper";
	
	public Integer insertMetropolitan(HashMap<String, Object> param) {
		return session.insert(String.format("%s.insertMetropolitan", namespace), param);
	}
	
	public Integer selectByUserid(HashMap<String, Object> param) {
		return session.selectOne(String.format("%s.selectByUserid", namespace), param);
	}
	
	public Integer countVotedUser(Date monday) {
		return session.selectOne(String.format("%s.countVotedUser", namespace), monday);
	}
	
	public Integer countVoteUserByRange(HashMap<String, Date> period) {
		return session.selectOne(String.format("%s.countVoteUserByRange", namespace), period);
	}
	
	public Integer countVoteUserByAgeRange(HashMap<String, Object> param) {
		return session.selectOne(String.format("%s.countVoteUserByAgeRange", namespace), param);
	}
	
	public Integer countVoteUserByArea(HashMap<String, Object> param) {
		return session.selectOne(String.format("%s.countVoteUserByArea", namespace), param);
	}
	
	public Integer countVoteUserByMetroFromArea(HashMap<String, Object> param) {
		return session.selectOne(String.format("%s.countVoteUserByMetroFromArea", namespace), param);
	}
	
	public Integer countVoteUserByGender(HashMap<String, Object> param) {
		return session.selectOne(String.format("%s.countVoteUserByGender", namespace), param);
	}
}

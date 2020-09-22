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
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.quantumsoft.koreasurvey.model.Users;

/**  
 * @Class Name : UsersSessionRepository.java
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
@Repository
public class UsersSessionRepository {
	@Autowired
	private SqlSessionTemplate session;
	
	private final String namespace = "kr.quantumsoft.koreasurvey.UsersMapper";
	
	public Integer insertUsers(Users user) {
		return session.insert(String.format("%s.insertUsers", namespace), user);
	}
	
	public Users selectUserByEmail(String value) {
		return session.selectOne(String.format("%s.selectUserByEmail", namespace), value);
	}
	
	public Integer countTotalUser() {
		return session.selectOne(String.format("%s.countTotalUser", namespace));
	}
	
	public Integer countNewUser(Date monday) {
		return session.selectOne(String.format("%s.countNewUser", namespace), monday);
	}
	
	public Integer countTotalUserToToday(Date today) {
		return session.selectOne(String.format("%s.countTotalUserToToday", namespace), today);
	}
	
	public Integer countNewUserByRange(HashMap<String, Date> period) {
		return session.selectOne(String.format("%s.countNewUserByRange", namespace), period);
	}
	
	public Users selectUserById(Integer id) {
		return session.selectOne(String.format("%s.selectUserById", namespace), id);
	}
	
	public List<Users> searchUsersByEmail(String email) {
		return session.selectList(String.format("%s.searchUsersByEmail", namespace), email);
	}
	
	public Integer updateUser(Users user) {
		return session.update(String.format("%s.updateUser", namespace), user);
	}

	public List<Users> search(HashMap<String, Object> search) {
		return session.selectList(String.format("%s.search", namespace), search);
	}


}

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

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.quantumsoft.koreasurvey.model.Tradings;
import kr.quantumsoft.koreasurvey.utils.ProjectConstants;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.quantumsoft.koreasurvey.repository.UsersSessionRepository;
import kr.quantumsoft.koreasurvey.model.Users;

/**  
 * @Class Name : UsersService.java
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
@Service
public class UsersService implements UserDetailsService {
	@Autowired
	private UsersSessionRepository repo;
	@Autowired
	private TradingsService tradingService;

	/* (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetailsService#loadUserByUsername(java.lang.String)
	 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		return repo.selectUserByEmail(username);
	}
	
	public Integer insertUsers(Users user) {
		return repo.insertUsers(user);
	}
	
	public Users selectUserByEmail(String email) {
		return repo.selectUserByEmail(email);
	}
	
	public Integer countTotalUser() {
		return repo.countTotalUser();
	}
	
	public Integer countNewUser(Date monday) {
		return repo.countNewUser(monday);
	}
	
	public Integer countTotalUserToToday(Date today) {
		return repo.countTotalUserToToday(today);
	}
	
	public Integer countNewUserByRange(HashMap<String, Date> period) {
		return repo.countNewUserByRange(period);
	}
	
	public Users selectUserById(Integer id) {
		return repo.selectUserById(id);
	}
	
	public List<Users> searchUsersByEmail(String email) {
		return repo.searchUsersByEmail(email);
	}
	
	public Integer updateUser(Users user) {
		return repo.updateUser(user);
	}

	public List<Users> search(String email, String start, String end) {
		HashMap<String, String> param = new HashMap<String, String>();
		if (StringUtils.isNotEmpty(end) && StringUtils.isNotEmpty(start)) {
			param.put("start", start);
			param.put("end", end);
		}
		if (StringUtils.isNotEmpty(email)) {
			param.put("email", email);
		}
		return repo.search(param);
	}

	public void addPoint(int userId, int point, int tradingType) {
		Users user = this.selectUserById(userId);
		if (user == null) {
			throw new RuntimeException("Failed Get UserInfo");
		}
		user.setPoint(user.getPoint()+point);
		this.updateUser(user);

		Tradings updateTrading = new Tradings();
		updateTrading.setAmount(point);
		updateTrading.setType(tradingType);
		updateTrading.setUserid(user.getId());

		tradingService.insertTradings(updateTrading);
	}
	
}

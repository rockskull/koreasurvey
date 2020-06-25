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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.quantumsoft.koreasurvey.repository.MetropolitanSessionRepository;

/**  
 * @Class Name : MetropolitanService.java
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
@Service
public class MetropolitanService {
	@Autowired
	MetropolitanSessionRepository repo;
	
	public Integer insertMetropolitan(HashMap<String, Object> param) {
		return repo.insertMetropolitan(param);
	}
	
	public Integer selectByUserid(HashMap<String, Object> param) {
		return repo.selectByUserid(param);
	}
	
	public Integer countVotedUser(Date monday) {
		return repo.countVotedUser(monday);
	}
	
	public Integer countVoteUserByRange(HashMap<String, Date> period) {
		return repo.countVoteUserByRange(period);
	}
	
	public Integer countVoteUserByAgeRange(HashMap<String, Object> param) {
		return repo.countVoteUserByAgeRange(param);
	}
	
	public Integer countVoteUserByArea(HashMap<String, Object> param) {
		return repo.countVoteUserByArea(param);
	}
	
	public Integer countVoteUserByMetroFromArea(HashMap<String, Object> param) {
		return repo.countVoteUserByMetroFromArea(param);
	}
	
	public Integer countVoteUserByGender(HashMap<String, Object> param) {
		return repo.countVoteUserByGender(param);
	}
}

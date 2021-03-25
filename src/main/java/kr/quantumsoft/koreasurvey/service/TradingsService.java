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

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.quantumsoft.koreasurvey.model.Tradings;
import kr.quantumsoft.koreasurvey.repository.TradingsSessionRepository;

/**  
 * @Class Name : TradingsService.java
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
public class TradingsService {
	@Autowired
	private TradingsSessionRepository repo;
	
	@Autowired
    private WithDrawsService withDrawsService;

    @Autowired
    private UsersService usersService;
	
	public Integer insertTradings(Tradings trading) {
		return repo.insertTradings(trading);
	}
	
	public List<Tradings> selectTradings(HashMap<String, Object> param) {
		return repo.selectTradingsByUserId(param);
	}
	
	public List<Tradings> selectTradingsByUserId(HashMap<String, Object> param) {
        List<Tradings> tradings = repo.selectTradingsByUserId(param);
        for (Tradings trading : tradings) {
            if (trading.getWithdrawsid() != null && trading.getWithdrawsid() != 0) {
                trading.setWithdraw(
                        withDrawsService.getWithdrawById(trading.getWithdrawsid())
                );
            }
            trading.setUser(usersService.selectUserById(trading.getUserid()));

        }
        return tradings;

    }

    public List<Tradings> selectTradingsByUserId(int userId, int page, int pageSize) {
        HashMap<String, Object> params = new HashMap<String, Object>();
        params.put("userid", userId);
        params.put("offset", page == 1 ? 0 : page * pageSize);
        params.put("limit", pageSize);
        List<Tradings> tradings = repo.selectTradingsLimitByUserId(params);
        for (Tradings trading : tradings) {
            if (trading.getWithdrawsid() != null) {
                trading.setWithdraw(
                        withDrawsService.getWithdrawById(trading.getWithdrawsid())
                );

            }
        }
        return tradings;
    }
}

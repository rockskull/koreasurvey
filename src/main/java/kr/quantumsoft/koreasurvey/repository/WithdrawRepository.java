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

import kr.quantumsoft.koreasurvey.model.Withdraw;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WithdrawRepository {
	@Autowired
	private SqlSessionTemplate session;
	
	private final String namespace = "kr.quantumsoft.koreasurvey.WithdrawMapper";

	public Integer insert(Withdraw item) {
		return session.insert(String.format("%s.insert", namespace), item);
	}

	public Withdraw selectById(Integer id) {
		return session.selectOne(String.format("%s.selectById", namespace), id);
	}

	public void update(Withdraw item) {
		session.update(String.format("%s.update", namespace), item);
	}

}

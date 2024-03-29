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
import kr.quantumsoft.koreasurvey.model.Users;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Repository
public class NoticeRepository {
	@Autowired
	private SqlSessionTemplate session;
	
	private final String namespace = "kr.quantumsoft.koreasurvey.NoticeMapper";

	public List<Notice> getNoticeList(int size) {
		return session.selectList(String.format("%s.selectTop", namespace), size);
	}


	public List<Notice> getNoticeAll() {
		return session.selectList(String.format("%s.selectAll", namespace));
	}

	public Notice getNoticeById(Integer id) {
		return session.selectOne(String.format("%s.selectById", namespace), id);
	}

	public void update(Notice notice) {
		session.update(String.format("%s.update", namespace), notice);
//		return
	}


}

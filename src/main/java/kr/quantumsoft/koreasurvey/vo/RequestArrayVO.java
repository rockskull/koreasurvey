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
package kr.quantumsoft.koreasurvey.vo;

import java.util.ArrayList;

/**  
 * @Class Name : RequestArrayVO.java
 * @Project Name : koreasurvey
 * @Description : 
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 6. 12.                     최초생성
 * 
 * @author QuantumSoft Inc.
 * @since 2015. 8.
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by QuantumSoft Inc. All right reserved.
 */
public class RequestArrayVO {
	private ArrayList<Object> req;
	private ArrayList<Object> req2;
	public ArrayList<Object> getReq() {
		return req;
	}
	public void setReq(ArrayList<Object> req) {
		this.req = req;
	}
	public ArrayList<Object> getReq2() {
		return req2;
	}
	public void setReq2(ArrayList<Object> req2) {
		this.req2 = req2;
	}
}

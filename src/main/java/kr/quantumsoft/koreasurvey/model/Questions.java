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
package kr.quantumsoft.koreasurvey.model;

import java.io.Serializable;
import java.util.List;

/**  
 * @Class Name : Questions.java
 * @Project Name : koreasurvey
 * @Description : 
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 4. 10.                     최초생성
 * 
 * @author QuantumSoft Inc.
 * @since 2015. 8.
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by QuantumSoft Inc. All right reserved.
 */
public class Questions implements Serializable {
	private Integer id;
	private Integer surveyid;
	private Integer orderid;
	private String title;
	private String question;
	private Integer type;
	
	private List<Options> options;
	private String answerValue;
	private Integer totalVoteCount;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getSurveyid() {
		return surveyid;
	}
	public void setSurveyid(Integer surveyid) {
		this.surveyid = surveyid;
	}
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public List<Options> getOptions() {
		return options;
	}
	public void setOptions(List<Options> options) {
		this.options = options;
	}
	public String getAnswerValue() {
		return answerValue;
	}
	public void setAnswerValue(String answerValue) {
		this.answerValue = answerValue;
	}
	public Integer getTotalVoteCount() {
		return totalVoteCount;
	}
	public void setTotalVoteCount(Integer totalVoteCount) {
		this.totalVoteCount = totalVoteCount;
	}
}

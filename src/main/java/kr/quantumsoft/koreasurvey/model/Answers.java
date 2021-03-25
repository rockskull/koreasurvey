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
import java.util.Date;

/**  
 * @Class Name : Answers.java
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
public class Answers implements Serializable {
	private Integer id;
	private Integer userid;
	private Integer surveyid;
	private Integer questionid;
	private String questioncontent;
	private Integer questiontype;
	private String answer;
	private Integer rewardpoint;
	private Date created;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getSurveyid() {
		return surveyid;
	}
	public void setSurveyid(Integer surveyid) {
		this.surveyid = surveyid;
	}
	public Integer getQuestionid() {
		return questionid;
	}
	public void setQuestionid(Integer questionid) {
		this.questionid = questionid;
	}
	public String getQuestioncontent() {
		return questioncontent;
	}
	public void setQuestioncontent(String questioncontent) {
		this.questioncontent = questioncontent;
	}
	public Integer getQuestiontype() {
		return questiontype;
	}
	public void setQuestiontype(Integer questiontype) {
		this.questiontype = questiontype;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Integer getRewardpoint() {
		return rewardpoint;
	}
	public void setRewardpoint(Integer rewardpoint) {
		this.rewardpoint = rewardpoint;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
}

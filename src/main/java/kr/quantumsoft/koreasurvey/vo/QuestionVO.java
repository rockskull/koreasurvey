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
import java.util.List;

import kr.quantumsoft.koreasurvey.model.Options;
import kr.quantumsoft.koreasurvey.model.Questions;

/**  
 * @Class Name : QuestionVO.java
 * @Project Name : koreasurvey
 * @Description : 
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 5. 27.                     최초생성
 * 
 * @author QuantumSoft Inc.
 * @since 2015. 8.
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by QuantumSoft Inc. All right reserved.
 */
@SuppressWarnings("serial")
public class QuestionVO extends Questions {
	private List<Options> listOption = new ArrayList<Options>();

	public List<Options> getListOption() {
		return listOption;
	}

	public void setListOption(List<Options> listOption) {
		this.listOption = listOption;
	}
	
	public void setQuestionModel(Questions questionModel) {
		this.setId(questionModel.getId());
		this.setQuestion(questionModel.getQuestion());
		this.setSurveyid(questionModel.getSurveyid());
		this.setTitle(questionModel.getTitle());
		this.setType(questionModel.getType());
	}
	
	public Questions getQuestionModel() {
		Questions target = new Questions();
		
		target.setId(this.getId());
		target.setQuestion(this.getQuestion());
		target.setSurveyid(this.getSurveyid());
		target.setTitle(this.getTitle());
		target.setType(this.getType());
		
		return target;
	}
}

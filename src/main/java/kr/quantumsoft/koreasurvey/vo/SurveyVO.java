/**
 * 
 */
package kr.quantumsoft.koreasurvey.vo;

import java.util.List;

import kr.quantumsoft.koreasurvey.model.Surveys;

/**
 * @author Seo
 *
 */
public class SurveyVO extends Surveys {
	public List<QuestionVO> listQuestions;

	public List<QuestionVO> getListQuestions() {
		return listQuestions;
	}

	public void setListQuestions(List<QuestionVO> listQuestions) {
		this.listQuestions = listQuestions;
	}
}

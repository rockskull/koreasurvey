/**
 * 
 */
package kr.quantumsoft.koreasurvey.vo;

import java.util.List;

import kr.quantumsoft.koreasurvey.model.Options;

/**
 * @author rock
 *
 */
public class AdminQuestionEditVO {
	private List<Options> options;
    private String title;
    private String question;
    private Integer type;
	public List<Options> getOptions() {
		return options;
	}
	public void setOptions(List<Options> options) {
		this.options = options;
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
}

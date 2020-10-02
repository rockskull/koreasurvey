package kr.quantumsoft.koreasurvey.vo;

import kr.quantumsoft.koreasurvey.model.Options;

import java.util.List;

public class AdminQuestionEditVo {
    private List<Options> options;
    private String title;
    private String question;

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<Options> getOptions() {
        return options;
    }

    public String getTitle() {
        return title;
    }

    public void setOptions(List<Options> options) {
        this.options = options;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}

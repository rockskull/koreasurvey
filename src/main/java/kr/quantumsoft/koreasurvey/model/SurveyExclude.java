package kr.quantumsoft.koreasurvey.model;

import java.io.Serializable;
import java.util.Date;

public class SurveyExclude implements Serializable {
    private Integer excludeId;
    private Integer excludeType;
    private String excludeValue;
    private Date created;
    private Integer surveyId;

    public Integer getExcludeId() {
        return excludeId;
    }

    public void setExcludeId(Integer excludeId) {
        this.excludeId = excludeId;
    }

    public Integer getExcludeType() {
        return excludeType;
    }

    public void setExcludeType(Integer excludeType) {
        this.excludeType = excludeType;
    }

    public String getExcludeValue() {
        return excludeValue;
    }

    public void setExcludeValue(String excludeValue) {
        this.excludeValue = excludeValue;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Integer getSurveyId() {
        return surveyId;
    }

    public void setSurveyId(Integer surveyId) {
        this.surveyId = surveyId;
    }
}

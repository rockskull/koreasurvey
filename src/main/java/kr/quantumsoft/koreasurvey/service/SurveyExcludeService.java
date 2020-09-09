package kr.quantumsoft.koreasurvey.service;

import kr.quantumsoft.koreasurvey.model.SurveyExclude;
import kr.quantumsoft.koreasurvey.repository.SurveyExcludeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SurveyExcludeService {
    @Autowired
    private SurveyExcludeRepository repo;


    public void insertExclude(SurveyExclude surveyExclude) {
        repo.insertExclude(surveyExclude);
    }
}

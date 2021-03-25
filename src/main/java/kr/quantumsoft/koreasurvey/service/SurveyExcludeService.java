/**
 * 
 */
package kr.quantumsoft.koreasurvey.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.quantumsoft.koreasurvey.model.SurveyExclude;
import kr.quantumsoft.koreasurvey.repository.SurveyExcludeRepository;

/**
 * @author rock
 *
 */
@Service
public class SurveyExcludeService {
	@Autowired
    private SurveyExcludeRepository repo;

    public void deleteExcludeBySurveyId(int surveyId) {
        repo.deleteExcludeBySurveyId(surveyId);
    }

    public void insertExclude(SurveyExclude surveyExclude) {
        repo.insertExclude(surveyExclude);
    }
}

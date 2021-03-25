/**
 * 
 */
package kr.quantumsoft.koreasurvey.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.quantumsoft.koreasurvey.model.SurveyExclude;

/**
 * @author rock
 *
 */
@Repository
public class SurveyExcludeRepository {
	@Autowired
	private SqlSessionTemplate session;
	
	private final String namespace = "kr.quantumsoft.koreasurvey.SurveyExcludeMapper";

	public Integer insertExclude(SurveyExclude exclude) {
		return session.insert(String.format("%s.insertSurveyExclude", namespace), exclude);
	}

	public List<SurveyExclude> getSurveyExcludeListBySurveyId(Integer surveyId) {
		return session.selectList(String.format("%s.getSurveyExcludeListBySurveyId", namespace), surveyId);
	}

	public void deleteExcludeBySurveyId(int surveyId) {
		session.delete(String.format("%s.deleteExcludeBySurveyId", namespace), surveyId);
	}
}

/**
 * 
 */
package kr.quantumsoft.koreasurvey.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.quantumsoft.koreasurvey.model.Withdraw;

/**
 * @author rock
 *
 */
@Repository
public class WithdrawRepository {
	@Autowired
	private SqlSessionTemplate session;
	
	private final String namespace = "kr.quantumsoft.koreasurvey.WithdrawMapper";

	public Integer insert(Withdraw item) {
		return session.insert(String.format("%s.insert", namespace), item);
	}

	public Withdraw selectById(Integer id) {
		return session.selectOne(String.format("%s.selectById", namespace), id);
	}

	public void update(Withdraw item) {
		session.update(String.format("%s.update", namespace), item);
	}
}

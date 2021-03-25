/**
 * 
 */
package kr.quantumsoft.koreasurvey.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.quantumsoft.koreasurvey.model.Boards;

/**
 * @author Seo
 *
 */
@Repository
public class BoardsSessionRepository {
	@Autowired
	private SqlSessionTemplate session;
	
	private final String namespace = "kr.quantumsoft.koreasurvey.BoardsMapper";
	
	public Integer insertBoard(Boards board) {
		return session.insert(String.format("%s.insertBoard", namespace), board);
	}
	
	public List<Boards> selectBoardForList(HashMap<String, Object> param) {
		return session.selectList(String.format("%s.selectBoardForList", namespace), param);
	}
	
	public Integer countBoardAll(HashMap<String, Object> param) {
		return session.selectOne(String.format("%s.countBoardAll", namespace), param);
	}
	
	public Boards selectBoardById(HashMap<String, Object> param) {
		return session.selectOne(String.format("%s.selectBoardById", namespace), param);
	}
	
	public Integer updateBoardById(Boards board) {
		return session.update(String.format("%s.updateBoardById", namespace), board);
	}
	
	public Integer deleteBoardById(HashMap<String, Object> param) {
		return session.delete(String.format("%s.deleteBoardById", namespace), param);
	}
}

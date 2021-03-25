/**
 * 
 */
package kr.quantumsoft.koreasurvey.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.quantumsoft.koreasurvey.model.Boards;
import kr.quantumsoft.koreasurvey.repository.BoardsSessionRepository;

/**
 * @author Seo
 *
 */
@Service
public class BoardsService {
	@Autowired
	private BoardsSessionRepository repo;
	
	public Integer insertBoard(Boards board) {
		return repo.insertBoard(board);
	}
	
	public List<Boards> selectBoardForList(HashMap<String, Object> param) {
		return repo.selectBoardForList(param);
	}
	
	public Integer countBoardAll(HashMap<String, Object> param) {
		return repo.countBoardAll(param);
	}
	
	public Boards selectBoardById(HashMap<String, Object> param) {
		return repo.selectBoardById(param);
	}
	
	public Integer updateBoardById(Boards board) {
		return repo.updateBoardById(board);
	}
	
	public Integer deleteBoardById(HashMap<String, Object> param) {
		return repo.deleteBoardById(param);
	}
}

package kr.quantumsoft.koreasurvey.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.quantumsoft.koreasurvey.model.Boards;
import kr.quantumsoft.koreasurvey.model.Users;
import kr.quantumsoft.koreasurvey.service.BoardsService;
import kr.quantumsoft.koreasurvey.utils.Paging;

@Controller
@RequestMapping(value="/m/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static final Integer LIST_COUNT = 10;
	
	@Autowired
	private BoardsService boardService;
	
	@RequestMapping(value={"", "/", "/list"})
	public String index(Model model, Authentication auth, String board, Integer page) {
		if(board == null) board = "free";
		if(page == null) page = 1;
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("boardName", board);
		param.put("limit", LIST_COUNT);
		param.put("offset", (page-1)*LIST_COUNT);
		
		Paging paging = new Paging();
		paging.setPageNo(page);
		paging.setPageSize(LIST_COUNT);
		paging.setTotalCount(boardService.countBoardAll(param));
		
		model.addAttribute("page", paging);
		model.addAttribute("boardName", board);
		model.addAttribute("list", boardService.selectBoardForList(param));
		return "boardList";
	}
	
	@RequestMapping(value="/new")
	public String getNew(Model model, Authentication auth, String board) {
		Boards newBoard = new Boards();
		newBoard.setBoardName(board);
		
		model.addAttribute("new", newBoard);
		return "boardNew";
	}
	
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String postNew(Authentication auth, Boards board) {
		Users owner = (Users)auth.getPrincipal();
		
		if(owner == null) {
			
		}
		
		board.setUserid(owner.getId());
		
		boardService.insertBoard(board);
		
		return "redirect:/board/";
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String getView(Model model, Authentication auth, String board, Integer id) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("boardName", board);
		param.put("id", id);
		
		Boards item = boardService.selectBoardById(param);
		item.setContent(item.getContent().replaceAll("\r\n", "<br />"));
		item.setBoardName(board);
		
		model.addAttribute("item", item);
		return "boardView";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public String getEdit(Model model, Authentication auth, String board, Integer id) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("boardName", board);
		param.put("id", id);
		
		Boards item = boardService.selectBoardById(param);
		item.setBoardName(board);
		
		model.addAttribute("editItem", item);
		
		return "boardEdit";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String postEdit(Authentication auth, Boards board) {
		boardService.updateBoardById(board);
		return "redirect:/board/view?board="+board.getBoardName()+"&id="+board.getId();
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String getDelete(Authentication auth, String board, Integer id) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("boardName", board);
		param.put("id", id);
		
		boardService.deleteBoardById(param);
		
		return "redirect:/m/board/?board="+board;
	}
}

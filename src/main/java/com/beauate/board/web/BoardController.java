package com.beauate.board.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beauate.admin.board.service.BoardManageService;
import com.beauate.admin.board.service.BoardVO;
import com.beauate.admin.code.service.CodeVO;
import com.beauate.board.service.BoardService;

@Controller
public class BoardController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@Resource(name = "boardManageService")
	private BoardManageService boardManageService;
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 리스트
	 * 2. 처리내용 : 게시판 리스트
	 * </pre>
	 * @Method Name : selectBoardList
	 * @date : 2019. 5. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/board/r/m/selectBoardList.do")
	public String selectBoardList(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		//제품정보 탭. 게시판 구분 코드리스트
		List<CodeVO> boardCateGoryList = boardManageService.selectScodeList();
		Map<String, Object> rsltMap = boardService.selectBoardList(boardVO);
		
		model.addAttribute("boardCateGoryList", boardCateGoryList);
		model.addAttribute("rslt", rsltMap);
		
		return "/board/boardList";
	}
}

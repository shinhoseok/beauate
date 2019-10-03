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
	 * @param boardVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/board/a/t/selectBoardList.do")
	public String selectBoardList(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		//제품정보 탭. 게시판 구분 코드리스트
		List<CodeVO> boardCateGoryList = boardManageService.selectScodeList();
		model.addAttribute("boardCateGoryList", boardCateGoryList);
		
		return "/board/boardList";
	}
	
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
	 * @param boardVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/board/a/t/selectBoardAjaxList.do")
	public String selectBoardAjaxList(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		Map<String, Object> rsltMap = boardService.selectBoardList(boardVO);
		model.addAttribute("rslt", rsltMap);
		
		if(boardVO.getPostCategorySt().equals("2")) { //자격증 탭
			return "/board/boardLicenceList";
		} else if(boardVO.getPostCategorySt().equals("3")) { //박람회 탭
			return "/board/boardExpoList";
		} else if(boardVO.getPostCategorySt().equals("4")) { //공지사항 탭
			return "/board/boardNoticeList";
		} else { //제품소개 탭
			return "/board/boardProductList";
		}
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 상세보기
	 * 2. 처리내용 : 게시판 상세보기
	 * </pre>
	 * @Method Name : selectBoardDetail
	 * @date : 2019. 5. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/board/a/t/selectBoardDetail.do")
	public String selectBoardDetail(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		
		BoardVO resultVO = boardService.selectBoardDetail(boardVO);
		model.addAttribute("boardVO", resultVO);
		
		return "/board/boardDetail";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 상세보기 다음글/이전글
	 * 2. 처리내용 : 게시판 상세보기 다음글/이전글
	 * </pre>
	 * @Method Name : selectBoardNextPrev
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/board/a/t/selectBoardNextPrev.do")
	public String selectBoardNextPrev(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		
		BoardVO resultVO = boardService.selectBoardNextPrev(boardVO);
		model.addAttribute("boardVO", resultVO);
		
		return "/board/boardDetail";
	}
}

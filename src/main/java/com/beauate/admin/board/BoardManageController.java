package com.beauate.admin.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.beauate.admin.board.service.BoardManageService;
import com.beauate.admin.board.service.BoardVO;
import com.beauate.admin.code.service.CodeVO;

import egovframework.cmmn.service.EgovFileMngService;
import egovframework.cmmn.service.EgovFileMngUtil;
import egovframework.cmmn.service.FileVO;

@Controller
public class BoardManageController {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "boardManageService")
	private BoardManageService boardManageService;
	
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	// 첨부파일 관련
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판관리 리스트
	 * 2. 처리내용 : 게시판관리 리스트
	 * </pre>
	 * @Method Name : insertBoardMng
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
	@RequestMapping(value = "/boardm/r/m/selectBoardMngList.do")
	public String selectBoardMngList(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		Map<String, Object> rsltMap = boardManageService.selectBoardMngList(boardVO);
		model.addAttribute("rslt" , rsltMap);
		return "/admin/board/boardList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판관리 상세화면
	 * 2. 처리내용 : 게시판관리 상세화면
	 * </pre>
	 * @Method Name : selectBoardMngDetail
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
	@RequestMapping(value = "/boardm/r/m/selectBoardMngDetail.do")
	public String selectBoardMngDetail(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {

		BoardVO resultVO = boardManageService.selectBoardMngDetail(boardVO);
		model.addAttribute("boardVO", resultVO);
		
		return "/admin/board/boardDetail";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판관리 등록화면
	 * 2. 처리내용 : 게시판관리 등록화면
	 * </pre>
	 * @Method Name : insertBoardMng
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
	@RequestMapping(value = "/boardm/r/m/insertBoardMng.do")
	public String insertBoardMng(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		
		log.debug(">>> Controller insertBoardMng >>> "+ boardVO);
		List<CodeVO> boardCateGoryList = boardManageService.selectScodeList();
		log.debug(">>> BoardCateGoryList : " + boardCateGoryList);
		model.addAttribute("boardCateGoryList", boardCateGoryList);
		
		return "/admin/board/boardInsert";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판관리 등록 처리
	 * 2. 처리내용 : 게시판관리 등록 처리
	 * </pre>
	 * @Method Name : insertBoardMng
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
	@RequestMapping(value = "/board/w/m/insertBoardMngProc.do")
	public String insertBoardMngProc(MultipartHttpServletRequest multiRequest, 
			SessionStatus status, @ModelAttribute("boardVO") BoardVO boardVO) throws Exception {
		
		log.debug(">>> BoardManageController in insertBoardMngProc : " + boardVO);
		
		// 첨부파일 관련 첨부파일ID 생성
		List<FileVO> _result = null;
		String _atchFileId = "";

		final Map<String, MultipartFile> files = multiRequest.getFileMap();

		if (!files.isEmpty()) {
			_result = fileUtil.parseFileInf(files, "BOARD_", 0, "", "");
			_atchFileId = fileMngService.insertFileInfs(_result); //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
		}

		// 리턴받은 첨부파일ID를 셋팅한다..
		boardVO.setAtchFileId(_atchFileId); // 첨부파일 ID
		
		boardManageService.insertBoardMngProc(boardVO);
		status.setComplete();	//중복 submit 방지
		
		log.debug(">>> After insertBoardMngProc, boardVO : " + boardVO);	
		
		return "redirect:/boardm/r/m/selectBoardMngList.do";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판관리 수정화면
	 * 2. 처리내용 : 게시판관리 수정화면
	 * </pre>
	 * @Method Name : updateBoardMng
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
	@RequestMapping(value = "/boardm/w/m/updateBoardMng.do")
	public String updateBoardMng(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		
		log.debug(">>> Controller updateBoardMng >>> "+ boardVO);
		List<CodeVO> boardCateGoryList = boardManageService.selectScodeList();
		log.debug(">>> BoardCateGoryList : " + boardCateGoryList);
		model.addAttribute("boardCateGoryList", boardCateGoryList);
		
		return "/admin/board/boardUpdate";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판관리 수정
	 * 2. 처리내용 : 게시판관리 수정
	 * </pre>
	 * @Method Name : updateBoardMngProc
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
	@RequestMapping(value = "/boardm/w/n/updateBoardMngProc.do")
	public String updateBoardMngProc(final MultipartHttpServletRequest multiRequest, @ModelAttribute("boardVO") BoardVO boardVO, ModelMap model, SessionStatus status) throws Exception {
		String _atchFileId = boardVO.getAtchFileId();
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		if (!files.isEmpty()) {
			if ("".equals(_atchFileId)) {
				List<FileVO> _result = fileUtil.parseFileInf(files, "BOARD_", 0, _atchFileId, "");
				_atchFileId = fileMngService.insertFileInfs(_result);
				boardVO.setAtchFileId(_atchFileId);
			} else {
				FileVO fvo = new FileVO();
				fvo.setAtchFileId(_atchFileId);
//				int cnt = fileMngService.getMaxFileSN(fvo);
				List<FileVO> _result = fileUtil.parseFileInf(files, "BOARD_", 0, _atchFileId, "");
				fileMngService.updateFileInfs(_result);
			}
		}
		boardManageService.updateBoardMngProc(boardVO);
		status.setComplete();	//중복 submit 방지
		return "redirect:/boardm/r/m/selectBoardMngDetail.do?postId="+boardVO.getPostId();
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판관리 삭제
	 * 2. 처리내용 : 게시판관리 삭제
	 * </pre>
	 * @Method Name : updateBoardMngProc
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
	@RequestMapping(value = "/boardm/w/n/deleteBoardMngProc.do")
	public String deleteBoardMngProc(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model, SessionStatus status) throws Exception {
		boardManageService.deleteBoardMngProc(boardVO);
		status.setComplete();	//중복 submit 방지
		return "redirect:/boardm/r/m/selectBoardMngList.do";
	}
}

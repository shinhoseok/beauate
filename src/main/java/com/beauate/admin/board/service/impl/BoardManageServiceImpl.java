package com.beauate.admin.board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.admin.board.service.BoardDao;
import com.beauate.admin.board.service.BoardManageService;
import com.beauate.admin.board.service.BoardVO;
import com.beauate.admin.code.service.CodeDao;
import com.beauate.admin.code.service.CodeVO;
import com.beauate.common.GlobalConstants;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("boardManageService")
public class BoardManageServiceImpl implements BoardManageService {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	@Resource(name="boardIdGnrService")
	private EgovIdGnrService boardIdGnrService;
	
	@Resource(name="codeDao")
	private CodeDao codeDao;
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 등록화면(카테고리 리스트)
	 * 2. 처리내용 : 게시판 등록화면(카테고리 리스트)
	 * </pre>
	 * @Method Name : insertBoardMngProc
	 * @date : 2019. 5. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @return void
	 * @throws Exception
	 */
	public List<CodeVO> selectScodeList() throws Exception {
		List<CodeVO> sCodeList = codeDao.selectScodeList(GlobalConstants.BOARD_CATEGORY_CODE);
		return sCodeList;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 등록
	 * 2. 처리내용 : 게시판 등록
	 * </pre>
	 * @Method Name : insertBoardMngProc
	 * @date : 2019. 5. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @return void
	 * @throws Exception
	 */ 	
	public void insertBoardMngProc(BoardVO boardVO) throws Exception {
		boardVO.setPostId(boardIdGnrService.getNextStringId());
		boardDao.insertBoardMngProc(boardVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 관리 리스트
	 * 2. 처리내용 : 게시판 관리 리스트
	 * </pre>
	 * @Method Name : selectBoardMngList
	 * @date : 2019. 5. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @return List<BoardVO>
	 * @throws Exception
	 */ 	
	public Map<String, Object> selectBoardMngList(BoardVO boardVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		log.debug(">>> Before pagingSetting, boardVO in selectBoardMngList : " + boardVO);
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());
		
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		log.debug(">>> Between after_paging and selectBoardMngList, boardVO : " + boardVO);
		
		List<BoardVO> selectList = null;
		int cnt = boardDao.selectBoardMngListCnt(boardVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//리스트
			selectList = boardDao.selectBoardMngList(boardVO);
		}
		log.debug(">>> selectBoardMngList, boardVO"+boardVO);
		rsltMap.put("paginationInfo", paginationInfo);
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 관리 상세 조회
	 * 2. 처리내용 : 게시판 관리 상세 조회
	 * </pre>
	 * @Method Name : selectBoardMngDetail
	 * @date : 2019. 5. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @return BoardVO
	 * @throws Exception
	 */ 	
	public BoardVO selectBoardMngDetail(BoardVO boardVO) throws Exception {
		return boardDao.selectBoardMngDetail(boardVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 관리 수정
	 * 2. 처리내용 : 게시판 관리 수정
	 * </pre>
	 * @Method Name : updateBoardMngProc
	 * @date : 2019. 5. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @return void
	 * @throws Exception
	 */ 	
	public void updateBoardMngProc(BoardVO boardVO) throws Exception {
		boardDao.updateBoardMngProc(boardVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 관리 삭제
	 * 2. 처리내용 : 게시판 관리 삭제
	 * </pre>
	 * @Method Name : deleteBoardMngProc
	 * @date : 2019. 5. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @return void
	 * @throws Exception
	 */ 	
	public void deleteBoardMngProc(BoardVO boardVO) throws Exception {
		boardDao.deleteBoardMngProc(boardVO);
	}
}

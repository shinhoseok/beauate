package com.beauate.admin.board.service;

import java.util.List;
import java.util.Map;

import com.beauate.admin.code.service.CodeVO;

public interface BoardManageService {
	
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
	public List<CodeVO> selectScodeList() throws Exception;
	
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
	public void insertBoardMngProc(BoardVO boardVO) throws Exception;
	
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
	public Map<String, Object> selectBoardMngList(BoardVO boardVO) throws Exception;
	
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
	public BoardVO selectBoardMngDetail(BoardVO boardVO) throws Exception;
	
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
	public void updateBoardMngProc(BoardVO boardVO) throws Exception;
	
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
	public void deleteBoardMngProc(BoardVO boardVO) throws Exception;
}

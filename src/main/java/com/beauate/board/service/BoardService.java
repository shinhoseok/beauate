package com.beauate.board.service;

import java.util.Map;

import com.beauate.admin.board.service.BoardVO;

public interface BoardService {
	/**
	 * <pre>
	 * 1. 개요 : 게시판 리스트
	 * 2. 처리내용 : 게시판 리스트
	 * </pre>
	 * @Method Name : selectBoardList
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
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public Map<String, Object> selectBoardList(BoardVO boardVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 상세화면
	 * 2. 처리내용 : 게시판 상세화면
	 * </pre>
	 * @Method Name : selectBoardDetail
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
	 * @return BoardVO
	 * @throws Exception
	 */
	public BoardVO selectBoardDetail(BoardVO boardVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 관리 상세 다음글, 이전글
	 * 2. 처리내용 : 게시판 관리 상세 다음글, 이전글
	 * </pre>
	 * @Method Name : selectBoardNextPrev
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @return BoardVO
	 * @throws Exception
	 */
	public BoardVO selectBoardNextPrev(BoardVO boardVO) throws Exception;
}

package com.beauate.admin.review.service;

import java.util.Map;

import com.beauate.admin.comment.service.CommentVO;
import com.beauate.review.service.ReviewVO;

public interface ReviewManageService {
	/**
	 * <pre>
	 * 1. 개요 : 후기 리스트
	 * 2. 처리내용 : 후기 리스트
	 * </pre>
	 * @Method Name : selectReviewList
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param reviewVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectReviewList(ReviewVO reviewVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 후기삭제/취소(delYn)
	 * 2. 처리내용 :  후기삭제/취소(delYn)
	 * </pre>
	 * @Method Name : updateReviewProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param reviewVO
	 * @return void
	 * @throws Exception
	 */ 
	public void updateReviewProc(ReviewVO reviewVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 후기 상세
	 * 2. 처리내용 :  후기 상세
	 * </pre>
	 * @Method Name : selectReviewMngDetail
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param reviewVO
	 * @return ReviewVO
	 * @throws Exception
	 */ 
	public ReviewVO selectReviewMngDetail(ReviewVO reviewVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 댓글등록
	 * 2. 처리내용 :  댓글등록
	 * </pre>
	 * @Method Name : insertCommentMngProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param commentVO
	 * @return void
	 * @throws Exception
	 */ 
	public void insertCommentMngProc(CommentVO commentVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 댓글 수정/삭제
	 * 2. 처리내용 :  댓글 수정/삭제
	 * </pre>
	 * @Method Name : updateCommentProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param commentVO
	 * @return Integer
	 * @throws Exception
	 */ 
	public void updateCommentProc(CommentVO commentVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 댓글 삭제
	 * 2. 처리내용 :  댓글 삭제
	 * </pre>
	 * @Method Name : deleteCommentProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param commentVO
	 * @return void
	 * @throws Exception
	 */ 
	public void deleteCommentProc(CommentVO commentVO) throws Exception;
}

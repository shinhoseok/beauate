package com.beauate.admin.comment.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("commentDao")
public interface CommentDao {
	
	/**
	 * <pre>
	 * 1. 개요 : 댓글등록
	 * 2. 처리내용 :  댓글등록
	 * </pre>
	 * @Method Name : insertCommentMngProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param commentVO
	 * @return Integer
	 * @throws Exception
	 */ 
	Integer insertCommentMngProc(CommentVO commentVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 댓글상세조회
	 * 2. 처리내용 :  댓글상세조회
	 * </pre>
	 * @Method Name : selectCommentMngDetail
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param commentVO
	 * @return CommentVO
	 * @throws Exception
	 */ 
	CommentVO selectCommentMngDetail(CommentVO commentVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 댓글 수정
	 * 2. 처리내용 :  댓글 수정
	 * </pre>
	 * @Method Name : updateCommentProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param commentVO
	 * @return Integer
	 * @throws Exception
	 */ 
	Integer updateCommentProc(CommentVO commentVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 댓글 삭제
	 * 2. 처리내용 :  댓글 삭제
	 * </pre>
	 * @Method Name : updateCommentProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param commentVO
	 * @return Integer
	 * @throws Exception
	 */ 
	Integer deleteCommentProc(CommentVO commentVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 수강후기 댓글 리스트
	 * 2. 처리내용 :  마이페이지 수강후기 댓글 리스트
	 * </pre>
	 * @Method Name : selectCommentDetail
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param commentVO
	 * @return CommentVO
	 * @throws Exception
	 */ 
	List<CommentVO> selectCommentDetail(CommentVO commentVO) throws Exception;
}

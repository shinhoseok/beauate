package com.beauate.review.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("reviewDao")
public interface ReviewDao {
	
	/**
	 * <pre>
	 * 1. 개요 : 리뷰리스트 카운트
	 * 2. 처리내용 : 리뷰리스트 카운트
	 * </pre>
	 * @Method Name : insertReviewProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param reviewVO
	 * @return int
	 * @throws Exception
	 */ 
	int selectReviewListCnt(ReviewVO reviewVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 리뷰리스트
	 * 2. 처리내용 :  리뷰리스트
	 * </pre>
	 * @Method Name : selectReviewList
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param reviewVO
	 * @return List<ReviewVO>
	 * @throws Exception
	 */ 
	List<ReviewVO> selectReviewList(ReviewVO reviewVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 리뷰작성 등록처리
	 * 2. 처리내용 :  리뷰작성 등록처리
	 * </pre>
	 * @Method Name : insertReviewProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param reviewVO
	 * @return int
	 * @throws Exception
	 */ 
	int insertReviewProc(ReviewVO reviewVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자가 하나의 클래스에 작성한 리뷰카운트
	 * 2. 처리내용 :  사용자가 하나의 클래스에 작성한 리뷰카운트
	 * </pre>
	 * @Method Name : selectUserReviewCnt
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param reviewVO
	 * @return int
	 * @throws Exception
	 */ 
	int selectUserReviewCnt(ReviewVO reviewVO) throws Exception;
}

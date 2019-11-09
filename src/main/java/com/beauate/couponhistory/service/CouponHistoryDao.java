package com.beauate.couponhistory.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("couponHistoryDao")
public interface CouponHistoryDao {
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰내역 상세조회
	 * 2. 처리내용 :  쿠폰내역 상세조회
	 * </pre>
	 * @Method Name : selectCouponHistory
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param CouponHistoryVO
	 * @return CouponHistoryVO
	 * @throws Exception
	 */ 
	CouponHistoryVO selectCouponHistoryDetail(CouponHistoryVO couponHistoryVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰내역 등록처리
	 * 2. 처리내용 :  쿠폰내역 등록처리
	 * </pre>
	 * @Method Name : insertCouponHistoryProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param CouponHistoryVO
	 * @return void
	 * @throws Exception
	 */ 
	void insertCouponHistoryProc(CouponHistoryVO couponHistoryVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 사용시 업데이트
	 * 2. 처리내용 :  쿠폰 사용시 업데이트
	 * </pre>
	 * @Method Name : updateCouponHistoryProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param CouponHistoryVO
	 * @return void
	 * @throws Exception
	 */ 
	void updateCouponHistoryProc(CouponHistoryVO couponHistoryVO);
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 사용가능한 쿠폰 갯수
	 * 2. 처리내용 :  마이페이지 사용가능한 쿠폰 갯수
	 * </pre>
	 * @Method Name : selectMyCouponCnt
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param CouponHistoryVO
	 * @return void
	 * @throws Exception
	 */ 
	List<CouponHistoryVO> selectMyCouponList(CouponHistoryVO couponHistoryVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 사용가능한 쿠폰 갯수
	 * 2. 처리내용 :  마이페이지 사용가능한 쿠폰 갯수
	 * </pre>
	 * @Method Name : selectMyCouponListCnt
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param CouponHistoryVO
	 * @return void
	 * @throws Exception
	 */ 
	Integer selectMyCouponListCnt(CouponHistoryVO couponHistoryVO) throws Exception;
}

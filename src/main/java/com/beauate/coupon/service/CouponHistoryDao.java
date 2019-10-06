package com.beauate.coupon.service;

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
	 * 1. 개요 : 쿠폰내역 삭제처리
	 * 2. 처리내용 :  쿠폰내역 삭제처리
	 * </pre>
	 * @Method Name : deleteCouponHistoryProc
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
	void deleteCouponHistoryProc(CouponHistoryVO couponHistoryVO);
}

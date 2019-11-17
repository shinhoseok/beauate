package com.beauate.couponhistory.service;

public interface CouponHistoryService {
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰발급 > 발급내역이 있으면 안되 > 없으면 발급하고 등록
	 * 2. 처리내용 : 쿠폰발급 > 발급내역이 있으면 안되 > 없으면 발급하고 등록
	 * </pre>
	 * @Method Name : selectCouponHistoryProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param CouponHistoryVO
	 * @return boolean
	 * @throws Exception
	 */ 
	public boolean insertCouponHistoryProc(CouponHistoryVO couponHistoryVO) throws Exception;
}

package com.beauate.admin.coupon.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("couponManageDao")
public interface CouponManageDao {
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰관리 리스트
	 * 2. 처리내용 : 쿠폰관리 리스트
	 * </pre>
	 * @Method Name : selectCouponMngList
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return List<CouponVO>
	 * @throws Exception
	 */ 
	List<CouponVO> selectCouponMngList(CouponVO couponVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰관리 리스트 카운트
	 * 2. 처리내용 : 쿠폰관리 카운트
	 * </pre>
	 * @Method Name : selectCouponMngListCnt
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return Integer
	 * @throws Exception
	 */ 
	Integer selectCouponMngListCnt(CouponVO couponVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰관리 등록처리
	 * 2. 처리내용 : 쿠폰관리 등록처리
	 * </pre>
	 * @Method Name : insertCpnMngProc
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return Integer
	 * @throws Exception
	 */ 
	Integer insertCpnMngProc(CouponVO couponVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 상세
	 * 2. 처리내용 : 쿠폰 상세
	 * </pre>
	 * @Method Name : selectCpnMngDetail
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return CouponVO
	 * @throws Exception
	 */ 
	CouponVO selectCpnMngDetail(CouponVO couponVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 삭제
	 * 2. 처리내용 : 쿠폰 삭제
	 * </pre>
	 * @Method Name : deleteCpnMngProc
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return void
	 * @throws Exception
	 */ 
	void deleteCpnMngProc(CouponVO couponVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 수정
	 * 2. 처리내용 : 쿠폰 수정
	 * </pre>
	 * @Method Name : updateCpnMngProc
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return void
	 * @throws Exception
	 */ 
	void updateCpnMngProc(CouponVO couponVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자가 사용 가능한 쿠폰조회
	 * 2. 처리내용 : 사용자가 사용 가능한 쿠폰조회
	 * </pre>
	 * @Method Name : selectUserHavingCoupon
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return CouponVO
	 * @throws Exception
	 */ 
	public List<CouponVO> selectUserHavingCoupon(CouponVO couponVO) throws Exception;
}

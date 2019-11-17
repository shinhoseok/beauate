package com.beauate.admin.coupon.service;

import java.util.List;
import java.util.Map;

import com.beauate.admin.code.service.CodeVO;

public interface CouponManageService {
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰관리 리스트
	 * 2. 처리내용 : 쿠폰관리 리스트
	 * </pre>
	 * @Method Name : selectCouponMngList
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @return List<ProgramVO>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectCouponMngList(CouponVO couponVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰관리 등록(쿠폰상태 리스트)
	 * 2. 처리내용 : 쿠폰관리 등록(쿠폰상태 리스트)
	 * </pre>
	 * @Method Name : insertCpnMng
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return List<CodeVO>
	 * @throws Exception
	 */ 
	public List<CodeVO> insertCpnMng(CouponVO couponVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰관리 등록처리
	 * 2. 처리내용 : 쿠폰관리 등록처리
	 * </pre>
	 * @Method Name : insertCpnMngProc
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return void
	 * @throws Exception
	 */ 
	public void insertCpnMngProc(CouponVO couponVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 상세
	 * 2. 처리내용 : 쿠폰 상세
	 * </pre>
	 * @Method Name : selectCpnMngDetail
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return CouponVO
	 * @throws Exception
	 */ 
	public CouponVO selectCpnMngDetail(CouponVO couponVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 삭제
	 * 2. 처리내용 : 쿠폰 삭제
	 * </pre>
	 * @Method Name : deleteCpnMngProc
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return void
	 * @throws Exception
	 */ 
	public void deleteCpnMngProc(CouponVO couponVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 수정
	 * 2. 처리내용 : 쿠폰 수정
	 * </pre>
	 * @Method Name : updateCpnMngProc
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return void
	 * @throws Exception
	 */ 
	public void updateCpnMngProc(CouponVO couponVO) throws Exception;
}

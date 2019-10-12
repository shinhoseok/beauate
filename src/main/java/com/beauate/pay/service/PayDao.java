package com.beauate.pay.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("payDao")
public interface PayDao {
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 클래스 결제 리스트 카운트
	 * 2. 처리내용 :  마이페이지 클래스 결제 리스트 카운트
	 * </pre>
	 * @Method Name : selectPayListCnt
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return Integer
	 * @throws Exception
	 */ 
	Integer selectPayListCnt(PayVO payVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 클래스 결제 리스트
	 * 2. 처리내용 :  마이페이지 클래스 결제 리스트
	 * </pre>
	 * @Method Name : selectPayList
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return List<PayVO>
	 * @throws Exception
	 */ 
	List<PayVO> selectPayList(PayVO payVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 결제 등록처리
	 * 2. 처리내용 :  결제 등록처리
	 * </pre>
	 * @Method Name : insertPayProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO 
	 * @return void
	 * @throws Exception
	 */ 
	void insertPayProc(PayVO payVO) throws Exception;

	/**
	 * <pre>
	 * 1. 개요 : 결제내역삭제
	 * 2. 처리내용 :  결제내역삭제
	 * </pre>
	 * @Method Name : deletePayProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return void
	 * @throws Exception
	 */ 
	void deletePayProc(PayVO payVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 환불처리
	 * 2. 처리내용 :  환불처리
	 * </pre>
	 * @Method Name : updatePayRefundProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return void
	 * @throws Exception
	 */ 
	int updatePayRefundProc(PayVO payVO) throws Exception;
}

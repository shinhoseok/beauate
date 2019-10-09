package com.beauate.pay.service;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("payDao")
public interface PayDao {

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
	void insertPayProc(PayVO payVO);

}

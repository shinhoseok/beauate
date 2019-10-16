package com.beauate.admin.pay.service;

import java.util.Map;

import com.beauate.pay.service.PayVO;

public interface PayManageService {
	/**
	 * <pre>
	 * 1. 개요 : 결재관리리스트
	 * 2. 처리내용 : 결재관리리스트
	 * </pre>
	 * @Method Name : selectPayList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param payVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectPayMngList(PayVO payVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 결제상태 변경
	 * 2. 처리내용 : 결제상태 변경
	 * </pre>
	 * @Method Name : updatePayStProc
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param payVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	public void updatePayStProc(PayVO payVO) throws Exception;
}

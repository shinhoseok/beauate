package com.beauate.jjim.service;

public interface JjimService {
	
	/**
	 * <pre>
	 * 1. 개요 : 찜 조회 후 삭제 혹은 등록처리
	 * 2. 처리내용 :  찜 조회 후 삭제 혹은 등록처리
	 * </pre>
	 * @Method Name : selectJjimProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param jjimVO
	 * @return void
	 * @throws Exception
	 */ 
	public String selectJjimProc(JjimVO jjimVO) throws Exception;
}

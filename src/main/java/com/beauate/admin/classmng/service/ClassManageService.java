package com.beauate.admin.classmng.service;

import java.util.Map;

public interface ClassManageService {
	/**
	 * <pre>
	 * 1. 개요 : 클래스등록등록페이지
	 * 2. 처리내용 : 클래스등록등록페이지 코드 리스트
	 * </pre>
	 * @Method Name : selectClassCodeList
	 * @date : 2019. 9. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param String
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectClassCodeList() throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인 클래스 등록
	 * 2. 처리내용 :  오프라인 클래스 등록
	 * </pre>
	 * @Method Name : insertOffClassProc
	 * @date : 2019. 9. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @return void
	 * @throws Exception
	 */ 
	public void insertOffClassProc(ClassVO classVO) throws Exception;
}

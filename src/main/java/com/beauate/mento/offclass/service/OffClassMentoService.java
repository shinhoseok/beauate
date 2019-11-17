package com.beauate.mento.offclass.service;

import java.util.Map;

import com.beauate.admin.classmng.service.ClassVO;

public interface OffClassMentoService {
	/**
	 * <pre>
	 * 1. 개요 : 오프라인 클래스 리스트
	 * 2. 처리내용 :  오프라인 클래스 클래스 리스트
	 * </pre>
	 * @Method Name : selectClassList
	 * @date : 2019. 9. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param classVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectClassList(ClassVO classVO) throws Exception;
}

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
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
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
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @return void
	 * @throws Exception
	 */ 
	public void insertOffClassProc(ClassVO classVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인 클래스 리스트
	 * 2. 처리내용 :  오프라인 클래스 클래스 리스트
	 * </pre>
	 * @Method Name : selectClassList
	 * @date : 2019. 9. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectClassList(ClassVO classVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인 클래스 상세
	 * 2. 처리내용 :  오프라인 클래스 상세
	 * </pre>
	 * @Method Name : selectClassMngDetail
	 * @date : 2019. 9. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @return ClassVO
	 * @throws Exception
	 */ 
	public ClassVO selectClassMngDetail(ClassVO classVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인 클래스 수정
	 * 2. 처리내용 :  오프라인 클래스 수정
	 * </pre>
	 * @Method Name : updateClassMngProc
	 * @date : 2019. 9. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @return int
	 * @throws Exception
	 */ 
	public int updateClassMngProc(ClassVO classVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인 클래스 삭제
	 * 2. 처리내용 :  오프라인 클래스 삭제
	 * </pre>
	 * @Method Name : deleteClassMngProc
	 * @date : 2019. 9. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @return int
	 * @throws Exception
	 */ 
	public int deleteClassMngProc(ClassVO classVO) throws Exception;
}

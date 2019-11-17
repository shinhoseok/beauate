package com.beauate.admin.classmng.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("classManageDao")
public interface ClassManageDao {
	
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
	void insertOffClassProc(ClassVO classVO) throws Exception;

	List<ClassVO> selectClassList(ClassVO classVO);
	int selectClassListCnt(ClassVO classVO);
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인 클래스 리스트 카운트
	 * 2. 처리내용 :  오프라인 클래스 리스트 카운트
	 * </pre>
	 * @Method Name : selectClassMngListCnt
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
	 * @return Integer
	 * @throws Exception
	 */ 
	Integer selectClassMngListCnt(ClassVO classVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인 클래스 리스트
	 * 2. 처리내용 :  오프라인 클래스 리스트
	 * </pre>
	 * @Method Name : selectClassMngList
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
	 * @return List<ClassVO>
	 * @throws Exception
	 */ 
	List<ClassVO> selectClassMngList(ClassVO classVO) throws Exception;
	
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
	 * @return List<ClassVO>
	 * @throws Exception
	 */ 
	ClassVO selectClassMngDetail(ClassVO classVO) throws Exception;
	
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
	int updateClassMngProc(ClassVO classVO) throws Exception;
	
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
	int deleteClassMngProc(ClassVO classVO) throws Exception;
}

package com.beauate.jjim.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("jjimDao")
public interface JjimDao {

	/**
	 * <pre>
	 * 1. 개요 : 찜 리스트 카운트
	 * 2. 처리내용 :  찜 리스트 카운트
	 * </pre>
	 * @Method Name : selectJjimListCnt
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param jjimVO
	 * @return Integer
	 * @throws Exception
	 */ 
	Integer selectJjimListCnt(JjimVO jjimVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 찜 리스트
	 * 2. 처리내용 :  찜 리스트
	 * </pre>
	 * @Method Name : selectJjimList
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param jjimVO
	 * @return List<JjimVO>
	 * @throws Exception
	 */ 
	List<JjimVO> selectJjimList(JjimVO jjimVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 찜 조회
	 * 2. 처리내용 :  찜 조회
	 * </pre>
	 * @Method Name : selectJjim
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param jjimVO
	 * @return JjimVO
	 * @throws Exception
	 */ 
	JjimVO selectJjim(JjimVO jjimVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 찜 등록처리
	 * 2. 처리내용 :  찜 등록처리
	 * </pre>
	 * @Method Name : insertJjimProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param jjimVO
	 * @return void
	 * @throws Exception
	 */ 
	void insertJjimProc(JjimVO jjimVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 찜 삭제처리
	 * 2. 처리내용 :  찜 삭제처리
	 * </pre>
	 * @Method Name : deleteJjimProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param jjimVO
	 * @return void
	 * @throws Exception
	 */ 
	void deleteJjimProc(JjimVO jjimVO);
}

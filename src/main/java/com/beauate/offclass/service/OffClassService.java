package com.beauate.offclass.service;

import java.util.Map;

import com.beauate.admin.classmng.service.ClassVO;

public interface OffClassService {
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 리스트(첫화면 페이징없이 헤어,메이크업, 전체)
	 * 2. 처리내용 :  오프라인클래스 리스트(첫화면 페이징없이 헤어,메이크업, 전체)
	 * </pre>
	 * @Method Name : selectOffClassList
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectOffClassList(ClassVO ClassVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 리스트(첫화면 전체 ajax)
	 * 2. 처리내용 :  오프라인클래스 리스트(첫화면 전체 ajax)
	 * </pre>
	 * @Method Name : selectAllOffClassList
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectAllOffClassList(ClassVO classVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 리스트(탭<헤어,메이크업,...)
	 * 2. 처리내용 :  오프라인클래스 리스트(탭<헤어,메이크업,...)
	 * </pre>
	 * @Method Name : selectOffClassTabList
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectOffClassTabList(ClassVO classVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 상세화면
	 * 2. 처리내용 :  오프라인클래스 상세화면
	 * </pre>
	 * @Method Name : selectOffClassDetail
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectOffClassDetail(ClassVO classVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 결제화면
	 * 2. 처리내용 : 오프라인클래스 결제화면
	 * </pre>
	 * @Method Name : selectOffClassApplyDetail
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectOffClassApplyDetail(ClassVO classVO) throws Exception;
}

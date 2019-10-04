package com.beauate.offclass.service;

import java.util.List;

import com.beauate.admin.classmng.service.ClassVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("OffClassDao")
public interface OffClassDao {
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
	List<ClassVO> selectOffClassList(ClassVO ClassVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 상세(슬라이드사진)
	 * 2. 처리내용 :  오프라인클래스 상세(슬라이드사진)
	 * </pre>
	 * @Method Name : selectOffClassSideDetail
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
	List<ClassVO> selectOffClassSideDetail(ClassVO ClassVO) throws Exception;
}

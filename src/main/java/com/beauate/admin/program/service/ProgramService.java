package com.beauate.admin.program.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import com.beauate.admin.menu.service.MenuStatsVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface ProgramService {
	/**
	 * <pre>
	 * 1. 개요 : 프로그램관리 리스트
	 * 2. 처리내용 : 프로그램관리 리스트
	 * </pre>
	 * @Method Name : selectProgramList
	 * @date : 2019. 5. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	public void selectProgramList(ProgramVO programVO, ModelMap model) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램 상세 조회
	 * 2. 처리내용 : 프로그램 상세 조회
	 * </pre>
	 * @Method Name : selectProgram
	 * @date : 2019. 5. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 16.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param model
	 * @throws Exception
	 */ 	
	public void selectProgram(ProgramVO programVO, ModelMap model) throws Exception;
	
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램 변수 중복검사 서비스
	 * 2. 처리내용 : 프로그램 변수 중복검사 서비스
	 * </pre>
	 * @Method Name : pgmParamChk
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param model
	 * @throws Exception
	 */ 	
	public void pgmParamChk(ProgramVO programVO, ModelMap model) throws Exception;
	
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램 정보를 등록
	 * 2. 처리내용 : 프로그램 정보를 등록
	 * </pre>
	 * @Method Name : insertProgram
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @throws Exception
	 */ 	
	public void insertProgram(ProgramVO programVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램 정보를 수정
	 * 2. 처리내용 : 프로그램 정보를 수정
	 * </pre>
	 * @Method Name : updateProgram
	 * @date : 2019. 5. 18.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 18.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @throws Exception
	 */ 	
	public void updateProgram(ProgramVO programVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램 삭제
	 * 2. 처리내용 : 프로그램 삭제
	 * </pre>
	 * @Method Name : deleteProgram
	 * @date : 2019. 5. 18.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 18.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @throws Exception
	 */ 	
	public void deleteProgram(ProgramVO programVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 검색 조건에 맞추어 프로그램 목록 출력
	 * 2. 처리내용 : 관리자가 원하는 검색 조건에 맞게 페이징없이 프로그램 목록 출력해서 model에 담는다
	 * </pre>
	 * @Method Name : selectProgramListForExel
	 * @date : 2019. 6. 23.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 23.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param model
	 * @throws Exception
	 */ 	
	public void selectProgramListForExcel(ProgramVO programVO, ModelMap model) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 검색 조건에 맞추어 프로그램별 이용건수를 출력
	 * 2. 처리내용 : 검색 조건(시작일자,종료일자)에 맞게 프로그램 이용건수해서 model에 담는다
	 * </pre>
	 * @Method Name : getProgramChart
	 * @date : 2019. 7. 1.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 7.  1.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuStatsVO
	 * @param List<Map<String, Integer>>
	 * @throws Exception
	 */ 	
	public List<EgovMap> getProgramChart(MenuStatsVO menuStatsVO) throws Exception;
}

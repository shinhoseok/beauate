package com.beauate.admin.program.service;

import java.util.List;

import com.beauate.admin.menu.service.MenuStatsVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("programDao")
public interface ProgramDao {
	/**
	 * <pre>
	 * 1. 개요 : 프로그램관리 리스트
	 * 2. 처리내용 : 프로그램관리 리스트
	 * </pre>
	 * @Method Name : selectProgramList
	 * @date : 2019. 5. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @return List<ProgramVO>
	 * @throws Exception
	 */ 
	List<ProgramVO> selectProgramList(ProgramVO programVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램관리 리스트 총건수
	 * 2. 처리내용 :  프로그램관리 리스트 총건수
	 * </pre>
	 * @Method Name : selectProgramListCnt
	 * @date : 2019. 5. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @return int
	 * @throws Exception
	 */ 	
	int selectProgramListCnt(ProgramVO programVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 선택된 프로그램 상세정보를 가져온다.
	 * 2. 처리내용 : 선택된 프로그램 상세정보를 가져온다.
	 * </pre>
	 * @Method Name : selectProgram
	 * @date : 2019. 5. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 16.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @return ProgramVO
	 * @throws Exception
	 */ 	
	ProgramVO selectProgram(ProgramVO programVO) throws Exception;
	
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램 등록시 프로그램 변수 중복 검사
	 * 2. 처리내용 : 프로그램 등록시 프로그램 변수 중복 검사
	 * </pre>
	 * @Method Name : pgmParamChk
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @return int
	 * @throws Exception
	 */ 	
	int pgmParamChk(ProgramVO programVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램관리 프로그램을 등록 한다 
	 * 2. 처리내용 :  프로그램관리 프로그램을 등록 한다 
	 * </pre>
	 * @Method Name : insertProgram
	 * @date : 2019. 5. 13.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 13  신호석			 	          최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @return int
	 * @throws Exception
	 */ 	
	int insertProgram(ProgramVO programVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램관리 프로그램을 수정한다 
	 * 2. 처리내용 :  프로그램관리 프로그램을 수정한다 
	 * </pre>
	 * @Method Name : updateProgram
	 * @date : 2019. 5. 13.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일		         	 작성자				          변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 13			신호석				           최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @return int
	 * @throws Exception
	 */ 	
	int updateProgram(ProgramVO programVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램 삭제
	 * 2. 처리내용 : 프로그램 삭제
	 * </pre>
	 * @Method Name : deleteProgram
	 * @date : 2019. 5. 18.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 18.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @return
	 * @throws Exception
	 */ 	
	int deleteProgram(ProgramVO programVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램 삭제시 조건에 따른 추가 프로그램 수정
	 * 2. 처리내용 : 프로그램 삭제시 메뉴테이블에 맵핑되어 있는 프로그램ID를 null처리
	 * </pre>
	 * @Method Name : updatePgmIdMenu
	 * @date : 2019. 5. 18.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 18.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @throws Exception
	 */ 	
	void updatePgmIdMenu(ProgramVO programVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 검색 조건에 맞추어 프로그램별 이용건수를 출력
	 * 2. 처리내용 : 검색 조건(시작일자,종료일자)에 맞게 프로그램 이용건수 출력
	 * </pre>
	 * @Method Name : selectProgramChart
	 * @date : 2019. 7. 1.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 7.  1.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuStatsVO
	 * @throws Exception
	 */ 	
	List<EgovMap> selectProgramChart(MenuStatsVO menuStatsVO) throws Exception; 
}

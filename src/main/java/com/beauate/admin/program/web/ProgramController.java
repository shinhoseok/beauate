package com.beauate.admin.program.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.beauate.admin.menu.service.MenuStatsVO;
import com.beauate.admin.program.service.ProgramService;
import com.beauate.admin.program.service.ProgramVO;
import com.beauate.login.service.LoginVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class ProgramController {
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "programService")
	private ProgramService programService;
	
	
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
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	//method = RequestMethod.POST
	@RequestMapping(value = "/program/r/m/selectProgramList.do")
	public String selectProgramList(@ModelAttribute("programVO") ProgramVO programVO, ModelMap model) throws Exception {
		log.debug(">>> before selectProgramList, model : " + model);
		log.debug(">>> searchCondition&searchKeyworkd : " + programVO.getSearchCondition() + "&" + programVO.getSearchKeyword());
		log.debug(">>> firstIndex & lastIndex : " + programVO.getFirstIndex() + "&" + programVO.getLastIndex());
		
		programService.selectProgramList(programVO, model);
		
		log.debug(">>> Afer selectProgramList, model : " + model);
		log.debug(">>> searchCondition&searchKeyworkd : " + programVO.getSearchCondition() + "&" + programVO.getSearchKeyword());
		log.debug(">>> firstIndex & lastIndex : " + programVO.getFirstIndex() + "&" + programVO.getLastIndex());
		
		return "admin/program/programList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램 상세 조회
	 * 2. 처리내용 : 프로그램 상세 조회
	 * </pre>
	 * @Method Name : selectProgram
	 * @date : 2019. 5. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 16.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/program/r/m/selectProgram.do")
	public String selectProgram(@ModelAttribute("programVO") ProgramVO programVO, ModelMap model) throws Exception {
		log.debug(">>> before selectProgram : " + programVO);
		programService.selectProgram(programVO, model);
		log.debug(">>> Afer selectProgram : " + model);
		return "admin/program/programDetail";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램 변수가 중복여부 검사
	 * 2. 처리내용 : 프로그램 변수가 중복여부 검사
	 * </pre>
	 * @Method Name : pgmParamChk
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/program/a/n/pgmParamChk.do")
	public String pgmParamChk(@ModelAttribute("programVO") ProgramVO programVO, ModelMap model) throws Exception {
		log.debug(">>> Before pgmParamChk : " + model);
		programService.pgmParamChk(programVO, model);
		log.debug(">>> Afer pgmParamChk : " + model);
		
		return "jsonView";
	}
	
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램 등록하는 화면
	 * 2. 처리내용 : 프로그램 등록하는 화면
	 * </pre>
	 * @Method Name : insertProgram
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/program/w/m/insertProgram.do")
	public String insertProgram(@ModelAttribute("programVO") ProgramVO programVO, ModelMap model) throws Exception {
		log.debug(">>> model in insertProgram Controller : " + model);
		return "admin/program/programInsert";
	}

	/**
	 * <pre>
	 * 1. 개요 : 프로그램 등록화면에서 입력한 정보를 등록
	 * 2. 처리내용 : 프로그램 등록화면에서 입력한 정보를 등록
	 * </pre>
	 * @Method Name : insertProgramProc
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param sessionVO
	 * @param status
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/program/w/n/insertProgramProc.do")
	public String insertProgramProc(final MultipartHttpServletRequest multiRequest, @ModelAttribute("programVO") ProgramVO programVO,
			LoginVO sessionVO, SessionStatus status, ModelMap model) throws Exception {
		log.debug(">>> Befor insertProgramProc : " + model);
		log.debug(">>> sessionVO in insertProgramProc : " + sessionVO);
		
		programVO.setUsrId(sessionVO.getUsrId());
		programVO.setMenuRlDiv(sessionVO.getMenuRlDiv());	
		programService.insertProgram(programVO);
		status.setComplete();	//중복 submit 방지
		
		log.debug(">>> After insertProgramProc, model : " + model);
		log.debug(">>> After insertProgramProc, programVO : " + programVO);	
		return "redirect:/program/r/m/selectProgramList.do";

	}
	
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램 수정 화면
	 * 2. 처리내용 : 프로그램 수정 화면
	 * </pre>
	 * @Method Name : updateProgram
	 * @date : 2019. 5. 18.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 18.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/program/w/m/updateProgram.do")
	public String updateProgram(@ModelAttribute("programVO") ProgramVO programVO, ModelMap model) throws Exception {
		log.debug(">>> Before updateProgram, model : " + model);
		programService.selectProgram(programVO, model);
		log.debug(">>> After updateProgram, model : " + model);
		return "admin/program/programUpdate";
	}

	/**
	 * <pre>
	 * 1. 개요 : 프로그램 수정화면에서 변경된 정보를 수정
	 * 2. 처리내용 : 프로그램 수정화면에서 변경된 정보를 수정
	 * </pre>
	 * @Method Name : updateProgramProc
	 * @date : 2019. 5. 18.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 18.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param sessionVO
	 * @param status
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/program/w/n/updateProgramProc.do")
	public String updateProgramProc(final MultipartHttpServletRequest multiRequest, @ModelAttribute("programVO") ProgramVO programVO,
			LoginVO sessionVO, SessionStatus status, ModelMap model) throws Exception {
		log.debug(">>> Before updateProgramProc, model : " + model);
		log.debug(">>> Before updateProgramProc, programVO : " + programVO);
		
		programVO.setUsrId(sessionVO.getUsrId());
		programVO.setMenuRlDiv(sessionVO.getMenuRlDiv());
		programService.updateProgram(programVO);
		status.setComplete();	//중복 submit 방지
		
		log.debug(">>> After updateProgramProc, model : " + model);
		log.debug(">>> After updateProgramProc, programVO : " + programVO);		
		return "redirect:/program/r/m/selectProgram.do?pgmId=" + programVO.getPgmId();
	}

	/**
	 * <pre>
	 * 1. 개요 : 등록된 프로그램 삭제
	 * 2. 처리내용 : 선택한 프로그램 상세목록에서의 선택한 프로그램 삭제 기능
	 * </pre>
	 * @Method Name : deleteProgramProc
	 * @date : 2019. 6. 10.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 10.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param sessionVO
	 * @param status
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/program/w/n/deleteProgramProc.do")
	public String deleteProgramProc(@ModelAttribute("programVO") ProgramVO programVO,
			LoginVO sessionVO, SessionStatus status, ModelMap model) throws Exception {
		log.debug(">>> Before deleteProgramProc, model : " + model);
		log.debug(">>> Before deleteProgramProc, programVO : " + programVO);

		programVO.setUsrId(sessionVO.getUsrId());
		programVO.setMenuRlDiv(sessionVO.getMenuRlDiv());
		
		// 프로그램삭제, 메뉴에 맵핑되어있는 프로그램 아이디도 null 업데이트
		programService.deleteProgram(programVO);
		status.setComplete();	//중복 submit 방지
		
		log.debug(">>> After deleteProgramProc, model : " + model);
		log.debug(">>> After deleteProgramProc, programVO : " + programVO);
		return "redirect:/program/r/m/selectProgramList.do";
	}

	/**
	 * <pre>
	 * 1. 개요 : 프로그램 목록을 엑셀파일로 출력
	 * 2. 처리내용 : 검색한 프로그램 목록을 엑셀파일로 다운로드받을 수 있게 출력
	 * </pre>
	 * @Method Name : programListExelDownload
	 * @date : 2019. 6. 23.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 23.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param status
	 * @param sessionVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 
	@RequestMapping(value="/program/r/m/programListExcelDownload.do")
	public String programListExcelDownload(@ModelAttribute("programVO") ProgramVO programVO,
			SessionStatus status, LoginVO sessionVO, ModelMap model) throws Exception{
		programService.selectProgramListForExcel(programVO, model);
		return "excelView";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램통계 화면
	 * 2. 처리내용 : 프로그램별 이용률을 보기위한 시작일자, 종료일자를 입력받을 화면 출력
	 * </pre>
	 * @Method Name : programStatsChart
	 * @date : 2019. 7. 1.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 7.  1.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuStatsVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 
	@RequestMapping(value = "/programStats/r/m/programStatsChart.do")
	public String programStatsChart(@ModelAttribute("menuStatsVO") MenuStatsVO menuStatsVO, ModelMap model) throws Exception {
		return "admin/program/programStatsChart";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램통계 화면
	 * 2. 처리내용 : 시작/종료일자를 이용하여 프로그램별 이용률을 출력
	 * </pre>
	 * @Method Name : getProgramChart
	 * @date : 2019. 7. 1.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 7.  1.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuStatsVO
	 * @param model
	 * @return jsonView
	 * @throws Exception
	 */ 
	@RequestMapping(value = "/programStats/r/m/selectProgramChart.do")
	public String getProgramChart(@ModelAttribute("menuStatsVO") MenuStatsVO menuStatsVO, ModelMap model) throws Exception {
		log.debug(">>> In ProgramController, startDate/endDate : " + menuStatsVO.getStartDate() + "/" + menuStatsVO.getEndDate());
		List<EgovMap> chartDataList = programService.getProgramChart(menuStatsVO);
		model.addAttribute("chartDataList", chartDataList);
		model.addAttribute("test", "test");
		log.debug(">>> After getProgramChart, chartDataList : " + chartDataList);
		log.debug(">>> After getProgramChart, model : " + model);
		return "jsonView";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램통계 엑셀파일 출력
	 * 2. 처리내용 : 시작/종료일자를 이용하여 프로그램별 이용률을 엑셀파일로 출력
	 * </pre>
	 * @Method Name : programStatsExcelDownload
	 * @date : 2019. 7. 4.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 7.  4.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuStatsVO
	 * @param model
	 * @return excelView
	 * @throws Exception
	 */ 
	@RequestMapping(value = "/programStats/r/m/programStatsExcelDownload.do")
	public String programStatsExcelDownload(@ModelAttribute("menuStatsVO") MenuStatsVO menuStatsVO,
			SessionStatus status, LoginVO sessionVO, ModelMap model) throws Exception {
		List<EgovMap> chartDataList = programService.getProgramChart(menuStatsVO);
		
		model.addAttribute("programStatsForExcel", chartDataList);
		model.addAttribute("templateFileName"	, "programStatsExcelDownload.xls");
		model.addAttribute("destFileName"		, "프로그램통계");
		
		log.debug(">>> In programStatsExcelDownload, model : " + model);
		log.debug(">>> In programStatsExcelDownload, progrmaStatsForExcel : " + model.get("programStatsForExcel"));

		return "excelView";
	}
}

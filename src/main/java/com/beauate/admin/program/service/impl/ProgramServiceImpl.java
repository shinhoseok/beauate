package com.beauate.admin.program.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.beauate.admin.menu.service.MenuStatsVO;
import com.beauate.admin.program.service.ProgramDao;
import com.beauate.admin.program.service.ProgramService;
import com.beauate.admin.program.service.ProgramVO;
import com.beauate.common.StringUtil;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("programService")
public class ProgramServiceImpl extends EgovAbstractServiceImpl implements ProgramService {
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name="programDao")
	private ProgramDao programDao;
	
	@Resource(name="programIdGnrService")
	private EgovIdGnrService programIdGnrService;
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램 리스트
	 * 2. 처리내용 : 프로그램 리스트를 불러온다.
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
	public void selectProgramList(ProgramVO programVO, ModelMap model) throws Exception{
		log.debug(">>> Before pagingSetting, ProgramVO in ProgramServiceImpl : " + programVO);
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(programVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(programVO.getPageUnit());
		paginationInfo.setPageSize(programVO.getPageSize());
		
		programVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		programVO.setLastIndex(paginationInfo.getLastRecordIndex());
		programVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		log.debug(">>> Between after_paging and selectProgramList, ProgramVO : " + programVO);
		List<ProgramVO> selectList = null;
		
		//총 카운트 
		int cnt = programDao.selectProgramListCnt(programVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//리스트
			selectList = programDao.selectProgramList(programVO);
		}
		log.debug(">>> After selectProgramList, ProgramVO : " + programVO);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("programList", selectList);
		model.addAttribute("programListCnt", cnt);
	}
	
	
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
	 * @see kr.co.enkiadmin.admin.program.service.ProgramService#selectProgram(kr.co.enkiadmin.admin.program.service.ProgramVO, org.springframework.ui.ModelMap)
	 * @param programVO
	 * @param model
	 * @throws Exception
	 */ 	
	public void selectProgram(ProgramVO programVO, ModelMap model) throws Exception {
		model.addAttribute("resultVO", programDao.selectProgram(programVO));
	}
	
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
	 * @see kr.co.enkiadmin.admin.program.service.ProgramService#pgmParamChk(kr.co.enkiadmin.admin.program.service.ProgramVO, org.springframework.ui.ModelMap)
	 * @param programVO
	 * @param model
	 * @throws Exception
	 */ 	
	public void pgmParamChk(ProgramVO programVO, ModelMap model) throws Exception {
		int cnt = programDao.pgmParamChk(programVO);
		log.debug(">>>After pgmParamChk Impl : " + cnt);
		
		//프로그램 변수가 중복(cnt>0)을 경우 chkResult값을 'N', 중복이 아니면 'Y'로 한다
		model.addAttribute("chkResult", (cnt > 0) ? "N" : "Y");
	}
	
	
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
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.admin.program.service.ProgramService#insertProgram(kr.co.enkiadmin.admin.program.service.ProgramVO, org.springframework.ui.ModelMap)
	 * @param programVO
	 * @throws Exception
	 */ 	
	public void insertProgram(ProgramVO programVO) throws Exception {
		programVO.setPgmId(programIdGnrService.getNextStringId());
		log.debug(">>> programVO in insertProgram impl : " + programVO);
		programDao.insertProgram(programVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 프로그램 수정
	 * 2. 처리내용 : 프로그램 수정
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
	 * @see kr.co.enkiadmin.admin.program.service.ProgramService#updateProgram(kr.co.enkiadmin.admin.program.service.ProgramVO)
	 * @param programVO
	 * @throws Exception
	 */ 	
	public void updateProgram(ProgramVO programVO) throws Exception {
		log.debug(">>> updateProgram serviceImpl");
		programDao.updateProgram(programVO);
	}
	
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
	 * @see kr.co.enkiadmin.admin.program.service.ProgramService#deleteProgram(kr.co.enkiadmin.admin.program.service.ProgramVO)
	 * @param programVO
	 * @throws Exception
	 */ 	
	public void deleteProgram(ProgramVO programVO) throws Exception {
		int delResult = programDao.deleteProgram(programVO);
		
		//삭제 결과가 있을 경우 메뉴테이블에 맵핑되어 있는 ID를 null 처리한다
		if (delResult > 0) {
			programDao.updatePgmIdMenu(programVO);
		}
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 검색 조건에 맞추어 프로그램 목록 출력
	 * 2. 처리내용 : 관리자가 원하는 검색 조건에 맞게 페이징없이 프로그램 목록 출력해서 model에 담는다
	 * </pre>
	 * @Method Name : selectProgramListForExel
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
	public void selectProgramListForExcel(ProgramVO programVO, ModelMap model) throws Exception {
		programVO.setFirstIndex(1);
		programVO.setLastIndex(99999999);
		programVO.setSortDescend("asc");
		List<ProgramVO> selectList = programDao.selectProgramList(programVO);
		
		model.addAttribute("programList", selectList);
		model.addAttribute("templateFileName"	, "programListExcelDownload.xls");
		model.addAttribute("destFileName"		, "프로그램목록");
	}

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
	@Override
	public List<EgovMap> getProgramChart(MenuStatsVO menuStatsVO) throws Exception {
		log.debug(">>> In ProgramServiceImpl, startdate/endDate :" + menuStatsVO.getStartDate() + "/" + menuStatsVO.getEndDate());
		//초기값으로 현재날짜를 시작일자, 종료일자로 줌
		if("".equals(StringUtil.nvl(menuStatsVO.getStartDate()))){
			String curTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			menuStatsVO.setStartDate(curTime);
			menuStatsVO.setEndDate(curTime);
		}
		log.debug(">>> In ProgramServiceImpl, getProgramChart, menuStatsVO : " + menuStatsVO);
		return programDao.selectProgramChart(menuStatsVO);
	}
}

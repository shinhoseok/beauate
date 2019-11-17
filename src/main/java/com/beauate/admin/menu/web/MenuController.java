package com.beauate.admin.menu.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.beauate.admin.menu.service.MenuService;
import com.beauate.admin.menu.service.MenuStatsVO;
import com.beauate.admin.menu.service.MenuVO;
import com.beauate.admin.program.service.ProgramService;
import com.beauate.admin.program.service.ProgramVO;
import com.beauate.login.service.LoginVO;

@Controller
public class MenuController {
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "menuService")
	private MenuService menuService;

	@Resource(name = "programService")
	private ProgramService programService;

	/**
	 * <pre>
	 * 1. 개요 : 메뉴 관리의 메뉴체계도 트리 리스트 화면
	 * 2. 처리내용 : 메뉴 관리의 메뉴체계도 트리 리스트 화면
	 * </pre>
	 * @Method Name : selectMenuList
	 * @date : 2019. 6. 13.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 13.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/menu/r/m/selectMenuList.do")
	public String selectMenuList(@ModelAttribute("menuVO") MenuVO menuVO,
			ModelMap model) throws Exception {

		Map<String, Object> rsltMap = menuService.selectMenuList(menuVO, model);
		model.addAttribute("rslt", rsltMap);

		return "/admin/menu/menuList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 선택한 메뉴의 상세정보 화면 
	 * 2. 처리내용 : 선택한 메뉴의 상세정보 화면
	 * </pre>
	 * @Method Name : selectMenu
	 * @date : 2019. 6. 13.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 13.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/menu/r/n/selectMenu.do")
	public String selectMenu(@ModelAttribute("menuVO") MenuVO menuVO,
			ModelMap model) throws Exception {

		log.debug("selectMenu model:" + model);

		// 상세정보 , 권한 맵핑리스트
		menuVO = menuService.selectMenu(menuVO);
		model.addAttribute("menuVO", menuVO);

		return "/admin/menu/menuDetail";
	}

	/**
	 * <pre>
	 * 1. 개요 : 하위 메뉴 등록 화면 
	 * 2. 처리내용 : 하위 메뉴 등록 화면 
	 * </pre>
	 * @Method Name : insertMenu
	 * @date : 2019. 6. 13.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 13.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/menu/z/n/insertMenu.do")
	public String insertMenu(@ModelAttribute("menuVO") MenuVO menuVO,
			ModelMap model) throws Exception {

		log.debug("insertMenu model:" + model);

		// 현재 클릭된 메뉴가 새로 생성된 메뉴의 상위 메뉴가 됨
		menuVO.setUprMenuId(menuVO.getMenuId());
		// 같은 레벨의 리스트 갯수 ==> 갯수 + 1 하는게 기본 정렬 리스트 세팅값 즉 1라면 셀렉트박스가 1, 2 이고 2에 세팅
		Integer uprMenuCnt = menuService.selectUprMenuCnt(menuVO);
		model.addAttribute("uprMenuCnt", uprMenuCnt);

		return "/admin/menu/menuInsert";
	}

	/**
	 * <pre>
	 * 1. 개요 : 하위 메뉴 등록 창에서 입력한 데이터가 메뉴로 등록 
	 * 2. 처리내용 : 하위 메뉴 등록 창에서 입력한 데이터가 메뉴로 등록 
	 * </pre>
	 * @Method Name : insertMenuProc
	 * @date : 2019. 6. 13.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 13.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @param status
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/menu/z/n/insertMenuProc.do")
	public String insertMenuProc(@ModelAttribute("menuVO") MenuVO menuVO,
			SessionStatus status, LoginVO sessionVO, ModelMap model)
			throws Exception {

		log.debug("insertMenuProc model:" + model);

		// 아이디 세팅
		//menuVO.setRgId("enki");
		menuVO.setRgId(sessionVO.getUsrId());
		// 메뉴추가 및 정렬값 변경이면 업데이트도 변행해야함
		menuService.insertMenu(menuVO);
		// 중복 submit 방지
		status.setComplete();

		return "redirect:/menu/r/m/selectMenuList.do?menuId=" + menuVO.getMenuId();
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 선택한 메뉴 수정하는 화면 
	 * 2. 처리내용 : 선택한 메뉴 수정하는 화면 
	 * </pre>
	 * @Method Name : updateMenu
	 * @date : 2019. 6. 13.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 13.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/menu/z/n/updateMenu.do")
	public String updateMenu(@ModelAttribute("menuVO") MenuVO menuVO,
			ModelMap model) throws Exception {

		log.debug("updateMenu model:" + model);

		// 상세정보 , 권한 매핍리스트
		menuVO = menuService.selectMenu(menuVO);
		// 하위의 같은 레벨 메뉴의 갯수 (정렬을 위해)
		Integer uprMenuCnt = menuService.selectUprMenuCnt(menuVO);
		
		model.addAttribute("menuVO", menuVO);
		model.addAttribute("uprMenuCnt", uprMenuCnt);

		return "/admin/menu/menuUpdate";
	}

	/**
	 * <pre>
	 * 1. 개요 : 수정창에서 입력한 데이터 업데이트
	 * 2. 처리내용 : 수정창에서 입력한 데이터 업데이트
	 * </pre>
	 * @Method Name : updateMenuProc
	 * @date : 2019. 6. 13.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 13.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @param status
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/menu/z/n/updateMenuProc.do")
	public String updateMenuProc(@ModelAttribute("menuVO") MenuVO menuVO,
			SessionStatus status, LoginVO sessionVO, ModelMap model)
			throws Exception {

		log.debug("updateMenuProc:" + model);

		// 아이디 세팅
		menuVO.setModId(sessionVO.getUsrId());

		// 메뉴수정
		// 메뉴업데이트 및 정렬값 변경이면 업데이트도 변행해야함
		menuService.updateMenu(menuVO);
		// 중복 submit 방지
		status.setComplete();

		return "redirect:/menu/r/m/selectMenuList.do?menuId=" + menuVO.getMenuId();
	}

	/**
	 * <pre>
	 * 1. 개요 : 선택된 메뉴 삭제
	 * 2. 처리내용 : 선택된 메뉴 삭제
	 * </pre>
	 * @Method Name : deleteMenuProc
	 * @date : 2019. 6. 13.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 13.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @param status
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/menu/z/n/deleteMenuProc.do")
	public String deleteMenuProc(@ModelAttribute("menuVO") MenuVO menuVO,
			SessionStatus status, ModelMap model) throws Exception {

		// 메뉴삭제, 메뉴 권한 맵핑 테이블 삭제
		menuService.deleteMenu(menuVO);
		
		// 중복 submit 방지
		status.setComplete();
		log.debug("deleteMenuProc vo:" + menuVO);

		// 삭제 이후에는 부모 메뉴를 보여줘야함
		return "redirect:/menu/r/m/selectMenuList.do?menuId=" + menuVO.getUprMenuId();
	}

	/**
	 * <pre>
	 * 1. 개요 : 메뉴에 맵핑될 프로그램 리스트 팝업 화면
	 * 2. 처리내용 : 메뉴에 맵핑될 프로그램 리스트 팝업 화면
	 * </pre>
	 * @Method Name : selectProgramPopList
	 * @date : 2019. 6. 13.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 13.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/menu/r/n/selectProgramPopList.do")
	public String selectProgramPopList(
			@ModelAttribute("programVO") ProgramVO programVO, ModelMap model)
			throws Exception {

		programVO.setPgmGubun("Y");
		programService.selectProgramList(programVO, model);

		return "/admin/menu/programPopList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 현재 메뉴에서 권한 수정을 할때 뜨는 메뉴 권한 맵핑 화면
	 * 2. 처리내용 : 현재 메뉴에서 권한 수정을 할때 뜨는 메뉴 권한 맵핑 화면
	 * </pre>
	 * @Method Name : selectRolePopList
	 * @date : 2019. 6. 13.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 13.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/menu/z/n/selectRolePopList.do")
	public String selectRolePopList(@ModelAttribute("menuVO") MenuVO menuVO,
			ModelMap model) throws Exception {

		log.debug("selectRolePopList");
		log.debug("selectRolePopList model:" + model);

		// 권한 목록 리스트
		List<MenuVO> rolePopList = menuService.selectRolePopList(menuVO);
		// 권한 맵핑 리스트
		List<MenuVO> roleMappList = menuService.selectRoleMappList(menuVO);
		menuVO.setRoleMappList(roleMappList);

		model.addAttribute("rolePopList", rolePopList);
		model.addAttribute("menuVO", menuVO);

		return "/admin/menu/rolePopList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 메뉴 와 권한 맵핑 저장
	 * 2. 처리내용 : 메뉴 와 권한 맵핑 저장
	 * </pre>
	 * @Method Name : saveRoleMapp
	 * @date : 2019. 6. 13.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 13.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @param status
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/menu/z/n/saveRoleMapp.do")
	public String saveRoleMapp(@ModelAttribute("menuVO") MenuVO menuVO,
			SessionStatus status, LoginVO sessionVO, ModelMap model)
			throws Exception {

		// 아이디 세팅
		menuVO.setRgId(sessionVO.getUsrId());
		
		menuService.saveRoleMapp(menuVO);
		
		// 중복 submit 방지
		status.setComplete();

		return "jsonView";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴 차트
	 * 2. 처리내용 : 메뉴 차트
	 * </pre>
	 * @Method Name : selectMenuChart
	 * @date : 2019. 6. 21.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 21.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuStatsVO
	 * @param status
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value="/menuStats/r/m/selectMenuChart.do")
	public String selectMenuChart(@ModelAttribute("menuStatsVO") MenuStatsVO menuStatsVO,
			SessionStatus status, LoginVO sessionVO, ModelMap model)
			throws Exception {
		
		menuService.selectMenuChart(menuStatsVO, model);
		return "/admin/menu/menuStats";
	}

	/**
	 * <pre>
	 * 1. 개요 : 메뉴 차트 리스트
	 * 2. 처리내용 : 메뉴 차트 리스트
	 * </pre>
	 * @Method Name : selectMenuChartList
	 * @date : 2019. 6. 24.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 24.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuStatsVO
	 * @param status
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value="/menuStats/r/m/selectMenuChartList.do")
	public String selectMenuChartList(@ModelAttribute("menuStatsVO") MenuStatsVO menuStatsVO,
			SessionStatus status, LoginVO sessionVO, ModelMap model)
					throws Exception {
		
		menuService.selectMenuChartList(menuStatsVO, model);
		
		return "/admin/menu/menuStatsList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴통계 리스트 엑셀 다운로드
	 * 2. 처리내용 : 메뉴통계 리스트 엑셀 다운로드
	 * </pre>
	 * @Method Name : menuChartListExcelDownload
	 * @date : 2019. 6. 24.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 24.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuStatsVO
	 * @param status
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value="/menuStats/r/m/menuChartListExcelDownload.do")
	public String menuChartListExcelDownload(@ModelAttribute("menuStatsVO") MenuStatsVO menuStatsVO,
			SessionStatus status, LoginVO sessionVO, ModelMap model) throws Exception{
		
		Map<String, Object> rsltMap = menuService.menuChartListExcelDownload(menuStatsVO);
		
		model.addAttribute("dataList"			, rsltMap.get("menuChartList"));
		model.addAttribute("templateFileName"	, "menuChartListExcelDownload.xls");
		model.addAttribute("destFileName"		, "메뉴통계목록");
		
		return "excelView";
	}
}

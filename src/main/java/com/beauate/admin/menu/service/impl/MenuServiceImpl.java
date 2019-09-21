package com.beauate.admin.menu.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.beauate.admin.menu.service.MenuDao;
import com.beauate.admin.menu.service.MenuService;
import com.beauate.admin.menu.service.MenuStatsVO;
import com.beauate.admin.menu.service.MenuVO;
import com.beauate.common.StringUtil;
import com.google.gson.Gson;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("menuService")
public class MenuServiceImpl extends EgovAbstractServiceImpl implements MenuService {

	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name="menuDao")
	private MenuDao menuDao;

	//메뉴 테이블 id
	@Resource(name = "menuIdGnrService")
	private EgovIdGnrService menuIdGnrService;
	
	@Resource(name = "mnRlMappingIdGnrService")
	private EgovIdGnrService mnRlMappingIdGnrService;
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴의 트리 리스트 
	 * 2. 처리내용 : 메뉴의 트리 리스트 
	 * </pre>
	 * @Method Name : selectMenuList
	 * @date : 2016. 6. 24.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2016. 6. 24.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.admin.menu.service.MenuService#selectMenuList(kr.co.enkiadmin.admin.menu.service.MenuVO, org.springframework.ui.ModelMap)
	 * @param menuVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@Override
	public Map<String, Object> selectMenuList(MenuVO menuVO, ModelMap model) throws Exception{
		
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		
		//메뉴 리스트
		List<MenuVO> selectList = menuDao.selectMenuList(menuVO);
		
		//왼쪽 메뉴 클릭 시 초기 세팅값 ( 트리중에서 root를 제외한 0 )제일 상단 값 세팅)
		if("I".equals(StringUtil.nvl(menuVO.getMenuUrlGubun()).trim()) || "".equals(StringUtil.nvl(menuVO.getMenuId()).trim())){
			MenuVO tempVO = null;
			
			for (int i = 0; i < selectList.size(); i++) {
				
				tempVO = new MenuVO();
				tempVO = selectList.get(i);
				
				if(tempVO.getUprMenuId() != null){
					menuVO.setMenuId(tempVO.getMenuId());
					menuVO.setLevel(tempVO.getLevel());
					menuVO.setMenuLup(tempVO.getMenuLup());
					menuVO.setUprMenuId(tempVO.getUprMenuId());
					break;
				}
			}
		}
			
		rsltMap.put("menuList", selectList);
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 :  선택된 메뉴의 상세 정보 와 그 메뉴의 권한맵핑 목록 리스트 
	 * 2. 처리내용 :  선택된 메뉴의 상세 정보 와 그 메뉴의 권한맵핑 목록 리스트 
	 * </pre>
	 * @Method Name : selectMenu
	 * @date : 2016. 6. 24.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2016. 6. 24.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.admin.menu.service.MenuService#selectMenu(kr.co.enkiadmin.admin.menu.service.MenuVO)
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	@Override
	public MenuVO selectMenu(MenuVO menuVO) throws Exception{
		
		//메뉴 상세 정보
		menuVO = menuDao.selectMenu(menuVO);
		
		//메뉴 룰 상세 정보
		List<MenuVO> selectList = menuDao.selectRoleMappList(menuVO);
		menuVO.setRoleMappList(selectList);
		
		return menuVO;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 정렬을 위한 메뉴의 갯수 리스트
	 * 2. 처리내용 : 정렬을 위한 메뉴의 갯수 리스트
	 * </pre>
	 * @Method Name : selectUprMenuCnt
	 * @date : 2016. 6. 24.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2016. 6. 24.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.admin.menu.service.MenuService#selectUprMenuCnt(kr.co.enkiadmin.admin.menu.service.MenuVO)
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	@Override
	public int selectUprMenuCnt(MenuVO menuVO) throws Exception{
		
		return menuDao.selectUprMenuCnt(menuVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 하위 메뉴 등록 창에서 입력한 데이터가 메뉴로 등록
	 * 2. 처리내용 : 하위 메뉴 등록 창에서 입력한 데이터가 메뉴로 등록
	 * </pre>
	 * @Method Name : insertMenu
	 * @date : 2016. 6. 24.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2016. 6. 24.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.admin.menu.service.MenuService#insertMenu(kr.co.enkiadmin.admin.menu.service.MenuVO)
	 * @param menuVO
	 * @throws Exception
	 */ 	
	@Override
	public void insertMenu(MenuVO menuVO) throws Exception{
		
		//메뉴 추가
		menuVO.setMenuId(menuIdGnrService.getNextStringId());
		menuDao.insertMenu(menuVO);
		
		//정렬값 변경이면 업데이트도 변행해야함
		menuDao.insertMenuOrder(menuVO);
		
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 선택된 메뉴의 맵핑이 되지않은 포탈관리 권한의 권한리스트 목록
	 * 2. 처리내용 : 선택된 메뉴의 맵핑이 되지않은 포탈관리 권한의 권한리스트 목록
	 * </pre>
	 * @Method Name : selectRolePopList
	 * @date : 2016. 6. 24.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2016. 6. 24.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.admin.menu.service.MenuService#selectRolePopList(kr.co.enkiadmin.admin.menu.service.MenuVO)
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	@Override
	public List<MenuVO> selectRolePopList (MenuVO menuVO) throws Exception{
		
		//관리자용 메뉴에서 권한을 맵핑할때에는 포탈 관리 권한으로 등록된 권한그룹리스트만을 보여줌
		if("2".equals(menuVO.getMenuDiv())){
			menuVO.setRlCls("A");
		}
		
		return menuDao.selectRolePopList(menuVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 현재 메뉴의 맵핑된 권한 리스트 
	 * 2. 처리내용 : 현재 메뉴의 맵핑된 권한 리스트 
	 * </pre>
	 * @Method Name : selectRoleMappList
	 * @date : 2016. 6. 24.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2016. 6. 24.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.admin.menu.service.MenuService#selectRoleMappList(kr.co.enkiadmin.admin.menu.service.MenuVO)
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	@Override
	public List<MenuVO> selectRoleMappList (MenuVO menuVO) throws Exception{
		
		return menuDao.selectRoleMappList(menuVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 선택한 메뉴와 권한을 맵핑하여 등록및 삭제 
	 * 2. 처리내용 : 선택한 메뉴와 권한을 맵핑하여 등록및 삭제 
	 * </pre>
	 * @Method Name : saveRoleMapp
	 * @date : 2016. 6. 24.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2016. 6. 24.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.admin.menu.service.MenuService#saveRoleMapp(kr.co.enkiadmin.admin.menu.service.MenuVO)
	 * @param menuVO
	 * @throws Exception
	 */ 	
	@Override
	public void saveRoleMapp(MenuVO menuVO) throws Exception{
		
		//메뉴와 권한 맵핑 추가 
		List<MenuVO> roleMappList = menuVO.getRoleMappList();
		MenuVO tempVO;
		
		if(roleMappList != null){
			//삭제
			menuDao.deleteRoleMappList(menuVO);
			
			for (int i = 0; i < roleMappList.size(); i++) {
				tempVO = new MenuVO();
				tempVO = roleMappList.get(i);
				
				tempVO.setMppgId(mnRlMappingIdGnrService.getNextStringId());
				tempVO.setMenuId(menuVO.getMenuId());
				tempVO.setRgId(menuVO.getRgId());
				
				//등록
				menuDao.insertRoleMappList(tempVO);
			}
		}
	}
	
	/**
	 * <pre>
	 * 1. 개요 :  메뉴의 수정창에서 입력한 데이터를 업데이트
	 * 2. 처리내용 :  메뉴의 수정창에서 입력한 데이터를 업데이트
	 * </pre>
	 * @Method Name : updateMenu
	 * @date : 2016. 6. 24.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2016. 6. 24.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.admin.menu.service.MenuService#updateMenu(kr.co.enkiadmin.admin.menu.service.MenuVO)
	 * @param menuVO
	 * @throws Exception
	 */ 	
	@Override
	public void updateMenu(MenuVO menuVO) throws Exception{
		
		//정렬값이 변하지 않는 경우 그냥 현재 메뉴 업데이트
		if(menuVO.getPreMenuLup().equals(menuVO.getMenuLup())){
			menuDao.updateMenu(menuVO);
		}
		//정렬값이 변한 경우에는 같은 부모를 가지고 있는 동레벨의 메뉴들의 정렬값을 update 해줘야함
		else{
			//정렬값 업데이트
			menuDao.updateMenuOrder(menuVO);
			//현재값 업데이트
			menuDao.updateMenu(menuVO);
		}
	} 

	/**
	 * <pre>
	 * 1. 개요 : 선택한 메뉴를 삭제 하며 그 메뉴에 맵핑된 권한도 삭제 , 동 레벨 그룹의 메뉴를 다시 재정렬
	 * 2. 처리내용 : 선택한 메뉴를 삭제 하며 그 메뉴에 맵핑된 권한도 삭제 , 동 레벨 그룹의 메뉴를 다시 재정렬
	 * </pre>
	 * @Method Name : deleteMenu
	 * @date : 2016. 6. 24.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2016. 6. 24.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.admin.menu.service.MenuService#deleteMenu(kr.co.enkiadmin.admin.menu.service.MenuVO)
	 * @param menuVO
	 * @throws Exception
	 */ 	
	@Override
	public void deleteMenu(MenuVO menuVO) throws Exception{
		
		//메뉴 권한 맵핑삭제 (먼저)
		menuDao.deleteRoleMappList(menuVO);
		//메뉴삭제 (나중에)
		menuDao.deleteMenu(menuVO);
		
		//같은 레벨의 메뉴들 재정렬 (현재 메뉴 정렬값보다 크다면 -1 씩 업데이트)
		menuDao.deletMenuOrder(menuVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 레프트 메뉴 클릭 시 메뉴 경로 이력 등록
	 * 2. 처리내용 : 레프트 메뉴 클릭 시 메뉴 경로 이력 등록
	 * </pre>
	 * @Method Name : routeHistory
	 * @date : 2016. 6. 21.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2016. 6. 21.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.admin.menu.service.MenuService#routeHistory(kr.co.enkiadmin.admin.menu.service.MenuStatsVO)
	 * @param menuStatsVO
	 * @throws Exception
	 */ 	
	@Override
	public void menuStatsInsert(MenuStatsVO menuStatsVO) throws Exception{
		menuDao.menuStatsInsert(menuStatsVO);
	}

	/**
	 * <pre>
	 * 1. 개요 : 메뉴 차트
	 * 2. 처리내용 : 메뉴 차트
	 * </pre>
	 * @Method Name : selectMenuChart
	 * @date : 2016. 6. 21.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2016. 6. 21.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.admin.menu.service.MenuService#selectMenuChart(kr.co.enkiadmin.admin.menu.service.MenuStatsVO, org.springframework.ui.ModelMap)
	 * @param menuStatsVO
	 * @param model
	 * @throws Exception
	 */ 	
	@Override
	public void selectMenuChart(MenuStatsVO menuStatsVO, ModelMap model) throws Exception {

		if("".equals(StringUtil.nvl(menuStatsVO.getStartDate()))){
			String curTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			menuStatsVO.setStartDate(curTime);
			menuStatsVO.setEndDate(curTime);
		}
		
		List<EgovMap> menuStatsChart = menuDao.selectMenuChart(menuStatsVO);
		Gson gson = new Gson();
		String menuStatsChartJson = gson.toJson(menuStatsChart);
		
		model.addAttribute("menuStatsChartJson", menuStatsChartJson);
	}

	/**
	 * <pre>
	 * 1. 개요 :  메뉴 차트 리스트
	 * 2. 처리내용 :  메뉴 차트 리스트
	 * </pre>
	 * @Method Name : selectMenuChartList
	 * @date : 2016. 6. 22.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2016. 6. 22.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.admin.menu.service.MenuService#selectMenuChartList(kr.co.enkiadmin.admin.menu.service.MenuStatsVO, org.springframework.ui.ModelMap)
	 * @param menuStatsVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@Override
	public void selectMenuChartList(MenuStatsVO menuStatsVO, ModelMap model) throws Exception {
		
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(menuStatsVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(menuStatsVO.getPageUnit());
		paginationInfo.setPageSize(menuStatsVO.getPageSize());
		
		menuStatsVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		menuStatsVO.setLastIndex(paginationInfo.getLastRecordIndex());
		menuStatsVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<EgovMap> selectList = null;
		
		// 현재 날짜 세팅
		if("".equals(StringUtil.nvl(menuStatsVO.getStartDate()))){
			String curTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			menuStatsVO.setStartDate(curTime);
			menuStatsVO.setEndDate(curTime);
		}
		
		int cnt = menuDao.selectMenuChartListCnt(menuStatsVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			if(null == menuStatsVO.getSortSubject()){
				menuStatsVO.setSortSubject("visitDate");
				menuStatsVO.setSortDescend("desc");
			}
			selectList = menuDao.selectMenuChartList(menuStatsVO);
		}
		
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("menuChartListCnt", cnt);
		model.addAttribute("menuChartList", selectList);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴통계 리스트 엑셀 다운로드
	 * 2. 처리내용 : 메뉴통계 리스트 엑셀 다운로드
	 * </pre>
	 * @Method Name : menuChartListExcelDownload
	 * @date : 2016. 6. 24.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2016. 6. 24.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.admin.menu.service.MenuService#menuChartListExcelDownload(kr.co.enkiadmin.admin.menu.service.MenuStatsVO)
	 * @param menuStatsVO
	 * @return
	 * @throws Exception
	 */ 	
	public Map<String, Object> menuChartListExcelDownload(MenuStatsVO menuStatsVO) throws Exception {
		
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		
		// 엑셀 다운로드 페이징 없애기 위해 값 세팅
		menuStatsVO.setFirstIndex(1); 
		menuStatsVO.setLastIndex(99999999);
		
		List<EgovMap> selectList = null;
		
		// 현재 날짜 세팅
		if("".equals(StringUtil.nvl(menuStatsVO.getStartDate()))){
			String curTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			menuStatsVO.setStartDate(curTime);
			menuStatsVO.setEndDate(curTime);
		}
		
		int cnt = menuDao.selectMenuChartListCnt(menuStatsVO);
		
		if(cnt > 0){
			if(null == menuStatsVO.getSortSubject()){
				menuStatsVO.setSortSubject("visitDate");
				menuStatsVO.setSortDescend("desc");
			}
			selectList = menuDao.selectMenuChartList(menuStatsVO);
		}
		
		rsltMap.put("menuChartListCnt", cnt);
		rsltMap.put("menuChartList", selectList);
		
		return rsltMap;
	}
}

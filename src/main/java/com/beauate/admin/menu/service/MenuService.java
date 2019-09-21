package com.beauate.admin.menu.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.ModelMap;

public interface MenuService {
	/**
	 * <pre>
	 * 1. 개요 : 메뉴의 트리 리스트
	 * 2. 처리내용 : 메뉴의 트리 리스트
	 * </pre>
	 * @Method Name : selectMenuList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	public Map<String, Object> selectMenuList(MenuVO menuVO, ModelMap model) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 선택된 메뉴의 상세 정보 와 그 메뉴의 권한맵핑 목록 리스트 
	 * 2. 처리내용 : 선택된 메뉴의 상세 정보 와 그 메뉴의 권한맵핑 목록 리스트 
	 * </pre>
	 * @Method Name : selectMenu
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	public MenuVO selectMenu(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 정렬을 위한 메뉴의 갯수 리스트 
	 * 2. 처리내용 : 정렬을 위한 메뉴의 갯수 리스트 
	 * </pre>
	 * @Method Name : selectUprMenuCnt
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	public int selectUprMenuCnt(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 하위 메뉴 등록 창에서 입력한 데이터가 메뉴로 등록
	 * 2. 처리내용 : 하위 메뉴 등록 창에서 입력한 데이터가 메뉴로 등록
	 * </pre>
	 * @Method Name : insertMenu
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @throws Exception
	 */ 	
	public void insertMenu(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 선택된 메뉴의 맵핑이 되지않은 포탈관리 권한의 권한리스트 목록
	 * 2. 처리내용 : 선택된 메뉴의 맵핑이 되지않은 포탈관리 권한의 권한리스트 목록
	 * </pre>
	 * @Method Name : selectRolePopList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	public List<MenuVO> selectRolePopList (MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 현재 메뉴의 맵핑된 권한 리스트 
	 * 2. 처리내용 : 현재 메뉴의 맵핑된 권한 리스트 
	 * </pre>
	 * @Method Name : selectRoleMappList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	public List<MenuVO> selectRoleMappList (MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 선택한 메뉴와 권한을 맵핑하여 등록및 삭제 
	 * 2. 처리내용 : 선택한 메뉴와 권한을 맵핑하여 등록및 삭제 
	 * </pre>
	 * @Method Name : saveRoleMapp
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @throws Exception
	 */ 	
	public void saveRoleMapp(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴의 수정창에서 입력한 데이터를 업데이트
	 * 2. 처리내용 : 메뉴의 수정창에서 입력한 데이터를 업데이트
	 * </pre>
	 * @Method Name : updateMenu
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @throws Exception
	 */ 	
	public void updateMenu(MenuVO menuVO) throws Exception;

	/**
	 * <pre>
	 * 1. 개요 : 선택한 메뉴를 삭제 하며 그 메뉴에 맵핑된 권한도 삭제 , 동 레벨 그룹의 메뉴를 다시 재정렬
	 * 2. 처리내용 : 선택한 메뉴를 삭제 하며 그 메뉴에 맵핑된 권한도 삭제 , 동 레벨 그룹의 메뉴를 다시 재정렬
	 * </pre>
	 * @Method Name : deleteMenu
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @throws Exception
	 */ 	
	public void deleteMenu(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 레프트 메뉴 클릭 시 메뉴 경로 이력 등록
	 * 2. 처리내용 : 레프트 메뉴 클릭 시 메뉴 경로 이력 등록
	 * </pre>
	 * @Method Name : menuStatsInsert
	 * @date : 2019. 6. 21.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 21.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuStatsVO
	 * @throws Exception
	 */ 	
	public void menuStatsInsert(MenuStatsVO menuStatsVO) throws Exception;

	/**
	 * <pre>
	 * 1. 개요 : 메뉴 차트
	 * 2. 처리내용 : 메뉴 차트
	 * </pre>
	 * @Method Name : selectMenuChart
	 * @date : 2019. 6. 21.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 21.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuStatsVO
	 * @param model
	 * @throws Exception
	 */ 	
	public void selectMenuChart(MenuStatsVO menuStatsVO, ModelMap model) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴 차트 리스트
	 * 2. 처리내용 : 메뉴 차트 리스트
	 * </pre>
	 * @Method Name : selectMenuChartList
	 * @date : 2019. 6. 21.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 21.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuStatsVO
	 * @param model
	 * @throws Exception
	 */ 	
	public void selectMenuChartList(MenuStatsVO menuStatsVO, ModelMap model) throws Exception;
	
	public Map<String, Object> menuChartListExcelDownload(MenuStatsVO menuStatsVO) throws Exception;
}

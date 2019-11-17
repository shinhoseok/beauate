package com.beauate.common.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.admin.menu.service.MenuVO;
import com.beauate.common.service.CommonDao;
import com.beauate.common.service.CommonService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("commonService")
public class CommonServiceImpl extends EgovAbstractServiceImpl implements CommonService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	/**
	 * <pre>
	 * 1. 개요 : 인터셉터에서  uri 정보로 메뉴 권한 가져오기
	 * 2. 처리내용 : 인터셉터에서  uri 정보로 메뉴 권한 가져오기
	 * </pre>
	 * @Method Name : selectMenuRole
	 * @date : 2019. 6. 3.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 3.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.common.service.CommonService#selectMenuRole(kr.co.enkiadmin.admin.menu.service.MenuVO)
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	@Override
	public String selectMenuRole(MenuVO menuVO) throws Exception {
		return commonDao.selectMenuRole(menuVO);
	}

	/**
	 * <pre>
	 * 1. 개요 : 현재 선택되어야하는 메뉴의 1 ,2, 3레벨 값을 세팅
	 * 2. 처리내용 : 현재 선택되어야하는 메뉴의 1 ,2, 3레벨 값을 세팅
	 * </pre>
	 * @Method Name : selectSearchMenuId
	 * @date : 2019. 6. 3.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 3.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.common.service.CommonService#selectSearchMenuId(kr.co.enkiadmin.admin.menu.service.MenuVO)
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	@Override
	public MenuVO selectSearchMenuId(MenuVO menuVO) throws Exception{
		MenuVO tempVO = commonDao.selectSearchMenuId(menuVO);
		menuVO.setMenuId1Lvl(tempVO.getMenuId1Lvl());
		menuVO.setMenuId2Lvl(tempVO.getMenuId2Lvl());
		menuVO.setMenuId3Lvl(tempVO.getMenuId3Lvl());
		menuVO.setMenuMiniLvl(tempVO.getMenuMiniLvl());
		return menuVO;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 탑 메뉴 리스트
	 * 2. 처리내용 : 사용자의 권한에 맞는 탑 메뉴 리스트
	 * </pre>
	 * @Method Name : selectTopMenuList
	 * @date : 2019. 6. 3.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 3.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.common.service.CommonService#selectTopMenuList(kr.co.enkiadmin.admin.menu.service.MenuVO)
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	public List<MenuVO> selectTopMenuList(MenuVO menuVO) throws Exception{
		//탑 메뉴 리스트
		return commonDao.selectTopMenuList(menuVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 포탈 관리 클릭후 자신의 관리 권한에 속한 메뉴중  프로그램이 연결되어있고 탑의 제일 앞, 레프트의 가장 상단 메뉴 정보
	 * 2. 처리내용 : 포탈 관리 클릭후 자신의 관리 권한에 속한 메뉴중  프로그램이 연결되어있고 탑의 제일 앞, 레프트의 가장 상단 메뉴 정보
	 * </pre>
	 * @Method Name : selectPortalAdminMenu
	 * @date : 2019. 6. 29.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 29.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	public String selectPortalAdminMenu(MenuVO menuVO) throws Exception{
		
		return commonDao.selectPortalAdminMenu(menuVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 서브 타이틀 리스트
	 * 2. 처리내용 : 서브 컨텐츠 메뉴의 제목 옆에 메뉴에 대한 서브 타이틀 리스트
	 * </pre>
	 * @Method Name : selectSubTitleList
	 * @date : 2019. 6. 3.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 3.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.common.service.CommonService#selectSubTitleList(kr.co.enkiadmin.admin.menu.service.MenuVO)
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	public List<MenuVO> selectSubTitleList(MenuVO menuVO) throws Exception{
		return commonDao.selectSubTitleList(menuVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 레프트 메뉴 리스트 
	 * 2. 처리내용 : 사용자의 권한과 탑메뉴에 맞는 레프트 메뉴 리스트 
	 * </pre>
	 * @Method Name : selectLeftMenuList
	 * @date : 2019. 6. 3.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 3.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.common.service.CommonService#selectLeftMenuList(kr.co.enkiadmin.admin.menu.service.MenuVO)
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	public List<MenuVO> selectLeftMenuList(MenuVO menuVO) throws Exception{
		//레프트 메뉴 리스트
		return commonDao.selectLeftMenuList(menuVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴 정보 
	 * 2. 처리내용 : 탑메뉴를 클릭했을때 이동해야하는 메뉴 정보 
	 * </pre>
	 * @Method Name : selectTopMenuBridge
	 * @date : 2019. 6. 3.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 3.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.common.service.CommonService#selectTopMenuBridge(kr.co.enkiadmin.admin.menu.service.MenuVO)
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	public String selectTopMenuBridge(MenuVO menuVO) throws Exception{
		return commonDao.selectTopMenuBridge(menuVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 
	 * 2. 처리내용 : 
	 * </pre>
	 * @Method Name : selectLeftMenuUrl
	 * @date : 2019. 6. 29.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 29.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see kr.co.enkiadmin.common.service.CommonService#selectLeftMenuUrl(java.lang.String)
	 * @param menuId
	 * @return
	 * @throws Exception
	 */ 	
	public Map<String, Object> selectLeftMenuUrl(String menuId) throws Exception{
		return commonDao.selectLeftMenuUrl(menuId);
	}
}

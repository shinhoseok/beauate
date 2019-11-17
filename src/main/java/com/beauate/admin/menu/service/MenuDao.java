package com.beauate.admin.menu.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("menuDao")
public interface MenuDao {
	/**
	 * <pre>
	 * 1. 개요 : 트리 모양 메뉴 의 리스트   
	 * 2. 처리내용 : 트리 모양 메뉴 의 리스트   
	 * </pre>
	 * @Method Name : selectMenuList
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	List<MenuVO> selectMenuList(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 트리 모양 메뉴 의 리스트 총 카운트 
	 * 2. 처리내용 : 트리 모양 메뉴 의 리스트 총 카운트 
	 * </pre>
	 * @Method Name : selectMenuListCnt
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	int selectMenuListCnt(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴의 상세 정보 
	 * 2. 처리내용 : 메뉴의 상세 정보 
	 * </pre>
	 * @Method Name : selectMenu
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	MenuVO selectMenu(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 하위의 같은 레벨 메뉴의 갯수 
	 * 2. 처리내용 : 하위의 같은 레벨 메뉴의 갯수 
	 * </pre>
	 * @Method Name : selectUprMenuCnt
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	int selectUprMenuCnt(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 등록창에서 작성한 메뉴를 등록  
	 * 2. 처리내용 : 등록창에서 작성한 메뉴를 등록 
	 * </pre>
	 * @Method Name : insertMenu
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @throws Exception
	 */ 	
	void insertMenu(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴 등록으로 인한 동레벨 메뉴 재정렬  
	 * 2. 처리내용 : 메뉴 등록으로 인한 동레벨 메뉴 재정렬  
	 * </pre>
	 * @Method Name : insertMenuOrder
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @throws Exception
	 */ 	
	void insertMenuOrder(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 권한 팝업시 권한목록
	 * 2. 처리내용 : 권한 팝업시 권한목록
	 * </pre>
	 * @Method Name : selectRolePopList
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	List<MenuVO> selectRolePopList(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 권한 팝업시 메뉴 맵핑 목록
	 * 2. 처리내용 : 권한 팝업시 메뉴 맵핑 목록
	 * </pre>
	 * @Method Name : selectRoleMappList
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */ 	
	List<MenuVO> selectRoleMappList(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴 권한 맵핑 삭제
	 * 2. 처리내용 : 메뉴 권한 맵핑 삭제
	 * </pre>
	 * @Method Name : deleteRoleMappList
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @throws Exception
	 */ 	
	void deleteRoleMappList(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴 권한 맵핑 등록
	 * 2. 처리내용 : 메뉴 권한 맵핑 등록
	 * </pre>
	 * @Method Name : insertAuthMappList
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param authMappList
	 * @throws Exception
	 */ 	
	void insertRoleMappList(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴 수정
	 * 2. 처리내용 : 메뉴 수정
	 * </pre>
	 * @Method Name : updateMenu
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @throws Exception
	 */ 	
	void updateMenu(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴 수정시 메뉴 정렬값 수정
	 * 2. 처리내용 : 메뉴 수정시 메뉴 정렬값 수정
	 * </pre>
	 * @Method Name : updateMenuOrder
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @throws Exception
	 */ 	
	void updateMenuOrder(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴 삭제
	 * 2. 처리내용 : 메뉴 삭제
	 * </pre>
	 * @Method Name : deleteMenu
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @throws Exception
	 */ 	
	void deleteMenu(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴삭제시 같은 레벨의 메뉴들 재정렬
	 * 2. 처리내용 : 메뉴삭제시 같은 레벨의 메뉴들 재정렬
	 * </pre>
	 * @Method Name : deletMenuOrder
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @throws Exception
	 */ 	
	void deletMenuOrder(MenuVO menuVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 레프트 메뉴 클릭 시 메뉴 경로 이력 등록
	 * 2. 처리내용 : 레프트 메뉴 클릭 시 메뉴 경로 이력 등록
	 * </pre>
	 * @Method Name : routeHistory
	 * @date : 2019. 6. 21.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 21.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param logVO
	 * @throws Exception
	 */ 	
	public void menuStatsInsert(MenuStatsVO logVO) throws Exception;
	
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
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 21.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param logVO
	 * @return
	 * @throws Exception
	 */ 	
	List<EgovMap> selectMenuChart(MenuStatsVO logVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 :  메뉴 차트 리스트 총 건수
	 * 2. 처리내용 : 
	 * </pre>
	 * @Method Name : selectMenuChartListCnt
	 * @date : 2019. 6. 21.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 21.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param logVO
	 * @return
	 * @throws Exception
	 */ 	
	int selectMenuChartListCnt(MenuStatsVO logVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴 차트 리스트
	 * 2. 처리내용 : 메뉴 차트 리스트
	 * </pre>
	 * @Method Name : selectMenuChartList
	 * @date : 2019. 6. 21.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 21.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param logVO
	 * @return
	 * @throws Exception
	 */ 	
	List<EgovMap> selectMenuChartList(MenuStatsVO logVO) throws Exception;
}

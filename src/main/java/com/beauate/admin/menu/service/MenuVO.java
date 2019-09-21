package com.beauate.admin.menu.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class MenuVO extends CommDefaultVO implements Serializable {
	/** 메뉴아이디 */
	private String menuId; 
	/** 메뉴구분 */
	private String menuDiv;
	/** 메뉴이름 */
	private String menuName;
	/** 메뉴에 대한 설명 */
	private String menuDes;
	/** 현재 메뉴의 상위 메뉴 ID */
	private String uprMenuId;
	/** 메뉴내에서의 정렬순서 */
	private Integer menuLup;
	/** 프로그램 아이디 */
	private String pgmId;
	/** 외부URL */
	private String otUrl;
	/** 사용 유무 */
	private String useYn;
	/** 트리의 레벨 */
	private String level;
	/** 메뉴의 레벨 */
	private String menuLvl;
	/** 트리의 leaf 구분값 */
	private String isleaf;
	/** 트리의 루트 */
	private String root;
	/** 이전 정렬값 (메뉴수정시 정렬값이 바뀌면 그 레벨의 메뉴들이 업데이트되야함) */
	private Integer preMenuLup; 
	
	
	/** 프로그램 이름 */
	private String pgmName;
	/** 프로그램 URL */
	private String pgmUrl;
	/** 프로그램 변수 */
	private String pgmParam;
	
	
	/** 맵핑시 아이디 */
	private String mppgId; 
	/** 프로그램의 권한구분 */
	private String rlDiv;  
	/** 권한 아이디*/
	private String rlId;
	/** 권한 코드 */
	private String rlCd;
	/** 권한 이름 */
	private String rlName;
	/** 권한 분류 */
	private String rlCls;
	
   
	/** 1레벨 메뉴아이디 */
	private String menuId1Lvl; 
	/** 2레벨 메뉴아이디 */
	private String menuId2Lvl; 
	/** 3레벨 메뉴아이디 */
	private String menuId3Lvl; 
	/** 메뉴 선택시 최소 레벨 */
	private String menuMiniLvl; 
	/** 메뉴 클릭시  B (탑메뉴 브릿지), M(2레벨 메뉴 열고 닫기만), I ( 내부콘텐츠), PI( 팝업 + 내부콘텐츠), PO(팝업 + 외부 컨텐츠) */
	private String menuUrlGubun;
	
	/** 메뉴 등록 구분값 */
	private String menuRegYn;
	
	/** 메뉴 권한 맵핑 리스트 */
	@SuppressWarnings("unchecked")
	private List<MenuVO> roleMappList = LazyList.decorate( new ArrayList<MenuVO>(), FactoryUtils.instantiateFactory(MenuVO.class));

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getMenuDiv() {
		return menuDiv;
	}

	public void setMenuDiv(String menuDiv) {
		this.menuDiv = menuDiv;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuDes() {
		return menuDes;
	}

	public void setMenuDes(String menuDes) {
		this.menuDes = menuDes;
	}

	public String getUprMenuId() {
		return uprMenuId;
	}

	public void setUprMenuId(String uprMenuId) {
		this.uprMenuId = uprMenuId;
	}

	public Integer getMenuLup() {
		return menuLup;
	}

	public void setMenuLup(Integer menuLup) {
		this.menuLup = menuLup;
	}

	public String getPgmId() {
		return pgmId;
	}

	public void setPgmId(String pgmId) {
		this.pgmId = pgmId;
	}

	public String getOtUrl() {
		return otUrl;
	}

	public void setOtUrl(String otUrl) {
		this.otUrl = otUrl;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getMenuLvl() {
		return menuLvl;
	}

	public void setMenuLvl(String menuLvl) {
		this.menuLvl = menuLvl;
	}

	public String getIsleaf() {
		return isleaf;
	}

	public void setIsleaf(String isleaf) {
		this.isleaf = isleaf;
	}

	public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}

	public Integer getPreMenuLup() {
		return preMenuLup;
	}

	public void setPreMenuLup(Integer preMenuLup) {
		this.preMenuLup = preMenuLup;
	}

	public String getPgmName() {
		return pgmName;
	}

	public void setPgmName(String pgmName) {
		this.pgmName = pgmName;
	}

	public String getPgmUrl() {
		return pgmUrl;
	}

	public void setPgmUrl(String pgmUrl) {
		this.pgmUrl = pgmUrl;
	}

	public String getPgmParam() {
		return pgmParam;
	}

	public void setPgmParam(String pgmParam) {
		this.pgmParam = pgmParam;
	}

	public String getMppgId() {
		return mppgId;
	}

	public void setMppgId(String mppgId) {
		this.mppgId = mppgId;
	}

	public String getRlDiv() {
		return rlDiv;
	}

	public void setRlDiv(String rlDiv) {
		this.rlDiv = rlDiv;
	}

	public String getRlId() {
		return rlId;
	}

	public void setRlId(String rlId) {
		this.rlId = rlId;
	}

	public String getRlCd() {
		return rlCd;
	}

	public void setRlCd(String rlCd) {
		this.rlCd = rlCd;
	}

	public String getRlName() {
		return rlName;
	}

	public void setRlName(String rlName) {
		this.rlName = rlName;
	}

	public String getRlCls() {
		return rlCls;
	}

	public void setRlCls(String rlCls) {
		this.rlCls = rlCls;
	}

	public String getMenuId1Lvl() {
		return menuId1Lvl;
	}

	public void setMenuId1Lvl(String menuId1Lvl) {
		this.menuId1Lvl = menuId1Lvl;
	}

	public String getMenuId2Lvl() {
		return menuId2Lvl;
	}

	public void setMenuId2Lvl(String menuId2Lvl) {
		this.menuId2Lvl = menuId2Lvl;
	}

	public String getMenuId3Lvl() {
		return menuId3Lvl;
	}

	public void setMenuId3Lvl(String menuId3Lvl) {
		this.menuId3Lvl = menuId3Lvl;
	}

	public String getMenuMiniLvl() {
		return menuMiniLvl;
	}

	public void setMenuMiniLvl(String menuMiniLvl) {
		this.menuMiniLvl = menuMiniLvl;
	}

	public String getMenuUrlGubun() {
		return menuUrlGubun;
	}

	public void setMenuUrlGubun(String menuUrlGubun) {
		this.menuUrlGubun = menuUrlGubun;
	}

	public String getMenuRegYn() {
		return menuRegYn;
	}

	public void setMenuRegYn(String menuRegYn) {
		this.menuRegYn = menuRegYn;
	}

	public List<MenuVO> getRoleMappList() {
		return roleMappList;
	}

	public void setRoleMappList(List<MenuVO> roleMappList) {
		this.roleMappList = roleMappList;
	}
}

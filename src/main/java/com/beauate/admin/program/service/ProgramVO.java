package com.beauate.admin.program.service;

import java.io.Serializable;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class ProgramVO extends CommDefaultVO implements Serializable {
	/** 프로그램 아이디 */
	private String pgmId;
	/** 프로그램 이름 */
	private String pgmName;
	/** 프로그램의 URL주소 */
	private String pgmUrl;
	/** 프로그램에 대한 설명 */
	private String pgmDes;
	/** 프로그램 과 실제 class 간에 연관 변수값 */
	private String pgmParam;
	/** 프로그램 메뉴 맵핑시 구분 값 (Y일때 프로그램 맵핑)  */
	private String pgmGubun;
	/** 메뉴에 따른 권한 아이디 r(읽기) w(등록) z(관리)  */
	private String menuRlDiv;
	
	public String getPgmId() {
		return pgmId;
	}
	public void setPgmId(String pgmId) {
		this.pgmId = pgmId;
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
	public String getPgmDes() {
		return pgmDes;
	}
	public void setPgmDes(String pgmDes) {
		this.pgmDes = pgmDes;
	}
	public String getPgmParam() {
		return pgmParam;
	}
	public void setPgmParam(String pgmParam) {
		this.pgmParam = pgmParam;
	}
	public String getPgmGubun() {
		return pgmGubun;
	}
	public void setPgmGubun(String pgmGubun) {
		this.pgmGubun = pgmGubun;
	}
	public String getMenuRlDiv() {
		return menuRlDiv;
	}
	public void setMenuRlDiv(String menuRlDiv) {
		this.menuRlDiv = menuRlDiv;
	}
}

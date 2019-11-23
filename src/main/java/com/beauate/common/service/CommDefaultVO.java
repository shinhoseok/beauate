package com.beauate.common.service;

import java.io.Serializable;

@SuppressWarnings("serial")
public class CommDefaultVO implements Serializable {
	/** 검색조건 */
	private String searchCondition = "";

	/** 검색Keyword */
	private String searchKeyword = "";

	/** 검색사용여부 */
	private String searchUseYn = "";

	/** 현재페이지 */
	private int pageIndex = 1;

	/** 페이지갯수 */
	private int pageUnit = 10;

	/** 페이지사이즈 */
	private int pageSize = 10;

	/** firstIndex */
	private int firstIndex = 1;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage */
	private int recordCountPerPage = 5;

	/** 등록자 아이디 */
	private String rgId;

	/** 등록자명 */
	private String rgNm;

	/** 등록일자 */
	private String rgDt;

	/** 등록일자 */
	private String rgDtStr;

	/** 수정자 아이디 */
	private String modId;

	/** 수정자명 */
	private String modNm;

	/** 수정일자 */
	private String modDt;

	/** 수정일자 */
	private String modDtStr;

	/** 사용자 로그인 아이디 */
	private String usrId;

	/** 사용자 명 */
	private String usrNm;
	
	/** 정렬조건 */
	private String sortSubject;

	/** 정렬방식 */
	private String sortDescend;

	/** 메뉴에 따른 권한 아이디 r(읽기) w(등록) z(관리) */
	private String menuRlDiv;
	
	/** 권한 아이디 */
	private String rlId;
	
	/** 권한 매핑 아이디 */
	private String mppgId;

	/** 첨부파일 아이디 */
	private String atchFileId;
	
	/** 이메일 주소 */
	private String emailAddr;
	
	/** 삭제여부 */
	private String delYn;

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String getEmailAddr() {
		return emailAddr;
	}

	public void setEmailAddr(String emailAddr) {
		this.emailAddr = emailAddr;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getSearchUseYn() {
		return searchUseYn;
	}

	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getRgId() {
		return rgId;
	}

	public void setRgId(String rgId) {
		this.rgId = rgId;
	}

	public String getRgNm() {
		return rgNm;
	}

	public void setRgNm(String rgNm) {
		this.rgNm = rgNm;
	}

	public String getRgDt() {
		return rgDt;
	}

	public void setRgDt(String rgDt) {
		this.rgDt = rgDt;
	}

	public String getRgDtStr() {
		return rgDtStr;
	}

	public void setRgDtStr(String rgDtStr) {
		this.rgDtStr = rgDtStr;
	}

	public String getModId() {
		return modId;
	}

	public void setModId(String modId) {
		this.modId = modId;
	}

	public String getModNm() {
		return modNm;
	}

	public void setModNm(String modNm) {
		this.modNm = modNm;
	}

	public String getModDt() {
		return modDt;
	}

	public void setModDt(String modDt) {
		this.modDt = modDt;
	}

	public String getModDtStr() {
		return modDtStr;
	}

	public void setModDtStr(String modDtStr) {
		this.modDtStr = modDtStr;
	}

	public String getUsrId() {
		return usrId;
	}

	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}

	public String getUsrNm() {
		return usrNm;
	}

	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}

	public String getSortSubject() {
		return sortSubject;
	}

	public void setSortSubject(String sortSubject) {
		this.sortSubject = sortSubject;
	}

	public String getSortDescend() {
		return sortDescend;
	}

	public void setSortDescend(String sortDescend) {
		this.sortDescend = sortDescend;
	}

	public String getMenuRlDiv() {
		return menuRlDiv;
	}

	public void setMenuRlDiv(String menuRlDiv) {
		this.menuRlDiv = menuRlDiv;
	}

	public String getRlId() {
		return rlId;
	}

	public void setRlId(String rlId) {
		this.rlId = rlId;
	}

	public String getMppgId() {
		return mppgId;
	}

	public void setMppgId(String mppgId) {
		this.mppgId = mppgId;
	}

	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
}

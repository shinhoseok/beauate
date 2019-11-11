package com.beauate.admin.classmng.service;

import java.io.Serializable;
import java.util.Date;
import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class ClassVO extends CommDefaultVO implements Serializable {

	/** 페이징넘버 */
	private String RNUM;
	/** 클래스번호 */
	private String classId;
	/** 클래스 개설자 번호 */
	private String classUserId;
	/** 클래스 이미지 번호 */
	private String classImgId;
	/** 클래스등록일 */
	private Date classRegDt;
	/** 클래스상태코드 */
	private String classSt;
	/** 클래스상태명 */
	private String classStNm;
	/** 클래스구분 */
	private String classGb;
	/** 클래스구분명 */
	private String classGbNm;
	/** 카테고리코드 */
	private String classCtSt;
	/** 카테고리명 */
	private String classCtStNm;
	/** 지역코드 */
	private String classAreaSt;
	/** 지역코드명 */
	private String classAreaStNm;
	/** 타이틀제목 */
	private String classTitle;
	/** 클래스시작일 */
	private String classStartDt;
	/** 클래스종료일 */
	private String classEndDt;
	/** 클래스시간 */
	private String classTime;
	/** 최소인원 */
	private String classSmallNo;
	/** 최대인원 */
	private String classBigNo;
	/** 신청인원 */
	private String classApplyNo;
	/** 주소 */
	private String classAdr;
	/** 클래스비용 */
	private int classCost;
	/** 외부링크 */
	private String classWebAdr;
	/** 이미지주소 목록 */
	private String imgSrc;
	/** 이미지주소 상세디테일 */
	private String imgSrc2;
	/** 이미지주소 알람신청 작은사진 */
	private String imgSrc3;
	/** 이미지주소관리자는 필요없으므로 구분자 유저는 N */
	private String adminYn;
	/** 게시판에 이미지가 몇장 들어가는지 */
	private String imgCnt;
	/** 클래스인원체크 */
	private boolean personnelChk = false;
	/** 클래스담당자 전화번호 */
	private String mblPno;
	/** 클래스상세페이지 탭이동할 값 */
	private String detailGoTab;
	
	public String getDetailGoTab() {
		return detailGoTab;
	}
	public void setDetailGoTab(String detailGoTab) {
		this.detailGoTab = detailGoTab;
	}
	public String getMblPno() {
		return mblPno;
	}
	public void setMblPno(String mblPno) {
		this.mblPno = mblPno;
	}
	public boolean isPersonnelChk() {
		return personnelChk;
	}
	public void setPersonnelChk(boolean personnelChk) {
		this.personnelChk = personnelChk;
	}
	public String getImgSrc3() {
		return imgSrc3;
	}
	public void setImgSrc3(String imgSrc3) {
		this.imgSrc3 = imgSrc3;
	}
	public String getImgSrc2() {
		return imgSrc2;
	}
	public void setImgSrc2(String imgSrc2) {
		this.imgSrc2 = imgSrc2;
	}
	public String getImgCnt() {
		return imgCnt;
	}
	public void setImgCnt(String imgCnt) {
		this.imgCnt = imgCnt;
	}
	public String getAdminYn() {
		return adminYn;
	}
	public void setAdminYn(String adminYn) {
		this.adminYn = adminYn;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	public String getRNUM() {
		return RNUM;
	}
	public void setRNUM(String rNUM) {
		RNUM = rNUM;
	}
	public String getClassImgId() {
		return classImgId;
	}
	public void setClassImgId(String classImgId) {
		this.classImgId = classImgId;
	}
	public String getClassUserId() {
		return classUserId;
	}
	public void setClassUserId(String classUserId) {
		this.classUserId = classUserId;
	}
	public String getClassAreaStNm() {
		return classAreaStNm;
	}
	public void setClassAreaStNm(String classAreaStNm) {
		this.classAreaStNm = classAreaStNm;
	}
	public String getClassCtStNm() {
		return classCtStNm;
	}
	public void setClassCtStNm(String classCtStNm) {
		this.classCtStNm = classCtStNm;
	}
	public String getClassStNm() {
		return classStNm;
	}
	public void setClassStNm(String classStNm) {
		this.classStNm = classStNm;
	}
	public String getClassGbNm() {
		return classGbNm;
	}
	public void setClassGbNm(String classGbNm) {
		this.classGbNm = classGbNm;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public Date getClassRegDt() {
		return classRegDt;
	}
	public void setClassRegDt(Date classRegDt) {
		this.classRegDt = classRegDt;
	}
	public String getClassSt() {
		return classSt;
	}
	public void setClassSt(String classSt) {
		this.classSt = classSt;
	}
	public String getClassGb() {
		return classGb;
	}
	public void setClassGb(String classGb) {
		this.classGb = classGb;
	}
	public String getClassCtSt() {
		return classCtSt;
	}
	public void setClassCtSt(String classCtSt) {
		this.classCtSt = classCtSt;
	}
	public String getClassAreaSt() {
		return classAreaSt;
	}
	public void setClassAreaSt(String classAreaSt) {
		this.classAreaSt = classAreaSt;
	}
	public String getClassTitle() {
		return classTitle;
	}
	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}
	public String getClassStartDt() {
		return classStartDt;
	}
	public void setClassStartDt(String classStartDt) {
		this.classStartDt = classStartDt;
	}
	public String getClassEndDt() {
		return classEndDt;
	}
	public void setClassEndDt(String classEndDt) {
		this.classEndDt = classEndDt;
	}
	public String getClassTime() {
		return classTime;
	}
	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}
	public String getClassSmallNo() {
		return classSmallNo;
	}
	public void setClassSmallNo(String classSmallNo) {
		this.classSmallNo = classSmallNo;
	}
	public String getClassBigNo() {
		return classBigNo;
	}
	public void setClassBigNo(String classBigNo) {
		this.classBigNo = classBigNo;
	}
	public String getClassApplyNo() {
		return classApplyNo;
	}
	public void setClassApplyNo(String classApplyNo) {
		this.classApplyNo = classApplyNo;
	}
	public String getClassAdr() {
		return classAdr;
	}
	public void setClassAdr(String classAdr) {
		this.classAdr = classAdr;
	}
	public int getClassCost() {
		return classCost;
	}
	public void setClassCost(int classCost) {
		this.classCost = classCost;
	}
	public String getClassWebAdr() {
		return classWebAdr;
	}
	public void setClassWebAdr(String classWebAdr) {
		this.classWebAdr = classWebAdr;
	}
}

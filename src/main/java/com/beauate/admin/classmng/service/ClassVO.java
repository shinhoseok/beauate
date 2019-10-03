package com.beauate.admin.classmng.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.beauate.admin.user.service.UserVO;
import com.beauate.common.service.CommDefaultVO;

import egovframework.cmmn.service.FileVO;

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
	
	private List<FileVO> classFileList;
	
	private List<ClassReviewVO> classReviewList;

	private UserVO mentor;
	
	public UserVO getMentor() {
		return mentor;
	}
	public void setMentor(UserVO mentor) {
		this.mentor = mentor;
	}
	public List<FileVO> getClassFileList() {
		return classFileList;
	}
	public void setClassFileList(List<FileVO> classFileList) {
		this.classFileList = classFileList;
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
	public List<ClassReviewVO> getClassReviewList() {
		return classReviewList;
	}
	public void setClassReviewList(List<ClassReviewVO> classReviewList) {
		this.classReviewList = classReviewList;
	}
}

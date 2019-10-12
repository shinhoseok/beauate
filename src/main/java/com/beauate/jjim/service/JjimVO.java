package com.beauate.jjim.service;

import java.io.Serializable;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class JjimVO extends CommDefaultVO implements Serializable {
	/** 찜 아이디 */
	private String jjimId;
	/** 클래스 아이디 */
	private String classId;
	/** 클래스 최종가격 */
	private String classCostNo;
	/** 클래스 제목 */
	private String classTitle;
	/** 클래스 주소 */
	private String classAdr;
	/** 클래스 시작일 */
	private String classStartDt;
	/** 클래스 상태 */
	private String classSt;
	/** 클래스 종료일 */
	private String classEndDt;
	/** 클래스 최대인원 */
	private String classBigNo;
	/** 클래스 현재신청인원 */
	private String classApplyNo;
	/** 클래스 이미지경로 */
	private String imgSrc1;
	/** 클래스 카테고리 */
	private String classCt;

	public String getClassCt() {
		return classCt;
	}

	public void setClassCt(String classCt) {
		this.classCt = classCt;
	}

	public String getClassCostNo() {
		return classCostNo;
	}

	public void setClassCostNo(String classCostNo) {
		this.classCostNo = classCostNo;
	}

	public String getClassTitle() {
		return classTitle;
	}

	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}

	public String getClassAdr() {
		return classAdr;
	}

	public void setClassAdr(String classAdr) {
		this.classAdr = classAdr;
	}

	public String getClassStartDt() {
		return classStartDt;
	}

	public void setClassStartDt(String classStartDt) {
		this.classStartDt = classStartDt;
	}

	public String getClassSt() {
		return classSt;
	}

	public void setClassSt(String classSt) {
		this.classSt = classSt;
	}

	public String getClassEndDt() {
		return classEndDt;
	}

	public void setClassEndDt(String classEndDt) {
		this.classEndDt = classEndDt;
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

	public String getImgSrc1() {
		return imgSrc1;
	}

	public void setImgSrc1(String imgSrc1) {
		this.imgSrc1 = imgSrc1;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getJjimId() {
		return jjimId;
	}

	public void setJjimId(String jjimId) {
		this.jjimId = jjimId;
	}
	
}

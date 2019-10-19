package com.beauate.pay.service;

import java.io.Serializable;
import java.util.Date;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class PayVO extends CommDefaultVO implements Serializable {
	/** 결제 아이디 */
	private String payId;
	/** 클래스 아이디 */
	private String classId;
	/** 쿠폰 아이디 */
	private String couponId;
	/** 결제일 */
	private Date payDt;
	/** 결제상태 */
	private String paySt;
	/** 결제방법 */
	private String payMethodSt;
	/** 최종결제금액 */
	private String payCostNo;
	/** 쿠폰금액 */
	private String couponMoney;
	/** 멘토번호 */
	private String mentoMblPno;
	/** 클래스허용인원 */
	private String classApplyNo;
	/** 클래스허용인원 */
	private String classBigNo;
	/** 클래스금액 */
	private String classCostNo;
	/** 클래스제목 */
	private String classTitle;
	/** 클래스주소 */
	private String classAdr;
	/** 클래스시작일 */
	private String classStartDt;
	/** 마이페이지이미지경로 */
	private String imgSrc2;
	/** 마이페이지이미지경로 */
	private String imgSrc3;
	/** 쿠폰할인율 */
	private String cpnRate;
	/** 마이페이지 탭번호 */
	private String mypageTab;
	/** 지역명 */
	private String areaNm;
	/** 클래스종료일 */
	private String classEndDt;
	/** 클래스 상태 */
	private String classSt;
	/** 클래스 상태명 */
	private String classStNm;
	/** 결제 삭제 여부 */
	private String delYn;
	/** 결제 방법명 */
	private String payMethodNm;
	/** 결제 상태명 */
	private String payStNm;

	public String getClassStNm() {
		return classStNm;
	}
	public void setClassStNm(String classStNm) {
		this.classStNm = classStNm;
	}
	public String getImgSrc3() {
		return imgSrc3;
	}
	public void setImgSrc3(String imgSrc3) {
		this.imgSrc3 = imgSrc3;
	}
	public String getPayMethodNm() {
		return payMethodNm;
	}
	public void setPayMethodNm(String payMethodNm) {
		this.payMethodNm = payMethodNm;
	}
	public String getPayStNm() {
		return payStNm;
	}
	public void setPayStNm(String payStNm) {
		this.payStNm = payStNm;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getClassEndDt() {
		return classEndDt;
	}
	public void setClassEndDt(String classEndDt) {
		this.classEndDt = classEndDt;
	}
	public String getClassSt() {
		return classSt;
	}
	public void setClassSt(String classSt) {
		this.classSt = classSt;
	}
	public String getAreaNm() {
		return areaNm;
	}
	public void setAreaNm(String areaNm) {
		this.areaNm = areaNm;
	}
	public String getMypageTab() {
		return mypageTab;
	}
	public void setMypageTab(String mypageTab) {
		this.mypageTab = mypageTab;
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
	public String getImgSrc2() {
		return imgSrc2;
	}
	public void setImgSrc2(String imgSrc2) {
		this.imgSrc2 = imgSrc2;
	}
	public String getCpnRate() {
		return cpnRate;
	}
	public void setCpnRate(String cpnRate) {
		this.cpnRate = cpnRate;
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
	public String getCouponMoney() {
		return couponMoney;
	}
	public void setCouponMoney(String couponMoney) {
		this.couponMoney = couponMoney;
	}
	public String getMentoMblPno() {
		return mentoMblPno;
	}
	public void setMentoMblPno(String mentoMblPno) {
		this.mentoMblPno = mentoMblPno;
	}
	public String getPayId() {
		return payId;
	}
	public void setPayId(String payId) {
		this.payId = payId;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getCouponId() {
		return couponId;
	}
	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}
	public Date getPayDt() {
		return payDt;
	}
	public void setPayDt(Date payDt) {
		this.payDt = payDt;
	}
	public String getPaySt() {
		return paySt;
	}
	public void setPaySt(String paySt) {
		this.paySt = paySt;
	}
	public String getPayMethodSt() {
		return payMethodSt;
	}
	public void setPayMethodSt(String payMethodSt) {
		this.payMethodSt = payMethodSt;
	}
	public String getPayCostNo() {
		return payCostNo;
	}
	public void setPayCostNo(String payCostNo) {
		this.payCostNo = payCostNo;
	}
	
}

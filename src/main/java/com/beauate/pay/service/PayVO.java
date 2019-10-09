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

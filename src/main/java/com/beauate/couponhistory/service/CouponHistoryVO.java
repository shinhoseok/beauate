package com.beauate.couponhistory.service;

import java.io.Serializable;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class CouponHistoryVO extends CommDefaultVO implements Serializable {
	/** 쿠폰내역 아이디 */
	private String cpnHistoryId;
	/** 쿠폰 발급일 */
	private String cpnDt;
	/** 쿠폰 아이디FK */
	private String couponId;
	/** 쿠폰 사용여부 */
	private String cpnFl;
	/** 쿠폰 명 */
	private String couponNm;
	/** 사용 조건 */
	private String couponCdt;
	/** 쿠폰 만료기간 */
	private String couponEndDt;
	/** 쿠폰 만료 날짜 비교값(<, >) */
	private String comPare;
	/** 쿠폰 할인율 */
	private int couponRate;
	
	public String getCouponNm() {
		return couponNm;
	}
	public void setCouponNm(String couponNm) {
		this.couponNm = couponNm;
	}
	public String getCouponCdt() {
		return couponCdt;
	}
	public void setCouponCdt(String couponCdt) {
		this.couponCdt = couponCdt;
	}
	public String getCouponEndDt() {
		return couponEndDt;
	}
	public void setCouponEndDt(String couponEndDt) {
		this.couponEndDt = couponEndDt;
	}
	public String getComPare() {
		return comPare;
	}
	public void setComPare(String comPare) {
		this.comPare = comPare;
	}
	public int getCouponRate() {
		return couponRate;
	}
	public void setCouponRate(int couponRate) {
		this.couponRate = couponRate;
	}
	public String getCpnHistoryId() {
		return cpnHistoryId;
	}
	public void setCpnHistoryId(String cpnHistoryId) {
		this.cpnHistoryId = cpnHistoryId;
	}
	public String getCpnDt() {
		return cpnDt;
	}
	public void setCpnDt(String cpnDt) {
		this.cpnDt = cpnDt;
	}
	public String getCouponId() {
		return couponId;
	}
	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}
	public String getCpnFl() {
		return cpnFl;
	}
	public void setCpnFl(String cpnFl) {
		this.cpnFl = cpnFl;
	}
}

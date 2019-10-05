package com.beauate.admin.coupon.service;

import java.io.Serializable;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class CouponVO extends CommDefaultVO implements Serializable {
	/** 쿠폰 아이디 */
	private String couponId;
	/** 쿠폰 생성일 */
	private String couponStartDt;
	/** 쿠폰 명 */
	private String couponNm;
	/** 쿠폰 할인율 */
	private String couponRate;
	/** 쿠폰 만료기간 */
	private String couponEndDt;
	/** 쿠폰 상태 */
	private String couponSt;
	
	public String getCouponStartDt() {
		return couponStartDt;
	}
	public void setCouponStartDt(String couponStartDt) {
		this.couponStartDt = couponStartDt;
	}
	public String getCouponEndDt() {
		return couponEndDt;
	}
	public void setCouponEndDt(String couponEndDt) {
		this.couponEndDt = couponEndDt;
	}
	public String getCouponId() {
		return couponId;
	}
	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}
	public String getCouponNm() {
		return couponNm;
	}
	public void setCouponNm(String couponNm) {
		this.couponNm = couponNm;
	}
	public String getCouponRate() {
		return couponRate;
	}
	public void setCouponRate(String couponRate) {
		this.couponRate = couponRate;
	}
	public String getCouponSt() {
		return couponSt;
	}
	public void setCouponSt(String couponSt) {
		this.couponSt = couponSt;
	}
}
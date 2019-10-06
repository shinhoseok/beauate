package com.beauate.coupon.service;

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

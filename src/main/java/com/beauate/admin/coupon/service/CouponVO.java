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
	private int couponRate;
	/** 쿠폰 만료기간 */
	private String couponEndDt;
	/** 쿠폰 상태 */
	private String couponSt;
	/** 사용 조건 */
	private String couponCdt;
	/** 마이페이지 탭번호 */
	private String mypageTab;
	/** 사용자,관리자 페이지 구분 */
	private String adminYn;
	/** 만료기간 비교값 */
	private String comPare;
	
	public String getComPare() {
		return comPare;
	}
	public void setComPare(String comPare) {
		this.comPare = comPare;
	}
	public String getAdminYn() {
		return adminYn;
	}
	public void setAdminYn(String adminYn) {
		this.adminYn = adminYn;
	}
	public String getMypageTab() {
		return mypageTab;
	}
	public void setMypageTab(String mypageTab) {
		this.mypageTab = mypageTab;
	}
	public String getCouponCdt() {
		return couponCdt;
	}
	public void setCouponCdt(String couponCdt) {
		this.couponCdt = couponCdt;
	}
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
	public int getCouponRate() {
		return couponRate;
	}
	public void setCouponRate(int couponRate) {
		this.couponRate = couponRate;
	}
	public String getCouponSt() {
		return couponSt;
	}
	public void setCouponSt(String couponSt) {
		this.couponSt = couponSt;
	}
}

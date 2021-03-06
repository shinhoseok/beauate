package com.beauate.admin.banner.service;

import java.io.Serializable;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class BannerVO extends CommDefaultVO implements Serializable {

	/** 페이징넘버 */
	private String RNUM;
	private String bannerId;
	private String bannerLoc;
	private String bannerOrder;
	private String bannerFileNm;
	private String bannerClassId;
	private String bannerUrl;
	private String txtName;
	private String txtMsg1;
	private String txtMsg2;
	
	public String getTxtName() {
		return txtName;
	}
	public void setTxtName(String txtName) {
		this.txtName = txtName;
	}
	public String getTxtMsg1() {
		return txtMsg1;
	}
	public void setTxtMsg1(String txtMsg1) {
		this.txtMsg1 = txtMsg1;
	}
	public String getTxtMsg2() {
		return txtMsg2;
	}
	public void setTxtMsg2(String txtMsg2) {
		this.txtMsg2 = txtMsg2;
	}
	public String getRNUM() {
		return RNUM;
	}
	public void setRNUM(String rNUM) {
		RNUM = rNUM;
	}
	public String getBannerId() {
		return bannerId;
	}
	public void setBannerId(String bannerId) {
		this.bannerId = bannerId;
	}
	public String getBannerLoc() {
		return bannerLoc;
	}
	public void setBannerLoc(String bannerLoc) {
		this.bannerLoc = bannerLoc;
	}
	public String getBannerOrder() {
		return bannerOrder;
	}
	public void setBannerOrder(String bannerOrder) {
		this.bannerOrder = bannerOrder;
	}
	public String getBannerFileNm() {
		return bannerFileNm;
	}
	public void setBannerFileNm(String bannerFileNm) {
		this.bannerFileNm = bannerFileNm;
	}
	public String getBannerClassId() {
		return bannerClassId;
	}
	public void setBannerClassId(String bannerClassId) {
		this.bannerClassId = bannerClassId;
	}
	public String getBannerUrl() {
		return bannerUrl;
	}
	public void setBannerUrl(String bannerUrl) {
		this.bannerUrl = bannerUrl;
	}
	
}

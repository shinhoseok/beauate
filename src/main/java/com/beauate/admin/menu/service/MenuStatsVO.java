package com.beauate.admin.menu.service;

import java.io.Serializable;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class MenuStatsVO extends CommDefaultVO implements Serializable {
	/** 메뉴통계ID */
	private String statsId;
	/** 메뉴ID */
	private String menuId;
	/** 접속 URL */
	private String accessUrl;
	/** 접속 IP */
	private String accessIp;
	/** 방문 날짜 */
	private String visitDate;
	/** 시작 일자*/
	private String startDate;
	/** 종료 일자*/
	private String endDate;
	
	public String getStatsId() {
		return statsId;
	}
	public void setStatsId(String statsId) {
		this.statsId = statsId;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getAccessUrl() {
		return accessUrl;
	}
	public void setAccessUrl(String accessUrl) {
		this.accessUrl = accessUrl;
	}
	public String getAccessIp() {
		return accessIp;
	}
	public void setAccessIp(String accessIp) {
		this.accessIp = accessIp;
	}
	public String getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
}

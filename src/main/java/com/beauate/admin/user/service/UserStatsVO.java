package com.beauate.admin.user.service;

import java.io.Serializable;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class UserStatsVO extends CommDefaultVO implements Serializable{
	
	/** 사용자 로그아이디 */
	private String accessLogId;
	/** 사용자 로그IP */
	private String accessIp;
	/** 사용자 로그날짜 */
	private String accessDt;
	/** 사용자 통계 시작일 */
	public String startDate;
	/** 사용자 통계 종료일 */
	private String endDate;
	/** 사용자 통계 사용자명 */
	private String usrNm;
	/** 사용자 통계 로우넘버 */
	private String rNum;
	/** 사용자 차트날짜 */
	private String chartDate;
	
	public String getChartDate() {
		return chartDate;
	}
	public void setChartDate(String chartDate) {
		this.chartDate = chartDate;
	}
	public String getAccessDt() {
		return accessDt;
	}
	public void setAccessDt(String accessDt) {
		this.accessDt = accessDt;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getAccessLogId() {
		return accessLogId;
	}
	public void setAccessLogId(String accessLogId) {
		this.accessLogId = accessLogId;
	}
	public String getAccessIp() {
		return accessIp;
	}
	public void setAccessIp(String accessIp) {
		this.accessIp = accessIp;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getUsrNm() {
		return usrNm;
	}
	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}
	public String getrNum() {
		return rNum;
	}
	public void setrNum(String rNum) {
		this.rNum = rNum;
	}
}

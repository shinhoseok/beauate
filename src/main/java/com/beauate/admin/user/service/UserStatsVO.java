package com.beauate.admin.user.service;

import java.io.Serializable;
import java.util.Date;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class UserStatsVO extends CommDefaultVO implements Serializable{
	
	/** 사용자 로그아이디 */
	private String accessLogId;
	/** 사용자 로그IP */
	private String accessIp;
	/** 사용자 ID */
	private String accessId;
	/** 사용자 로그날짜 */
	private Date accessDate;
	/** 사용자 부서명 */
	private String ogCd;
	/** 사용자 통계 종료일 */
	private String endDate;
	/** 사용자 통계 사용자명 */
	private String usrNm;
	/** 사용자 통계 로우넘버 */
	private String rNum;
	/** 사용자 통계 차트날짜 */
	private String chartDate;
	
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
	public String getAccessId() {
		return accessId;
	}
	public void setAccessId(String accessId) {
		this.accessId = accessId;
	}
	public Date getAccessDate() {
		return accessDate;
	}
	public void setAccessDate(Date accessDate) {
		this.accessDate = accessDate;
	}
	public String getOgCd() {
		return ogCd;
	}
	public void setOgCd(String ogCd) {
		this.ogCd = ogCd;
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
	public String getChartDate() {
		return chartDate;
	}
	public void setChartDate(String chartDate) {
		this.chartDate = chartDate;
	}
}

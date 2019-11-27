package com.beauate.admin.user.service;

import java.io.Serializable;
import java.util.Date;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class UserVO extends CommDefaultVO implements Serializable {
	
	/** 페이징넘버 */
	private String RNUM;
	/** 사용자 비밀번호 */
	private String usrPw;
	/** 사용자 이름 */
	private String usrNm;
	/** 핸드폰번호 */
	private String mblPno;
	/** 이메일 주소 */
	private String emailAddr;
	/** 가입일 */
	private Date joinDt;
	/** 최근접속일 */
	private Date loginDt;
	/** 계정상태 */
	private String userSt;
	/** 탈퇴일 */
	private Date userOutDt;
	/** 패스워드 변경 구분값 */
	private String pwChangeGubun;
	/** 권한 이름 */
	private String rlName;
	/** 사용자 비밀번호 변경값 */
	private String newUsrPw;
	/** 차트날짜 */
	private String chartDate;
	
	public String getChartDate() {
		return chartDate;
	}
	public void setChartDate(String chartDate) {
		this.chartDate = chartDate;
	}
	public String getNewUsrPw() {
		return newUsrPw;
	}
	public void setNewUsrPw(String newUsrPw) {
		this.newUsrPw = newUsrPw;
	}
	public String getRlName() {
		return rlName;
	}
	public void setRlName(String rlName) {
		this.rlName = rlName;
	}
	public String getPwChangeGubun() {
		return pwChangeGubun;
	}
	public void setPwChangeGubun(String pwChangeGubun) {
		this.pwChangeGubun = pwChangeGubun;
	}
	public Date getUserOutDt() {
		return userOutDt;
	}
	public void setUserOutDt(Date userOutDt) {
		this.userOutDt = userOutDt;
	}
	public String getRNUM() {
		return RNUM;
	}
	public void setRNUM(String rNUM) {
		RNUM = rNUM;
	}
	public String getUsrPw() {
		return usrPw;
	}
	public void setUsrPw(String usrPw) {
		this.usrPw = usrPw;
	}
	public String getUsrNm() {
		return usrNm;
	}
	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}
	public String getMblPno() {
		return mblPno;
	}
	public void setMblPno(String mblPno) {
		this.mblPno = mblPno;
	}
	public String getEmailAddr() {
		return emailAddr;
	}
	public void setEmailAddr(String emailAddr) {
		this.emailAddr = emailAddr;
	}
	public Date getJoinDt() {
		return joinDt;
	}
	public void setJoinDt(Date joinDt) {
		this.joinDt = joinDt;
	}
	public Date getLoginDt() {
		return loginDt;
	}
	public void setLoginDt(Date loginDt) {
		this.loginDt = loginDt;
	}
	public String getUserSt() {
		return userSt;
	}
	public void setUserSt(String userSt) {
		this.userSt = userSt;
	}
}

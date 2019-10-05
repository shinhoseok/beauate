package com.beauate.alarm.service;

import java.io.Serializable;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class AlarmVO extends CommDefaultVO implements Serializable {
	/** 알람 아이디 */
	private String alarmId;
	/** 알람 신청일 */
	private String alarmDt;
	/** 알람 발송여부 */
	private String alarmFl;
	/** 알람 발송일 */
	private String alarmSendDt;
	/** 클래스아이디 */
	private String classId;
	/** 휴대폰번호 */
	private String mblPno;
	/** 사용자이름 */
	private String usrNm;
	
	public String getMblPno() {
		return mblPno;
	}
	public void setMblPno(String mblPno) {
		this.mblPno = mblPno;
	}
	public String getUsrNm() {
		return usrNm;
	}
	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getAlarmId() {
		return alarmId;
	}
	public void setAlarmId(String alarmId) {
		this.alarmId = alarmId;
	}
	public String getAlarmDt() {
		return alarmDt;
	}
	public void setAlarmDt(String alarmDt) {
		this.alarmDt = alarmDt;
	}
	public String getAlarmFl() {
		return alarmFl;
	}
	public void setAlarmFl(String alarmFl) {
		this.alarmFl = alarmFl;
	}
	public String getAlarmSendDt() {
		return alarmSendDt;
	}
	public void setAlarmSendDt(String alarmSendDt) {
		this.alarmSendDt = alarmSendDt;
	}
}

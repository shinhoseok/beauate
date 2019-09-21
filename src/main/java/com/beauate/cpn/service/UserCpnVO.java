package com.beauate.cpn.service;

import java.io.Serializable;
import java.util.Date;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class UserCpnVO extends CommDefaultVO implements Serializable {
	private String uCpnSq;
	private Date uCpnDt;
	private String cpnSq;
	private String uSq;
	private String uCpnFl;
	public String getuCpnSq() {
		return uCpnSq;
	}
	public void setuCpnSq(String uCpnSq) {
		this.uCpnSq = uCpnSq;
	}
	public Date getuCpnDt() {
		return uCpnDt;
	}
	public void setuCpnDt(Date uCpnDt) {
		this.uCpnDt = uCpnDt;
	}
	public String getCpnSq() {
		return cpnSq;
	}
	public void setCpnSq(String cpnSq) {
		this.cpnSq = cpnSq;
	}
	public String getuSq() {
		return uSq;
	}
	public void setuSq(String uSq) {
		this.uSq = uSq;
	}
	public String getuCpnFl() {
		return uCpnFl;
	}
	public void setuCpnFl(String uCpnFl) {
		this.uCpnFl = uCpnFl;
	}
	
}
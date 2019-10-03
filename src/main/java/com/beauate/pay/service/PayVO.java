package com.beauate.pay.service;

import java.io.Serializable;
import java.util.Date;

import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.admin.user.service.UserVO;
import com.beauate.common.service.CommDefaultVO;
import com.beauate.cpn.service.AdminCpnVO;

@SuppressWarnings("serial")
public class PayVO extends CommDefaultVO implements Serializable {
	private String paySq;
	private String cSq;
	private String uSq;
	private String cpnSq;
	private Date payDt;
	private String paySt;
	private String payMethodSt;
	private String payCostNo;
	private UserVO user;
	private AdminCpnVO cpn;
	private ClassVO cls;
	
	
	public ClassVO getCls() {
		return cls;
	}
	public void setCls(ClassVO cls) {
		this.cls = cls;
	}
	public String getPaySq() {
		return paySq;
	}
	public void setPaySq(String paySq) {
		this.paySq = paySq;
	}
	public String getcSq() {
		return cSq;
	}
	public void setcSq(String cSq) {
		this.cSq = cSq;
	}
	public String getuSq() {
		return uSq;
	}
	public void setuSq(String uSq) {
		this.uSq = uSq;
	}
	public String getCpnSq() {
		return cpnSq;
	}
	public void setCpnSq(String cpnSq) {
		this.cpnSq = cpnSq;
	}
	public Date getPayDt() {
		return payDt;
	}
	public void setPayDt(Date payDt) {
		this.payDt = payDt;
	}
	public String getPaySt() {
		return paySt;
	}
	public void setPaySt(String paySt) {
		this.paySt = paySt;
	}
	public String getPayMethodSt() {
		return payMethodSt;
	}
	public void setPayMethodSt(String payMethodSt) {
		this.payMethodSt = payMethodSt;
	}
	public String getPayCostNo() {
		return payCostNo;
	}
	public void setPayCostNo(String payCostNo) {
		this.payCostNo = payCostNo;
	}
	public UserVO getUser() {
		return user;
	}
	public void setUser(UserVO user) {
		this.user = user;
	}
	public AdminCpnVO getCpn() {
		return cpn;
	}
	public void setCpn(AdminCpnVO cpn) {
		this.cpn = cpn;
	}
	
}

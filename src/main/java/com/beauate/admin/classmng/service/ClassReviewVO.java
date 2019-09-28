package com.beauate.admin.classmng.service;

import java.io.Serializable;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class ClassReviewVO extends CommDefaultVO implements Serializable {

	/*후기번호*/
	private String rSq;
	/*클래스번호*/
	private String cSq;
	/*회원번호*/
	private String uSq;
	/*후기작성일*/
	private String rDt;
	/*커리큘럼평점*/
	private String sco1;
	/*친절도평점*/
	private String sco2;
	/*시간준수평점*/
	private String sco3;
	/*전달력평점*/
	private String sco4;
	/*후기내용*/
	private String rCtt;
	/*삭제여부*/
	private String rFl;
	public String getrSq() {
		return rSq;
	}
	public void setrSq(String rSq) {
		this.rSq = rSq;
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
	public String getrDt() {
		return rDt;
	}
	public void setrDt(String rDt) {
		this.rDt = rDt;
	}
	public String getSco1() {
		return sco1;
	}
	public void setSco1(String sco1) {
		this.sco1 = sco1;
	}
	public String getSco2() {
		return sco2;
	}
	public void setSco2(String sco2) {
		this.sco2 = sco2;
	}
	public String getSco3() {
		return sco3;
	}
	public void setSco3(String sco3) {
		this.sco3 = sco3;
	}
	public String getSco4() {
		return sco4;
	}
	public void setSco4(String sco4) {
		this.sco4 = sco4;
	}
	public String getrCtt() {
		return rCtt;
	}
	public void setrCtt(String rCtt) {
		this.rCtt = rCtt;
	}
	public String getrFl() {
		return rFl;
	}
	public void setrFl(String rFl) {
		this.rFl = rFl;
	}
	
}

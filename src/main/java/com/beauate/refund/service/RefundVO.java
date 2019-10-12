package com.beauate.refund.service;

import java.io.Serializable;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class RefundVO extends CommDefaultVO implements Serializable {
	/** 환불 아이디 */
	private String refundId;
	/** 결제 아이디 */
	private String payId;
	/** 취소 완료일 */
	private String cancelDt;
	/** 환불 신청일 */
	private String refundStartDt;
	/** 환불 완료일 */
	private String refundEndDt;
	
	public String getRefundId() {
		return refundId;
	}
	public void setRefundId(String refundId) {
		this.refundId = refundId;
	}
	public String getPayId() {
		return payId;
	}
	public void setPayId(String payId) {
		this.payId = payId;
	}
	public String getCancelDt() {
		return cancelDt;
	}
	public void setCancelDt(String cancelDt) {
		this.cancelDt = cancelDt;
	}
	public String getRefundStartDt() {
		return refundStartDt;
	}
	public void setRefundStartDt(String refundStartDt) {
		this.refundStartDt = refundStartDt;
	}
	public String getRefundEndDt() {
		return refundEndDt;
	}
	public void setRefundEndDt(String refundEndDt) {
		this.refundEndDt = refundEndDt;
	}
}

package com.beauate.jjim.service;

import java.io.Serializable;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class JjimVO extends CommDefaultVO implements Serializable {
	/** 찜 아이디 */
	private String jjimId;
	/** 클래스 아이디 */
	private String classId;
	
	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getJjimId() {
		return jjimId;
	}

	public void setJjimId(String jjimId) {
		this.jjimId = jjimId;
	}
	
}

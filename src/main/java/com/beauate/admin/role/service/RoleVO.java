package com.beauate.admin.role.service;

import java.io.Serializable;

import com.beauate.common.service.CommDefaultVO;

/**
 * * 프로그램 정보 *
 * 1. Package	: com.beauate.admin.role.service
 * 2. FileName	: RoleVO.java
 * 3. 작성자		: 뷰아떼1
 * 4. 작성일		: 2019. 05. 18
 * 5. 설명		: 권한 메뉴의 관련 정보를 담고 있는 VO 파일
 * 6. 수정이력
 * @
 * @  수정일				수정자			수정내용
 * @ --------------		---------		-------------------------------
 * @  2019. 05. 18		뷰아떼1			최초생성
 */

@SuppressWarnings("serial")
public class RoleVO extends CommDefaultVO implements Serializable {
	/** 권한 코드 */
	private String rlCd;
	
	/** 권한 이름 */
	private String rlName;
	
	/** 권한 설명 */
	private String rlDes;
	
	/** 권한 분류 */
	private String rlCls;

	public String getRlCd() {
		return rlCd;
	}

	public void setRlCd(String rlCd) {
		this.rlCd = rlCd;
	}

	public String getRlName() {
		return rlName;
	}

	public void setRlName(String rlName) {
		this.rlName = rlName;
	}

	public String getRlDes() {
		return rlDes;
	}

	public void setRlDes(String rlDes) {
		this.rlDes = rlDes;
	}

	public String getRlCls() {
		return rlCls;
	}

	public void setRlCls(String rlCls) {
		this.rlCls = rlCls;
	}
}
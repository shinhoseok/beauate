package com.beauate.login.service;

import java.io.Serializable;
import java.util.ArrayList;

import com.beauate.admin.role.service.RoleVO;
import com.beauate.admin.user.service.UserVO;

@SuppressWarnings("serial")
public class LoginVO extends UserVO implements Serializable {
	 /** 포탈관리자 */
	private String portalAdmin;
	/** 상단의 포탈관리 버튼 */
	private String portalManageGunbun;
	
	private ArrayList<RoleVO> roleList = new ArrayList<RoleVO>(); 
	private ArrayList<RoleVO> ifmsRoleList = new ArrayList<RoleVO>();
	
	public String getPortalAdmin() {
		return portalAdmin;
	}
	public void setPortalAdmin(String portalAdmin) {
		this.portalAdmin = portalAdmin;
	}
	public String getPortalManageGunbun() {
		return portalManageGunbun;
	}
	public void setPortalManageGunbun(String portalManageGunbun) {
		this.portalManageGunbun = portalManageGunbun;
	}
	public ArrayList<RoleVO> getRoleList() {
		return roleList;
	}
	public void setRoleList(ArrayList<RoleVO> roleList) {
		this.roleList = roleList;
	}
	public ArrayList<RoleVO> getIfmsRoleList() {
		return ifmsRoleList;
	}
	public void setIfmsRoleList(ArrayList<RoleVO> ifmsRoleList) {
		this.ifmsRoleList = ifmsRoleList;
	}
}

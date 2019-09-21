package com.beauate.login.service;

import java.util.List;

import com.beauate.admin.role.service.RoleVO;

public interface LoginService {
	public LoginVO selectLoginUserInfo(LoginVO loginVO) throws Exception;
	
	public List<RoleVO> selectUserRoleList(LoginVO loginVO) throws Exception;
	
	public int selectPortalManageRoleCnt(LoginVO loginVO) throws Exception;
}

package com.beauate.login.service;

import java.util.List;

import com.beauate.admin.role.service.RoleVO;
import com.beauate.admin.user.service.UserVO;

public interface LoginService {
	public LoginVO selectLoginUserInfo(LoginVO loginVO) throws Exception;
	
	public List<RoleVO> selectUserRoleList(LoginVO loginVO) throws Exception;
	
	public int selectPortalManageRoleCnt(LoginVO loginVO) throws Exception;
	
	public String selectPwdSearch(String emailAddr) throws Exception;
	
	public Integer userPwReset(UserVO userVO) throws Exception;
}

package com.beauate.login.service;

import java.util.List;

import com.beauate.admin.role.service.RoleVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("loginDao")
public interface LoginDao {
	public LoginVO selectLoginUserInfo(LoginVO loginVO) throws Exception;
	
	public List<RoleVO> selectUserRoleList(LoginVO loginVO) throws Exception;
	
	public int selectPortalManageRoleCnt(LoginVO loginVO) throws Exception;
}

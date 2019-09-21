package com.beauate.login.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.admin.role.service.RoleVO;
import com.beauate.login.service.LoginDao;
import com.beauate.login.service.LoginService;
import com.beauate.login.service.LoginVO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	/** LoginDAO */
	@Resource(name="loginDao")
	private LoginDao loginDao;
	
	public LoginVO selectLoginUserInfo(LoginVO loginVO) throws Exception {
		return loginDao.selectLoginUserInfo(loginVO);
	}
	
	public List<RoleVO> selectUserRoleList(LoginVO loginVO) throws Exception {
		return loginDao.selectUserRoleList(loginVO);
	}
	
	public int selectPortalManageRoleCnt(LoginVO loginVO) throws Exception {
		return loginDao.selectPortalManageRoleCnt(loginVO);
	}
}

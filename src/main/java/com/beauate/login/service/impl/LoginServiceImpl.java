package com.beauate.login.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.beauate.admin.role.service.RoleVO;
import com.beauate.admin.user.service.UserDao;
import com.beauate.admin.user.service.UserVO;
import com.beauate.common.CommonUtils;
import com.beauate.common.StringUtil;
import com.beauate.login.service.LoginDao;
import com.beauate.login.service.LoginService;
import com.beauate.login.service.LoginVO;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="mailSender")
	private MailSender mailSender;
	
	@Resource(name="propertiesService")
	private EgovPropertyService propertiesService;
	
	@Resource(name="commonUtils")
	private CommonUtils commonUtils;
	
	@Resource(name="userDao")
	private UserDao userDao;
	
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
	
	public String selectPwdSearch(String emailAddr) throws Exception {
		String secureKey = "";
		log.debug(">>> selectPwdSearch impl : "+emailAddr+" , "+ propertiesService.getString("mail.from.adress"));
		try {
			SimpleMailMessage mailMessage = new SimpleMailMessage();
			mailMessage.setTo(emailAddr);
			mailMessage.setFrom(propertiesService.getString("mail.from.adress"));
			mailMessage.setSubject(propertiesService.getString("mail.title"));
			//인증키생성
			secureKey = commonUtils.numberGen(6,2);
			mailMessage.setText(propertiesService.getString("mail.text")+" "+secureKey);
			mailSender.send(mailMessage);
		} catch(MailException e) {
			secureKey = "";
			log.error(">>> selectPwdSearch impl 메일발송실패");
		}
		return secureKey;
	}
	
	public Integer userPwReset(UserVO userVO) throws Exception {
		String usrPw = "";
		if(!StringUtil.isEmpty(userVO.getUsrPw())) {
			usrPw = commonUtils.encryption(userVO.getUsrPw());
		}
		log.debug("After usrPw:"+ usrPw);
		userVO.setUsrPw(usrPw);
		
		return userDao.userPwReset(userVO);	
	}
}

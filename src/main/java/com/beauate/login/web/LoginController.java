package com.beauate.login.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.beauate.admin.role.service.RoleVO;
import com.beauate.admin.user.service.UserManageService;
import com.beauate.admin.user.service.UserStatsVO;
import com.beauate.admin.user.service.UserVO;
import com.beauate.common.CommonUtils;
import com.beauate.common.GlobalConstants;
import com.beauate.common.StringUtil;
import com.beauate.common.service.CommonService;
import com.beauate.login.service.LoginService;
import com.beauate.login.service.LoginVO;

@Controller
public class LoginController {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "commonService")
	private CommonService commonService; 

	@Resource(name = "commonUtils")
	private CommonUtils commonUtils; 
	
	@Resource(name = "loginService")
	private LoginService loginService;
	
	@Resource(name = "userManageService")
	private UserManageService userManageService;
	/**
	 * <pre>
	 * 1. 개요 : 로그인 화면을 보여준다. 
	 * 2. 처리내용 : 로그인 화면을 보여준다. 
	 * </pre>
	 * @Method Name : login
	 * @date : 2019. 6. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/login/a/n/login.do")
	public String login(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request,
			HttpServletResponse response, ModelMap model)
			throws Exception {
		return "/login/login";
	}
	
	@RequestMapping(value = "/login/a/n/selectIdPwdcheck.do")
	public String selectIdPwdcheck(@ModelAttribute("loginVO") LoginVO loginVO, ModelMap model) throws Exception {
		//비밀 번호 암호화
		log.debug("Before usrPw:"+loginVO.getUsrPw());
		String passwd = commonUtils.encryption(loginVO.getUsrPw());
		loginVO.setUsrPw(passwd);
		LoginVO resultVO = (LoginVO)loginService.selectLoginUserInfo(loginVO);
		if(resultVO == null){
			model.addAttribute("message", "N");
		} else {
			model.addAttribute("message", "Y");
		}
		return "jsonView";
	}
	
	@RequestMapping(value = "/login/a/n/afterLogin.do")
	public String afterLogin(HttpServletRequest request,
			HttpServletResponse response, SessionStatus status,
			@ModelAttribute("loginVO") LoginVO loginVO, ModelMap model)
			throws Exception {
		
		//비밀 번호 암호화
		log.debug("Before usrPw:"+loginVO.getUsrPw());
		String passwd = commonUtils.encryption(loginVO.getUsrPw());
		loginVO.setUsrPw(passwd);
		//========================== @.사용자 정보 세팅
		LoginVO resultVO = (LoginVO)loginService.selectLoginUserInfo(loginVO);
		if(resultVO == null){
			model.addAttribute("message", "로그인정보가 잘못되었습니다. 확인해주십시오.");
			model.addAttribute("redirectUrl", "/home/a/n/main.do");

			return "/common/temp_action_message";
		}
		
		loginVO.setUsrPw(passwd);
		
		//========================== @.권한 세팅dmd
		resultVO.setRoleList((ArrayList<RoleVO>)loginService.selectUserRoleList(resultVO));

		//========================== @.상단 포탈관리 버튼 권한 구분값(포탈관리 메뉴에 권한이 한개라도 있으면 Y)
		int portalManageMenuCnt = loginService.selectPortalManageRoleCnt(resultVO);
		
		if(portalManageMenuCnt > 0){
			resultVO.setPortalManageGunbun("Y");
		}
		log.debug("loginService.selectUserRoleList.size:"+resultVO.getRoleList().size());
		
		request.getSession().setAttribute(GlobalConstants.LOGIN_SESSION_KEY, resultVO);
		
		//사용자 통계 등록
		UserStatsVO userStatsVO = new UserStatsVO();
		userStatsVO.setAccessId(resultVO.getUsrId());
		userStatsVO.setAccessIp(request.getRemoteAddr());
		userManageService.insertUserStatisticsProc(userStatsVO);
		status.setComplete();
		
		//관리자페이지 브릿지 mong
//		return "redirect:/common/a/n/portalAdminBridge.do";
		return "redirect:/home/a/n/main.do";
	}
	
	@RequestMapping(value="/login/a/n/logOut.do")
	public String logOut(HttpServletRequest request, HttpServletResponse response, LoginVO sessionVO, ModelMap model ) throws Exception{
		
		HttpSession session = request.getSession();
		session.setAttribute(GlobalConstants.LOGIN_SESSION_KEY, null);
		session.invalidate();
		
		return "redirect:/login/a/n/login.do";
	}
	
	@RequestMapping(value="/login/a/n/selectPwdSearch.do")
	public String selectPwdSearch(@ModelAttribute("loginVO") LoginVO loginVO) {
		return "/login/pwdSearch";
	}
	
	@RequestMapping(value="/login/a/n/pwdMailSearch.do")
	public String pwdMailSearch(@ModelAttribute("loginVO") LoginVO loginVO, ModelMap model, HttpServletRequest request) throws Exception {
		Map<String, Object> rslt = new HashMap<String, Object>();
		String secureKey = loginService.selectPwdSearch(loginVO.getEmailAddr());
		rslt.put("emailAddr", loginVO.getEmailAddr());
		log.debug(">>> pwdMailSearch web >>> "+ loginVO.getEmailAddr());
		if(!StringUtil.isEmpty(secureKey)) {
			request.getSession().setAttribute(GlobalConstants.MAIL_SECURE_KEY, secureKey);
			rslt.put("result", "Y");
		} else {
			rslt.put("result", "N");
		}
		model.addAttribute("rslt", rslt);
		log.debug(">>>> pwdMailSearch : " + model);
		return "jsonView";
	}
	
	@RequestMapping(value="/login/a/n/pwdMailSearch2.do")
	public String pwdMailSearch2(String emailAddr, ModelMap model) {
		LoginVO loginVO = new LoginVO();
		loginVO.setEmailAddr(emailAddr);
		model.addAttribute("loginVO", loginVO);
		log.debug(">> pwdMailSearch2 Controller : "+emailAddr);
		return "/login/pwdSearch2";
	}
	
	@RequestMapping(value="/login/a/n/pwdMailSearch3.do")
	public String pwdMailSearch3(String mailSecureKey, String emailAddr, HttpServletRequest request, ModelMap model) {
		log.debug(">>> pwdMailSearch3 Contoller : "+mailSecureKey+" ,"+emailAddr);
		Map<String, Object> rsltMap = new HashMap<>();
		if(!StringUtil.isEmpty(mailSecureKey)) {
			String sessionMailKey = (String) request.getSession().getAttribute(GlobalConstants.MAIL_SECURE_KEY);
			
			if(sessionMailKey.equals(mailSecureKey)) {
				rsltMap.put("result", "Y");
				rsltMap.put("emailAddr", emailAddr);
			} else {
				rsltMap.put("result", "N");
			}
		} else {
			rsltMap.put("result", "N");
		}
		model.addAttribute("rslt", rsltMap);
		return "jsonView";
	}
	
	@RequestMapping(value="/login/a/n/pwdChange.do")
	public String pwdChange(UserVO userVO, ModelMap model) {
		model.addAttribute("userVO", userVO);
		return "/login/pwdChange";
	}
	
	@RequestMapping(value = "/login/a/n/updatePwdChange.do")
	public String updatePwdChange(String emailAddr, String usrPw, ModelMap model, SessionStatus status) throws Exception {
		log.debug("updatePwdChange Web >>> "+emailAddr +" ,"+ usrPw);
		UserVO userVO = new UserVO();
		userVO.setEmailAddr(emailAddr);
		userVO.setUsrPw(usrPw);
		int cnt = loginService.userPwReset(userVO);
		model.addAttribute("updateCnt", cnt);
		log.debug("updatePwdChange Web >>> "+ cnt);
		//중복 submit 방지
		status.setComplete();
		return "jsonView";
	}
}
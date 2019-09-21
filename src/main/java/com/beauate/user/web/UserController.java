package com.beauate.user.web;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.beauate.admin.user.service.UserManageService;
import com.beauate.admin.user.service.UserVO;
import com.beauate.login.service.LoginVO;
import com.beauate.user.service.UserService;

@Controller
public class UserController {
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "userService")
	private UserService userService;
	
	@RequestMapping(value="/user/a/t/userInsert.do")
	public String userInsert(@ModelAttribute("userVO") UserVO userVO, LoginVO sessionVO, ModelMap model ) throws Exception{
		return "/user/userInsert";
	}

	@RequestMapping(value = "/user/w/n/userInsertProc.do")
	public String userInsertProc(@ModelAttribute("userVO") UserVO userVO, LoginVO sessionVO, SessionStatus status, ModelMap model) throws Exception {
		String message;
		String redirectUrl;
		
		try {
			userService.userInsertProc(userVO, sessionVO);
			redirectUrl = "/home/a/t/main.do";
			message = "회원가입이 완료되었습니다.";
			//중복 submit 방지
			status.setComplete();
		} catch (Exception e) {
			redirectUrl = "/user/w/n/userInsertProc.do";
			message = "현재 서비스가 원활하지 않습니다.\n잠시후 다시 이용해 주십시요.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", redirectUrl);
		
		return "jsonView";
	}
	
}

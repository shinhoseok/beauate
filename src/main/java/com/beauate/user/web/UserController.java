package com.beauate.user.web;

import java.util.ArrayList;

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
import com.beauate.common.GlobalConstants;
import com.beauate.login.service.LoginService;
import com.beauate.login.service.LoginVO;
import com.beauate.user.service.UserService;

@Controller
public class UserController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "userManageService")
	private UserManageService userManageService;

	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "loginService")
	private LoginService loginService;
	
	@RequestMapping(value="/user/a/t/userInsert.do")
	public String userInsert(@ModelAttribute("userVO") UserVO userVO, LoginVO sessionVO, ModelMap model ) throws Exception{
		return "/user/userInsert";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 회원가입
	 * 2. 처리내용 : 회원가입
	 * </pre>
	 * @Method Name : userInsertProc
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/w/n/userInsertProc.do")
	public String userInsertProc(HttpServletRequest request, @ModelAttribute("userVO") UserVO userVO, LoginVO sessionVO, SessionStatus status, ModelMap model) throws Exception {
		String message;
		String redirectUrl;
		
		try {
			userService.userInsertProc(userVO, sessionVO);
			redirectUrl = "/home/a/n/main.do";
			message = "회원가입이 완료되었습니다.";
			//중복 submit 방지
			status.setComplete();
			//email만으로 조회해도 되는데 바쁘니까 email/pw로 가져오는 기존 기능 쓰자.
			LoginVO loginVO = new LoginVO();
			loginVO.setEmailAddr(userVO.getEmailAddr());
			loginVO.setUsrPw(userVO.getUsrPw());
			LoginVO resultVO = (LoginVO)loginService.selectLoginUserInfo(loginVO);
			if(resultVO == null){
				redirectUrl = "/user/w/n/userInsertProc.do";
				message = "현재 서비스가 원활하지 않습니다. 잠시후 다시 이용해 주십시요.";
				model.addAttribute("message", message);
				model.addAttribute("redirectUrl", redirectUrl);
				return "jsonView";
			}
			
			loginVO.setUsrPw(userVO.getUsrPw());
			
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
			userStatsVO.setUsrId(resultVO.getUsrId());
			userStatsVO.setAccessIp(request.getRemoteAddr());
			userManageService.insertUserStatisticsProc(userStatsVO);
			status.setComplete();
			
			//쿠폰등록 임시적용
			
		} catch (Exception e) {
			redirectUrl = "/user/w/n/userInsertProc.do";
			message = "현재 서비스가 원활하지 않습니다. 잠시후 다시 이용해 주십시요.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", redirectUrl);
		
		return "jsonView";
	}

	/**
	 * <pre>
	 * 1. 개요 : 비밀번호변경 팝업
	 * 2. 처리내용 : 비밀번호변경 팝업
	 * </pre>
	 * @Method Name : userPasswordChange
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/w/t/userPasswordChange.do")
	public String userPasswordChange(@ModelAttribute("userVO") UserVO userVO, LoginVO sessionVO, ModelMap model ) throws Exception{
		return "/user/userPasswordChange";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 비밀번호변경 처리
	 * 2. 처리내용 : 비밀번호변경 처리
	 * </pre>
	 * @Method Name : userPasswordChangeProc
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/w/n/userPasswordChangeProc.do")
	public String userPasswordChangeProc(HttpServletRequest request, @ModelAttribute("userVO") UserVO userVO, LoginVO sessionVO, SessionStatus status, ModelMap model) throws Exception {
		String message;
		String redirectUrl;
		
		try {
			userVO.setPwChangeGubun("Y");
			userVO.setUsrId(sessionVO.getUsrId());
			userService.updateUser(userVO);
			redirectUrl = "/home/a/n/main.do";
			message = "비밀번호 변경이 완료되었습니다.";
			//중복 submit 방지
			status.setComplete();
			//email만으로 조회해도 되는데 바쁘니까 email/pw로 가져오는 기존 기능 쓰자.
			LoginVO loginVO = new LoginVO();
			loginVO.setEmailAddr(sessionVO.getEmailAddr());
			loginVO.setUsrPw(userVO.getUsrPw());
			LoginVO resultVO = (LoginVO)loginService.selectLoginUserInfo(loginVO);
			if(resultVO == null){
				redirectUrl = "/user/w/t/userPasswordChange.do";
				message = "현재 서비스가 원활하지 않습니다. 잠시후 다시 이용해 주십시요.";
				model.addAttribute("message", message);
				model.addAttribute("redirectUrl", redirectUrl);
				return "jsonView";
			}
			
			loginVO.setUsrPw(userVO.getUsrPw());
			
			//========================== @.권한 세팅dmd
			resultVO.setRoleList((ArrayList<RoleVO>)loginService.selectUserRoleList(resultVO));

			//========================== @.상단 포탈관리 버튼 권한 구분값(포탈관리 메뉴에 권한이 한개라도 있으면 Y)
			int portalManageMenuCnt = loginService.selectPortalManageRoleCnt(resultVO);
			
			if(portalManageMenuCnt > 0){
				resultVO.setPortalManageGunbun("Y");
			}
			log.debug("loginService.selectUserRoleList.size:"+resultVO.getRoleList().size());
			
			request.getSession().setAttribute(GlobalConstants.LOGIN_SESSION_KEY, resultVO);
			
			status.setComplete();
		} catch (Exception e) {
			redirectUrl = "/user/w/t/userPasswordChange.do";
			message = "현재 서비스가 원활하지 않습니다. 잠시후 다시 이용해 주십시요.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", redirectUrl);
		
		return "jsonView";
	}

	/**
	 * <pre>
	 * 1. 개요 : 로그아웃
	 * 2. 처리내용 : 로그아웃
	 * </pre>
	 * @Method Name : userLogout
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/a/n/logOut.do")
	public String userLogout(HttpServletRequest request, HttpServletResponse response, LoginVO sessionVO, ModelMap model ) throws Exception{
		
		HttpSession session = request.getSession();
		session.setAttribute(GlobalConstants.LOGIN_SESSION_KEY, null);
		session.invalidate();
		
		return "redirect:/home/a/n/main.do";
	}
}

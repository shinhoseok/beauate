package com.beauate.admin.user.web;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.beauate.admin.user.service.UserManageService;
import com.beauate.admin.user.service.UserStatsVO;
import com.beauate.admin.user.service.UserVO;
import com.beauate.login.service.LoginVO;

@Controller
public class UserManageController {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "userManageService")
	private UserManageService userManageService;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자관리 리스트
	 * 2. 처리내용 : 사용자관리 리스트
	 * </pre>
	 * @Method Name : selectUserList
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/usermgr/r/m/userList.do")
	public String selectUserList(@ModelAttribute("userVO") UserVO userVO, ModelMap model) throws Exception {
		
		userManageService.selectUserList(userVO, model);
		
		return "/admin/user/userList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 상세정보
	 * 2. 처리내용 : 사용자 상세정보
	 * </pre>
	 * @Method Name : userView
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/usermgr/r/m/userView.do")
	public String userView(@ModelAttribute("userVO") UserVO userVO, ModelMap model) throws Exception {
		
		userVO = userManageService.selectUser(userVO);
		model.addAttribute("userVO", userVO);
		
		return "/admin/user/userView";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 정보 등록화면
	 * 2. 처리내용 : 사용자 관리자에게 사용자 정보 등록화면을 보여준다.
	 * </pre>
	 * @Method Name : userInsert
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/usermgr/w/m/userInsert.do")
	public String userInsert(@ModelAttribute("userVO") UserVO userVO, ModelMap model) throws Exception {
		
		return "/admin/user/userInsert";		
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자아이디 중복체크
	 * 2. 처리내용 : 사용자 아이디가 중복되어있는지 체크하는 메서드
	 * </pre>
	 * @Method Name : userIdChk
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/usermgr/a/n/userIdChk.do")
	public String userIdChk(@ModelAttribute("userVO") UserVO userVO, ModelMap model) throws Exception {
		
		int cnt = userManageService.userIdChk(userVO);
		if(cnt > 0){
			model.addAttribute("chkResult","N");
		}else{
			model.addAttribute("chkResult","Y");
		}

		return "jsonView";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 정보 등록
	 * 2. 처리내용 : 사용자 관리자가 사용자 정보를 등록한다
	 * </pre>
	 * @Method Name : userInsertProc
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/usermgr/w/n/userInsertProc.do")
	public String userInsertProc(@ModelAttribute("userVO") UserVO userVO, LoginVO sessionVO, SessionStatus status, ModelMap model) throws Exception {
		
		
		String message;
		String redirectUrl;
		
		try {
			userManageService.userInsertProc(userVO, sessionVO);
			redirectUrl = "/usermgr/r/m/userList.do";
			message = "등록 되었습니다.";
			//중복 submit 방지
			status.setComplete();
		} catch (Exception e) {
			redirectUrl = "/usermgr/w/m/userInsert.do";
			message = "현재 서비스가 원활하지 않습니다. 잠시후 다시 이용해 주십시요.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", redirectUrl);
		
		return "/common/temp_action_message";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 패스워드 초기화
	 * 2. 처리내용 : 사용자 패스워드 초기화
	 * </pre>
	 * @Method Name : userPwReset
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/usermgr/z/n/userPwReset.do")
	public String userPwReset(@ModelAttribute("userVO") UserVO userVO, SessionStatus status, 
			LoginVO sessionVO, ModelMap model) throws Exception {
		
		//수정아이디 세팅
		userVO.setModId(sessionVO.getUsrId());
		log.debug("userId:"+ userVO.getUsrId());
		
		int cnt = userManageService.userPwReset(userVO);
		model.addAttribute("updateCnt", cnt);
		//중복 submit 방지
		status.setComplete();

		return "jsonView";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 정보 수정화면 이동
	 * 2. 처리내용 : 사용자 관리자 에게 사용자 정보 수정화면을 보여준다.
	 * </pre>
	 * @Method Name : userUpdate
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/usermgr/w/m/userUpdate.do")
	public String userUpdate(@ModelAttribute("userVO") UserVO userVO, ModelMap model)
			throws Exception {			
	   
		userVO = userManageService.selectUser(userVO);
		
		model.addAttribute("userVO", userVO);
		
		return "/admin/user/userUpdate";		
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 수정
	 * 2. 처리내용 : 사용자 관리자가 사용자 정보를 수정한다.
	 * </pre>
	 * @Method Name : userUpdateProc
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/usermgr/w/n/userUpdateProc.do")
	public String userUpdateProc(@ModelAttribute("userVO") UserVO userVO, 
			SessionStatus status, LoginVO sessionVO, ModelMap model) throws Exception {
		
		//수정아이디 세팅
		userVO.setModId(sessionVO.getUsrId());
		log.debug(userVO.getUsrId());
		
		userManageService.updateUser(userVO);
		// 중복 submit 방지
		status.setComplete();
		
		return "redirect:/usermgr/r/m/userView.do?usrId="+userVO.getUsrId();
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 삭제
	 * 2. 처리내용 : 사용자 정보를 삭제한다.
	 * </pre>
	 * @Method Name : userDeleteProc
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/usermgr/z/n/userDeleteProc.do")
	public String userDeleteProc(@ModelAttribute("userVO") UserVO userVO,
			SessionStatus status, ModelMap model) throws Exception {		   
		
		userManageService.updateUserProc(userVO);
		status.setComplete();
		
		return "jsonView";	  
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 통계
	 * 2. 처리내용 : 사용자 통계를 조회한다.
	 * </pre>
	 * @Method Name : selectuserStatistics
	 * @date : 2019. 6. 22.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 22.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/userstats/r/m/selectuserStatistics.do")
	public String selectUserStatisticsList(@ModelAttribute("userStatsVO") UserStatsVO userStatsVO ,ModelMap model) throws Exception {
		
		userManageService.selectUserStatisticsList(userStatsVO, model);
		
		return "/admin/user/userStatistics";
	}
}

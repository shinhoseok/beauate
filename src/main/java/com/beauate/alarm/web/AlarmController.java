package com.beauate.alarm.web;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.beauate.admin.user.service.UserManageService;
import com.beauate.admin.user.service.UserVO;
import com.beauate.alarm.service.AlarmService;
import com.beauate.alarm.service.AlarmVO;
import com.beauate.common.StringUtil;

@Controller
public class AlarmController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "alarmService")
	private AlarmService alarmService;
	
	@Resource(name = "userManageService")
	private UserManageService userManageService;
	
	/**
	 * <pre>
	 * 1. 개요 : 알람이 있는지 확인 후 등록
	 * 2. 처리내용 : 알람이 있는지 확인 후 등록
	 * </pre>
	 * @Method Name : selectAlarmProc
	 * @date : 2019. 10. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param jjimVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/alarm/w/n/selectAlarmProc.do")
	public String selectAlarmProc(AlarmVO alarmVO, SessionStatus status, ModelMap model) throws Exception {
		
		String resultYn = alarmService.selectAlarmDetail(alarmVO);
		status.setComplete();	//중복 submit 방지
		model.addAttribute("resultYn", resultYn);
		
		return "jsonView";
	}

	/**
	 * <pre>
	 * 1. 개요 : 알람이 신청시 사용자 핸드폰 조회
	 * 2. 처리내용 : 알람이 신청시 사용자 핸드폰 조회
	 * </pre>
	 * @Method Name : selectUserPhon
	 * @date : 2019. 10. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param jjimVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/alarm/r/n/selectUserPhon.do")
	public String selectUserPhon(UserVO userVO, ModelMap model) throws Exception {
		userVO = userManageService.selectUser(userVO);
		if(!StringUtil.isEmpty(userVO.getMblPno())) {
			String mblPno = StringUtil.phone(userVO.getMblPno());
			model.addAttribute("mblPno", mblPno);
		} else {
			model.addAttribute("mblPno", "N");
		}
		return "jsonView";
	}
}

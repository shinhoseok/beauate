package com.beauate.admin.alarm.web;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beauate.admin.alarm.service.AlarmManageService;
import com.beauate.alarm.service.AlarmVO;

@Controller
public class AlarmManageController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "alarmManageService")
	private AlarmManageService alarmManageService;
	
	/**
	 * <pre>
	 * 1. 개요 : 알람신청 리스트
	 * 2. 처리내용 : 알람신청 리스트를 불러온다.
	 * </pre>
	 * @Method Name : selectAlarmList
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param alarmVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 
	@RequestMapping(value = "/alarm/r/m/selectAlarmList.do")
	public String selectAlarmList(@ModelAttribute("alarmVO") AlarmVO alarmVO, ModelMap model) throws Exception {
		
		Map<String, Object> rsltMap = alarmManageService.selectAlarmList(alarmVO);
		model.addAttribute("rslt", rsltMap);
		
		return "/admin/alarm/alarmList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 알람 발송완료/취소 처리
	 * 2. 처리내용 : 알람 발송완료 처리
	 * </pre>
	 * @Method Name : updateAlarmSendProc
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param alarmVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/alarm/w/n/updateAlarmSendProc.do")
	public String updateAlarmSendProc(@ModelAttribute("alarmVO") AlarmVO alarmVO, ModelMap model) throws Exception {
		alarmManageService.updateAlarmSendProc(alarmVO);
		return "redirect:/alarm/r/m/selectAlarmList.do";
	}
}

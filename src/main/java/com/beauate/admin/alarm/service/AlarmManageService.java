package com.beauate.admin.alarm.service;

import java.util.Map;

import com.beauate.alarm.service.AlarmVO;

public interface AlarmManageService {
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
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectAlarmList(AlarmVO alarmVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 알람 발송완료 처리
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
	public void updateAlarmSendProc(AlarmVO alarmVO) throws Exception;
}

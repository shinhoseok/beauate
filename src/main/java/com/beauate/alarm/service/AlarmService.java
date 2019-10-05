package com.beauate.alarm.service;

public interface AlarmService {
	
	/**
	 * <pre>
	 * 1. 개요 : 알람 조회 후 등록처리
	 * 2. 처리내용 :  알람 조회 후 등록처리
	 * </pre>
	 * @Method Name : selectAlarmDetail
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param alarmVO
	 * @return String
	 * @throws Exception
	 */ 
	public String selectAlarmDetail(AlarmVO alarmVO) throws Exception;
}

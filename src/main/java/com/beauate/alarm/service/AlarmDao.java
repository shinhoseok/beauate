package com.beauate.alarm.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("alarmDao")
public interface AlarmDao {
	
	/**
	 * <pre>
	 * 1. 개요 : 알람 목록 카운트
	 * 2. 처리내용 :  알람 목록 카운트
	 * </pre>
	 * @Method Name : selectAlarmMngListCnt
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
	 * @return Integer
	 * @throws Exception
	 */ 
	Integer selectAlarmMngListCnt(AlarmVO alarmVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 알람 목록
	 * 2. 처리내용 :  알람 목록
	 * </pre>
	 * @Method Name : selectAlarmMngList
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
	 * @return AlarmVO
	 * @throws Exception
	 */ 
	List<AlarmVO> selectAlarmMngList(AlarmVO alarmVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 알람 조회
	 * 2. 처리내용 :  알람 조회
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
	 * @return AlarmVO
	 * @throws Exception
	 */ 
	AlarmVO selectAlarmDetail(AlarmVO alarmVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 알람 등록처리
	 * 2. 처리내용 :  알람 등록처리
	 * </pre>
	 * @Method Name : insertAlarmProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param AlarmVO
	 * @return void
	 * @throws Exception
	 */ 
	void insertAlarmProc(AlarmVO AlarmVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 알람 삭제처리
	 * 2. 처리내용 :  알람 삭제처리
	 * </pre>
	 * @Method Name : deleteAlarmProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param AlarmVO
	 * @return void
	 * @throws Exception
	 */ 
	void deleteAlarmProc(AlarmVO AlarmVO);
	
	/**
	 * <pre>
	 * 1. 개요 : 알람 수정처리
	 * 2. 처리내용 :  알람 수정처리
	 * </pre>
	 * @Method Name : updateAlarmProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param AlarmVO
	 * @return void
	 * @throws Exception
	 */ 
	void updateAlarmProc(AlarmVO AlarmVO);
}

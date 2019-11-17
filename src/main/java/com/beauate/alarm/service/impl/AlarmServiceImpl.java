package com.beauate.alarm.service.impl;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.alarm.service.AlarmDao;
import com.beauate.alarm.service.AlarmService;
import com.beauate.alarm.service.AlarmVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("alarmService")
public class AlarmServiceImpl extends EgovAbstractServiceImpl implements AlarmService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="alarmDao")
	private AlarmDao alarmDao;
	
	@Resource(name = "alarmIdGnrService")
	private EgovIdGnrService alarmIdGnrService;
	
	/**
	 * <pre>
	 * 1. 개요 : 알람 조회 후 등록처리
	 * 2. 처리내용 :  알람 조회 후 등록처리
	 * </pre>
	 * @Method Name : selectAlarmDetail
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param alarmVO
	 * @return String
	 * @throws Exception
	 */ 
	public String selectAlarmDetail(AlarmVO alarmVO) throws Exception {
		AlarmVO selectVO = alarmDao.selectAlarmDetail(alarmVO);
		
		String resultYn = "N";
		//알람을 안했다면 등록
		if(selectVO == null) {
			alarmVO.setAlarmId(alarmIdGnrService.getNextStringId());
			alarmDao.insertAlarmProc(alarmVO);
			resultYn = "Y";
		}
		
		return resultYn;
	}
}

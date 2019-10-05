package com.beauate.admin.alarm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.alarm.service.AlarmDao;
import com.beauate.alarm.service.AlarmVO;
import com.beauate.common.StringUtil;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("alarmManageService")
public class AlarmManageServiceImpl extends EgovAbstractServiceImpl implements AlarmManageService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="alarmDao")
	private AlarmDao alarmDao;
	
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
	public Map<String, Object> selectAlarmList(AlarmVO alarmVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(alarmVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(alarmVO.getPageUnit());
		paginationInfo.setPageSize(alarmVO.getPageSize());
		
		alarmVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		alarmVO.setLastIndex(paginationInfo.getLastRecordIndex());
		alarmVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<AlarmVO> selectList = null;
		
		//총 카운트 
		int cnt = alarmDao.selectAlarmMngListCnt(alarmVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//리스트
			selectList = alarmDao.selectAlarmMngList(alarmVO);
			//전화번호 형식(000-000-0000)변환
			for(int i=0; i<selectList.size(); i++) {
				selectList.get(i).setMblPno(StringUtil.phone(selectList.get(i).getMblPno()));
			}
		}
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		
		return rsltMap;
	}
	
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
	public void updateAlarmSendProc(AlarmVO alarmVO) throws Exception {
		String[] updateAlarmList = alarmVO.getAlarmId().split(",");
		if(updateAlarmList.length == 1) {
			alarmDao.updateAlarmProc(alarmVO);
		} else {
			for(String alarmId : updateAlarmList) {
				alarmVO.setAlarmId(alarmId);
				alarmDao.updateAlarmProc(alarmVO);
			}
		}
	}
}

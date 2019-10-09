package com.beauate.mypage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.common.DateUtil;
import com.beauate.common.StringUtil;
import com.beauate.mypage.service.MyPageService;
import com.beauate.pay.service.PayDao;
import com.beauate.pay.service.PayVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("myPageService")
public class MyPageServiceImpl extends EgovAbstractServiceImpl implements MyPageService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="payDao")
	private PayDao payDao;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 신청한 클래스 리스트
	 * 2. 처리내용 : 마이페이지 신청한 클래스 리스트를 불러온다.
	 * </pre>
	 * @Method Name : selectApplyClassList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectApplyClassList(PayVO payVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(payVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(payVO.getPageUnit());
		paginationInfo.setPageSize(payVO.getPageSize());
		
		payVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		payVO.setLastIndex(paginationInfo.getLastRecordIndex());
		payVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<PayVO> selectList = null;
		
		int cnt = payDao.selectPayListCnt(payVO);
		paginationInfo.setTotalRecordCount(cnt);
		if(cnt > 0){
			//리스트
			selectList = payDao.selectPayList(payVO);
			//이미지 경로수정 yyyyMM/파일명
			selectList = fullImgPathChang(selectList);
		}
		//오늘날짜
		String today = DateUtil.getCurrentYearMonthDay();
		
		rsltMap.put("paginationInfo", paginationInfo);
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		rsltMap.put("today", today);
		
		return rsltMap;
	}
	
	//이미지 경로를 WAS의 경로로 변환한다.
	private List<PayVO> fullImgPathChang(List<PayVO> sqlList) {
		for(int i=0; i<sqlList.size(); i++) {
			String tempSrc = sqlList.get(i).getImgSrc2();
			log.debug(">> origin Path >> "+tempSrc);
			if(!StringUtil.isEmpty(tempSrc)) {
				int cnt = tempSrc.indexOf("\\");
				if(cnt == -1) {
					cnt = tempSrc.indexOf("//");
				}
				String resultSrc = tempSrc.substring(cnt+1);
				log.debug(">> result Path >> "+resultSrc);
				sqlList.get(i).setImgSrc2(resultSrc);
				log.debug(">> vo Path >> "+sqlList.get(i).getImgSrc2());
			}
		}
		return sqlList;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 결제내역삭제
	 * 2. 처리내용 :  결제내역삭제
	 * </pre>
	 * @Method Name : deletePayProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return void
	 * @throws Exception
	 */ 
	public void deletePayProc(PayVO payVO) throws Exception {
		String [] payIdList = payVO.getPayId().split(",");
		if(payIdList.length == 1) {
			payDao.deletePayProc(payVO);
		} else {
			for(String payId : payIdList) {
				payVO.setPayId(payId);
				payDao.deletePayProc(payVO);
			}
		}
	}
}

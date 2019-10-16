package com.beauate.mypage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.admin.classmng.service.ClassManageDao;
import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.common.DateUtil;
import com.beauate.common.StringUtil;
import com.beauate.jjim.service.JjimDao;
import com.beauate.jjim.service.JjimVO;
import com.beauate.mypage.service.MyPageService;
import com.beauate.pay.service.PayDao;
import com.beauate.pay.service.PayVO;
import com.beauate.refund.service.RefundDao;
import com.beauate.refund.service.RefundVO;
import com.beauate.review.service.ReviewDao;
import com.beauate.review.service.ReviewVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("myPageService")
public class MyPageServiceImpl extends EgovAbstractServiceImpl implements MyPageService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="payDao")
	private PayDao payDao;
	
	@Resource(name="refundDao")
	private RefundDao refundDao;
	
	@Resource(name="refundIdGnrService")
	private EgovIdGnrService refundIdGnrService;
	
	@Resource(name="classManageDao")
	private ClassManageDao classManageDao;
	
	@Resource(name="jjimDao")
	private JjimDao jjimDao;
	
	@Resource(name="reviewDao")
	private ReviewDao reviewDao;
	
	@Resource(name="reviewIdGnrService")
	private EgovIdGnrService reviewIdGnrService;
	
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
	 * @param payVO
	 * @return Map<String, Object>
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
	 * 1. 개요 : 마이페이지 찜 리스트
	 * 2. 처리내용 : 마이페이지 찜 리스트
	 * </pre>
	 * @Method Name : selectJjimList
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
	public Map<String, Object> selectJjimList(JjimVO jjimVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(jjimVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(jjimVO.getPageUnit());
		paginationInfo.setPageSize(jjimVO.getPageSize());
		
		jjimVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		jjimVO.setLastIndex(paginationInfo.getLastRecordIndex());
		jjimVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<JjimVO> selectList = null;
		
		int cnt = jjimDao.selectJjimListCnt(jjimVO);
		paginationInfo.setTotalRecordCount(cnt);
		if(cnt > 0){
			//리스트
			selectList = jjimDao.selectJjimList(jjimVO);
			//이미지 경로수정 yyyyMM/파일명
			selectList = fullImgPathChang2(selectList);
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
	private List<JjimVO> fullImgPathChang2(List<JjimVO> sqlList) {
		for(int i=0; i<sqlList.size(); i++) {
			String tempSrc = sqlList.get(i).getImgSrc1();
			log.debug(">> origin Path >> "+tempSrc);
			if(!StringUtil.isEmpty(tempSrc)) {
				int cnt = tempSrc.indexOf("\\");
				if(cnt == -1) {
					cnt = tempSrc.indexOf("//");
				}
				String resultSrc = tempSrc.substring(cnt+1);
				log.debug(">> result Path >> "+resultSrc);
				sqlList.get(i).setImgSrc1(resultSrc);
				log.debug(">> vo Path >> "+sqlList.get(i).getImgSrc1());
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
			payVO.setDelYn("Y");
			payDao.deletePayProc(payVO);
		} else {
			for(String payId : payIdList) {
				payVO.setPayId(payId);
				payVO.setDelYn("Y");
				payDao.deletePayProc(payVO);
			}
		}
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 환불처리
	 * 2. 처리내용 :  환불처리
	 * </pre>
	 * @Method Name : updatePayRefundProc
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
	public void updatePayRefundProc(PayVO payVO) throws Exception {
		//결재내역 취소2로 저장
		payVO.setPaySt("2");
		payDao.updatePayRefundProc(payVO);
		
		//취소,환불내역 저장
		RefundVO refundVO = new RefundVO();
		refundVO.setRefundId(refundIdGnrService.getNextStringId());
		refundVO.setPayId(payVO.getPayId());
		refundDao.insertRefundProc(refundVO);
		
		//현재 클래스에 등록한 인원체크
		ClassVO tempVO = new ClassVO();
		tempVO.setClassId(payVO.getClassId());
		ClassVO queryVO = classManageDao.selectClassMngDetail(tempVO);
		int currentNo = Integer.parseInt(queryVO.getClassApplyNo());
		int applyNo = currentNo - 1;
		tempVO.setClassApplyNo(String.valueOf(applyNo));
		classManageDao.updateClassMngProc(tempVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 찜 삭제
	 * 2. 처리내용 :  찜 삭제
	 * </pre>
	 * @Method Name : deleteJjimProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param jjimVO
	 * @return void
	 * @throws Exception
	 */ 
	public void deleteJjimProc(JjimVO jjimVO) throws Exception {
		String [] jjimIdList = jjimVO.getJjimId().split(",");
		if(jjimIdList.length == 1) {
			jjimDao.deleteJjimProc(jjimVO);
		} else {
			for(String jjimId : jjimIdList) {
				jjimVO.setJjimId(jjimId);
				jjimDao.deleteJjimProc(jjimVO);
			}
		}
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 리뷰작성 등록처리
	 * 2. 처리내용 :  리뷰작성 등록처리
	 * </pre>
	 * @Method Name : insertReviewProc
	 * @date : 2019. 5. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param reviewVO
	 * @return
	 * @throws Exception
	 */ 
	public void insertReviewProc(ReviewVO reviewVO) throws Exception {
		reviewVO.setReviewId(reviewIdGnrService.getNextStringId());
		reviewDao.insertReviewProc(reviewVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자가 하나의 클래스에 작성한 리뷰카운트
	 * 2. 처리내용 :  사용자가 하나의 클래스에 작성한 리뷰카운트
	 * </pre>
	 * @Method Name : selectUserReviewCnt
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param reviewVO
	 * @return int
	 * @throws Exception
	 */ 
	public int selectUserReviewCnt(ReviewVO reviewVO) throws Exception {
		return reviewDao.selectUserReviewCnt(reviewVO);
	}
}

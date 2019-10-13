package com.beauate.offclass.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.admin.classmng.service.ClassManageDao;
import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.admin.code.service.CodeDao;
import com.beauate.admin.code.service.CodeVO;
import com.beauate.admin.coupon.service.CouponManageDao;
import com.beauate.admin.coupon.service.CouponVO;
import com.beauate.admin.user.service.UserDao;
import com.beauate.admin.user.service.UserVO;
import com.beauate.common.DateUtil;
import com.beauate.common.GlobalConstants;
import com.beauate.common.StringUtil;
import com.beauate.coupon.service.CouponHistoryDao;
import com.beauate.coupon.service.CouponHistoryVO;
import com.beauate.jjim.service.JjimDao;
import com.beauate.jjim.service.JjimVO;
import com.beauate.offclass.service.OffClassDao;
import com.beauate.offclass.service.OffClassService;
import com.beauate.pay.service.PayDao;
import com.beauate.pay.service.PayVO;
import com.beauate.review.service.ReviewDao;
import com.beauate.review.service.ReviewVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("offClassService")
public class OffClassServiceImpl extends EgovAbstractServiceImpl implements OffClassService {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="OffClassDao")
	private OffClassDao offClassDao;
	
	@Resource(name="classManageDao")
	private ClassManageDao classManageDao;
	
	@Resource(name="codeDao")
	private CodeDao codeDao;
	
	@Resource(name="jjimDao")
	private JjimDao jjimDao;
	
	@Resource(name="userDao")
	private UserDao userDao;
	
	@Resource(name="payDao")
	private PayDao payDao;
	
	@Resource(name="couponManageDao")
	private CouponManageDao couponManageDao;
	
	@Resource(name="payIdGnrService")
	private EgovIdGnrService payIdGnrService;
	
	@Resource(name="couponHistoryDao")
	private CouponHistoryDao couponHistoryDao;
	
	@Resource(name="reviewDao")
	private ReviewDao reviewDao;
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 리스트(첫화면 페이징없이 헤어,메이크업, 전체)
	 * 2. 처리내용 :  오프라인클래스 리스트(첫화면 페이징없이 헤어,메이크업, 전체)
	 * </pre>
	 * @Method Name : selectOffClassList
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectOffClassList(ClassVO classVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		String today = DateUtil.getCurrentYearMonthDay();
		log.debug(">>>>>>>>>>>>>>>>>>> selectOffClassList ClassCtSt >>>>>>>>>>>>>>>>>>>>>>>> "+classVO.getClassCtSt());
		//*********************헤어리스트 8장
		classVO.setClassCtSt("1");
		classVO.setImgCnt("8");
		List<ClassVO> hairList = offClassDao.selectOffClassList(classVO);
		if(hairList != null) {
			hairList = fullImgPathChang(hairList);
		}
		
		
		//********************메이크업리스트 8장
		classVO.setClassCtSt("2");
		classVO.setImgCnt("8");
		List<ClassVO> makeUpList = offClassDao.selectOffClassList(classVO);
		if(makeUpList != null) {
			makeUpList = fullImgPathChang(makeUpList);
		}
		
		//****************전체리스트 지역 셀렉트박스
		List<CodeVO> classAreaList = codeDao.selectScodeList(GlobalConstants.AREA_CODE);
		
		rsltMap.put("hairList", hairList);
		rsltMap.put("classAreaList", classAreaList);
		rsltMap.put("makeUpList", makeUpList);
		rsltMap.put("today", today);
		
		return rsltMap;
	}
	
	//이미지 경로를 WAS의 경로로 변환한다.
	private List<ClassVO> fullImgPathChang(List<ClassVO> sqlList) {
		for(int i=0; i<sqlList.size(); i++) {
			String tempSrc = sqlList.get(i).getImgSrc();
			log.debug(">> origin Path >> "+tempSrc);
			if(!StringUtil.isEmpty(tempSrc)) {
				int cnt = tempSrc.indexOf("\\");
				if(cnt == -1) {
					cnt = tempSrc.indexOf("//");
				}
				String resultSrc = tempSrc.substring(cnt+1);
				log.debug(">> result Path >> "+resultSrc);
				sqlList.get(i).setImgSrc(resultSrc);
				log.debug(">> vo Path >> "+sqlList.get(i).getImgSrc());
			}
		}
		return sqlList;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 리스트(첫화면 전체 ajax)
	 * 2. 처리내용 :  오프라인클래스 리스트(첫화면 전체 ajax)
	 * </pre>
	 * @Method Name : selectAllOffClassList
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectAllOffClassList(ClassVO classVO) throws Exception {
		
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		String today = DateUtil.getCurrentYearMonthDay();
		
		classVO.setAdminYn("N"); //파일경로 쿼리 구분자 어드민은 필요없음.
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(classVO.getPageIndex());
		classVO.setPageUnit(16);//페이징 게시물 수 (전체16개)
		paginationInfo.setRecordCountPerPage(classVO.getPageUnit());
		paginationInfo.setPageSize(classVO.getPageSize());
		
		classVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		classVO.setLastIndex(paginationInfo.getLastRecordIndex());
		classVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<ClassVO> selectList = null;
		
		//총 카운트 
		int cnt = classManageDao.selectClassMngListCnt(classVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//리스트
			selectList = classManageDao.selectClassMngList(classVO);
			//이미지 경로수정 yyyyMM/파일명
			selectList = fullImgPathChang(selectList);
		}
		
		
		rsltMap.put("paginationInfo", paginationInfo);
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		rsltMap.put("today", today);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 리스트(탭<헤어,메이크업,...)
	 * 2. 처리내용 :  오프라인클래스 리스트(탭<헤어,메이크업,...)
	 * </pre>
	 * @Method Name : selectOffClassTabList
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectOffClassTabList(ClassVO classVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<>();
		String today = DateUtil.getCurrentYearMonthDay();
		log.debug(">>>>>>>>>>>>>>>>>>> selectOffClassList ClassCtSt >>>>>>>>>>>>>>>>>>>>>>>> "+classVO.getClassCtSt());
//		classVO.setClassCtSt("1");
		//상단 최신순 4개
		classVO.setImgCnt("4");
		List<ClassVO> selectNewList = offClassDao.selectOffClassList(classVO);
		if(selectNewList != null) {
			selectNewList = fullImgPathChang(selectNewList);
		}
		
		//중단 마감임박 8개
		classVO.setImgCnt("8");
		classVO.setOrderByYn(true);
		List<ClassVO> selectHurryList = offClassDao.selectOffClassList(classVO);
		if(selectHurryList != null) {
			selectHurryList = fullImgPathChang(selectHurryList);
		}
		
		//****************전체리스트 지역 셀렉트박스
		List<CodeVO> classAreaList = codeDao.selectScodeList(GlobalConstants.AREA_CODE);
		
		rsltMap.put("selectNewList", selectNewList);
		rsltMap.put("selectHurryList", selectHurryList);
		rsltMap.put("classAreaList", classAreaList);
		rsltMap.put("today", today);
		return rsltMap;
	}
	
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 상세화면
	 * 2. 처리내용 :  오프라인클래스 상세화면
	 * </pre>
	 * @Method Name : selectOffClassDetail
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectOffClassDetail(ClassVO classVO) throws Exception {
		
		Map<String, Object> rsltMap = new HashMap<>();
		String today = DateUtil.getCurrentYearMonthDay();
		
		//Detail List >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		classVO.setAdminYn("N");
		ClassVO resultVO = classManageDao.selectClassMngDetail(classVO);
		//전화번호 형식변경
		if(!StringUtil.isEmpty(resultVO.getMblPno())) {
			String tempMblPno = resultVO.getMblPno();
			resultVO.setMblPno(StringUtil.phone(tempMblPno)); 
		}
		log.debug(">> origin Path >> "+resultVO.getImgSrc2());
		//이미지 WAS경로 변환
		String tempSrc = resultVO.getImgSrc();
		String tempSrc2 = resultVO.getImgSrc2();
		String tempSrc3 = resultVO.getImgSrc3();
		if(!StringUtil.isEmpty(tempSrc) && !StringUtil.isEmpty(tempSrc2)) {
			String resultSrc = StringUtil.getWasfilePath(tempSrc);
			String resultSrc2 = StringUtil.getWasfilePath(tempSrc2);
			String resultSrc3 = StringUtil.getWasfilePath(tempSrc3);
			
			log.debug(">> result Path >> "+resultSrc2);
			resultVO.setImgSrc(resultSrc);
			resultVO.setImgSrc2(resultSrc2);
			resultVO.setImgSrc3(resultSrc3);
			log.debug(">> vo Path >> "+resultVO.getImgSrc2());
		} else {
			throw new NullPointerException("해당 클래스에 등록된 이미지 파일이 없습니다. classId >>> "+classVO.getClassId());
		}
		
		//Side List >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		List<ClassVO> sideImgVO = offClassDao.selectOffClassSideDetail(resultVO);
		if(sideImgVO != null) {
			sideImgVO = fullImgPathChang(sideImgVO);
		}
		
		//찜내역 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		JjimVO jjimVO = null;
		if(!StringUtil.isEmpty(classVO.getUsrId())) {
			JjimVO paramVO = new JjimVO();
			paramVO.setUsrId(classVO.getUsrId());
			paramVO.setClassId(resultVO.getClassId());
			jjimVO = jjimDao.selectJjim(paramVO);
		}
		
		rsltMap.put("resultVO", resultVO);
		rsltMap.put("today", today);
		rsltMap.put("sideImgVO", sideImgVO);
		rsltMap.put("jjimVO", jjimVO);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 상세 리뷰리스트
	 * 2. 처리내용 :  오프라인클래스 상세 리뷰리스트
	 * </pre>
	 * @Method Name : selectReviewList
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
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectReviewList(ReviewVO reviewVO) throws Exception {
		
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(reviewVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(reviewVO.getPageUnit());
		paginationInfo.setPageSize(reviewVO.getPageSize());
		
		reviewVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		reviewVO.setLastIndex(paginationInfo.getLastRecordIndex());
		reviewVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<ReviewVO> selectList = null;
		
		//총 카운트 
		int cnt = reviewDao.selectReviewListCnt(reviewVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//합계
			double curriculumSum = 0;
			double kindnessSum = 0;
			double timeProSum = 0;
			double communitySum = 0;
			//별점 합계
			double curriculumStarSum = 0;
			double kindnessStarSum = 0;
			double timeProStarSum = 0;
			double communityStarSum = 0;
			//평점 합계
			double curriculumScoreSum = 0;
			double kindnessScoreSum = 0;
			double timeProScoreSum = 0;
			double communityScoreSum = 0;
			double scoreSum = 0;
			//리스트
			selectList = reviewDao.selectReviewList(reviewVO);
			//별점평점
			for(ReviewVO reviewTmpVO : selectList) {
				curriculumSum += Integer.parseInt(reviewTmpVO.getCurriculum());
				kindnessSum += Integer.parseInt(reviewTmpVO.getKindness());
				timeProSum += Integer.parseInt(reviewTmpVO.getTimePro());
				communitySum += Integer.parseInt(reviewTmpVO.getCommunity());
			}
			//평점합계
			curriculumScoreSum = curriculumSum;
			kindnessScoreSum = kindnessSum;
			timeProScoreSum = timeProSum;
			communityScoreSum = communitySum;
			//별점합계
			curriculumStarSum = curriculumSum * 20;
			kindnessStarSum = kindnessSum * 20;
			timeProStarSum = timeProSum * 20;
			communityStarSum = communitySum * 20;
			
			if(curriculumSum != 0) {
				curriculumScoreSum = curriculumScoreSum / cnt;
				curriculumScoreSum = Math.round(curriculumScoreSum*10)/10.0;
				curriculumStarSum = curriculumStarSum / cnt;
				curriculumStarSum = Math.round(curriculumStarSum*10)/10.0;
			}else { }
			if(kindnessSum != 0) {
				kindnessScoreSum = kindnessScoreSum / cnt;
				kindnessScoreSum = Math.round(kindnessScoreSum*10)/10.0;
				kindnessStarSum = kindnessStarSum / cnt;
				kindnessStarSum = Math.round(kindnessStarSum*10)/10.0;
			}else { }
			if(timeProSum != 0) {
				timeProScoreSum = timeProScoreSum / cnt;
				timeProScoreSum = Math.round(timeProScoreSum*10)/10.0;
				timeProStarSum = timeProStarSum / cnt;
				timeProStarSum = Math.round(timeProStarSum*10)/10.0;
			}else { }
			if(communitySum != 0) {
				communityScoreSum = communityScoreSum / cnt;
				communityScoreSum = Math.round(communityScoreSum*10)/10.0;
				communityStarSum = communityStarSum / cnt;
				communityStarSum = Math.round(communityStarSum*10)/10.0;
			}else { }
			scoreSum = (communityScoreSum + timeProScoreSum + kindnessScoreSum + curriculumScoreSum) / 4;
			scoreSum = Math.round(scoreSum*10)/10.0;
			rsltMap.put("scoreSum", scoreSum);
			rsltMap.put("communityStarSum", communityStarSum);
			rsltMap.put("timeProStarSum", timeProStarSum);
			rsltMap.put("kindnessStarSum", kindnessStarSum);
			rsltMap.put("curriculumStarSum", curriculumStarSum);
		}
		
		rsltMap.put("paginationInfo", paginationInfo);
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 결제화면
	 * 2. 처리내용 : 오프라인클래스 결제화면
	 * </pre>
	 * @Method Name : selectOffClassApplyDetail
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectOffClassApplyDetail(ClassVO classVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<>();
		ClassVO resultVO = classManageDao.selectClassMngDetail(classVO);
		//이미지 WAS경로 변환
		String tempSrc3 = resultVO.getImgSrc3();
		if(!StringUtil.isEmpty(tempSrc3)) {
			/*int cnt = tempSrc3.indexOf("\\");
			if(cnt == -1) {
				cnt = tempSrc3.indexOf("//");
			}
			String resultSrc3 = tempSrc3.substring(cnt+1);*/
			String resultSrc3 = StringUtil.getWasfilePath(tempSrc3);
			log.debug(">> result Path >> "+tempSrc3);
			resultVO.setImgSrc3(resultSrc3);
			log.debug(">> vo Path >> "+resultVO.getImgSrc3());
		} else {
			throw new NullPointerException("해당 클래스에 등록된 이미지 파일이 없습니다. classId >>> "+classVO.getClassId());
		}
		
		//멘토 전화번호
		UserVO userVO = new UserVO();
		userVO.setUsrId(resultVO.getClassUserId());
		userVO = userDao.selectUserDetail(userVO);
		if(!StringUtil.isEmpty(userVO.getMblPno())) {
			userVO.setMblPno(StringUtil.phone(userVO.getMblPno()));
		} else {
			userVO.setMblPno("등록된 번호가 없습니다.");
		}
		
		//사용자가 사용 가능한 쿠폰 내역을 가져온다.
		CouponVO couponVO = new CouponVO();
		couponVO.setUsrId(classVO.getUsrId());
		List<CouponVO> couponList = couponManageDao.selectUserHavingCoupon(couponVO);
		
		rsltMap.put("resultVO", resultVO);
		rsltMap.put("userVO", userVO);
		rsltMap.put("couponList", couponList);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 결제시 수강인원체크
	 * 2. 처리내용 : 오프라인클래스 결제시 수강인원체크
	 * </pre>
	 * @Method Name : selectClassMemChk
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectClassMemChk(ClassVO classVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<>();
		boolean result = false;
		ClassVO resultVO = classManageDao.selectClassMngDetail(classVO);
		int classBigNo = Integer.parseInt(resultVO.getClassBigNo());
		int classApplyNo = Integer.parseInt(resultVO.getClassApplyNo());
		if(classApplyNo >= classBigNo) {
			result = false;
		} else {
			result = true;
		}
		
		rsltMap.put("resultYn", result);
		rsltMap.put("resultVO", resultVO);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 결제완료처리
	 * 2. 처리내용 : 오프라인클래스 결제완료처리
	 * </pre>
	 * @Method Name : insertPayProc
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return
	 * @throws Exception
	 */
	public ClassVO insertPayProc(PayVO payVO) throws Exception {
		//결제상태 결제모듈 달기전 하드코딩(결제완료 코드값)
		payVO.setPaySt("1");
		//결제방법 결제모듈 달기전 하드코딩(계좌이체 코드값)
		payVO.setPayMethodSt("2");
		
		//결제하기전 수강하는 클래스의 applyno +1업데이트, 클래스 상태값 변경 
		ClassVO classParamVO = new ClassVO();
		classParamVO.setClassId(payVO.getClassId());
		log.debug(">>>> class Apply no >>>>"+payVO.getClassApplyNo());
		int classApplyNoTmp = Integer.parseInt(payVO.getClassApplyNo());
		int classBigNo = Integer.parseInt(payVO.getClassBigNo());
		int classApplyNo = classApplyNoTmp +1;
		if(classBigNo == classApplyNo) {
			classParamVO.setClassSt("3"); //클래스상태 신청마감
		}
		classParamVO.setClassApplyNo(String.valueOf(classApplyNo));
		classManageDao.updateClassMngProc(classParamVO);
		
		//쿠폰사용했다면 쿠폰상태 N
		CouponHistoryVO couponHistoryVO = new CouponHistoryVO();
		couponHistoryVO.setUsrId(payVO.getUsrId());
		couponHistoryVO.setCpnFl("N");
		couponHistoryVO.setCouponId(payVO.getCouponId());
		couponHistoryDao.updateCouponHistoryProc(couponHistoryVO);
		
		//결제
		payVO.setPayId(payIdGnrService.getNextStringId());
		payDao.insertPayProc(payVO);
		
		//완료화면 리스트
		ClassVO paramClassVO = new ClassVO();
		paramClassVO.setClassId(payVO.getClassId());
		paramClassVO.setAdminYn("N");
		ClassVO resultVO = classManageDao.selectClassMngDetail(paramClassVO);
		//이미지 WAS경로 변환
		String tempSrc3 = resultVO.getImgSrc3();
		if(!StringUtil.isEmpty(tempSrc3)) {
			/*int cnt = tempSrc3.indexOf("\\");
			if(cnt == -1) {
				cnt = tempSrc3.indexOf("//");
			}
			String resultSrc3 = tempSrc3.substring(cnt+1);*/
			String resultSrc3 = StringUtil.getWasfilePath(tempSrc3);
			log.debug(">> result Path >> "+tempSrc3);
			resultVO.setImgSrc3(resultSrc3);
			log.debug(">> vo Path >> "+resultVO.getImgSrc3());
		} else {
			throw new NullPointerException("해당 클래스에 등록된 이미지 파일이 없습니다. classId >>> "+paramClassVO.getClassId());
		}
		
		return resultVO;
	}
}

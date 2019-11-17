package com.beauate.admin.coupon.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.admin.code.service.CodeDao;
import com.beauate.admin.code.service.CodeVO;
import com.beauate.admin.coupon.service.CouponManageDao;
import com.beauate.admin.coupon.service.CouponManageService;
import com.beauate.admin.coupon.service.CouponVO;
import com.beauate.common.GlobalConstants;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("couponManageService")
public class CouponManageServiceImpl extends EgovAbstractServiceImpl implements CouponManageService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="couponManageDao")
	private CouponManageDao couponManageDao;
	
	@Resource(name="couponMngIdGnrService")
	private EgovIdGnrService couponMngIdGnrService;
	
	@Resource(name="codeDao")
	private CodeDao codeDao;
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰관리 리스트
	 * 2. 처리내용 : 쿠폰관리 리스트
	 * </pre>
	 * @Method Name : selectCouponMngList
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param couponVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectCouponMngList(CouponVO couponVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(couponVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(couponVO.getPageUnit());
		paginationInfo.setPageSize(couponVO.getPageSize());
		
		couponVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		couponVO.setLastIndex(paginationInfo.getLastRecordIndex());
		couponVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<CouponVO> selectList = null;		
		//총 카운트 
		int cnt = couponManageDao.selectCouponMngListCnt(couponVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//리스트
			selectList = couponManageDao.selectCouponMngList(couponVO);
		}
		
		rsltMap.put("paginationInfo", paginationInfo);
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰관리 등록(쿠폰상태 리스트)
	 * 2. 처리내용 : 쿠폰관리 등록(쿠폰상태 리스트)
	 * </pre>
	 * @Method Name : insertCpnMng
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return List<CodeVO>
	 * @throws Exception
	 */ 
	public List<CodeVO> insertCpnMng(CouponVO couponVO) throws Exception {
		return codeDao.selectScodeList(GlobalConstants.COUPON_ST_CODE);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰관리 등록처리
	 * 2. 처리내용 : 쿠폰관리 등록처리
	 * </pre>
	 * @Method Name : insertCpnMngProc
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return void
	 * @throws Exception
	 */ 
	public void insertCpnMngProc(CouponVO couponVO) throws Exception {
		couponVO.setCouponId(couponMngIdGnrService.getNextStringId());
		couponManageDao.insertCpnMngProc(couponVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 상세
	 * 2. 처리내용 : 쿠폰 상세
	 * </pre>
	 * @Method Name : selectCpnMngDetail
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return CouponVO
	 * @throws Exception
	 */ 
	public CouponVO selectCpnMngDetail(CouponVO couponVO) throws Exception {
		return couponManageDao.selectCpnMngDetail(couponVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 삭제
	 * 2. 처리내용 : 쿠폰 삭제
	 * </pre>
	 * @Method Name : deleteCpnMngProc
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return void
	 * @throws Exception
	 */ 
	public void deleteCpnMngProc(CouponVO couponVO) throws Exception {
		couponManageDao.deleteCpnMngProc(couponVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 수정
	 * 2. 처리내용 : 쿠폰 수정
	 * </pre>
	 * @Method Name : updateCpnMngProc
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return void
	 * @throws Exception
	 */ 
	public void updateCpnMngProc(CouponVO couponVO) throws Exception {
		couponManageDao.updateCpnMngProc(couponVO);
	}
}

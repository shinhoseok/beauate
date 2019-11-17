package com.beauate.admin.pay.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.admin.code.service.CodeDao;
import com.beauate.admin.code.service.CodeVO;
import com.beauate.admin.pay.service.PayManageService;
import com.beauate.pay.service.PayDao;
import com.beauate.pay.service.PayVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("payManageService")
public class PayManageServiceImpl extends EgovAbstractServiceImpl implements PayManageService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="payDao")
	private PayDao payDao;
	
	@Resource(name="codeDao")
	private CodeDao codeDao;
	
	/**
	 * <pre>
	 * 1. 개요 : 결재관리리스트
	 * 2. 처리내용 : 결재관리리스트
	 * </pre>
	 * @Method Name : selectPayList
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param payVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectPayMngList(PayVO payVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(payVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(payVO.getPageUnit());
		paginationInfo.setPageSize(payVO.getPageSize());
		
		payVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		payVO.setLastIndex(paginationInfo.getLastRecordIndex());
		payVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<PayVO> selectList = null;
		
		int cnt = payDao.selectPayMngListCnt(payVO);
		paginationInfo.setTotalRecordCount(cnt);
		if(cnt > 0){
			//리스트
			selectList = payDao.selectPayMngList(payVO);
		}
		
		//결제상태 코드값
		List<CodeVO> payStCodeList = codeDao.selectScodeList("PAY");
		
		rsltMap.put("paginationInfo", paginationInfo);
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		rsltMap.put("payStCodeList", payStCodeList);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 결제상태 변경
	 * 2. 처리내용 : 결제상태 변경
	 * </pre>
	 * @Method Name : updatePayStProc
	 * @date : 2019. 10. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param payVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	public void updatePayStProc(PayVO payVO) throws Exception {
		String[] payIdList = payVO.getPayId().split(",");
		String[] payStList = payVO.getPaySt().split(",");
		if(payIdList.length == 1) {
			payDao.updatePayRefundProc(payVO);
		} else {
			for(int i=0; i<payIdList.length; i++) {
				payVO.setPayId(payIdList[i]);
				payVO.setPaySt(payStList[i]);
				payDao.updatePayRefundProc(payVO);
			}
		}
	}
}

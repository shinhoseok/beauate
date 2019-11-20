package com.beauate.mento.offclass.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.admin.classmng.service.ClassManageDao;
import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.jjim.service.JjimDao;
import com.beauate.jjim.service.JjimVO;
import com.beauate.mento.offclass.service.OffClassMentoService;
import com.beauate.offclass.service.OffClassDao;
import com.beauate.pay.service.PayDao;
import com.beauate.pay.service.PayVO;
import com.google.gson.Gson;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("offClassMentoService")
public class OffClassMentoServiceImpl extends EgovAbstractServiceImpl implements OffClassMentoService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="classManageDao")
	private ClassManageDao classManageDao;
	
	@Resource(name="OffClassDao")
	private OffClassDao offClassDao;
	
	@Resource(name="jjimDao")
	private JjimDao jjimDao;
	
	@Resource(name="payDao")
	private PayDao payDao;
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인 클래스 리스트
	 * 2. 처리내용 :  오프라인 클래스 클래스 리스트
	 * </pre>
	 * @Method Name : selectClassList
	 * @date : 2019. 9. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param classVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectClassList(ClassVO classVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<>();
		
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(classVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(classVO.getPageUnit());
		paginationInfo.setPageSize(classVO.getPageSize());
		
		classVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		classVO.setLastIndex(paginationInfo.getLastRecordIndex());
		classVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<ClassVO> selectList = null;
		classVO.setAdminYn("Y");
		//총 카운트 
		int cnt = classManageDao.selectClassMngListCnt(classVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//리스트
			selectList = classManageDao.selectClassMngList(classVO);
		}
		
		rsltMap.put("paginationInfo", paginationInfo);
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 클래스관리 통계
	 * 2. 처리내용 :  클래스관리 통계
	 * </pre>
	 * @Method Name : selectClassList
	 * @date : 2019. 9. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param classVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectOffClassChart(ClassVO classVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<>();
		//차트
		List<Map<String, String>> charMap = offClassDao.selectOffClassPayChart(classVO);
		Gson gson = new Gson();
		String chartJson = gson.toJson(charMap);
		
		rsltMap.put("chartJson", chartJson);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 멘토페이지 찜한 사용자 리스트
	 * 2. 처리내용 :  멘토페이지 찜한 사용자 리스트
	 * </pre>
	 * @Method Name : selectMentoJjimUserList
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param jjimVO
	 * @return void
	 * @throws Exception
	 */ 
	public Map<String, Object> selectMentoJjimUserList(JjimVO jjimVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<>();
		
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(jjimVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(jjimVO.getPageUnit());
		paginationInfo.setPageSize(jjimVO.getPageSize());
		
		jjimVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		jjimVO.setLastIndex(paginationInfo.getLastRecordIndex());
		jjimVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<JjimVO> selectList = null;
		//총 카운트 
		int cnt = jjimDao.selectMentoJjimUserListCnt(jjimVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//리스트
			selectList = jjimDao.selectMentoJjimUserList(jjimVO);
		}
		
		rsltMap.put("paginationInfo", paginationInfo);
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 멘토페이지 결제한 사용자 리스트
	 * 2. 처리내용 :  멘토페이지 결제한 사용자 리스트
	 * </pre>
	 * @Method Name : selectMentoPayUserList
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param payVO
	 * @return void
	 * @throws Exception
	 */ 
	public Map<String, Object> selectMentoPayUserList(PayVO payVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<>();
		
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(payVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(payVO.getPageUnit());
		paginationInfo.setPageSize(payVO.getPageSize());
		
		payVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		payVO.setLastIndex(paginationInfo.getLastRecordIndex());
		payVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<PayVO> selectList = null;
		//총 카운트 
		int cnt = payDao.selectMentoPayUserListCnt(payVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//리스트
			selectList = payDao.selectMentoPayUserList(payVO);
		}
		
		rsltMap.put("paginationInfo", paginationInfo);
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		
		return rsltMap;
	}
}

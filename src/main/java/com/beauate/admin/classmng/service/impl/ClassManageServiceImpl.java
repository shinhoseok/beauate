package com.beauate.admin.classmng.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.admin.classmng.service.ClassManageDao;
import com.beauate.admin.classmng.service.ClassManageService;
import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.admin.code.service.CodeDao;
import com.beauate.admin.code.service.CodeVO;
import com.beauate.common.GlobalConstants;
import com.beauate.common.StringUtil;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("classManageService")
public class ClassManageServiceImpl implements ClassManageService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="codeDao")
	private CodeDao codeDao;
	
	@Resource(name="classManageDao")
	private ClassManageDao classManageDao;
	
	@Resource(name="classIdGnrService")
	private EgovIdGnrService classIdGnrService;
	
	/**
	 * <pre>
	 * 1. 개요 : 클래스등록등록페이지
	 * 2. 처리내용 : 클래스등록등록페이지 코드 리스트
	 * </pre>
	 * @Method Name : selectClassCodeList
	 * @date : 2019. 9. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param String
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectClassCodeList() throws Exception {
		
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		
		List<CodeVO> classStList = codeDao.selectScodeList(GlobalConstants.CLASS_STATUS_CODE);
		List<CodeVO> classGbList = codeDao.selectScodeList(GlobalConstants.CLASS_GUBUN_CODE);
		List<CodeVO> classCategoryList = codeDao.selectScodeList(GlobalConstants.CLASS_CATEGORY_CODE);
		List<CodeVO> classAreaList = codeDao.selectScodeList(GlobalConstants.AREA_CODE);
		
		rsltMap.put("classStList", classStList);
		rsltMap.put("classGbList", classGbList);
		rsltMap.put("classCategoryList", classCategoryList);
		rsltMap.put("classAreaList", classAreaList);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인 클래스 등록
	 * 2. 처리내용 :  오프라인 클래스 등록
	 * </pre>
	 * @Method Name : insertOffClassProc
	 * @date : 2019. 9. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @return void
	 * @throws Exception
	 */ 
	public void insertOffClassProc(ClassVO classVO) throws Exception {
		classVO.setClassId(classIdGnrService.getNextStringId());
		log.debug(">>> classVO in insertOffClassProc impl : " + classVO);
		if(StringUtil.isEmpty(classVO.getClassApplyNo())) {
			classVO.setClassApplyNo("0");
		}
		classManageDao.insertOffClassProc(classVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인 클래스 리스트
	 * 2. 처리내용 :  오프라인 클래스 클래스 리스트
	 * </pre>
	 * @Method Name : selectClassList
	 * @date : 2019. 9. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	@Override
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
	 * 1. 개요 : 오프라인 클래스 상세
	 * 2. 처리내용 :  오프라인 클래스 상세
	 * </pre>
	 * @Method Name : selectClassMngDetail
	 * @date : 2019. 9. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @return ClassVO
	 * @throws Exception
	 */ 
	public ClassVO selectClassMngDetail(ClassVO classVO) throws Exception {
		return classManageDao.selectClassMngDetail(classVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인 클래스 수정
	 * 2. 처리내용 :  오프라인 클래스 수정
	 * </pre>
	 * @Method Name : updateClassMngProc
	 * @date : 2019. 9. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @return int
	 * @throws Exception
	 */ 
	public int updateClassMngProc(ClassVO classVO) throws Exception {
		return classManageDao.updateClassMngProc(classVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인 클래스 삭제
	 * 2. 처리내용 :  오프라인 클래스 삭제
	 * </pre>
	 * @Method Name : deleteClassMngProc
	 * @date : 2019. 9. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @return int
	 * @throws Exception
	 */ 
	public int deleteClassMngProc(ClassVO classVO) throws Exception {
		return classManageDao.deleteClassMngProc(classVO);
	}
}
package com.beauate.admin.classmng.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.admin.classmng.service.ClassDao;
import com.beauate.admin.classmng.service.ClassManageService;
import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.admin.code.service.CodeDao;
import com.beauate.admin.code.service.CodeVO;
import com.beauate.common.GlobalConstants;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("classManageService")
public class ClassManageServiceImpl implements ClassManageService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="codeDao")
	private CodeDao codeDao;
	
	@Resource(name="classDao")
	private ClassDao classDao;
	
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
		classDao.insertOffClassProc(classVO);
	}
}
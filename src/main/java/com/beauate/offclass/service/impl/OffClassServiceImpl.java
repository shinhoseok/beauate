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
import com.beauate.common.DateUtil;
import com.beauate.common.GlobalConstants;
import com.beauate.common.StringUtil;
import com.beauate.jjim.service.JjimDao;
import com.beauate.jjim.service.JjimVO;
import com.beauate.offclass.service.OffClassDao;
import com.beauate.offclass.service.OffClassService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("offClassService")
public class OffClassServiceImpl implements OffClassService {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="OffClassDao")
	private OffClassDao offClassDao;
	
	@Resource(name="classManageDao")
	private ClassManageDao classManageDao;
	
	@Resource(name="codeDao")
	private CodeDao codeDao;
	
	@Resource(name="jjimDao")
	private JjimDao jjimDao;
	
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
		log.debug(">>>>>>>>>>>>>>>>>>> selectOffClassList ClassCtSt >>>>>>>>>>>>>>>>>>>>>>>> "+classVO.getClassSt());
		//*********************헤어리스트 8장
//		classVO.setClassCtSt("1");
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
				String resultSrc = tempSrc.substring(tempSrc.indexOf("\\")+1);
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
		log.debug(">>>>>>>>>>>>>>>>>>> selectOffClassList ClassCtSt >>>>>>>>>>>>>>>>>>>>>>>> "+classVO.getClassSt());
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
		log.debug(">> origin Path >> "+resultVO.getImgSrc2());
		//이미지 WAS경로 변환
		String tempSrc = resultVO.getImgSrc();
		String tempSrc2 = resultVO.getImgSrc2();
		String tempSrc3 = resultVO.getImgSrc3();
		if(!StringUtil.isEmpty(tempSrc) && !StringUtil.isEmpty(tempSrc2)) {
			String resultSrc = tempSrc.substring(tempSrc.indexOf("\\")+1);
			String resultSrc2 = tempSrc2.substring(tempSrc2.indexOf("\\")+1);
			String resultSrc3 = tempSrc3.substring(tempSrc3.indexOf("\\")+1);
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
}

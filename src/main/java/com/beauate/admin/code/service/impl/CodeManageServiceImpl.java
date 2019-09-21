package com.beauate.admin.code.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.beauate.admin.code.service.CodeDao;
import com.beauate.admin.code.service.CodeManageService;
import com.beauate.admin.code.service.CodeVO;
import com.beauate.common.StringUtil;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("codeManageService")
public class CodeManageServiceImpl extends EgovAbstractServiceImpl implements CodeManageService {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="codeDao")
	private CodeDao codeDao;
	
	/** 대분류 IdGnr */
	@Resource(name = "codeIdGnrService")
	private EgovIdGnrService codeIdGnrService;
	
	/** 소분류 IdGnr */
	@Resource(name = "codeIdGnrServiceM")
	private EgovIdGnrService codeIdGnrServiceM;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 리스트 조회
	 * 2. 처리내용 : 공통코드 대분류 리스트 조회
	 * </pre>
	 * @Method Name : selectCodeManageList
	 * @date : 2019. 5. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 16.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see com.beauate.admin.code.service.CodeManageService#selectCodeManageList(com.beauate.admin.code.service.CodeVO, org.springframework.ui.ModelMap)
	 * @param codeVO
	 * @param model
	 * @throws Exception
	 */ 	
	public void selectCodeManageList(CodeVO codeVO, ModelMap model) throws Exception{
		
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(codeVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(codeVO.getPageUnit());
		paginationInfo.setPageSize(codeVO.getPageSize());
		
		codeVO.setFirstIndex(paginationInfo.getFirstRecordIndex()); 
		codeVO.setLastIndex(paginationInfo.getLastRecordIndex());
		codeVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<CodeVO> selectList = null;
		
		//총 카운트 
		int cnt = codeDao.selectCodeManageListCnt(codeVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//리스트
			selectList = codeDao.selectCodeManageList(codeVO);
		}
		
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("codeList", selectList);
		model.addAttribute("codeListCnt", cnt);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 상세, 소분류 리스트
	 * 2. 처리내용 : 소분류 조회
	 * </pre>
	 * @Method Name : selectMcodeList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see com.beauate.admin.code.service.CodeManageService#selectMcodeList(com.beauate.admin.code.service.CodeVO)
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	public List<CodeVO> selectMcodeList(CodeVO codeVO, ModelMap model) throws Exception {
		
		int codeCnt = codeDao.selectMcodeListCnt(codeVO);
		
		List<CodeVO> codeList = null;
		if(codeCnt > 0 ){
			codeList = codeDao.selectMcodeList(codeVO);
			model.addAttribute("codeCnt", codeCnt);
		}
		return codeList;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 상세, 소분류 리스트
	 * 2. 처리내용 : 대분류 조회
	 * </pre>
	 * @Method Name : selectLCodeView
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see com.beauate.admin.code.service.CodeManageService#selectLCodeView(com.beauate.admin.code.service.CodeVO)
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	public CodeVO selectLCodeView(CodeVO codeVO) throws Exception {
		return codeDao.selectLCodeView(codeVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 상세 수정, 소분류 입력&수정&삭제
	 * 2. 처리내용 : 공통코드 대분류 상세 수정, 소분류 입력&수정&삭제
	 * </pre>
	 * @Method Name : updateMList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see com.beauate.admin.code.service.CodeManageService#updateMList(com.beauate.admin.code.service.CodeVO)
	 * @param codeVO
	 * @throws Exception
	 */ 	
	public void updateMList(CodeVO codeVO) throws Exception {

		//대분류 상세 수정
		codeDao.updateLCode(codeVO);
		
		for (CodeVO tempVO : codeVO.getCodeList()) {
			//구멍난리스트는 다음걸로
			if("".equals(StringUtil.nvl(tempVO.getMclsNm()))){
				continue;
			}
			
			if("N".equals(tempVO.getMclsGubun())){
				tempVO.setMclsId(codeIdGnrServiceM.getNextStringId());
				tempVO.setLclsId(codeVO.getLclsId());
				tempVO.setRgId(codeVO.getRgId());

				//getMclsGubun()의 값이 N면 소분류 입력
				codeDao.insertMCodeManager(tempVO);
			} else {
				if(tempVO.getMclsId() != "" && tempVO.getMclsId() != null){
					if("Y".equals(tempVO.getMclsGubun())){
						//getMclsGubun()의 값이 Y면 소분류 수정
						tempVO.setModId(codeVO.getModId());
						codeDao.updateMCodeManager(tempVO);
					} else if("D".equals(tempVO.getMclsGubun())) {
						//getMclsGubun()의 값이 D면 소분류 삭제
						codeDao.deleteMCodeManager(tempVO);
					}
				}
			}
		}
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 입력화면 저장
	 * 2. 처리내용 : 공통코드 대분류 입력화면 저장
	 * </pre>
	 * @Method Name : insertCodeManageList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see com.beauate.admin.code.service.CodeManageService#insertCodeManageList(com.beauate.admin.code.service.CodeVO)
	 * @param codeVO
	 * @throws Exception
	 */ 	
	public void insertCodeManageList(CodeVO codeVO) throws Exception {
		codeVO.setLclsId(codeIdGnrService.getNextStringId());
		codeDao.insertCodeManageList(codeVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 소분류 조회
	 * 2. 처리내용 : 공통코드 소분류 조회
	 * </pre>
	 * @Method Name : selectLastcodeView
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	public CodeVO selectLastcodeView(CodeVO codeVO) throws Exception {
		return codeDao.selectLastcodeView(codeVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 소분류 상세화면 수정
	 * 2. 처리내용 : 공통코드 소분류 상세화면 수정
	 * </pre>
	 * @Method Name : updateSCode
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see com.beauate.admin.code.service.CodeManageService#updateSCode(com.beauate.admin.code.service.CodeVO)
	 * @param codeVO
	 * @throws Exception
	 */ 	
	public void updateSCode(CodeVO codeVO) throws Exception {
		codeDao.updateSCode(codeVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 중복체크
	 * 2. 처리내용 : 공통코드 대분류 중복체크
	 * </pre>
	 * @Method Name : lclsCdChk
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see com.beauate.admin.code.service.CodeManageService#lclsCdChk(com.beauate.admin.code.service.CodeVO)
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	public int lclsCdChk(CodeVO codeVO) throws Exception {
		return  codeDao.lclsCdChk(codeVO);
	}

	/**
	 * <pre>
	 * 1. 개요 : 공통코드 소분류 중복체크
	 * 2. 처리내용 : 공통코드 소분류 중복체크
	 * </pre>
	 * @Method Name : mclsCdChk
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see com.beauate.admin.code.service.CodeManageService#mclsCdChk(com.beauate.admin.code.service.CodeVO)
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	public int mclsCdChk(CodeVO codeVO) throws Exception {
		List<CodeVO> mclsCdList = codeVO.getCodeList();
		int result = 0;
		if(mclsCdList.size() > 1) {
			for(int i=0; i < mclsCdList.size(); i++) {
				if(mclsCdList.get(i).getCodeIdsChk().equals("N")) {
					codeVO.setMclsCd("XXX");
				}
				result += codeDao.mclsCdChk(codeVO);
			}
		}
		return result;
	}
}

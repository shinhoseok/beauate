package com.beauate.admin.code.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.beauate.admin.code.service.CodeManageService;
import com.beauate.admin.code.service.CodeVO;
import com.beauate.login.service.LoginVO;

@Controller
public class CodeManageController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "codeManageService")
	private CodeManageService codeManageService;
	
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
	 * @param codeVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/code/r/m/selectCodeManageList.do")
	public String selectCodeManageList(@ModelAttribute("codeVO") CodeVO codeVO, ModelMap model) throws Exception {

		codeManageService.selectCodeManageList(codeVO, model);
		return "/admin/code/codeManageList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 상세, 소분류 리스트 
	 * 2. 처리내용 : 공통코드 대분류 상세, 소분류 리스트 
	 * </pre>
	 * @Method Name : selectLCodeList
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
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/code/r/m/selectLCodeList.do")
	public String selectLCodeList(@ModelAttribute("codeVO") CodeVO codeVO, HttpServletRequest request, 
			ModelMap model) throws Exception{
		
		//소분류 리스트
		List<CodeVO> codeList = codeManageService.selectMcodeList(codeVO, model);
		
		//대분류 상세
		codeVO = codeManageService.selectLCodeView(codeVO);

		codeVO.setCodeList(codeList);
		model.addAttribute("rsltMap", codeVO);

		return "/admin/code/codeManageMList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 수정페이지로 이동 
	 * 2. 처리내용 : 공통코드 대분류 수정페이지로 이동
	 * </pre>
	 * @Method Name : updateLCodeListPage
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
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value="/code/z/m/updateLCodeListPage.do")
	public String updateLCodeListPage(@ModelAttribute("codeVO") CodeVO codeVO, HttpServletRequest request,
			ModelMap model) throws Exception {
		
		//소분류 리스트
		List<CodeVO> codeList = codeManageService.selectMcodeList(codeVO, model);

		//대분류 상세
		codeVO = codeManageService.selectLCodeView(codeVO);

		codeVO.setCodeList(codeList);
		model.addAttribute("rsltMap", codeVO);

		return "/admin/code/codeManageMUpdate";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 상세 수정, 소분류 입력&수정&삭제 
	 * 2. 처리내용 : 공통코드 대분류 상세 수정, 소분류 입력&수정&삭제 
	 * </pre>
	 * @Method Name : updateLCodeList
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
	 * @param status
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value="/code/z/n/updateLCodeList.do")
	public String updateLCodeList(@ModelAttribute("codeVO") CodeVO codeVO,  SessionStatus status,
			LoginVO sessionVO, ModelMap model) throws Exception {

		// 아이디 세팅 신호석 로그인 후
		codeVO.setUsrId(sessionVO.getUsrId());
		codeVO.setRgId(sessionVO.getUsrId());
		codeVO.setModId(sessionVO.getUsrId());

		codeManageService.updateMList(codeVO);
		status.setComplete();
		model.addAttribute("rsltMap", codeVO);

		return "redirect:/code/r/m/selectLCodeList.do?lclsId="+codeVO.getLclsId();
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 입력페이지로 이동
	 * 2. 처리내용 : 공통코드 대분류 입력페이지로 이동
	 * </pre>
	 * @Method Name : insertCodePage
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param request
	 * @param codeVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/code/z/m/insertCodePage.do")
	public String insertCodePage(HttpServletRequest request, @ModelAttribute("codeVO") CodeVO codeVO,
			ModelMap model) throws Exception{

		model.addAttribute("codeVO", new CodeVO());

		return "/admin/code/insertCodeManage";
	}

	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 입력화면 저장 
	 * 2. 처리내용 : 공통코드 대분류 입력화면 저장 
	 * </pre>
	 * @Method Name : insertCode
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
	 * @param sessionVO
	 * @param status
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/code/z/n/insertCode.do")
	public String insertCode(@ModelAttribute("codeVO") CodeVO codeVO, LoginVO sessionVO,
			SessionStatus status, ModelMap model) throws Exception{
		
		codeVO.setRgId(sessionVO.getUsrId());
		codeManageService.insertCodeManageList(codeVO);
		status.setComplete();

		return "redirect:/code/r/m/selectCodeManageList.do";
	}
 
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 소분류 조회 
	 * 2. 처리내용 : 공통코드 소분류 조회 
	 * </pre>
	 * @Method Name : selectSCodeList
	 * @date : 2019. 5. 18.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 18.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/code/r/m/selectSCodeList.do")
	public String selectSCodeList(@ModelAttribute("codeVO") CodeVO codeVO, ModelMap model) throws Exception{

		codeVO = codeManageService.selectLastcodeView(codeVO);
		model.addAttribute("rsltMap", codeVO);
		
		return "/admin/code/codeManageSView";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 소분류 수정페이지로 이동
	 * 2. 처리내용 : 공통코드 소분류 수정페이지로 이동
	 * </pre>
	 * @Method Name : codeSUpdatePage
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
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/code/z/m/codeManageSUpdate.do")
	public String codeSUpdatePage(@ModelAttribute("codeVO") CodeVO codeVO, ModelMap model) throws Exception{

		codeVO = codeManageService.selectLastcodeView(codeVO);
		model.addAttribute("rsltMap", codeVO);

		return "/admin/code/codeManageUpdate";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 소분류 상세화면 수정
	 * 2. 처리내용 : 공통코드 소분류 상세화면 수정
	 * </pre>
	 * @Method Name : updateSCodeList
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
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/code/z/m/updateSCodeList.do")
	public String updateSCodeList(@ModelAttribute("codeVO") CodeVO codeVO, SessionStatus status,
			LoginVO sessionVO, ModelMap model) throws Exception{

		codeVO.setModId(sessionVO.getUsrId());
		codeManageService.updateSCode(codeVO);
		status.setComplete();
		
		return "redirect:/code/r/m/selectSCodeList.do?mclsId="+codeVO.getMclsId()+"&lclsId="+codeVO.getLclsId();
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
	 * @param codeVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value="/code/z/n/lclsCdChk.do")
	public String lclsCdChk(@ModelAttribute("codeVO") CodeVO codeVO, ModelMap model) throws Exception {

		int cnt = codeManageService.lclsCdChk(codeVO);

		if(cnt > 0){
			model.addAttribute("chkResult", "N");
		}else{
			model.addAttribute("chkResult", "Y");
		}

		return "jsonView";
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
	 * @param codeVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value="/code/z/n/mclsCdChk.do")
	public String mclsCdChk(@ModelAttribute("codeVO") CodeVO codeVO, ModelMap model) throws Exception {
		
		int cnt = codeManageService.mclsCdChk(codeVO);
		
		if(cnt > 1){
			model.addAttribute("chkResult", "N");
		}else{
			model.addAttribute("chkResult", "Y");
		}
		
		return "jsonView";
	}
}

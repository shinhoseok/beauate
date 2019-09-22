package com.beauate.admin.classmng.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.beauate.admin.classmng.service.ClassManageService;
import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.admin.user.service.UserDao;
import com.beauate.admin.user.service.UserVO;

import egovframework.cmmn.service.EgovFileMngService;
import egovframework.cmmn.service.EgovFileMngUtil;
import egovframework.cmmn.service.FileVO;

@Controller
public class ClassManageController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "classManageService")
	private ClassManageService classManageService;
	
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	// 첨부파일 관련
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;
	
	@Resource(name = "userDao")
	private UserDao userDao;
	
	/**
	 * <pre>
	 * 1. 개요 : 클래스관리 리스트
	 * 2. 처리내용 : 클래스관리 리스트
	 * </pre>
	 * @Method Name : selectClassMngList
	 * @date : 2019. 9. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/classmng/r/m/selectClassMngList.do")
	public String selectClassMngList(@ModelAttribute("userVO") UserVO userVO, ModelMap model) throws Exception {
		return "/admin/class/classList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 클래스등록등록페이지
	 * 2. 처리내용 : 클래스등록페이지 이동
	 * </pre>
	 * @Method Name : insertclassMng
	 * @date : 2019. 9. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/classmng/w/m/insertOffClass.do")
	public String insertclassMng(@ModelAttribute("classVO") ClassVO classVO ,ModelMap model) throws Exception {
		
		Map<String, Object> rslt = classManageService.selectClassCodeList();
		model.addAttribute("rslt", rslt);
		
		return "/admin/class/classInsert";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 클래스 등록시 이메일 체크 및 아이디 불러오기
	 * 2. 처리내용 : 클래스 등록시 이메일 체크 및 아이디 불러오기
	 * </pre>
	 * @Method Name : insertclassMng
	 * @date : 2019. 9. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/classmng/r/n/selectUserIdChk.do")
	public String selectUserIdChk(@ModelAttribute("classVO") ClassVO classVO ,ModelMap model) throws Exception {
		
		//이메일로 받은 아이디를 실제 아이디값으로 셋팅
		log.debug(">>> classVO before usrId : " + classVO.getUsrId());
		UserVO userVO = userDao.selectUserDetail(classVO.getUsrId());
		if(userVO != null) {
			classVO.setUsrId(userVO.getUsrId());
		}
		
		log.debug(">>> classVO after usrId : " + classVO.getUsrId());
		
		model.addAttribute("result", classVO.getUsrId());
		
		return "jsonView";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 클래스등록등록 처리
	 * 2. 처리내용 : 클래스등록등록 처리
	 * </pre>
	 * @Method Name : insertOffClassProc
	 * @date : 2019. 9. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/classmng/w/m/insertOffClassProc.do")
	public String insertOffClassProc (MultipartHttpServletRequest multiRequest, @ModelAttribute("classVO") ClassVO classVO, SessionStatus status) throws Exception {
		
		log.debug(">>> classVO in insertOffClassProcfinal : " + classVO);
		
		// 첨부파일 관련 첨부파일ID 생성
		List<FileVO> _result = null;
		String _atchFileId = "";

		final Map<String, MultipartFile> files = multiRequest.getFileMap();

		if (!files.isEmpty()) {
			_result = fileUtil.parseFileInf(files, "CLASS_", 0, "", "");
			_atchFileId = fileMngService.insertFileInfs(_result); //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
		}

		// 리턴받은 첨부파일ID를 셋팅한다..
		classVO.setAtchFileId(_atchFileId); // 첨부파일 ID
		
		classManageService.insertOffClassProc(classVO);
		status.setComplete();	//중복 submit 방지
		
		log.debug(">>> After insertProgramProc, programVO : " + classVO);	
		
		return "redirect:/classmng/r/m/selectClassMngList.do";
	}
}

package com.beauate.jjim.service;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class JjimController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "jjimService")
	private JjimService jjimService;
	
	/**
	 * <pre>
	 * 1. 개요 : 찜이 있는지 확인 후 등록 및 삭제처리
	 * 2. 처리내용 : 찜이 있는지 확인 후 등록 및 삭제처리
	 * </pre>
	 * @Method Name : selectJjimProc
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param jjimVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/jjim/w/n/selectJjimProc.do")
	public String selectJjimProc(@ModelAttribute("jjimVO") JjimVO jjimVO, SessionStatus status, ModelMap model) throws Exception {
		
		String resultYn = jjimService.selectJjimProc(jjimVO);
		status.setComplete();	//중복 submit 방지
		model.addAttribute("resultYn", resultYn);
		
		return "jsonView";
	}
}

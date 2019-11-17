package com.beauate.mento.offclass.web;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beauate.admin.classmng.service.ClassManageService;
import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.login.service.LoginVO;

@Controller
public class OffClassMentoController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "classManageService")
	private ClassManageService classManageService;
	
	/**
	 * <pre>
	 * 1. 개요 : 클래스관리 리스트
	 * 2. 처리내용 : 클래스관리 리스트
	 * </pre>
	 * @Method Name : selectClassMngList
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param classVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/offclassm/r/m/selectOffClassList.do")
	public String selectClassMngList(@ModelAttribute("classVO") ClassVO classVO, ModelMap model, LoginVO sessionVO) throws Exception {
		classVO.setUsrId(sessionVO.getUsrId());
		classVO.setMentoGb("Y");
		Map<String, Object> rslt = classManageService.selectClassList(classVO);
		model.addAttribute("rslt", rslt);
		
		return "/mento/offclass/offClassList";
	}
}

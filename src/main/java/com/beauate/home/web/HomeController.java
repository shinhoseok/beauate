package com.beauate.home.web;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.home.service.HomeService;

@Controller
public class HomeController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "homeService")
	private HomeService homeService;
	
	/**
	 * <pre>
	 * 1. 개요 : 메인화면
	 * 2. 처리내용 : 메인화면
	 * </pre>
	 * @Method Name : main
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/home/a/n/main.do")
	public String main(@ModelAttribute("classVO") ClassVO classVO, ModelMap model ) throws Exception{
		
		Map<String, Object> rsltMap = homeService.selectMainList(classVO);
		model.addAttribute("rslt", rsltMap);
		
		return "/home/main";
	}
}

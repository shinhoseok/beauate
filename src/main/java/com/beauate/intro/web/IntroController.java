package com.beauate.intro.web;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	/**
	 * <pre>
	 * 1. 개요 : 뷰아떼 소개
	 * 2. 처리내용 : 뷰아떼 소개
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
	 * @param 
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/intro/a/n/intro.do")
	public String intro() throws Exception{
		return "/intro/intro";
	}
}

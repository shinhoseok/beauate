package com.beauate.mento.apply.web;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MentoApplyController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	/**
	 * <pre>
	 * 1. 개요 : 멘토지원
	 * 2. 처리내용 : 멘토지원
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
	@RequestMapping(value="/mento/a/n/mentoApply.do")
	public String mentoApply() throws Exception{
		return "/mentoApply/mentoApply";
	}
}

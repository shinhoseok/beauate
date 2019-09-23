package com.beauate.home.web;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beauate.login.service.LoginVO;

/**
 * * 프로그램 정보 *
 * 1. Package	: com.beauate.home.web
 * 2. FileName	: HomeController.java
 * 3. 작성자		: 신호석
 * 4. 작성일		: 2019. 9. 20. 오후 1:48:35
 * 5. 설명		: 홈 controller
 * 6. 수정이력
 * @
 * @  수정일					  수정자			  수정내용
 * @ -------------   ---------   -------------------------------
 * @  2019. 9. 20.	 신호석			  최초생성
 */
@Controller
public class HomeController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	/** 
	 * 설명 :  홈 메인 페이지 화면
	 * @param homeVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 * @return String
	*/
	@RequestMapping(value="/home/a/n/main.do")
	public String main(LoginVO sessionVO, ModelMap model ) throws Exception{
		return "/home/main";
	}
}

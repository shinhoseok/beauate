package com.beauate.common.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beauate.admin.menu.service.MenuVO;
import com.beauate.common.service.CommonService;
import com.beauate.login.service.LoginVO;

@Controller
public class CommonController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	/** CommonService */
	@Resource(name="commonService")
	private CommonService commonService;
	
	/**
	 * <pre>
	 * 1. 개요 : 권한 없을때 홈으로 redirect 메서드
	 * 2. 처리내용 : 권한 없을때 홈으로 redirect 메서드 쿼리 추후에 변경 필요.
	 * </pre>
	 * @Method Name : roleBridge
	 * @date : 2019. 6. 3.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 3.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/common/a/n/roleBridge.do")
	public String roleBridge(HttpServletRequest request, ModelMap model)
			throws Exception {

		// * 팝업과 일반을 어떻게 구분?
		String messageGubun =request.getParameter("messageGubun");
		String message = null;
		
		
		if("A".equals(messageGubun)){
			message = "관리자 메뉴에 대한 권한이 없습니다";
		}else if("B".equals(messageGubun)){
			message = "현재 이동할수 없는 메뉴입니다 ";
		}else{
			message = "현재 메뉴에 대한 권한이 없습니다";
		}
		
		log.debug("NO RULE MENU MOVE");
		log.debug("request:" + request.getRequestURI());

		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", "/home/a/t/main.do");

		return "/common/temp_action_message";
	}
	
	/** 
	 * 설명 :  포탈관리를 클릭시 자신의 관리자 메뉴중 정렬을했을때 pgm_url 있는 첫번재 메뉴
	 * @param menuVO
	 * @param request
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 * @return String
	*/
	@RequestMapping(value = "/common/a/n/portalAdminBridge.do")
	public String portalAdminBridge(@ModelAttribute("menuVO") MenuVO menuVO,
			HttpServletRequest request, LoginVO sessionVO, ModelMap model) throws Exception {
		
		menuVO.setUsrId(sessionVO.getUsrId());
		
		String url = commonService.selectPortalAdminMenu(menuVO);

		if(url == null){
			//페이지가 없다면 에러가 날수 있다 홈으로 팅겨
			url = "/common/a/n/roleBridge.do?messageGubun=A";
		}

		return "redirect:"+url;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 정상적인 레프트메뉴와 컨텐츠를 redirect 하기위한 브릿지 메서드 
	 * 2. 처리내용 : TOP 메뉴 클릭시 정상적인 레프트메뉴와 컨텐츠를 redirect 하기위한 브릿지 메서드 (MENU_ID로 찾음) 
	 * </pre>
	 * @Method Name : topMenuBridge
	 * @date : 2019. 6. 3.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 3.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param menuVO
	 * @param request
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/common/a/n/topMenuBridge.do")
	public String topMenuBridge(@ModelAttribute("menuVO") MenuVO menuVO,
			HttpServletRequest request, LoginVO sessionVO, ModelMap model) throws Exception {

		//TOP 메뉴 클릭시 정상적인 레프트메뉴와 컨텐츠를 redirect 하기위한 브릿지 메서드
		log.debug("topMenuBridge");

		menuVO.setUsrId(sessionVO.getUsrId());
		// 현재 넘어온 탑 메뉴 아이디로
		// 이분의 3레벨이 있다면 가장 상위, 없다면 2레벨 상위 (권한내에서) 로 redirect 할 PGM_URL 구해오는 서비스
		String url = commonService.selectTopMenuBridge(menuVO);

		if(url == null){
			//페이지가 없다면 에러가 날수 있다 홈으로 팅겨
			url = "/common/a/n/roleBridge.do?messageGubun=B";
		}

		return "redirect:"+url;
	}
}

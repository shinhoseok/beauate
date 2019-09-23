package com.beauate.common;

import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.beauate.admin.menu.service.MenuService;
import com.beauate.admin.menu.service.MenuVO;
import com.beauate.common.service.CommonService;
import com.beauate.login.service.LoginService;
import com.beauate.login.service.LoginVO;

public class PortalInterceptor extends HandlerInterceptorAdapter {

	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "commonService")
	private CommonService commonService;

	@Resource(name = "menuService")
	private MenuService menuService;
	
	//신호석 추가
	@Resource(name = "loginService")
	private LoginService loginService;

	private String requestURI;

	private Set<String> permittedURL;

	public void setPermittedURL(Set<String> permittedURL) {
		this.permittedURL = permittedURL;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		requestURI = request.getRequestURI(); // 요청 URI
		log.debug("###preHandle-requestURI:" + requestURI);

		// c:import 를 사용할경우의 uri 값
		String importURI = request.getAttribute("javax.servlet.include.request_uri") == null ? "" : (String) (request.getAttribute("javax.servlet.include.request_uri"));
		log.debug("preHandle=====================");
		log.debug("requestURI=====================" + requestURI);
		log.debug("jsp:include or c:import uri =====================" + importURI);

		// egov 용 validator URI 는 통과 , 파일 다운, 업로드 통과
		if (requestURI.indexOf("/cmm/fms/") != -1 || importURI.indexOf("/cmm/fms/") != -1 ) {
			return true;
		}

		boolean isPermittedURL = false;
		LoginVO loginVO = null;
		loginVO = (LoginVO) request.getSession().getAttribute(GlobalConstants.LOGIN_SESSION_KEY);

		String[] replaceURI = null;
		replaceURI = requestURI.split("/"); // "" 0번째, enki_admin 1번째, program 2번째, r 3번째, m 4번째, selectPrgoram.do 5번째

		if (loginVO != null) {
			log.debug("loginVO:" + loginVO);
			// 권한 체크
			// 0. a 면 권한 체크 없이 통과
			// 1. 현재 URI 상의 프로그램 변수와 사용자의 권한을 비교하여 접근 권한이 맞는 가 확인 해서 redirect(홈으로 시킴)
			// 2. 현재 URI 에서의 사용자 권한 구분값 구해서 세션에 담기 menuRlDiv(r,w,z)

			Boolean roleChk = false;

			// TODO BASIC context root가 없으면 2번째 , 있으면 3번째로 변경해줘야함
			// URI 권한이 상관없는 코드 a 면 그냥 통과
			if ("a".equals(replaceURI[3])) {
				roleChk = true;
			} else {
				String menuRlDiv = null;
				MenuVO menuSetVO = new MenuVO();
				// TODO BASIC context root가 없으면 1번째 , 있으면 2번째로 변경해줘야함
				menuSetVO.setPgmParam(replaceURI[2]);
				menuSetVO.setUsrId(loginVO.getUsrId());

				// 권한구분값과 사용자 아이디 , 사용자 포탈권한 정보 , 메뉴아이디 로 권한 조건 서비스 로직 구현
				menuRlDiv = commonService.selectMenuRole(menuSetVO);
				log.debug("menuRlDiv:" + menuRlDiv);

				loginVO.setMenuRlDiv(menuRlDiv);

				if ("".equals(StringUtil.nvl(menuRlDiv))) {// 권한값이 없다
					roleChk = false;
				} else {
					if (menuRlDiv.charAt(0) >= replaceURI[3].charAt(0)) {// 현재 사용자가 보유하고 있는 권한그룹의 권한이 현재 URI 의 권한보다 크거나 같다
						roleChk = true;
					} else {// 안크다
						roleChk = false;
					}
				}
			}

			log.debug("roleChk >>>>>>>>>>>>>>>>>>>>> " + roleChk);

			if (!roleChk) {
				// 1 틀리면 권한이 없다는 메세지를 뿌리면 화면으로 가고
				// 2 redirect 로 메인홈 URI 로 팅겨~~~
				// * 팝업과 일반을 현재 구분하지 못한다
				ModelAndView modelAndView = new ModelAndView("redirect:/common/a/n/roleBridge.do");
				throw new ModelAndViewDefiningException(modelAndView);
			}
			return true;
		} else {
			log.debug("loginVO is NULL ");
			for (Iterator<String> it = this.permittedURL.iterator(); it.hasNext();) {
				String urlPattern = request.getContextPath() + (String) it.next();

				log.debug("urlPattern:" + urlPattern);

				if (Pattern.matches(urlPattern, requestURI)) {// 정규표현식을 이용해서 요청 URI가 허용된 URL에 맞는지 점검함.

					/*게스트유저 메뉴 표시 추가 시작*/
					log.debug("게스트유저 메뉴 표시 추가 시작 >>>>>>>>>>>>>>>>>>>>> ");
					log.debug("로그인 정보가 없어도 보여줄 수 있는 페이지라면, 비로그인 유저를 위한 메뉴권한을 가져 와야 한다. >>>>>>>>>>>>>>>>>>>>> ");
					/*허용된 url이기 때문에 권한체크하여 roleBridge.do로 보낼 필요는 없다.*/
					log.debug("urlPattern:" + urlPattern);


					String menuRlDiv = null;
					MenuVO menuSetVO = new MenuVO();
					// TODO BASIC context root가 없으면 1번째 , 있으면 2번째로 변경해줘야함
					menuSetVO.setPgmParam(replaceURI[2]);
					menuSetVO.setUsrId(GlobalConstants.NON_MEMBER);

					// 권한구분값과 사용자 아이디 , 사용자 포탈권한 정보 , 메뉴아이디 로 권한 조건 서비스 로직 구현
					menuRlDiv = commonService.selectMenuRole(menuSetVO);
					log.debug("menuRlDiv:" + menuRlDiv);
					loginVO = new LoginVO();
					loginVO.setMenuRlDiv(menuRlDiv);
					request.getSession().setAttribute(GlobalConstants.LOGIN_SESSION_KEY, loginVO);
					/*게스트유저 메뉴 표시 추가 종료*/
					
					isPermittedURL = true;
				}
			}
			if (!isPermittedURL) {
				ModelAndView modelAndView = new ModelAndView("redirect:/home/a/n/main.do");
				throw new ModelAndViewDefiningException(modelAndView);
			}
			return true;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

		log.debug("###postHandle-requestURI:" + requestURI);
		log.debug("###postHandle-modelAndView:" + modelAndView);

		String requestURI = request.getRequestURI(); // 요청 URI
		// c:import 를 사용할경우의 uri 값
		String importURI = request.getAttribute("javax.servlet.include.request_uri") == null ? "" : (String) (request.getAttribute("javax.servlet.include.request_uri"));
		log.debug("postHandle=====================:" + modelAndView);

		if (null == modelAndView) {
			return;
		}

		// egov 용 validator URI 는 통과 , 파일 다운, 업로드 통과
		if (requestURI.indexOf("/cmm/fms/") == -1 && importURI.indexOf("/cmm/fms/") == -1) {

			// 1 현재 선택한 메뉴 구분 - menuId1Lvl, menuId1Lv2, menuId1Lv3
			// 2 사용자의 권한에 맞는 탑과 레프트 메뉴 리스트 처리
			// 3 티커메세지 리스트
			// 4 탑메뉴의 class 구분을 위해서 menuGubun 값 세팅

			String[] replaceURI = null;
			replaceURI = requestURI.split("/");// "" 0번째, dPortal 1번째, program 2번째, r 3번째, m 4번째, selectPrgoram.do 5번째

			// TODO BASIC context root가 없으면 3번째 , 있으면 4번째로 변경해줘야함
			// 메뉴 탑 t, 레프트 m ,n 은 없음
			if (!"n".equals(replaceURI[4])) {// n 이 아니라면 t or m , 그러므로 top 은 무조건 구해야함

				LoginVO loginVO = (LoginVO) request.getSession().getAttribute(GlobalConstants.LOGIN_SESSION_KEY);

				MenuVO menuSetVO = new MenuVO();
				List<MenuVO> setSubTitleList = null;
				List<MenuVO> setTopMenuList = null;
				List<MenuVO> setLeftMenuList = null;
				log.debug("shin >>>>>>>>>>>>>>>>"+replaceURI[1]);
				//메인메뉴, 로그인 처리과정 URI에서 로그인 상태정보가 없어 비회원 임시로그인처리
				if(replaceURI[1].equals(GlobalConstants.FREE_URI_MAIN)) {
					menuSetVO.setUsrId(GlobalConstants.NON_MEMBER);
				} else {
					menuSetVO.setUsrId(loginVO.getUsrId());
				}
				// TODO BASIC context root가 없으면 1번째 , 있으면 2번째로 변경해줘야함
				menuSetVO.setPgmParam(replaceURI[2]);

				// 메뉴를 구하기전 프로그램id 와 사용자 정보만으로 menuId1Lvl 값을 알아야함(포함해서
				// menuId1Lv2, menuId1Lv3도 함께)
				menuSetVO = commonService.selectSearchMenuId(menuSetVO);
				log.debug("SearchMenuId AFTER menuVO:" + menuSetVO);

				// 탑 메뉴
				setTopMenuList = commonService.selectTopMenuList(menuSetVO);

				// 탑메뉴 class 이름 메뉴 구분 (관리자admin, 일반olap)
				if (setTopMenuList.size() > 0) {
					if ("2".equals(setTopMenuList.get(0).getMenuDiv())) {// 관리자 탑메뉴 class
						modelAndView.addObject("menuGubun", "admin");
					} else {// 일반 탑메뉴 class
						modelAndView.addObject("menuGubun", "olap");
					}
				}

				// TODO BASIC context root가 없으면 3번째 , 있으면 4번째로 변경해줘야함
				if ("m".equals(replaceURI[4])) {// m 이라면 레프트 까지 구해야함 레프트 메뉴일때만 컨텐츠의 서브타이틀 (예: 홈 > 포탈관리 > 메뉴관리)
					setSubTitleList = commonService.selectSubTitleList(menuSetVO);
					setLeftMenuList = commonService.selectLeftMenuList(menuSetVO);
				}

				// 메뉴를 가져오는 리스트 (권한에 맞게 , 권한맵핑생각)
				modelAndView.addObject("menuSetVO", menuSetVO);
				modelAndView.addObject("setSubTitleList", setSubTitleList);
				modelAndView.addObject("setTopMenuList", setTopMenuList);
				modelAndView.addObject("setLeftMenuList", setLeftMenuList);
			}
		}

		String viewName = modelAndView.getViewName();
		log.debug("viewName:" + viewName);

		if (!StringUtil.isEmpty(viewName)) {
			if (viewName.startsWith("redirect:") || viewName.startsWith(":")) {
				return;
			}
		}
	}

}

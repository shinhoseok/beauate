package com.beauate.admin.role.web;

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

import com.beauate.admin.role.service.RoleService;
import com.beauate.admin.role.service.RoleVO;
import com.beauate.admin.user.service.UserVO;
import com.beauate.login.service.LoginVO;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * * 프로그램 정보
 * 1. Package	:	kr.co.enkiadmin.admin.role.web
 * 2. FileName	:	RoleController.java
 * 3. 작성자		:	신호석
 * 4. 작성일		:	2019. 05. 17
 * 5. 설명		:	권한 관리 (권한 그룹, 권한 별 사용자, 사용자 별 권한, 권한별 사용자 통계)에 관련된
 * 					리스트 , 상세 , 수정 , 삭제 등의 모든 기능의 화면을 보여주는 controller
 * 6. 수정이력
 * @
 * @ 수정일				수정자				수정내용
 * @ -------------		---------			-------------------------------
 * @ 2019. 05. 17		신호석				최초생성
 */
@Controller
public class RoleController {

	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "roleService")
	private RoleService roleService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;


	/**************************************************** 권한그룹 관리(S) */
	
	/**
	 * <pre>
	 * 1. 개요 : 권한 그룹 목록
	 * 2. 처리내용 : 권한 그룹 관리 목록을 가져온다.
	 * </pre>
	 * @Method Name : selectRoleGroupList
	 * @date : 2019. 6. 28.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	------------------------------- ---------------------------------------
	 *	2019. 6. 28.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/role/r/m/selectRoleGroupList.do")
	public String selectRoleGroupList(@ModelAttribute("roleVO") RoleVO roleVO, ModelMap model) throws Exception {

		Map<String, Object> rslt = roleService.selectRoleGroupList(roleVO, model);
		model.addAttribute("rslt", rslt);

		return "/admin/role/roleGroupMng/selectRoleGroupList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 권한 관리 그룹 정보 등록 화면으로 이동
	 * 2. 처리내용 : 관리자가 새로운 권한 관리를 등록 하기 위해 등록 화면으로 이동.
	 * </pre>
	 * @Method Name : insertRole
	 * @date : 2019. 6. 28.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 6. 28.		신호석				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/role/w/m/insertRoleGroup.do")
	public String insertRole(@ModelAttribute("roleVO") RoleVO roleVO) throws Exception {

		return "/admin/role/roleGroupMng/insertRoleGroup";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 입력 된 권한 관리 정보를 등록 처리
	 * 2. 처리내용 : 관리자가 입력한 새로운 권한 관리 정보를 DB에 입력 처리.
	 * </pre>
	 * @Method Name : insertRoleProc
	 * @date : 2019. 6. 28.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 6. 28.		신호석				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @param sessionVO
	 * @param status
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/role/w/n/insertRoleGroupProc.do")
	public String insertRoleProc(@ModelAttribute("roleVO") RoleVO roleVO
			, LoginVO sessionVO, SessionStatus status) throws Exception {
		
		roleVO.setRgId(sessionVO.getUsrId());
		roleService.insertRoleGroup(roleVO);
		
		return "redirect:/role/r/m/selectRoleGroupList.do";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 권한 그룹 상세정보 수정
	 * 2. 처리내용 : 권한 그룹 상세보기 화면에서 수정을 위한 화면으로 이동.
	 * </pre>
	 * @Method Name : updateRoleGroup
	 * @date : 2019. 6. 28.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 6. 28.		신호석				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @param model
	 * @param sessionVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/role/w/m/updateRoleGroup.do")
	public String updateRoleGroup(@ModelAttribute("roleVO") RoleVO roleVO
			, ModelMap model, LoginVO sessionVO) throws Exception {

		
		model.addAttribute("sCondition", roleVO.getSearchCondition());
		model.addAttribute("sKeyword", roleVO.getSearchKeyword());

		roleVO = roleService.selectRoleGroupDetail(roleVO);
		model.addAttribute("roleVO", roleVO);
		
		return "/admin/role/roleGroupMng/updateRoleGroup";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 권한 그룹 정보 수정 처리
	 * 2. 처리내용 : 관리자가 입력한 권한 그룹 관리 사항을 DB에 저장 처리 한다.
	 * </pre>
	 * @Method Name : updateRoleGroupProc
	 * @date : 2019. 6. 28.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 6. 28.		신호석						최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/role/w/n/updateRoleGroupProc.do")
	public String updateRoleGroupProc(@ModelAttribute("roleVO") RoleVO roleVO
			, LoginVO sessionVO, SessionStatus status) throws Exception {
		
		roleVO.setModId(sessionVO.getUsrId());
		roleService.updateRoleGroup(roleVO);
		
		String redirectParam = "searchCondition=" + roleVO.getSearchCondition()
								+ "&searchKeyword=" + roleVO.getSearchKeyword()
								+ "&pageIndex=" + roleVO.getPageIndex()
								+ "&rlId=" + roleVO.getRlId();
		
		return "redirect:/role/r/m/selectRoleGroupDetail.do?" + redirectParam;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 관리자가 요청하는 권한 그룹의 상세정보를 가져온다.
	 * 2. 처리내용 : 해당 권한의 권한 아이디 값으로 상세 정보 select
	 * </pre>
	 * @Method Name : selectRoleDetail
	 * @date : 2019. 6. 27.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용
	 *	----------------------------------------- -----------------------------
	 *	2019. 6. 27.		신호석						최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/role/r/m/selectRoleGroupDetail.do")
	public String selectRoleDetail(@ModelAttribute("roleVO") RoleVO roleVO, ModelMap model) throws Exception {
		
		roleVO = roleService.selectRoleGroupDetail(roleVO);
		model.addAttribute("tempVO", roleVO);
		
		return "/admin/role/roleGroupMng/selectRoleGroupDetail";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 권한 그룹의 상세 정보 화면에서 해당 데이터를 삭제 한다.
	 * 2. 처리내용 : 해당 권한 아이디로 삭제 처리
	 * </pre>
	 * @Method Name : deleteRoleProc
	 * @date : 2019. 6. 27.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용
	 *	----------------------------------------- -----------------------------
	 *	2019. 6. 27.		신호석						최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @param status
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/role/w/n/deleteRoleProc.do")
	public String deleteRoleProc(RoleVO roleVO, SessionStatus status) throws Exception {
		
		roleService.deleteRoleGroup(roleVO);
		status.setComplete(); // 중복 방지
		
		return "redirect:/role/r/m/selectRoleGroupList.do?pageIndex=" + roleVO.getPageIndex();
	}
	/**************************************************** 권한그룹 관리(E) */
	
	
	/**************************************************** 권한별 사용자 관리(S) */

	/**
	 * <pre>
	 * 1. 개요 : 권한별 사용자 관리 목록
	 * 2. 처리내용 : 권한 그룹 정보만 불러 온다. (권한에 따른 사용자 목록은 따로 호출. ajaxUserInfoList)
	 * </pre>
	 * @Method Name : selectRoleUserList
	 * @date : 2019. 6. 30.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 6. 30.		신호석				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/roleuser/z/m/selectRoleUserList.do")
	public String selectRoleUserList(ModelMap model) throws Exception {

		List<RoleVO> roleInfoList = roleService.selectRoleNameOfRoleUser();
		model.addAttribute("roleInfoList", roleInfoList);

		return "/admin/role/roleUserMng/selectRoleUserList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 권한 그룹별 사용자 목록
	 * 2. 처리내용 : 권한 그룹에 따른 사용자 목록을 조회 한다. ajax
	 * </pre>
	 * @Method Name : ajaxUserInfoList
	 * @date : 2019. 6. 30.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 6. 30.		신호석				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/roleuser/r/n/ajaxUserInfoList.do")
	public String ajaxUserInfoList(RoleVO roleVO, ModelMap model) throws Exception {

		List<RoleVO> roleUserList = roleService.selectRoleUserList(roleVO);
		model.addAttribute("roleUserList", roleUserList);
		model.addAttribute("roleGroup", roleVO.getRlCd());

		return "/admin/role/roleUserMng/ajaxUserInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 권한별 사용자 관리 화면 > 권한 추가 화면 이동
	 * 2. 처리내용 : 관리자가 추가 버튼 클릭 시 권한 추가 화면으로 이동 한다.
	 * </pre>
	 * @Method Name : insertRoleUserPopup
	 * @date : 2019. 7. 5.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 7. 5.		신호석				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/roleuser/w/n/insertRoleUserPopup.do")
	public String insertRoleUserPopup(RoleVO roleVO, ModelMap model) throws Exception {

		List<RoleVO> roleUserListForUpdate = roleService.selectUserListForUpdateRole(roleVO);

		model.addAttribute("roleUserListForUpdate", roleUserListForUpdate);
		model.addAttribute("roleCode", roleVO.getRlCd());

		return "/admin/role/roleUserMng/popUpLayer/insertRoleUser";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 권한 추가 popUp 화면의 사용자 검색 결과 목록
	 * 2. 처리내용 : 관리자가 권한 추가 화면에서 찾고자 하는 사용자를 검색 한 후 결과를 ajax로 return
	 * </pre>
	 * @Method Name : selectSearchRoleUserList
	 * @date : 2019. 7. 5.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 7. 5.		신호석				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/roleuser/w/n/selectSearchRoleUserList.do")
	public String selectSearchRoleUserList(RoleVO roleVO, ModelMap model) throws Exception {
		
		List<RoleVO> roleUserListForUpdate = roleService.selectUserListForUpdateRole(roleVO);

		model.addAttribute("roleUserListForUpdate", roleUserListForUpdate);
		
		return "/admin/role/roleUserMng/popUpLayer/searchResult";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자의 권한 변경 처리
	 * 2. 처리내용 : 사용자의 권한을 변경 처리 한다.
	 * </pre>
	 * @Method Name : saveRoleUserProc
	 * @date : 2019. 7. 5.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 7. 5.		신호석				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/roleuser/z/n/saveRoleUserProc.do")
	public String saveRoleUserProc(RoleVO roleVO, SessionStatus status) throws Exception {

		roleService.updateRoleUserMapping(roleVO);
		status.setComplete();

		return "redirect:/roleuser/z/m/selectRoleUserList.do";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 권한별 사용자 관리 > 해당 사용자 권한 삭제(인증 되지 않은 사용자로 전환)
	 * 2. 처리내용 : 권한별 사용자 목록에서 해당하는 사용자의 권한을 삭제 한다.
	 * </pre>
	 * @Method Name : deleteRoleUserPrco
	 * @date : 2019. 7. 6.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 7. 6.		신호석				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @param status
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/roleuser/z/n/deleteRoleUserProc.do")
	public String deleteRoleUserPrco(RoleVO roleVO, SessionStatus status) throws Exception {
		
		roleVO.setRlCd("unauthenticated");

		roleService.updateRoleUserMapping(roleVO);
		status.setComplete();

		return "redirect:/roleuser/z/m/selectRoleUserList.do";
	}
	/**************************************************** 권한별 사용자 관리(E) */
	
	
	/**************************************************** 사용자별 권한 관리(S) */

	/**
	 * <pre>
	 * 1. 개요 : 사용자 별 권한 관리 목록
	 * 2. 처리내용 : 사용자 별 권한을 관리 할 수 있다.
	 * </pre>
	 * @Method Name : selectUserRoleList
	 * @date : 2019. 7. 6.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 7. 6.		신호석				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/userrole/z/m/selectUserRoleList.do")
	public String selectUserRoleList(@ModelAttribute("userVO") UserVO userVO, ModelMap model) throws Exception {
		
		Map<String, Object> rslt = roleService.selectUserRoleList(userVO, model);
		model.addAttribute("rslt", rslt);
		
		return "/admin/role/userRoleMng/selectUserRoleList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 별 권한 확인 팝업 목록
	 * 2. 처리내용 : 사용자 별 권한을 확인하는 팝업 화면의 목록을 불러온다.
	 * </pre>
	 * @Method Name : selectUserRolePopList
	 * @date : 2019. 7. 25.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 7. 6.			신호석				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/userrole/z/n/selectUserRolePopList.do")
	public String selectUserRolePopList(RoleVO roleVO, ModelMap model) throws Exception {
		
		Map<String, Object> rslt = roleService.selectUserRoleForPopup(roleVO);
		model.addAttribute("rslt", rslt);
		
		return "/admin/role/userRoleMng/popUpLayer/insertUserRole";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자별 권한을 수정 한 후 저장 한다.
	 * 2. 처리내용 : 사용자별 권한을 수정한 후 해당 권한으로 저장한다.
	 * </pre>
	 * @Method Name : saveUserRoleProc
	 * @date : 2019. 7. 25.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자				변경내용
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 7. 6.			신호석				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @return
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/userrole/z/n/saveUserRoleProc.do")
	public String saveUserRoleProc(RoleVO roleVO) throws Exception {
		
		roleService.updateUserRoleMapping(roleVO);
		
		return "redirect:/userrole/z/m/selectUserRoleList.do";
	}
	/**************************************************** 사용자별 권한 관리(E) */
}

package com.beauate.admin.role.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.ModelMap;

import com.beauate.admin.user.service.UserVO;

public interface RoleService {
	// 권한 그룹 관리 Start
	/**
	 * <pre>
	 * 1. 개요 : 권한 관리의 첫 화면에 뿌려지는 권한 그룹 목록
	 * 2. 처리내용 : 권한 관리의 첫 화면에 뿌려지는 권한 그룹 목록
	 * </pre>
	 * @Method Name : selectRoleGroupList
	 * @date : 2019. 6. 24.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자				변경내용
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 24.		뷰아떼1				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectRoleGroupList(RoleVO roleVO, ModelMap model) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 권한 그룹의 상세 정보
	 * 2. 처리내용 : 사용자가 요청하는 권한 그룹의 상세 정보를 가져온다.
	 * </pre>
	 * @Method Name : selectRoleGroupDetail
	 * @date : 2019. 6. 27.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자				변경내용
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 27.		뷰아떼1				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public RoleVO selectRoleGroupDetail(RoleVO roleVO) throws Exception;
	
	
	/**
	 * <pre>
	 * 1. 개요 : 권한 그룹 정보를 삭제
	 * 2. 처리내용 : 사용자가 요청하는 권한 그룹 정보를 삭제 한다.
	 * </pre>
	 * @Method Name : deleteRoleGroup
	 * @date : 2019. 6. 27.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자				변경내용
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 27.		뷰아떼1				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @return
	 * @throws Exception
	 */ 	
	public int deleteRoleGroup(RoleVO roleVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 권한 그룹 정보 수정
	 * 2. 처리내용 : 관리자가 권한 정보를 수정 한 후 저장 한다.
	 * </pre>
	 * @Method Name : updateRoleGroup
	 * @date : 2019. 6. 28.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 6. 28.		뷰아떼1				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @return
	 * @throws Exception
	 */ 	
	public int updateRoleGroup(RoleVO roleVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 
	 * 2. 처리내용 : 
	 * </pre>
	 * @Method Name : insertRoleGroup
	 * @date : 2019. 6. 28.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자					변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 6. 28.		뷰아떼1					최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @return
	 * @throws Exception
	 */
	public int insertRoleGroup(RoleVO roleVO) throws Exception;
// 권한 그룹 관리 End
	
// 권한별 사용자 관리 Start
	/**
	 * <pre>
	 * 1. 개요 : 권한별 사용자 관리의 권한 정보 목록
	 * 2. 처리내용 : 권한별 사용자 관리의 권한 정보 목록을 가져온다.
	 * </pre>
	 * @Method Name : selectRoleNameOfRoleUser
	 * @date : 2019. 6. 29.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 6. 29.		뷰아떼1				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<RoleVO> selectRoleNameOfRoleUser() throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 권한별 사용자 목록
	 * 2. 처리내용 : 권한별 사용자 목록을 가져온다.
	 * </pre>
	 * @Method Name : selectRoleUserList
	 * @date : 2019. 6. 29.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 6. 29.		뷰아떼1				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @return
	 * @throws Exception
	 */
	public List<RoleVO> selectRoleUserList(RoleVO roleVO) throws Exception;
	
	
	/**
	 * <pre>
	 * 1. 개요 : 권한별 사용자 관리에서 해당 권한이 없는 사용자 목록
	 * 2. 처리내용 : 현재의 선택된 권한에서 해당 권한이 없는 사용자의 목록을 뿌려준다.
	 * </pre>
	 * @Method Name : selectUserListForUpdateRole
	 * @date : 2019. 6. 30.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자				변경내용
	 *	-----------------------------------------------------------------------
	 *	2019. 6. 30.		뷰아떼1				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @return
	 * @throws Exception
	 */
	public List<RoleVO> selectUserListForUpdateRole(RoleVO roleVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 권한별 사용자 등록 혹은 수정
	 * 2. 처리내용 : 권한별 사용자를 등록하는데, 권한이 존재 하는 사용자면 update, 존재하지 않으면 insert
	 * </pre>
	 * @Method Name : updateRoleUserMapping
	 * @date : 2019. 7. 1.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자				변경내용
	 *	------------------------------ ---------------------------------------
	 *	2019. 7. 1.			뷰아떼1				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @return
	 * @throws Exception
	 */ 	
	public int mergeIntoRoleUserMapping(RoleVO roleVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 권한별 사용자의 권한 변경
	 * 2. 처리내용 : 관리자가 요청한 사용자의 권한을 변경 처리한다.
	 * </pre>
	 * @Method Name : updateRoleUserMapping
	 * @date : 2019. 7. 5.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 7. 5.		뷰아떼1				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @throws Exception
	 */
	public void updateRoleUserMapping(RoleVO roleVO) throws Exception;
// 권한별 사용자 관리 End

// 사용자별 권한 관리 Start
	/**
	 * <pre>
	 * 1. 개요 : 사용자 별 권한 관리 목록
	 * 2. 처리내용 : 사용자 별 권한 관리 목록
	 * </pre>
	 * @Method Name : selectUserRoleList
	 * @date : 2019. 7. 6.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 7. 6.		뷰아떼1				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectUserRoleList(UserVO userVO, ModelMap model) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자의 권한 조회
	 * 2. 처리내용 : 사용자의 현재 권한 조회
	 * </pre>
	 * @Method Name : selectUserRoleForPopup
	 * @date : 2019. 7. 6.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 7. 6.		뷰아떼1				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectUserRoleForPopup(RoleVO roleVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 별 권한 변경 처리
	 * 2. 처리내용 : 사용자 별 권한 변경 처리
	 * </pre>
	 * @Method Name : updateUserRoleMapping
	 * @date : 2019. 7. 7.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자				변경내용
	 *	------------------------------- ---------------------------------------
	 *	2019. 7. 7.		뷰아떼1				최초 작성
	 *	-----------------------------------------------------------------------
	 * 
	 * @param roleVO
	 * @return
	 * @throws Exception
	 */
	public int updateUserRoleMapping(RoleVO roleVO) throws Exception;
}

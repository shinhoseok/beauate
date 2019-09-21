package com.beauate.admin.role.service;

import java.util.List;

import com.beauate.admin.user.service.UserVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("roleDao")
public interface RoleDao {
	// 권한 그룹 관리
	/** 권한 그룹 목록 */
	public List<RoleVO> selectRoleGroupList(RoleVO roleVO) throws Exception;

	/** 권한 그룹 목록 갯수 */
	public int selectRoleGroupListCnt(RoleVO roleVO) throws Exception;

	/** 권한 그룹 상세 보기 */
	public RoleVO selectRoleGroupDetail(RoleVO roleVO) throws Exception;

	/** 권한 그룹 정보 삭제 */
	public int deleteRoleGroup(RoleVO roleVO) throws Exception;

	/** 권한 그룹 정보 수정 */
	public int updateRoleGroup(RoleVO roleVO) throws Exception;

	/** 권한 그룹 정보 등록 */
	public int insertRoleGroup(RoleVO roleVO) throws Exception;
	
// 권한별 사용자 관리
	/** 권한 정보 목록 */
	public List<RoleVO> selectRoleNameOfRoleUser() throws Exception;
	
	/** 권한별 사용자 목록 */
	public List<RoleVO> selectRoleUserList(RoleVO roleVO) throws Exception;
	
	/** 권한 수정을 위한 사용자 목록 */
	public List<RoleVO> selectUserListForUpdateRole(RoleVO roleVO) throws Exception;
	
	/** 권한별 사용자 등록(해당 사용자가 권한이 있으면 update, 없으면 insert */
	public int mergeIntoRoleUserMapping(RoleVO roleVO) throws Exception;
	
	/** 사용자 권한 등록 */
	void insertRoleUserProc(RoleVO roleVO) throws Exception;
	
	/** 사용자 권한 삭제 */
	void deleteRoleUser(RoleVO roleVO) throws Exception;
	
	/** 사용자 권한 변경 */
	public void updateRoleUserMapping(RoleVO roleVO) throws Exception;
	
// 사용자별 권한 관리
	/** 사용자별 권한 관리 목록 */
	public List<UserVO> selectUserRoleList(UserVO userVO) throws Exception;
	
	/** 사용자 별 권한 관리 목록 갯수 */
	public int selectUserRoleListCnt(UserVO userVO) throws Exception;
	
	/** 사용자의 현재 권한 조회 */
	public RoleVO selectUserRoleForPopup(RoleVO roleVO) throws Exception;
	
	/** 사용자에게 부여 할 수 있는 권한 조회 */
	public List<RoleVO> selectPossibleRoleForPopup(RoleVO roleVO) throws Exception;
	
	/** 사용자의 권한을 변경 한다. */
	public int updateUserRoleMapping(RoleVO roleVO) throws Exception;
}

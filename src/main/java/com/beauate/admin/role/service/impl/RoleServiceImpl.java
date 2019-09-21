package com.beauate.admin.role.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.beauate.admin.role.service.RoleDao;
import com.beauate.admin.role.service.RoleService;
import com.beauate.admin.role.service.RoleVO;
import com.beauate.admin.user.service.UserVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("roleService")
public class RoleServiceImpl extends EgovAbstractServiceImpl implements RoleService {

	@Resource(name = "roleDao")
	private RoleDao roleDao;
	
	@Resource(name = "roleIdGnrService")
	private EgovIdGnrService roleIdGnrService;
	
	@Override
	public Map<String, Object> selectRoleGroupList(RoleVO roleVO, ModelMap model) throws Exception {
		
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		
		// 페이징
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(roleVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(roleVO.getPageUnit());
		paginationInfo.setPageSize(roleVO.getPageSize());

		roleVO.setFirstIndex(paginationInfo.getFirstRecordIndex() + 1); // +1
		roleVO.setLastIndex(paginationInfo.getLastRecordIndex());
		roleVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<RoleVO> selectList = null;
		
		int cnt = roleDao.selectRoleGroupListCnt(roleVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if (cnt > 0) {

			if (roleVO.getSortSubject() == null) {
				roleVO.setSortSubject("rlId");
				roleVO.setSortDescend("desc");
			}

			selectList = roleDao.selectRoleGroupList(roleVO);
		}
		
		rsltMap.put("roleGroupList", selectList);
		rsltMap.put("roleGroupListCnt", cnt);
		rsltMap.put("paginationInfo", paginationInfo);
		
		return rsltMap;
	}

	@Override
	public RoleVO selectRoleGroupDetail(RoleVO roleVO) throws Exception {

		return roleDao.selectRoleGroupDetail(roleVO);
	}

	@Override
	public int deleteRoleGroup(RoleVO roleVO) throws Exception {
		// myBatis 는 따로 정의 하지 않아도 해당 쿼리의 결과를 int 로 반환 해준다.
		// 사용 되는 예는 삭제, 수정등의 결과 이다.
		return roleDao.deleteRoleGroup(roleVO);
	}

	@Override
	public int updateRoleGroup(RoleVO roleVO) throws Exception {
		// myBatis 는 따로 정의 하지 않아도 해당 쿼리의 결과를 int 로 반환 해준다.
		// 사용 되는 예는 삭제, 수정등의 결과 이다.
		return roleDao.updateRoleGroup(roleVO);
	}

	@Override
	public int insertRoleGroup(RoleVO roleVO) throws Exception {
		roleVO.setRlId(roleIdGnrService.getNextStringId());
		return roleDao.insertRoleGroup(roleVO);
	}

	@Override
	public List<RoleVO> selectRoleNameOfRoleUser() throws Exception {

		return roleDao.selectRoleNameOfRoleUser();
	}

	@Override
	public List<RoleVO> selectRoleUserList(RoleVO roleVO) throws Exception {
		
		return roleDao.selectRoleUserList(roleVO);
	}

	@Override
	public List<RoleVO> selectUserListForUpdateRole(RoleVO roleVO) throws Exception {
		
		return roleDao.selectUserListForUpdateRole(roleVO);
	}

	@Override
	public int mergeIntoRoleUserMapping(RoleVO roleVO) throws Exception {
		return roleDao.mergeIntoRoleUserMapping(roleVO);
	}

	@Override
	public void updateRoleUserMapping(RoleVO roleVO) throws Exception {
		String usrId = roleVO.getUsrId();
		if (usrId.indexOf(",") == -1) {
			// 전달 받은 사용자 아이디가 하나인 경우
			roleDao.updateRoleUserMapping(roleVO);
		} else {
			// 전달 받은 사용자 아이디가 하나가 아니라 여러개가 넘어온 경우
			String[] usrIdArr = usrId.split(",");
			for (int i = 0; i < usrIdArr.length; i++) {
				roleVO.setUsrId(usrIdArr[i]);
				roleDao.updateRoleUserMapping(roleVO);
			}
		}
	}

	@Override
	public Map<String, Object> selectUserRoleList(UserVO userVO, ModelMap model) throws Exception {
		
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		
		// 페이징
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(userVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(userVO.getPageUnit());
		paginationInfo.setPageSize(userVO.getPageSize());

		userVO.setFirstIndex(paginationInfo.getFirstRecordIndex() + 1); // +1
		userVO.setLastIndex(paginationInfo.getLastRecordIndex());
		userVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<UserVO> selectList = null;
		
		int cnt = roleDao.selectUserRoleListCnt(userVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if (cnt > 0) {

			if (userVO.getSortSubject() == null) {
				userVO.setSortSubject("usrId");
				userVO.setSortDescend("asc");
			}

			selectList = roleDao.selectUserRoleList(userVO);
		}
		
		rsltMap.put("userRoleList", selectList);
		rsltMap.put("userRoleListCnt", cnt);
		rsltMap.put("paginationInfo", paginationInfo);
		
		return rsltMap;
	}

	@Override
	public Map<String, Object> selectUserRoleForPopup(RoleVO roleVO) throws Exception {
		
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		
		RoleVO tempUserRole = roleDao.selectUserRoleForPopup(roleVO);
		List<RoleVO> roleList = roleDao.selectPossibleRoleForPopup(roleVO);
		
		rsltMap.put("tempRole", tempUserRole);
		rsltMap.put("roleList", roleList);
		
		return rsltMap;
	}

	@Override
	public int updateUserRoleMapping(RoleVO roleVO) throws Exception {
		return roleDao.updateUserRoleMapping(roleVO);
	}

}

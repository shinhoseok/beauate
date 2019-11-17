package com.beauate.user.service;

import java.util.Map;

import org.springframework.ui.ModelMap;

import com.beauate.admin.user.service.UserStatsVO;
import com.beauate.admin.user.service.UserVO;
import com.beauate.login.service.LoginVO;

public interface UserService {
	/**
	 * <pre>
	 * 1. 개요 : 사용자 목록 리스트
	 * 2. 처리내용 : 사용자 목록 조회
	 * </pre>
	 * @Method Name : selectUserList
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 
	public void selectUserList(UserVO userVO, ModelMap model) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 상세정보
	 * 2. 처리내용 : 사용자 상세정보를 불러온다.
	 * </pre>
	 * @Method Name : selectUser
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public UserVO selectUser(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자아이디 중복체크
	 * 2. 처리내용 : 사용자아이디 중복체크
	 * </pre>
	 * @Method Name : userIdChk
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public Integer userIdChk(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 등록
	 * 2. 처리내용 : 사용자 등록
	 * </pre>
	 * @Method Name : userInsertProc
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public void userInsertProc(UserVO userVO, LoginVO sessionVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 비밀번호 초기화
	 * 2. 처리내용 : 사용자 비밀번호 초기화
	 * </pre>
	 * @Method Name : userPwReset
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public Integer userPwReset(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 수정
	 * 2. 처리내용 : 사용자 수정
	 * </pre>
	 * @Method Name : updateUser
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public void updateUser(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 삭제
	 * 2. 처리내용 : 사용자 삭제
	 * </pre>
	 * @Method Name : updateUserProc
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public void updateUserProc(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 통계 등록
	 * 2. 처리내용 : 사용자 통계 등록
	 * </pre>
	 * @Method Name : insertUserStatisticsProc
	 * @date : 2019. 6. 22.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 22.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param UserStatsVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public void insertUserStatisticsProc(UserStatsVO userStatsVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 통계 리스트
	 * 2. 처리내용 : 사용자 통계 리스트
	 * </pre>
	 * @Method Name : selectUserStatisticsList
	 * @date : 2019. 6. 23.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 23.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param UserStatsVO
	 * @param ModelMap
	 * @return
	 * @throws Exception
	 */ 
	public void selectUserStatisticsList(UserStatsVO userStatsVO, ModelMap model) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 상태,권한 코드리스트를 불러온다.
	 * 2. 처리내용 : 사용자 상태,권한 코드리스트를 불러온다.
	 * </pre>
	 * @Method Name : selectCodeList
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param 
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectCodeList() throws Exception;
}

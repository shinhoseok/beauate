package com.beauate.admin.user.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.beauate.admin.code.service.CodeDao;
import com.beauate.admin.code.service.CodeVO;
import com.beauate.admin.role.service.RoleDao;
import com.beauate.admin.role.service.RoleVO;
import com.beauate.admin.user.service.UserDao;
import com.beauate.admin.user.service.UserManageService;
import com.beauate.admin.user.service.UserStatsVO;
import com.beauate.admin.user.service.UserVO;
import com.beauate.common.CommonUtils;
import com.beauate.common.DateUtil;
import com.beauate.common.GlobalConstants;
import com.beauate.common.StringUtil;
import com.beauate.login.service.LoginVO;
import com.google.gson.Gson;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("userManageService")
public class UserManageServiceImple extends EgovAbstractServiceImpl implements UserManageService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="commonUtils")
	private CommonUtils commonUtils;
	
	@Resource(name="userDao")
	private UserDao userDao;
	
	@Resource(name = "userIdGnrService")
	private EgovIdGnrService userIdGnrService;
	
	@Resource(name = "userStatsIdGnrService")
	private EgovIdGnrService userStatsIdGnrService;
	
	@Resource(name = "roleUserMappingIdGnrService")
	private EgovIdGnrService roleUserMappingIdGnrService;
	
	@Resource(name="roleDao")
	private RoleDao roleDao;
	
	@Resource(name="codeDao")
	private CodeDao codeDao;
	
	private final String DATE_PATTERN = "yyyy-MM-dd";
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 리스트
	 * 2. 처리내용 : 사용자 리스트를 불러온다.
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
	public void selectUserList(UserVO userVO, ModelMap model) throws Exception {
		
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(userVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(userVO.getPageUnit());
		paginationInfo.setPageSize(userVO.getPageSize());
		
		userVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		userVO.setLastIndex(paginationInfo.getLastRecordIndex());
		userVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<UserVO> selectList = null;
		
		//총 카운트 
		int cnt = userDao.selectUserListCnt(userVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//리스트
			selectList = userDao.selectUserList(userVO);
		}
		
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("userList", selectList);
		model.addAttribute("userListCnt", cnt);
	}
	
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
	public UserVO selectUser(UserVO userVO) throws Exception {
		return userDao.selectUser(userVO);
	}
	
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
	public Integer userIdChk(UserVO userVO) throws Exception {
		return userDao.userIdChk(userVO);
	}
	
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
	public void userInsertProc(UserVO userVO, LoginVO sessionVO) throws Exception {
		
		//사용자 등록
		log.debug("Before usrPw:"+ userVO.getUsrPw());
		String passwd = commonUtils.encryption(userVO.getUsrPw());
		
		log.debug("After usrPw:"+ passwd);
		userVO.setUsrPw(passwd);
		userVO.setUsrId(userIdGnrService.getNextStringId());
		
		//정상회원 상태코드 등록
		userVO.setUserSt(GlobalConstants.NORMAL_MEMBER_CODE);
		userDao.userInsertProc(userVO);
		
		//사용자 권한 등록
		if(userVO.getUsrId() != null || userVO.getUsrId() != "") {
			RoleVO roleVO = new RoleVO();
			roleVO.setMppgId(roleUserMappingIdGnrService.getNextStringId());
			roleVO.setRlId(GlobalConstants.USER_AUTHORITY_DEFAULT);
			roleVO.setUsrId(userVO.getUsrId());
			roleVO.setRgId(sessionVO.getUsrId());
			roleDao.insertRoleUserProc(roleVO);
		}
	}
	
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
	public Integer userPwReset(UserVO userVO) throws Exception {
		//기본적으로 beauate 로 바꿈
		String usrPw = "beauate";
		userVO.setUsrPw(usrPw);
		
		usrPw = commonUtils.encryption(userVO.getUsrPw());
		log.debug("After usrPw:"+ usrPw);
		userVO.setUsrPw(usrPw);
		
		return userDao.userPwReset(userVO);	
	}
	
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
	public void updateUser(UserVO userVO) throws Exception {
		
		//패스워드 변경시에만 수정값 세팅
		if("Y".equals(userVO.getPwChangeGubun())){
			log.debug("Before usrPw:"+ userVO.getUsrPw());
			String passwd = commonUtils.encryption(userVO.getUsrPw());
			log.debug("After usrPw:"+ passwd);
			userVO.setUsrPw(passwd);
			userDao.updateUser(userVO);
		} else {
			userDao.updateUser(userVO);
		}
	}
	
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
	public void updateUserProc(UserVO userVO) throws Exception {
		userDao.updateUserProc(userVO);
		//권한삭제
		if(userVO.getUsrId() != null || userVO.getUsrId() != "") {
			RoleVO roleVO = new RoleVO();
			roleVO.setUsrId(userVO.getUsrId());
			roleDao.deleteRoleUser(roleVO);
		}
	}
	
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
	 * @param userStatsVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public void insertUserStatisticsProc(UserStatsVO userStatsVO) throws Exception {
		userStatsVO.setAccessLogId(userStatsIdGnrService.getNextStringId());
		userDao.insertUserStatisticsProc(userStatsVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 통계 리스트
	 * 2. 처리내용 : 사용자 통계 리스트
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
	 * @param userStatsVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public void selectUserStatisticsList(UserStatsVO userStatsVO, ModelMap model) throws Exception {
		String inputStartDate = "";
		String inputEndDate = "";
		String today = DateUtil.getCurrentYearMonthDay();
		
		if(StringUtil.isEmpty(userStatsVO.getStartDate()) || StringUtil.isEmpty(userStatsVO.getEndDate())) {
			//2달 전
			Calendar mon = Calendar.getInstance();
			mon.add(Calendar.MONTH , -2);
			String beforeMonth = new java.text.SimpleDateFormat(DATE_PATTERN).format(mon.getTime());
			inputStartDate = beforeMonth;
			inputEndDate = today;
			userStatsVO.setStartDate(inputStartDate);
			userStatsVO.setEndDate(inputEndDate);
		} else {
			inputStartDate = userStatsVO.getStartDate();
			inputEndDate = userStatsVO.getEndDate();
		}
		
		List<Map<String, Object>> userStatsChartList = userDao.selectUserStatsChartList(userStatsVO);

		//이빨빠진 날짜 채워넣기
		List<Map<String, Object>> resultList = this.getDates(inputStartDate, inputEndDate);
		
		int i=0;
		int j=0;
		int listSize = userStatsChartList.size();
		String firstDate = "";
		for (Map<String, Object> date : resultList) {
			String queryDate = (String) userStatsChartList.get(i).get("accessDt");
			String allDate = (String) date.get("accessDt");
			if(j == 0) {
				firstDate = allDate;
			}
			if(allDate.equals(queryDate)) {
				resultList.get(j).put("cnt", (Integer) userStatsChartList.get(i).get("cnt"));
				if(i < listSize-1) {
					i++;
				}
			} else {
				resultList.get(j).put("cnt", 0);
			}
			j++;
		}
		
		Gson gson = new Gson();
		String resultChartList = gson.toJson(resultList);
		
		model.addAttribute("resultChartList", resultChartList);
		model.addAttribute("firstDate", firstDate);
	}
	
	//통계 2달간의 날짜를 가져온다. inputStartDate ~ inputEndDate
	private List<Map<String, Object>> getDates(String inputStartDate, String inputEndDate) throws ParseException {
		
		ArrayList<Map<String, Object>> dates = new ArrayList<>();
		
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		Date startDate = sdf.parse(inputStartDate);
		Date endDate = sdf.parse(inputEndDate);
		
		Date currentDate = startDate;
		while (currentDate.compareTo(endDate) <= 0) {
			Map<String, Object> rsltMap = new HashMap<String, Object>();
			rsltMap.put("accessDt", sdf.format(currentDate));
			dates.add(rsltMap);
			Calendar c = Calendar.getInstance();
			c.setTime(currentDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = c.getTime();
		}
		return dates;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 리스트 통계
	 * 2. 처리내용 : 사용자 리스트 통계를 불러온다.
	 * </pre>
	 * @Method Name : selectUserStatisticsAjax
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userStatsVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectUserStatisticsAjax(UserStatsVO userStatsVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<>();
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(userStatsVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(userStatsVO.getPageUnit());
		paginationInfo.setPageSize(userStatsVO.getPageSize());
		
		userStatsVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		userStatsVO.setLastIndex(paginationInfo.getLastRecordIndex());
		userStatsVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<UserStatsVO> selectList = null;
		
		//총 카운트 
		int cnt = userDao.selectUserStatisticsListCnt(userStatsVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//리스트
			selectList = userDao.selectUserStatisticsList(userStatsVO);
		}
		
		rsltMap.put("selectListCnt", cnt);
		rsltMap.put("selectList", selectList);
		
		return rsltMap;
	}
	
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
	public Map<String, Object> selectCodeList() throws Exception {
		Map<String, Object> rsltMap = new HashMap<>();
		List<CodeVO> userStatsList = codeDao.selectScodeList(GlobalConstants.USER_ACCOUNT_STATS);
		List<CodeVO> roleList = codeDao.selectScodeList(GlobalConstants.ROLE_CODE_NAME);
		
		rsltMap.put("userStatsList", userStatsList);
		rsltMap.put("roleList", roleList);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 회원가입 차트
	 * 2. 처리내용 : 회원가입 차트
	 * </pre>
	 * @Method Name : selectUserInsertChart
	 * @date : 2019. 6. 22.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 22.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userStatsVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public void selectUserInsertChart(UserStatsVO userStatsVO, ModelMap model) throws Exception {
		String inputStartDate = "";
		String inputEndDate = "";
		String today = DateUtil.getCurrentYearMonthDay();
		
		if(StringUtil.isEmpty(userStatsVO.getStartDate()) || StringUtil.isEmpty(userStatsVO.getEndDate())) {
			//2달 전
			Calendar mon = Calendar.getInstance();
			mon.add(Calendar.MONTH , -2);
			String beforeMonth = new java.text.SimpleDateFormat(DATE_PATTERN).format(mon.getTime());
			inputStartDate = beforeMonth;
			inputEndDate = today;
			userStatsVO.setStartDate(inputStartDate);
			userStatsVO.setEndDate(inputEndDate);
		} else {
			inputStartDate = userStatsVO.getStartDate();
			inputEndDate = userStatsVO.getEndDate();
		}
		
		List<Map<String, Object>> userStatsChartList = userDao.selectUserInsertChart(userStatsVO);

		//이빨빠진 날짜 채워넣기
		List<Map<String, Object>> resultList = this.getDates(inputStartDate, inputEndDate);
		
		int i=0;
		int j=0;
		int listSize = userStatsChartList.size();
		String firstDate = "";
		for (Map<String, Object> date : resultList) {
			String queryDate = (String) userStatsChartList.get(i).get("accessDt");
			String allDate = (String) date.get("accessDt");
			if(j == 0) {
				firstDate = allDate;
			}
			if(allDate.equals(queryDate)) {
				resultList.get(j).put("cnt", (Integer) userStatsChartList.get(i).get("cnt"));
				if(i < listSize-1) {
					i++;
				}
			} else {
				resultList.get(j).put("cnt", 0);
			}
			j++;
		}
		
		Gson gson = new Gson();
		String resultChartList = gson.toJson(resultList);
		
		model.addAttribute("resultChartList", resultChartList);
		model.addAttribute("firstDate", firstDate);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 회원가입 통계 리스트
	 * 2. 처리내용 : 회원가입 통계 리스트
	 * </pre>
	 * @Method Name : selectMemberStatsAjax
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userStatsVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectMemberStatsAjax(UserVO userVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<>();
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(userVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(userVO.getPageUnit());
		paginationInfo.setPageSize(userVO.getPageSize());
		
		userVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		userVO.setLastIndex(paginationInfo.getLastRecordIndex());
		userVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<UserVO> selectList = null;
		
		//총 카운트 
		int cnt = userDao.selectUserListCnt(userVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//리스트
			selectList = userDao.selectUserList(userVO);
			//전화번호 형식(000-000-0000)변환
			for(int i=0; i<selectList.size(); i++) {
				selectList.get(i).setMblPno(StringUtil.phone(selectList.get(i).getMblPno()));
			}
		}
		
		rsltMap.put("selectListCnt", cnt);
		rsltMap.put("selectList", selectList);
		
		return rsltMap;
	}
}

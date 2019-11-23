package com.beauate.mento.web;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.beauate.admin.alarm.service.AlarmManageService;
import com.beauate.admin.classmng.service.ClassManageService;
import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.admin.comment.service.CommentVO;
import com.beauate.admin.review.service.ReviewManageService;
import com.beauate.alarm.service.AlarmVO;
import com.beauate.jjim.service.JjimVO;
import com.beauate.login.service.LoginVO;
import com.beauate.mento.service.MentoService;
import com.beauate.pay.service.PayVO;
import com.beauate.review.service.ReviewVO;

@Controller
public class MentoController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="mentoService")
	private MentoService mentoService;
	
	@Resource(name = "classManageService")
	private ClassManageService classManageService;
	
	@Resource(name = "alarmManageService")
	private AlarmManageService alarmManageService;
	
	@Resource(name = "reviewManageService")
	private ReviewManageService reviewManageService;
	
	/**
	 * <pre>
	 * 1. 개요 : 클래스관리 리스트
	 * 2. 처리내용 : 클래스관리 리스트
	 * </pre>
	 * @Method Name : selectClassMngList
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param classVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mento/r/n/selectOffClassList.do")
	public String selectClassMngList(@ModelAttribute("classVO") ClassVO classVO, ModelMap model, LoginVO sessionVO) throws Exception {
		classVO.setUsrId(sessionVO.getUsrId());
		classVO.setMentoGb("Y");
		Map<String, Object> rslt = mentoService.selectClassList(classVO);
		model.addAttribute("rslt", rslt);
		
		model.addAttribute("alevel", "1");
		model.addAttribute("blevel", "1");
		model.addAttribute("clevel", "1");
		return "/mento/offClassList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 클래스관리 상세보기
	 * 2. 처리내용 : 클래스관리 상세보기
	 * </pre>
	 * @Method Name : selectOffClassDetail
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param classVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mento/r/n/selectOffClassDetail.do")
	public String selectOffClassDetail(ClassVO classVO, ModelMap model) throws Exception {
		ClassVO resultVO = classManageService.selectClassMngDetail(classVO);
		model.addAttribute("resultVO", resultVO);
		
		model.addAttribute("alevel", "1");
		model.addAttribute("blevel", "1");
		model.addAttribute("clevel", "1");
		return "/mento/offClassDetail";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 클래스관리 통계
	 * 2. 처리내용 : 클래스관리 통계
	 * </pre>
	 * @Method Name : selectOffClassChart
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param classVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mento/r/n/selectOffClassChart.do")
	public String selectOffClassChart(ClassVO classVO, ModelMap model, LoginVO sessionVO) throws Exception {
		
		classVO.setUsrId(sessionVO.getUsrId());
		Map<String, Object> rslt = mentoService.selectOffClassChart(classVO);
		
		model.addAttribute("rslt", rslt);
		
		model.addAttribute("alevel", "1");
		model.addAttribute("blevel", "2");
		model.addAttribute("clevel", "1");
		
		return "/mento/userChart";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 멘토페이지 결제한 사용자 리스트
	 * 2. 처리내용 :  멘토페이지 결제한 사용자 리스트
	 * </pre>
	 * @Method Name : selectMentoPayUserList
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param payVO
	 * @return void
	 * @throws Exception
	 */ 
	@RequestMapping(value="/mento/r/n/selectMentoPayUserList.do")
	public String selectMentoPayUserList(PayVO payVO, ModelMap model, LoginVO sessionVO) throws Exception {
		
		Map<String, Object> rsltMap = mentoService.selectMentoPayUserList(payVO);
		model.addAttribute("rslt", rsltMap);
		model.addAttribute("payVO", payVO);
		
		return "/mento/payUserListAjax";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 멘토페이지 찜한 사용자 리스트
	 * 2. 처리내용 :  멘토페이지 찜한 사용자 리스트
	 * </pre>
	 * @Method Name : selectMentoJjimUserList
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param payVO
	 * @return void
	 * @throws Exception
	 */ 
	@RequestMapping(value="/mento/r/n/selectMentoJjimUserList.do")
	public String selectMentoJjimUserList(JjimVO jjimVO, ModelMap model, LoginVO sessionVO) throws Exception {
		
		Map<String, Object> rsltMap = mentoService.selectMentoJjimUserList(jjimVO);
		model.addAttribute("rslt", rsltMap);
		model.addAttribute("payVO", jjimVO);
		
		return "/mento/jjimUserListAjax";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 클래스관리 알람신청 리스트
	 * 2. 처리내용 : 클래스관리 알람신청 리스트
	 * </pre>
	 * @Method Name : selectOffClassChart
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param classVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mento/r/n/selectOffClassAlarmList.do")
	public String selectOffClassAlarmList(@ModelAttribute("alarmVO") AlarmVO alarmVO, ModelMap model, LoginVO sessionVO) throws Exception {
		
		alarmVO.setUsrId(sessionVO.getUsrId());
		Map<String, Object> rslt = alarmManageService.selectAlarmList(alarmVO);
		
		model.addAttribute("rslt", rslt);
		
		model.addAttribute("alevel", "1");
		model.addAttribute("blevel", "2");
		model.addAttribute("clevel", "2");
		
		return "/mento/userAlarmList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 클래스관리 알람신청 리스트
	 * 2. 처리내용 : 클래스관리 알람신청 리스트
	 * </pre>
	 * @Method Name : selectOffClassChart
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param classVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mento/r/n/selectOffClassReviewList.do")
	public String selectOffClassReviewList(@ModelAttribute("reviewVO") ReviewVO reviewVO, ModelMap model, LoginVO sessionVO) throws Exception {
		reviewVO.setUsrId(sessionVO.getUsrId());
		Map<String, Object> rsltMap = reviewManageService.selectReviewList(reviewVO);
		model.addAttribute("rslt", rsltMap);
		
		model.addAttribute("alevel", "1");
		model.addAttribute("blevel", "3");
		model.addAttribute("clevel", "1");
		
		return "/mento/userReviewList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 후기상세
	 * 2. 처리내용 : 후기상세
	 * </pre>
	 * @Method Name : selectReviewMngDetail
	 * @date : 2019. 5. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param reviewVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/mento/r/n/selectReviewMngDetail.do")
	public String selectReviewMngDetail(ReviewVO reviewVO, ModelMap model) throws Exception {
		
		ReviewVO resultVO = reviewManageService.selectReviewMngDetail(reviewVO);
		model.addAttribute("resultVO", resultVO);
		
		model.addAttribute("alevel", "1");
		model.addAttribute("blevel", "3");
		model.addAttribute("clevel", "1");
		
		return "/mento/reviewDetail";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 댓글등록
	 * 2. 처리내용 :  댓글등록
	 * </pre>
	 * @Method Name : insertCommentMngProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param commentVO
	 * @return String
	 * @throws Exception
	 */ 
	@RequestMapping(value = "/mento/w/n/insertCommentMngProc.do")
	public String insertCommentMngProc(CommentVO commentVO, ModelMap model, LoginVO sessionVO, SessionStatus status) throws Exception {
		commentVO.setUsrId(sessionVO.getUsrId());
		reviewManageService.insertCommentMngProc(commentVO);
		//중복 submit 방지
		status.setComplete();
		String message;
		String redirectUrl;
		
		redirectUrl = "/mento/r/n/selectReviewMngDetail.do?reviewId="+commentVO.getReviewId()+"&commentId="+commentVO.getCommentId();
		message = "등록 되었습니다.";
		
		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", redirectUrl);
		
		return"/common/temp_action_message";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 댓글 수정
	 * 2. 처리내용 :  댓글 수정
	 * </pre>
	 * @Method Name : updateCommentProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param commentVO
	 * @return String
	 * @throws Exception
	 */ 
	@RequestMapping(value = "/mento/w/n/updateCommentProc.do")
	public String updateCommentProc(CommentVO commentVO, ModelMap model, SessionStatus status) throws Exception {
		String message;
		String redirectUrl;
		reviewManageService.updateCommentProc(commentVO);
		//중복 submit 방지
		status.setComplete();
		
		message = "수정 되었습니다.";
		redirectUrl = "/mento/r/n/selectReviewMngDetail.do?reviewId="+commentVO.getReviewId()+"&commentId="+commentVO.getCommentId();
		
		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", redirectUrl);
		
		return"/common/temp_action_message";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 댓글 삭제
	 * 2. 처리내용 :  댓글 삭제
	 * </pre>
	 * @Method Name : updateCommentProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param commentVO
	 * @return Integer
	 * @throws Exception
	 */ 
	@RequestMapping(value = "/mento/w/n/deleteCommentProc.do")
	public String deleteCommentProc(CommentVO commentVO, ModelMap model, SessionStatus status) throws Exception {
		String message;
		String redirectUrl;
		reviewManageService.deleteCommentProc(commentVO);
		//중복 submit 방지
		status.setComplete();
		
		message = "삭제 되었습니다.";
		redirectUrl = "/mento/r/n/selectReviewMngDetail.do?reviewId="+commentVO.getReviewId()+"&commentId="+commentVO.getCommentId();
		
		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", redirectUrl);
		
		return"/common/temp_action_message";
	}
}

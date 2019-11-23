package com.beauate.admin.review.web;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.beauate.admin.comment.service.CommentVO;
import com.beauate.admin.review.service.ReviewManageService;
import com.beauate.login.service.LoginVO;
import com.beauate.review.service.ReviewVO;

@Controller
public class ReviewManageController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "reviewManageService")
	private ReviewManageService reviewManageService;
	
	/**
	 * <pre>
	 * 1. 개요 : 후기관리 리스트
	 * 2. 처리내용 : 후기관리 리스트
	 * </pre>
	 * @Method Name : selectReviewList
	 * @date : 2019. 5. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param reviewVO
	 * @param model /review/r/m/selectReviewMngDetail.do
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/review/r/m/selectReviewList.do")
	public String selectReviewList(@ModelAttribute("reviewVO") ReviewVO reviewVO, ModelMap model) throws Exception {
		//관리자페이지
		reviewVO.setAdminYn(true);
		Map<String, Object> rsltMap = reviewManageService.selectReviewList(reviewVO);
		model.addAttribute("rslt", rsltMap);
		
		return "/admin/review/reviewList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 후기 삭제/취소
	 * 2. 처리내용 : 후기 삭제/취소
	 * </pre>
	 * @Method Name : updateReviewMngProc
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
	@RequestMapping(value = "/review/w/n/updateReviewMngProc.do")
	public String updateReviewProc(ReviewVO reviewVO, ModelMap model) throws Exception {
		
		reviewManageService.updateReviewProc(reviewVO);
		
		return "redirect:/review/r/m/selectReviewList.do";
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
	@RequestMapping(value = "/review/r/m/selectReviewMngDetail.do")
	public String selectReviewMngDetail(ReviewVO reviewVO, ModelMap model) throws Exception {
		
		ReviewVO resultVO = reviewManageService.selectReviewMngDetail(reviewVO);
		model.addAttribute("resultVO", resultVO);
		
		return "/admin/review/reviewDetail";
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
	@RequestMapping(value = "/review/w/n/insertCommentMngProc.do")
	public String insertCommentMngProc(CommentVO commentVO, ModelMap model, LoginVO sessionVO, SessionStatus status) throws Exception {
		commentVO.setUsrId(sessionVO.getUsrId());
		reviewManageService.insertCommentMngProc(commentVO);
		//중복 submit 방지
		status.setComplete();
		String message;
		String redirectUrl;
		
		redirectUrl = "/review/r/m/selectReviewMngDetail.do?reviewId="+commentVO.getReviewId()+"&commentId="+commentVO.getCommentId();
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
	@RequestMapping(value = "/review/w/n/updateCommentProc.do")
	public String updateCommentProc(CommentVO commentVO, ModelMap model, SessionStatus status) throws Exception {
		String message;
		String redirectUrl;
		reviewManageService.updateCommentProc(commentVO);
		//중복 submit 방지
		status.setComplete();
		
		message = "수정 되었습니다.";
		redirectUrl = "/review/r/m/selectReviewMngDetail.do?reviewId="+commentVO.getReviewId()+"&commentId="+commentVO.getCommentId();
		
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
	 * @return Integer
	 * @throws Exception /review/w/n/updateReviewCmmProc.do
	 */ 
	@RequestMapping(value = "/review/w/n/deleteCommentProc.do")
	public String deleteCommentProc(CommentVO commentVO, ModelMap model, SessionStatus status) throws Exception {
		String message;
		String redirectUrl;
		reviewManageService.deleteCommentProc(commentVO);
		//중복 submit 방지
		status.setComplete();
		
		message = "삭제 되었습니다.";
		redirectUrl = "/review/r/m/selectReviewMngDetail.do?reviewId="+commentVO.getReviewId()+"&commentId="+commentVO.getCommentId();
		
		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", redirectUrl);
		
		return"/common/temp_action_message";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 리뷰삭제 / 댓글삭제
	 * 2. 처리내용 :  리뷰삭제 / 댓글삭제
	 * </pre>
	 * @Method Name : updateReviewCmmProc
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
	@RequestMapping(value = "/review/w/n/updateReviewCmmProc.do")
	public String updateReviewCmmProc(CommentVO commentVO, ModelMap model, SessionStatus status) throws Exception {
		String message;
		String redirectUrl;
		reviewManageService.deleteCommentProc(commentVO);
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setDelYn("Y");
		reviewVO.setReviewId(commentVO.getReviewId());
		reviewManageService.updateReviewProc(reviewVO);
		//중복 submit 방지
		status.setComplete();
		
		message = "삭제 되었습니다.";
		redirectUrl = "/review/r/m/selectReviewList.do";
		
		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", redirectUrl);
		
		return"/common/temp_action_message";
	}
}

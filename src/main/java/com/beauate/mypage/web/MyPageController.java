package com.beauate.mypage.web;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beauate.jjim.service.JjimVO;
import com.beauate.login.service.LoginVO;
import com.beauate.mypage.service.MyPageService;
import com.beauate.pay.service.PayVO;

@Controller
public class MyPageController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "myPageService")
	private MyPageService myPageService;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 신청한 클래스 리스트
	 * 2. 처리내용 : 마이페이지 신청한 클래스 리스트
	 * </pre>
	 * @Method Name : selectMyClassList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/r/t/selectMyClassList.do")
	public String selectMyClassList(@ModelAttribute("payVO") PayVO payVO, ModelMap model) throws Exception {
		return "/mypage/myPageList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 신청한 클래스 리스트
	 * 2. 처리내용 : 마이페이지 신청한 클래스 리스트
	 * </pre>
	 * @Method Name : selectApplyClassList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/r/n/selectApplyClassList.do")
	public String selectApplyClassList(@ModelAttribute("payVO") PayVO payVO, ModelMap model, LoginVO sessionVO) throws Exception {
		payVO.setUsrId(sessionVO.getUsrId());
		Map<String, Object> rsltMap = myPageService.selectApplyClassList(payVO);
		model.addAttribute("rslt", rsltMap);
		return "/mypage/applyClassAjax";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 신청한 클래스 리스트
	 * 2. 처리내용 : 마이페이지 신청한 클래스 리스트
	 * </pre>
	 * @Method Name : selectMyClassTabList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/r/t/selectMyClassTabList.do")
	public String selectMyClassTabList(@ModelAttribute("payVO") PayVO payVO, ModelMap model, LoginVO sessionVO) throws Exception {
		payVO.setUsrId(sessionVO.getUsrId());
		Map<String, Object> rsltMap = myPageService.selectApplyClassList(payVO);
		model.addAttribute("rslt", rsltMap);
		return "/mypage/applyClassTabAjax";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 신청한 클래스 리스트
	 * 2. 처리내용 : 마이페이지 신청한 클래스 리스트
	 * </pre>
	 * @Method Name : selectMyClassTabList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/r/n/selectMyJjimClassList.do")
	public String selectMyJjimClassList(@ModelAttribute("jjimVO") JjimVO jjimVO, ModelMap model, LoginVO sessionVO) throws Exception {
		jjimVO.setUsrId(sessionVO.getUsrId());
		Map<String, Object> rsltMap = myPageService.selectJjimList(jjimVO);
		model.addAttribute("rslt", rsltMap);
		return "/mypage/jjimClassListAjax";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 결제내역삭제
	 * 2. 처리내용 :  결제내역삭제
	 * </pre>
	 * @Method Name : deletePayProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return void
	 * @throws Exception
	 */ 
	@RequestMapping(value = "/mypage/w/n/deletePayProc.do")
	public String deletePayProc(PayVO payVO, ModelMap model) throws Exception {
		myPageService.deletePayProc(payVO);
		return "redirect:/mypage/r/t/selectMyClassList.do";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 취소/환불처리
	 * 2. 처리내용 :  취소/환불처리
	 * </pre>
	 * @Method Name : updatePayRefundProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return void
	 * @throws Exception
	 */ 
	@RequestMapping(value = "/mypage/w/n/updatePayRefundProc.do")
	public String updatePayRefundProc(PayVO payVO, ModelMap model) throws Exception {
		myPageService.updatePayRefundProc(payVO);
		String message = null;
		message = "취소처리가 완료되었습니다.";

		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", "/mypage/r/t/selectMyClassList.do");
		
		return "/common/temp_action_message";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 찜삭제
	 * 2. 처리내용 :  찜삭제
	 * </pre>
	 * @Method Name : deleteJjimProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return void
	 * @throws Exception
	 */ 
	@RequestMapping(value = "/mypage/w/n/deleteJjimProc.do")
	public String deleteJjimProc(JjimVO jjimVO, ModelMap model) throws Exception {
		myPageService.deleteJjimProc(jjimVO);
		return "jsonView";
	}
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 작성 가능한 리스트
	 * 2. 처리내용 : 마이페이지 작성 가능한 리스트
	 * </pre>
	 * @Method Name : selectWritePossibleReviewList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/r/n/selectWritePossibleReviewList.do")
	public String selectWritePossibleReviewList(@ModelAttribute("payVO") PayVO payVO, ModelMap model) throws Exception {
		
		return "/mypage/writePossibleReviewAjax";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 할인쿠폰 리스트
	 * 2. 처리내용 : 마이페이지 할인쿠폰 리스트
	 * </pre>
	 * @Method Name : selectUsePossibleCpnList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/r/n/selectUsePossibleCpnList.do")
	public String selectUsePossibleCpnList(@ModelAttribute("payVO") PayVO payVO, ModelMap model) throws Exception {
		
		return "/mypage/usePossibleCpnAjax";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 결재내역 리스트
	 * 2. 처리내용 : 마이페이지 결재내역 리스트
	 * </pre>
	 * @Method Name : selectPayHistoryList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/r/n/selectPayHistoryList.do")
	public String selectPayHistoryList(@ModelAttribute("payVO") PayVO payVO, ModelMap model) throws Exception {
		
		return "/mypage/payHistoryAjax";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내 정보수정
	 * 2. 처리내용 : 마이페이지 내 정보수정
	 * </pre>
	 * @Method Name : selectPayHistoryList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/r/n/updateMyInfo.do")
	public String updateMyInfo(@ModelAttribute("payVO") PayVO payVO, ModelMap model) throws Exception {
		
		return "/mypage/myInfoUpdateAjax";
	}
}

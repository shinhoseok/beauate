package com.beauate.admin.coupon.web;

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

import com.beauate.admin.code.service.CodeVO;
import com.beauate.admin.coupon.service.CouponManageService;
import com.beauate.admin.coupon.service.CouponVO;

@Controller
public class CouponManageController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "couponManageService")
	private CouponManageService couponManageService;
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰관리 리스트
	 * 2. 처리내용 : 쿠폰관리 리스트
	 * </pre>
	 * @Method Name : selectCouponMngList
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/cpnmng/r/m/selectCouponMngList.do")
	public String selectCouponMngList(@ModelAttribute("couponVO") CouponVO couponVO, ModelMap model) throws Exception {
		
		Map<String, Object> rsltMap = couponManageService.selectCouponMngList(couponVO);
		model.addAttribute("rslt", rsltMap);
		
		return "/admin/coupon/couponList";
	};
		
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 등록화면
	 * 2. 처리내용 : 쿠폰 등록화면
	 * </pre>
	 * @Method Name : insertCpnMng
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cpnmng/w/m/insertCpnMng.do")
	public String insertCpnMng(@ModelAttribute("couponVO") CouponVO couponVO, ModelMap model) throws Exception {
		
		List<CodeVO> couponStList = couponManageService.insertCpnMng(couponVO);
		model.addAttribute("couponStList", couponStList);
		
		return "/admin/coupon/couponInsert";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 등록처리
	 * 2. 처리내용 : 쿠폰 등록처리
	 * </pre>
	 * @Method Name : insertCpnMngProc
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cpnmng/w/n/insertCpnMngProc.do")
	public String insertCpnMngProc(@ModelAttribute("couponVO") CouponVO couponVO, ModelMap model, SessionStatus status) throws Exception {
		couponManageService.insertCpnMngProc(couponVO);
		status.setComplete();	//중복 submit 방지
		return "redirect:/cpnmng/r/m/selectCouponMngList.do";
	}
	
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 상세
	 * 2. 처리내용 : 쿠폰 상세
	 * </pre>
	 * @Method Name : selectCpnMngDetail
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cpnmng/r/m/selectCpnMngDetail.do")
	public String selectCpnMngDetail(@ModelAttribute("couponVO") CouponVO couponVO, ModelMap model) throws Exception {
		log.debug("selectCpnMngDetail >>>>>>>>>>>>>>>>>>>>>>>>>>>> "+couponVO);
		CouponVO resultVO = couponManageService.selectCpnMngDetail(couponVO);
		model.addAttribute("resultVO", resultVO);
		return "/admin/coupon/couponDetail";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 삭제처리
	 * 2. 처리내용 : 쿠폰 삭제처리
	 * </pre>
	 * @Method Name : deleteCpnMngProc
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @param model
	 * @param status
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/cpnmng/z/n/deleteCpnMngProc.do")
	public String deleteCpnMngProc(@ModelAttribute("couponVO") CouponVO couponVO, ModelMap model, SessionStatus status) throws Exception {
		couponManageService.deleteCpnMngProc(couponVO);
		status.setComplete();
		return "jsonView";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 수정화면
	 * 2. 처리내용 : 쿠폰 수정화면
	 * </pre>
	 * @Method Name : updateCpnMng
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @param model
	 * @param status
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/cpnmng/w/m/updateCpnMng.do")
	public String updateCpnMng(@ModelAttribute("couponVO") CouponVO couponVO, ModelMap model, SessionStatus status) throws Exception {
		CouponVO resultVO = couponManageService.selectCpnMngDetail(couponVO);
		List<CodeVO> couponStList = couponManageService.insertCpnMng(couponVO);
		model.addAttribute("resultVO", resultVO);
		model.addAttribute("couponStList", couponStList);
		return "/admin/coupon/couponUpdate";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 수정처리
	 * 2. 처리내용 : 쿠폰 수정처리
	 * </pre>
	 * @Method Name : updateCpnMngProc
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @param model
	 * @param status
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/cpnmng/w/m/updateCpnMngProc.do")
	public String updateCpnMngProc(@ModelAttribute("couponVO") CouponVO couponVO, ModelMap model, SessionStatus status) throws Exception {
		couponManageService.updateCpnMngProc(couponVO);
		status.setComplete();
		return "redirect:/cpnmng/r/m/selectCpnMngDetail.do?couponId="+couponVO.getCouponId();
	}
}

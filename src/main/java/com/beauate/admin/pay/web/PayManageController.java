package com.beauate.admin.pay.web;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beauate.admin.pay.service.PayManageService;
import com.beauate.pay.service.PayVO;

@Controller
public class PayManageController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="payManageService")
	private PayManageService payManageService;
	
	/**
	 * <pre>
	 * 1. 개요 : 결제관리 리스트
	 * 2. 처리내용 : 결제관리 리스트
	 * </pre>
	 * @Method Name : selectPayMngList
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param payVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/paymgr/r/m/selectPayMngList.do")
	public String selectPayMngList(@ModelAttribute("payVO") PayVO payVO, ModelMap model) throws Exception {
		Map<String, Object> rsltMap = payManageService.selectPayMngList(payVO);
		model.addAttribute("rslt", rsltMap);
		return "/admin/pay/payList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 결제상태 변경
	 * 2. 처리내용 : 결제상태 변경
	 * </pre>
	 * @Method Name : updatePayStProc
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param payVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/paymgr/w/n/updatePayStProc.do")
	public String updatePayStProc(PayVO payVO, ModelMap model) throws Exception {
		payManageService.updatePayStProc(payVO);
		return "redirect:/paymgr/r/m/selectPayMngList.do";
	}
}

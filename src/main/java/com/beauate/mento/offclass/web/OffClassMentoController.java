package com.beauate.mento.offclass.web;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beauate.admin.classmng.service.ClassManageService;
import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.jjim.service.JjimVO;
import com.beauate.login.service.LoginVO;
import com.beauate.mento.offclass.service.OffClassMentoService;
import com.beauate.pay.service.PayVO;

@Controller
public class OffClassMentoController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "offClassMentoService")
	private OffClassMentoService offClassMentoService;
	
	@Resource(name = "classManageService")
	private ClassManageService classManageService;
	
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
	@RequestMapping(value = "/offclassm/r/n/selectOffClassChart.do")
	public String selectOffClassChart(ClassVO classVO, ModelMap model, LoginVO sessionVO) throws Exception {
		
		classVO.setUsrId(sessionVO.getUsrId());
		Map<String, Object> rslt = offClassMentoService.selectOffClassChart(classVO);
		
		model.addAttribute("rslt", rslt);
		
		model.addAttribute("alevel", "1");
		model.addAttribute("blevel", "1");
		model.addAttribute("clevel", "1");
		
		return "/mento/offclass/userChart";
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
	@RequestMapping(value="/offclassm/r/n/selectMentoPayUserList.do")
	public String selectMentoPayUserList(PayVO payVO, ModelMap model, LoginVO sessionVO) throws Exception {
		
		Map<String, Object> rsltMap = offClassMentoService.selectMentoPayUserList(payVO);
		model.addAttribute("rslt", rsltMap);
		model.addAttribute("payVO", payVO);
		
		return "/mento/offclass/payUserListAjax";
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
	@RequestMapping(value="/offclassm/r/n/selectMentoJjimUserList.do")
	public String selectMentoJjimUserList(JjimVO jjimVO, ModelMap model, LoginVO sessionVO) throws Exception {
		
		Map<String, Object> rsltMap = offClassMentoService.selectMentoJjimUserList(jjimVO);
		model.addAttribute("rslt", rsltMap);
		model.addAttribute("payVO", jjimVO);
		
		return "/mento/offclass/jjimUserListAjax";
	}
	
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
	@RequestMapping(value = "/offclassm/r/m/selectOffClassList.do")
	public String selectClassMngList(@ModelAttribute("classVO") ClassVO classVO, ModelMap model, LoginVO sessionVO) throws Exception {
		classVO.setUsrId(sessionVO.getUsrId());
		classVO.setMentoGb("Y");
		Map<String, Object> rslt = offClassMentoService.selectClassList(classVO);
		model.addAttribute("rslt", rslt);
		
		model.addAttribute("alevel", "1");
		model.addAttribute("blevel", "2");
		model.addAttribute("clevel", "1");
		return "/mento/offclass/offClassList";
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
	@RequestMapping(value = "/offclassm/r/n/selectOffClassDetail.do")
	public String selectOffClassDetail(ClassVO classVO, ModelMap model) throws Exception {
		ClassVO resultVO = classManageService.selectClassMngDetail(classVO);
		model.addAttribute("resultVO", resultVO);
		
		model.addAttribute("alevel", "1");
		model.addAttribute("blevel", "2");
		model.addAttribute("clevel", "1");
		return "/mento/offclass/offClassDetail";
	}
	
}

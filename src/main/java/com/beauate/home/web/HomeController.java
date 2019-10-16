package com.beauate.home.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.admin.code.service.CodeDao;
import com.beauate.admin.code.service.CodeVO;
import com.beauate.common.GlobalConstants;
import com.beauate.login.service.LoginVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * * 프로그램 정보 *
 * 1. Package	: com.beauate.home.web
 * 2. FileName	: HomeController.java
 * 3. 작성자		: 신호석
 * 4. 작성일		: 2019. 9. 20. 오후 1:48:35
 * 5. 설명		: 홈 controller
 * 6. 수정이력
 * @
 * @  수정일					  수정자			  수정내용
 * @ -------------   ---------   -------------------------------
 * @  2019. 9. 20.	 신호석			  최초생성
 */
@Controller
public class HomeController {
	protected Log log = LogFactory.getLog(this.getClass());

//	@Resource(name = "classService")
//	private ClassService classService;

//	@Resource(name = "payService")
//	private PayService payService;

	@Resource(name="codeDao")
	private CodeDao codeDao;
	
//	@Resource(name="bannerDao")
//	private BannerDao bannerDao;
	/** 
	 * 설명 :  홈 메인 페이지 화면
	 * @param homeVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 * @return String
	*/
	@RequestMapping(value="/home/a/n/main.do")
	public String main(@ModelAttribute("classVO") ClassVO classVO, LoginVO sessionVO, ModelMap model ) throws Exception{

		//메인, 카테고리 공통 - 카테고리 리스트
		List<CodeVO> classCategoryList = codeDao.selectScodeList(GlobalConstants.CLASS_CATEGORY_CODE);
		model.addAttribute("classCategoryList", classCategoryList);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(1);
		paginationInfo.setRecordCountPerPage(4);
		paginationInfo.setPageSize(1);
		classVO.setSortSubject("classListTop");
		classVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		classVO.setLastIndex(paginationInfo.getLastRecordIndex());
		classVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
//		List<ClassVO> classListTop = classService.selectClassList(classVO);
//		model.addAttribute("classListTop", classListTop);
		
		return "/home/main";
	}
}

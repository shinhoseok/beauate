package com.beauate.cls.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.admin.code.service.CodeDao;
import com.beauate.admin.code.service.CodeVO;
import com.beauate.cls.service.ClassService;
import com.beauate.common.GlobalConstants;
import com.beauate.login.service.LoginVO;
import com.beauate.pay.service.PayService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ClassController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "classService")
	private ClassService classService;
	
	@Resource(name = "payService")
	private PayService payService;

	@Resource(name="codeDao")
	private CodeDao codeDao;
	
	@RequestMapping(value= {"/class/a/t/classList.do","/class/a/t/classListDtl.do"})
	public String userInsert(HttpServletRequest request, @ModelAttribute("classVO") ClassVO classVO, LoginVO sessionVO, ModelMap model ) throws Exception{

		//클래스리스트의 상단 중단 하단을 각각 가져온다. 하단뷰에서만 페이징 필요함. 나머지는 그냥 쿼리용
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();

		if(StringUtils.isEmpty(classVO.getClassCtSt())) {
			model.addAttribute("classCtSt", classVO.getClassCtSt());
		}
		String url = request.getRequestURI();
		if(url.indexOf("ListDtl.do")==-1){
			List<CodeVO> classCategoryList = codeDao.selectScodeList(GlobalConstants.CLASS_CATEGORY_CODE);
			model.addAttribute("classCategoryList", classCategoryList);
			List<CodeVO> classAreaList = codeDao.selectScodeList(GlobalConstants.AREA_CODE);
			model.addAttribute("classAreaList", classAreaList);
			
			paginationInfo.setCurrentPageNo(1);
			paginationInfo.setRecordCountPerPage(4);
			paginationInfo.setPageSize(1);
			classVO.setSortSubject("classListTop");
			classVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
			classVO.setLastIndex(paginationInfo.getLastRecordIndex());
			classVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			List<ClassVO> classListTop = classService.selectClassList(classVO);
			model.addAttribute("classListTop", classListTop);
			
	
			paginationInfo.setCurrentPageNo(1);
			paginationInfo.setRecordCountPerPage(8);
			paginationInfo.setPageSize(1);
			classVO.setSortSubject("classListHurry");
			classVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
			classVO.setLastIndex(paginationInfo.getLastRecordIndex());
			classVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			List<ClassVO> classListHurry = classService.selectClassList(classVO);
			model.addAttribute("classListHurry", classListHurry);
		}

		paginationInfo.setCurrentPageNo(classVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(classVO.getPageUnit());
		paginationInfo.setPageSize(classVO.getPageSize());
		classVO.setSortSubject("classListBottom");
		classVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		classVO.setLastIndex(paginationInfo.getLastRecordIndex());
		classVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		List<ClassVO> classListBottom = null;
		//총 카운트 
		int cnt = classService.selectClassListCnt(classVO);
		paginationInfo.setTotalRecordCount(cnt);
		if(cnt > 0){
			classListBottom = classService.selectClassList(classVO);
		}
		model.addAttribute("classListBottom", classListBottom);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("classListBottomCnt", cnt);
		
		if(url.indexOf("ListDtl.do")>-1){
    		return "/class/lists/classBottomList";
    	}else{
    		return "/class/classList";
    	}		
	}
}

package com.beauate.cls.web;

import java.util.Date;
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
import org.springframework.web.bind.support.SessionStatus;

import com.beauate.admin.banner.service.BannerDao;
import com.beauate.admin.banner.service.BannerVO;
import com.beauate.admin.classmng.service.ClassReviewVO;
import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.admin.code.service.CodeDao;
import com.beauate.admin.code.service.CodeVO;
import com.beauate.admin.user.service.UserVO;
import com.beauate.cls.service.ClassService;
import com.beauate.common.GlobalConstants;
import com.beauate.login.service.LoginVO;
import com.beauate.pay.service.PayDao;
import com.beauate.pay.service.PayVO;
import com.beauate.user.service.UserService;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ClassController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "classService")
	private ClassService classService;
	
	@Resource(name="codeDao")
	private CodeDao codeDao;
	
	@Resource(name="bannerDao")
	private BannerDao bannerDao;
	
	@Resource(name="payDao")
	private PayDao payDao;

	@Resource(name="payIdGnrService")
	private EgovIdGnrService payIdGnrService;

	@Resource(name="propertiesService")
	private EgovPropertyService propertiesService;

	@Resource(name = "userService")
	private UserService userService;
	
	@SuppressWarnings("unused")
	@RequestMapping(value= {"/class/a/t/classList.do","/class/a/t/classListDtl.do","/class/a/t/classMainList.do"})
	public String classList(HttpServletRequest request, @ModelAttribute("classVO") ClassVO classVO, LoginVO sessionVO, ModelMap model ) throws Exception{

		//클래스리스트의 상단 중단 하단을 각각 가져온다. 하단뷰에서만 페이징 필요함. 나머지는 그냥 쿼리용
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();

		if(!StringUtils.isEmpty(classVO.getClassCtSt())) {
			model.addAttribute("classCtSt", classVO.getClassCtSt());
		}
		String url = request.getRequestURI();
		if(url.indexOf("ListDtl.do")==-1){
			//메인, 카테고리 공통 - 카테고리 리스트
			List<CodeVO> classCategoryList = codeDao.selectScodeList(GlobalConstants.CLASS_CATEGORY_CODE);
			model.addAttribute("classCategoryList", classCategoryList);
			
			//메인, 카테고리 공통 - 지역 리스트
			List<CodeVO> classAreaList = codeDao.selectScodeList(GlobalConstants.AREA_CODE);
			model.addAttribute("classAreaList", classAreaList);
			
			//메인, 카테고리 공통 - 스페셜 멘토 리스트
			BannerVO bannerParam = new BannerVO();
			bannerParam.setBannerLoc(GlobalConstants.BANNER_SPECIAL_LEFT);
			List<BannerVO> specialMentorList = bannerDao.selectBannerList(bannerParam);
			model.addAttribute("specialMentorList", specialMentorList);
			
			//메인 - 상단 헤어 리스트
			paginationInfo.setCurrentPageNo(1);
			paginationInfo.setRecordCountPerPage(8);
			paginationInfo.setPageSize(1);
			ClassVO mainparam1 = new ClassVO();
			mainparam1.setClassCtSt(String.valueOf(GlobalConstants.CLASS_CATEGORY_HAIR));
			mainparam1.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
			mainparam1.setLastIndex(paginationInfo.getLastRecordIndex());
			mainparam1.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			List<ClassVO> classHairList = classService.selectClassList(mainparam1);
			model.addAttribute("classHairList", classHairList);
			
			//메인 - 상단 메이크업 리스트
			paginationInfo.setCurrentPageNo(1);
			paginationInfo.setRecordCountPerPage(8);
			paginationInfo.setPageSize(1);
			ClassVO mainparam2 = new ClassVO();
			mainparam2.setClassCtSt(String.valueOf(GlobalConstants.CLASS_CATEGORY_MAKEUP));
			mainparam2.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
			mainparam2.setLastIndex(paginationInfo.getLastRecordIndex());
			mainparam2.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			List<ClassVO> classMakeuprList = classService.selectClassList(mainparam2);
			model.addAttribute("classMakeuprList", classMakeuprList);
			
			//메인, 카테고리 공통 - 브랜디픽(롱배너) 리스트
			bannerParam.setBannerLoc(GlobalConstants.BANNER_LONG_BANNER);
			List<BannerVO> longBannerList = bannerDao.selectBannerList(bannerParam);
			model.addAttribute("longBannerList", longBannerList);

			if(classVO == null) {
				classVO = new ClassVO();
			}
			if(classVO.getClassCtSt()==null) {
				classVO.setClassCtSt("0");
			}
			//카테고리 - 상단 좌
			switch(classVO.getClassCtSt()) {
			case GlobalConstants.CLASS_CATEGORY_HAIR :
				bannerParam.setBannerLoc(GlobalConstants.BANNER_CATEGORY_SPECIAL_MENTOR_HAIR);
				break;
			case GlobalConstants.CLASS_CATEGORY_MAKEUP :
				bannerParam.setBannerLoc(GlobalConstants.BANNER_CATEGORY_SPECIAL_MENTOR_MAKEUP);
				break;
			case GlobalConstants.CLASS_CATEGORY_EYELASHES :
				bannerParam.setBannerLoc(GlobalConstants.BANNER_CATEGORY_SPECIAL_MENTOR_EYELASHES);
				break;
			case GlobalConstants.CLASS_CATEGORY_WAXING :
				bannerParam.setBannerLoc(GlobalConstants.BANNER_CATEGORY_SPECIAL_MENTOR_WAXING);
				break;
			case GlobalConstants.CLASS_CATEGORY_NAIL :
				bannerParam.setBannerLoc(GlobalConstants.BANNER_CATEGORY_SPECIAL_MENTOR_NAIL);
				break;
			case GlobalConstants.CLASS_CATEGORY_ETC :
				bannerParam.setBannerLoc(GlobalConstants.BANNER_CATEGORY_SPECIAL_MENTOR_ETC);
				break;
				default:
			}
			List<BannerVO> categorySpecialMentorList = bannerDao.selectBannerList(bannerParam);
			model.addAttribute("categorySpecialMentorList", categorySpecialMentorList);
			
			paginationInfo.setCurrentPageNo(1);
			paginationInfo.setRecordCountPerPage(4);
			paginationInfo.setPageSize(1);
			classVO.setSortSubject("classListTop");
			classVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
			classVO.setLastIndex(paginationInfo.getLastRecordIndex());
			classVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			List<ClassVO> classListTop = classService.selectClassList(classVO);
			model.addAttribute("classListTop", classListTop);

			//카테고리 - 중단 베스트 클래스
			switch(classVO.getClassCtSt()) {
			case GlobalConstants.CLASS_CATEGORY_HAIR :
				bannerParam.setBannerLoc(GlobalConstants.BANNER_BEST_CLASS_HAIR);
				break;
			case GlobalConstants.CLASS_CATEGORY_MAKEUP :
				bannerParam.setBannerLoc(GlobalConstants.BANNER_BEST_CLASS_MAKEUP);
				break;
			case GlobalConstants.CLASS_CATEGORY_EYELASHES :
				bannerParam.setBannerLoc(GlobalConstants.BANNER_BEST_CLASS_EYELASHES);
				break;
			case GlobalConstants.CLASS_CATEGORY_WAXING :
				bannerParam.setBannerLoc(GlobalConstants.BANNER_BEST_CLASS_WAXING);
				break;
			case GlobalConstants.CLASS_CATEGORY_NAIL :
				bannerParam.setBannerLoc(GlobalConstants.BANNER_BEST_CLASS_NAIL);
				break;
			case GlobalConstants.CLASS_CATEGORY_ETC :
				bannerParam.setBannerLoc(GlobalConstants.BANNER_BEST_CLASS_ETC);
				break;
				default:
			}
			List<BannerVO> categoryBestClassList = bannerDao.selectBannerList(bannerParam);
			model.addAttribute("categoryBestClassList", categoryBestClassList);
			
			//카테고리 - 중단, 마감임박리스트
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
    	}else if(url.indexOf("classMainList.do")>-1){
    		return "/class/classMainList";
    	}else{
    		return "/class/classList";
    	}		
	}

	@RequestMapping(value= {"/class/a/t/classDetail.do"})
	public String classSelect(HttpServletRequest request, @ModelAttribute("classVO") ClassVO classVO, LoginVO sessionVO, ModelMap model ) throws Exception{
		List<ClassVO> classList = classService.selectClassList(classVO);
		if(classList.size()==0) {
			model.addAttribute("cls", null);
		}else {
			classVO = classList.get(0);
			ClassReviewVO reviewForException = null;
			String scoAvr = "";
			double sco1 = 0.0d;
			double sco2 = 0.0d;
			double sco3 = 0.0d;
			double sco4 = 0.0d;
			try {
				for(ClassReviewVO review : classVO.getClassReviewList()) {
					reviewForException = review;
					sco1 += Double.parseDouble(review.getSco1());
					sco2 += Double.parseDouble(review.getSco2());
					sco3 += Double.parseDouble(review.getSco3());
					sco4 += Double.parseDouble(review.getSco4());
				}
				sco1 = sco1 / classVO.getClassReviewList().size();
				sco2 = sco2 / classVO.getClassReviewList().size();
				sco3 = sco3 / classVO.getClassReviewList().size();
				sco4 = sco4 / classVO.getClassReviewList().size();
			}catch(Exception e) {
				log.error("=======ST "+e.getMessage()+" "+classVO.getClassId()+"클래스의 코멘트의 sco1~4중에 숫자가 아닌게 있음.");
				log.error("=======ST "+e.getMessage()+" reviewForException!=null:"+reviewForException!=null);
				if(reviewForException!=null) {
					log.error("=======ST "+e.getMessage()+" reviewForException.getSco1():"+reviewForException.getSco1());
					log.error("=======ST "+e.getMessage()+" reviewForException.getSco2():"+reviewForException.getSco2());
					log.error("=======ST "+e.getMessage()+" reviewForException.getSco3():"+reviewForException.getSco3());
					log.error("=======ST "+e.getMessage()+" reviewForException.getSco4():"+reviewForException.getSco4());
				}
				e.printStackTrace();
				log.error("=======ED "+e.getMessage()+" ");
			}
			scoAvr = Double.toString(Double.isNaN((sco1+sco2+sco3+sco4)/4.0d) ? 0 : (sco1+sco2+sco3+sco4)/4.0d);
			
			model.addAttribute("scoAvr",scoAvr);
			model.addAttribute("sco1", Double.toString(Double.isNaN(sco1) ? 0 : sco1/5*100));
			model.addAttribute("sco2", Double.toString(Double.isNaN(sco2) ? 0 : sco2/5*100));
			model.addAttribute("sco3", Double.toString(Double.isNaN(sco3) ? 0 : sco3/5*100));
			model.addAttribute("sco4", Double.toString(Double.isNaN(sco4) ? 0 : sco4/5*100));
			model.addAttribute("cls", classVO);
			model.addAttribute("discountPercent", propertiesService.getString("discountPercent"));
		}
		return "/class/classDetail";
    			
	}
	
	@RequestMapping(value= {"/class/r/t/classRegist.do"})
	public String classRegist(HttpServletRequest request, @ModelAttribute("payVO")PayVO payVO, @ModelAttribute("classVO") ClassVO classVO, LoginVO sessionVO, ModelMap model ) throws Exception{
		List<ClassVO> classList = classService.selectClassList(classVO);
		if(classList.size()==0) {
			model.addAttribute("cls", null);
		}else {
			classVO = classList.get(0);
			model.addAttribute("cls", classVO);
			model.addAttribute("discountPercent", propertiesService.getString("discountPercent"));
		}
		return "/class/classRegist";
	}

	@RequestMapping(value= {"/class/w/n/classRegistProc.do"})
	public String classRegistProc(SessionStatus status, HttpServletRequest request, @ModelAttribute("payVO") PayVO payVO, LoginVO sessionVO, ModelMap model ) throws Exception{

		String redirectUrl = "/class/r/t/classRegistComplete.do";
		String message = "";
		boolean isValid = true;
		//TODO 결제 중복 체크를 해줘야함.
		ClassVO classVO = new ClassVO();
		classVO.setClassId(payVO.getcSq());
		List<ClassVO> classList = classService.selectClassList(classVO);
		if(classList.size()==0) {
			redirectUrl = "";
			message += "현재 서비스가 원활하지 않습니다.\n잠시후 다시 이용해 주십시요.\n(클래스 정보가 없습니다.)\n"; //클래스가 없다.
			isValid = false;
		}
		UserVO userVO = new UserVO();
		userVO.setUsrId(payVO.getuSq());;
		userVO = userService.selectUser(userVO);
		if(userVO == null) {
			redirectUrl = "";
			message += "현재 서비스가 원활하지 않습니다.\n잠시후 다시 이용해 주십시요.\\n(사용자 정보가 없습니다.)\n"; //유저가 없다.
			isValid = false;
		}
		List<PayVO> chkDuplicatePay = payDao.selectPayByUsrSqAndClsSq(payVO); //pay의 사용자id와 클래스id의 유일성이 보장안되기 때문에 List로 받아서 로직에서 검증해야함.
		if(chkDuplicatePay!=null && chkDuplicatePay.size()>0) {
			redirectUrl = "";
			message += "이미 결제한 클래스입니다.\n"; //중복결제 방지
			isValid = false;
		}
		if(!isValid) {
			model.addAttribute("redirectUrl", redirectUrl);
			model.addAttribute("message", message);
			return "jsonView";
		}
		payVO.setPayDt(new Date());
		payVO.setPaySq(payIdGnrService.getNextStringId());
		payDao.insertPay(payVO);
		redirectUrl+="?paySq="+payVO.getPaySq();
		status.setComplete();
		message = "결제가 완료되었습니다.";
		model.addAttribute("redirectUrl", redirectUrl);
		model.addAttribute("message", message);
		
		return "jsonView";
	}

	@RequestMapping(value= {"/class/r/t/classRegistComplete.do"})
	public String classRegistComplete(HttpServletRequest request, @ModelAttribute("payVO")PayVO payVO, @ModelAttribute("classVO") ClassVO classVO, LoginVO sessionVO, ModelMap model ) throws Exception{

		payVO = payDao.selectPayByPaySq(payVO);
		model.addAttribute("pay", payVO);
		model.addAttribute("discountPercent", propertiesService.getString("discountPercent"));
		
		return "/class/classRegistComplete";
	}

}

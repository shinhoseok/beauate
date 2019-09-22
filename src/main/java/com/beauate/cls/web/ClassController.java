package com.beauate.cls.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.admin.user.service.UserVO;
import com.beauate.cls.service.ClassService;
import com.beauate.login.service.LoginVO;
import com.beauate.pay.service.PayService;

@Controller
public class ClassController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "classService")
	private ClassService classService;
	
	@Resource(name = "payService")
	private PayService payService;
	
	@RequestMapping(value="/class/a/t/classList.do")
	public String userInsert(@ModelAttribute("userVO") UserVO userVO, LoginVO sessionVO, ModelMap model ) throws Exception{
		List<ClassVO> classList = classService.selectClassList();
		model.addAttribute("classList", classList);
		return "/class/classList";
	}
}

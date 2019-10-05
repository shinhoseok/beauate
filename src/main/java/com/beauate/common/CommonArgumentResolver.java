package com.beauate.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.beauate.login.service.LoginVO;

/********************************************************************************
 * <PRE> * 프로그램 정보 *
 * 1. FileName	: CommonArgumentResolver.java
 * 2. 작성자		: 신호석
 * 3. 작성일		: 2019. 7. 17. 오후 2:23:37
 * 4. 설명		: CommonArgumentResolver는 Controller 메소드의 argument중에 sessionVO이라는 VO 객체가 있다면 세팅해준다
 * 5. 수정이력
 * @
 * @  수정일					  수정자			  수정내용
 * @ -------------		---------	-------------------------------
 * @  2019. 7. 17.		신호석		최초생성
 * </PRE>
 * Copyright (C) by BEAUATE All right reserved.
 ********************************************************************************/

public class CommonArgumentResolver implements HandlerMethodArgumentResolver{
	
	 /**
	 * <PRE>
	 * 1. MethodName	: resolveArgument
	 * 2. ClassName		: CommonArgumentResolver
	 * 3. Commnet		: 컨트롤러 메소드 아규먼트에 sessionVO가 있으면 세션에서 꺼내서 세팅해준다.
	 * 4. 작성자		: 신호석
	 * 5. 작성일		: 2019. 7. 17. 오후 2:22:43
	 * </PRE>
	 * 		@param methodParameter
	 * 		@param webRequest
	 * 		@return
	 * 		@throws Exception
	 */
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return LoginVO.class.isAssignableFrom(parameter.getParameterType());
	}
 
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		Class<?> clazz = parameter.getParameterType();
		String paramName = parameter.getParameterName();
		if(clazz.equals(LoginVO.class) && paramName.equals("sessionVO")){			
			HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();  
			return request.getSession().getAttribute(GlobalConstants.LOGIN_SESSION_KEY);
		}
		return null;
	}
}
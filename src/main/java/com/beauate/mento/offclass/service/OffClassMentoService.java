package com.beauate.mento.offclass.service;

import java.util.Map;

import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.jjim.service.JjimVO;
import com.beauate.pay.service.PayVO;

public interface OffClassMentoService {
	/**
	 * <pre>
	 * 1. 개요 : 오프라인 클래스 리스트
	 * 2. 처리내용 :  오프라인 클래스 클래스 리스트
	 * </pre>
	 * @Method Name : selectClassList
	 * @date : 2019. 9. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param classVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectClassList(ClassVO classVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 클래스관리 통계
	 * 2. 처리내용 :  클래스관리 통계
	 * </pre>
	 * @Method Name : selectClassList
	 * @date : 2019. 9. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param classVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectOffClassChart(ClassVO classVO) throws Exception;
	
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
	 * @param jjimVO
	 * @return void
	 * @throws Exception
	 */ 
	public Map<String, Object> selectMentoJjimUserList(JjimVO jjimVO) throws Exception;
	
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
	public Map<String, Object> selectMentoPayUserList(PayVO payVO) throws Exception;
}

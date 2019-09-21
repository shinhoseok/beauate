package com.beauate.admin.code.service;

import java.util.List;

import org.springframework.ui.ModelMap;

public interface CodeManageService {
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 리스트 조회
	 * 2. 처리내용 : 공통코드 대분류 리스트 조회
	 * </pre>
	 * @Method Name : selectCodeManageList
	 * @date : 2019. 5. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 16.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @param model
	 * @throws Exception
	 */ 	
	public void selectCodeManageList(CodeVO codeVO, ModelMap model) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 상세, 소분류 리스트
	 * 2. 처리내용 : 소분류 조회
	 * </pre>
	 * @Method Name : selectMcodeList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	public List<CodeVO> selectMcodeList(CodeVO codeVO, ModelMap model) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 상세, 소분류 리스트
	 * 2. 처리내용 : 대분류 조회
	 * </pre>
	 * @Method Name : selectLCodeView
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	public CodeVO selectLCodeView(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 상세 수정, 소분류 입력&수정&삭제
	 * 2. 처리내용 : 공통코드 대분류 상세 수정, 소분류 입력&수정&삭제
	 * </pre>
	 * @Method Name : updateMList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @throws Exception
	 */ 	
	public void updateMList(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 입력화면 저장
	 * 2. 처리내용 : 공통코드 대분류 입력화면 저장
	 * </pre>
	 * @Method Name : insertCodeManageList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @throws Exception
	 */ 	
	public void insertCodeManageList(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 소분류 조회
	 * 2. 처리내용 : 공통코드 소분류 조회
	 * </pre>
	 * @Method Name : selectLastcodeView
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	public CodeVO selectLastcodeView(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 소분류 상세화면 수정
	 * 2. 처리내용 : 공통코드 소분류 상세화면 수정
	 * </pre>
	 * @Method Name : updateSCode
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @throws Exception
	 */ 	
	public void updateSCode(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 중복체크
	 * 2. 처리내용 : 공통코드 대분류 중복체크
	 * </pre>
	 * @Method Name : lclsCdChk
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	public int lclsCdChk(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 소분류 중복체크 
	 * 2. 처리내용 : 공통코드 소분류 중복체크
	 * </pre>
	 * @Method Name : mclsCdChk
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	public int mclsCdChk(CodeVO codeVO) throws Exception;
}

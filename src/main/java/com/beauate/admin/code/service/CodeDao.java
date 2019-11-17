package com.beauate.admin.code.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("codeDao")
public interface CodeDao {
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 리스트 조회
	 * 2. 처리내용 : 공통코드 대분류 리스트 조회
	 * </pre>
	 * @Method Name : selectCodeManageList
	 * @date : 2019. 5. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 16.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	List<CodeVO> selectCodeManageList(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 리스트의 총 건수
	 * 2. 처리내용 : 공통코드 리스트의 총 건수
	 * </pre>
	 * @Method Name : selectCodeManageListCnt
	 * @date : 2019. 5. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 16.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	int selectCodeManageListCnt(CodeVO codeVO) throws Exception;

	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 상세, 소분류 리스트 총 건수
	 * 2. 처리내용 : 소분류 리스트 총 건수
	 * </pre>
	 * @Method Name : selectMcodeListCnt
	 * @date : 2019. 7. 1.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	-----------------------------------------------------------------------
	 *	2019. 7. 1.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	int selectMcodeListCnt(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 상세, 소분류 리스트
	 * 2. 처리내용 : 소분류 조회
	 * </pre>
	 * @Method Name : selectMcodeList
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	List<CodeVO> selectMcodeList(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 상세, 소분류 리스트
	 * 2. 처리내용 : 대분류 조회
	 * </pre>
	 * @Method Name : selectLCodeView
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	CodeVO selectLCodeView(CodeVO codeVO) throws Exception;;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 상세 수정, 소분류 입력&수정&삭제
	 * 2. 처리내용 : 대분류 수정
	 * </pre>
	 * @Method Name : updateLCode
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	int updateLCode(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 상세 수정, 소분류 입력&수정&삭제
	 * 2. 처리내용 : 소분류 입력
	 * </pre>
	 * @Method Name : insertMCodeManager
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	int insertMCodeManager(CodeVO codeVO) throws Exception;
	
	 /**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 상세 수정, 소분류 입력&수정&삭제
	 * 2. 처리내용 : 소분류 수정
	 * </pre>
	 * @Method Name : updateMCodeManager
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	int updateMCodeManager(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 상세 수정, 소분류 입력&수정&삭제
	 * 2. 처리내용 : 소분류 삭제
	 * </pre>
	 * @Method Name : deleteMCodeManager
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	int deleteMCodeManager(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 입력화면 저장
	 * 2. 처리내용 : 공통코드 대분류 입력화면 저장
	 * </pre>
	 * @Method Name : insertCodeManageList
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	int insertCodeManageList(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 소분류 조회
	 * 2. 처리내용 : 공통코드 소분류 조회
	 * </pre>
	 * @Method Name : selectLastcodeView
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	CodeVO selectLastcodeView(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 소분류 상세화면 수정
	 * 2. 처리내용 : 공통코드 소분류 상세화면 수정
	 * </pre>
	 * @Method Name : updateSCode
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	int updateSCode(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 대분류 중복체크
	 * 2. 처리내용 : 공통코드 대분류 중복체크
	 * </pre>
	 * @Method Name : lclsCdChk
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	int lclsCdChk(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 소분류 중복체크
	 * 2. 처리내용 : 공통코드 소분류 중복체크
	 * </pre>
	 * @Method Name : mclsCdChk
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	int mclsCdChk(CodeVO codeVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 대분류 코드에 의한 소분류 리스트
	 * 2. 처리내용 : 대분류 코드에 의한 소분류 리스트
	 * </pre>
	 * @Method Name : selectScodeList
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */ 	
	public List<CodeVO> selectScodeList(String lclsCd) throws Exception;
}

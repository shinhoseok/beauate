package com.beauate.common;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jxls.transformer.XLSTransformer;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class CommonExcelView extends AbstractExcelView {
	
	private static final String EXCEL_PATH = "egovframework/excel";
	
	/**
	 * <pre>
	 * 1. 개요 : 엑셀 다운로드
	 * 2. 처리내용 : 엑셀 다운로드
	 * </pre>
	 * @Method Name : buildExcelDocument
	 * @date : 2019. 6. 22.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 22.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @see org.springframework.web.servlet.view.document.AbstractExcelView#buildExcelDocument(java.util.Map, org.apache.poi.hssf.usermodel.HSSFWorkbook, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 * @param model
	 * @param workbook
	 * @param request
	 * @param response
	 * @throws Exception
	 */ 	
	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// model 에서 templateFileName, destFileName 가져오기
		String templateFileName = (String) model.get("templateFileName");
		String destFileName = (String) model.get("destFileName");

		XLSTransformer transformer = new XLSTransformer();
		
		InputStream is = new ClassPathResource(EXCEL_PATH + "/" + templateFileName).getInputStream();
		
		Workbook resultWorkbook = transformer.transformXLS(is, model);
		
		StringBuilder contentDisposition = new StringBuilder();
		contentDisposition.append("attachment;fileName=\"");
		contentDisposition.append(encodeFileName(destFileName) + ".xls");
		contentDisposition.append("\";");
		//브라우저 인식 파일확장자를 포함하여 모든 확장자의 파일들에 대해, 다운로드시 무조건 "파일 다운로드" 대화상자가 뜨도록 하는 헤더속성
		response.setHeader("Content-Disposition", contentDisposition.toString());
		// MIME 타입을 변경하고자 할 경우나 또는 캐릭터의 인코딩셋을 변경하고자 할때 setContentType 메소드를 사용
		response.setContentType("application/x-msexcel");
		resultWorkbook.write(response.getOutputStream());
	}

	private String encodeFileName(String filename) throws UnsupportedEncodingException {		
		return URLEncoder.encode(filename, "UTF-8");	
	}
}

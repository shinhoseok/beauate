package com.beauate.admin.code.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class CodeVO extends CommDefaultVO implements Serializable {
	/** 대분류ID  */
	private String lclsId;
	/** 대분류명  */
	private String lclsNm;
	/** 대분류코드  */
	private String lclsCd;
	/** 소분류ID  */
	private String mclsId;
	/** 소분류명  */
	private String mclsNm;
	/** 소분류코드  */
	private String mclsCd;
	/** 대분류 사용유무  */
	private String useYn;
	/** 소분류 사용유무  */
	private String useYn2;
	/** 소분류 대분류ID  */
	private String lclsId2;
	/** 대분류설명  */
	private String lclsEpl;
	/** 소분류설명  */
	private String mclsEpl;
	/** 소분류 수정구분  */
	private String mclsGubun;
	/** 소분류 순서  */
	private String ord;
	/** 코드  */
	private String code;
	/** 코드명  */
	private String codeNm;
	/** 코드중복체크  */
	private String codeIdsChk;
	
	@SuppressWarnings("unchecked")
	private List<CodeVO> codeList = LazyList.decorate(new ArrayList<CodeVO>(), FactoryUtils.instantiateFactory(CodeVO.class));

	public String getLclsId() {
		return lclsId;
	}

	public void setLclsId(String lclsId) {
		this.lclsId = lclsId;
	}

	public String getLclsNm() {
		return lclsNm;
	}

	public void setLclsNm(String lclsNm) {
		this.lclsNm = lclsNm;
	}

	public String getLclsCd() {
		return lclsCd;
	}

	public void setLclsCd(String lclsCd) {
		this.lclsCd = lclsCd;
	}

	public String getMclsId() {
		return mclsId;
	}

	public void setMclsId(String mclsId) {
		this.mclsId = mclsId;
	}

	public String getMclsNm() {
		return mclsNm;
	}

	public void setMclsNm(String mclsNm) {
		this.mclsNm = mclsNm;
	}

	public String getMclsCd() {
		return mclsCd;
	}

	public void setMclsCd(String mclsCd) {
		this.mclsCd = mclsCd;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getUseYn2() {
		return useYn2;
	}

	public void setUseYn2(String useYn2) {
		this.useYn2 = useYn2;
	}

	public String getLclsId2() {
		return lclsId2;
	}

	public void setLclsId2(String lclsId2) {
		this.lclsId2 = lclsId2;
	}

	public String getLclsEpl() {
		return lclsEpl;
	}

	public void setLclsEpl(String lclsEpl) {
		this.lclsEpl = lclsEpl;
	}

	public String getMclsEpl() {
		return mclsEpl;
	}

	public void setMclsEpl(String mclsEpl) {
		this.mclsEpl = mclsEpl;
	}

	public String getMclsGubun() {
		return mclsGubun;
	}

	public void setMclsGubun(String mclsGubun) {
		this.mclsGubun = mclsGubun;
	}

	public String getOrd() {
		return ord;
	}

	public void setOrd(String ord) {
		this.ord = ord;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCodeNm() {
		return codeNm;
	}

	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}

	public String getCodeIdsChk() {
		return codeIdsChk;
	}

	public void setCodeIdsChk(String codeIdsChk) {
		this.codeIdsChk = codeIdsChk;
	}

	public List<CodeVO> getCodeList() {
		return codeList;
	}

	public void setCodeList(List<CodeVO> codeList) {
		this.codeList = codeList;
	}
}

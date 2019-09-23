package com.beauate.common;

import java.text.MessageFormat;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

public class FrontPaginationRenderer extends AbstractPaginationRenderer {
	public FrontPaginationRenderer() {
		firstPageLabel = "";
		previousPageLabel = "<button type=\"button\" class=\"btn-prev {2}\" onclick=\"{0}({1}); return false;\"><span>이전</span></button><ul>";
		currentPageLabel = "<li class=\"active\"><span>{0}</span></li>";
		otherPageLabel = "<li><a href=\"#\" onclick=\"{0}({1}); return false;\">{1}</a></li>";
		nextPageLabel = "</ul><button type=\"button\" class=\"btn-next {2}\" onclick=\"{0}({1}); return false;\"><span>다음</span></button>";
		lastPageLabel = "";
	}
	@Override
	public String renderPagination(PaginationInfo paginationInfo,String jsFunction){
		StringBuffer strBuff = new StringBuffer();
        int firstPageNoOnPageList = paginationInfo.getFirstPageNoOnPageList();
        int totalPageCount = paginationInfo.getTotalPageCount();
		int pageSize = paginationInfo.getPageSize();
		int currentPageNo = paginationInfo.getCurrentPageNo();
		int pageUnit = paginationInfo.getRecordCountPerPage();
		int recordCount = paginationInfo.getTotalRecordCount();
		int viewCount = currentPageNo*pageUnit;
		
		if(viewCount >= recordCount)viewCount = recordCount;
		if(currentPageNo == 1) strBuff.append(MessageFormat.format(previousPageLabel,new Object[]{jsFunction,Integer.toString(currentPageNo-1), "off"}));
		if(currentPageNo > 1) strBuff.append(MessageFormat.format(previousPageLabel,new Object[]{jsFunction,Integer.toString(currentPageNo-1), "on"}));
		
		if(currentPageNo > 2) strBuff.append(MessageFormat.format(otherPageLabel,new Object[]{jsFunction, Integer.toString(currentPageNo-2)}));
		if(currentPageNo > 1) strBuff.append(MessageFormat.format(otherPageLabel,new Object[]{jsFunction, Integer.toString(currentPageNo-1)}));
		strBuff.append(MessageFormat.format(currentPageLabel,new Object[]{Integer.toString(currentPageNo)}));
		if(totalPageCount-currentPageNo>0)strBuff.append(MessageFormat.format(otherPageLabel,new Object[]{jsFunction, Integer.toString(firstPageNoOnPageList+1)}));
		if(totalPageCount-currentPageNo>1)strBuff.append(MessageFormat.format(otherPageLabel,new Object[]{jsFunction, Integer.toString(firstPageNoOnPageList+2)}));
		if(currentPageNo < totalPageCount) strBuff.append(MessageFormat.format(nextPageLabel,new Object[]{jsFunction,Integer.toString(currentPageNo+1), "on"}));
		if(currentPageNo == totalPageCount) strBuff.append(MessageFormat.format(nextPageLabel,new Object[]{jsFunction,Integer.toString(currentPageNo+1), "off"}));

		return strBuff.toString();
	}
}

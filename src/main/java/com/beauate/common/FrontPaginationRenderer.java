package com.beauate.common;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class FrontPaginationRenderer extends AbstractPaginationRenderer {
	public FrontPaginationRenderer() {
		firstPageLabel = "";
		previousPageLabel = "<button type=\"button\" class=\"btn-prev\" onclick=\"{0}({1}); return false;\"><span>이전</span></button>";
		currentPageLabel = "<li class=\"active\"><span>{0}<span></li>";
		otherPageLabel = "<li><a href=\"#\" onclick=\"{0}({1}); return false;\">{1}</an></li>";
		nextPageLabel = "<button type=\"button\" class=\"btn-next\" onclick=\"{0}({1}); return false;\"><span>다음</span></button>";
		lastPageLabel = "";
	}

}

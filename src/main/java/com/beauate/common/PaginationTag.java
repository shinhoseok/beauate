package com.beauate.common;

import java.io.IOException;

import org.springframework.web.servlet.tags.RequestContextAwareTag;

public final class PaginationTag extends RequestContextAwareTag {

	private static final long serialVersionUID = 1L;

	/** 총건수 */
	private int totalCount = 0;
	/** 페이지번호 */
	private int pageNo = 1;
	/** 페이지사이즈 */
	private int pageSize = 5;
	/** 총페이지 */
	private int totalPage = 0;
	/** Display 페이지 수 */
	private int displayPageCount = 5;
	private String clickPage = "";
//	private String imgPath = "";
	
	public void setClickPage(String clickPage) {
		this.clickPage = clickPage;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setDisplayPageCount(int displayPageCount) {
		this.displayPageCount = displayPageCount;
	}
//	public void setImgPath(String imgPath) {
//		this.imgPath = imgPath;
//	}

	@Override
	protected int doStartTagInternal() throws Exception {
		drawPaging();
		return SKIP_BODY;
	}

	private void drawPaging() throws IOException {
		this.totalPage = (this.totalCount / this.pageSize) + ((this.totalCount*1.0) % (this.pageSize*1.0) > 0 ? 1 : 0);
		int curPos = (this.pageNo / this.displayPageCount) + ((this.pageNo*1.0) % (this.displayPageCount*1.0) > 0 ? 1 : 0);
		int prevPage = curPos > 1 ? (curPos - 1) * this.displayPageCount : 0;
		int nextPage = (curPos * this.displayPageCount +1) <= this.totalPage ? curPos * this.displayPageCount + 1 : 0;
		
		int start =((this.pageNo / this.displayPageCount) + ((this.pageNo*1.0) % (this.displayPageCount*1.0) > 0 ? 1 : 0)) * this.displayPageCount - (this.displayPageCount -1);
		int end = ((this.pageNo / this.displayPageCount) + ((this.pageNo*1.0) % (this.displayPageCount*1.0) > 0 ? 1 : 0)) * this.displayPageCount ;
		
		if(end > this.totalPage) {
			end = this.totalPage;
		}
		//이미지 사용시
		/*
		 * HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		 * String contextPath = request.getContextPath(); String strWebDir = contextPath
		 * + "/contents/images/";
		 */
		StringBuffer sb = new StringBuffer();
		
		if(start > end) {
			sb.append("<a href='#' title='맨 앞으로' class='pprev'></a>");
		} else {
			sb.append("<a href='javascript:"+ clickPage +"(1)' title='맨 앞으로' class='pprev'></a>");
		}
		
		if(this.pageNo > this.displayPageCount) {
			sb.append("<a href='javascript:"+ clickPage + "(" + prevPage + ")" + "' title='이전' class='prev'></a>");
		} else {
			sb.append("<a href='#' title='이전' class='prev'></a>");
		}
		
		sb.append("<span>");
		if( start > end ){
			sb.append("<a href='#' class='active'>1</a>");
		}else{
			for(int i=start ; i<=end ; i++) {
				if(i == this.pageNo) {
					sb.append("<a href='javascript:" + clickPage + "(" + i + ");' class='active'>" + i + "</a>");
				} else {
					sb.append("<a href='javascript:" + clickPage + "(" + i + ");'>" + i + "</a>");
				}
			}
		}
		sb.append("</span>");
		
		if(this.totalPage >= nextPage && nextPage != 0) {
			sb.append("<a href='javascript:"+ clickPage + "(" + nextPage + ")" + "' title='다음' class='next'></a>");
		} else {
			sb.append("<a href='#' title='다음' class='next'></a>");
		}
		
		if( start > end ) {
			sb.append("<a href='#' title='맨 뒤로' class='nnext'></a>");
		} else {
			sb.append("<a href='javascript:"+ clickPage + "(" + totalPage + ")" + "' title='맨 뒤로' class='nnext'></a>");
		}
		
		pageContext.getOut().write(sb.toString());
	}
}

package com.beauate.admin.board.service;

import java.io.Serializable;
import java.util.Date;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class BoardVO extends CommDefaultVO implements Serializable {
	/** 게시판번호 */
	private String postId;
	/** 게시글작성일 */
	private Date postDt;
	/** 카테고리 */
	private String postCategorySt;
	/** 제목 */
	private String postTitle;
	/** 서브타이틀 */
	private String postSubTitle;
	/** 내용 */
	private String postCtt;
	/** 이미지경로 */
	private String imgSrc;
	/** 사용자, 관리자구분 */
	private String adminYn;
	/** 이전글, 다음글 구분 */
	private String nextYn;
	
	public String getNextYn() {
		return nextYn;
	}
	public void setNextYn(String nextYn) {
		this.nextYn = nextYn;
	}
	public String getAdminYn() {
		return adminYn;
	}
	public void setAdminYn(String adminYn) {
		this.adminYn = adminYn;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	public Date getPostDt() {
		return postDt;
	}
	public void setPostDt(Date postDt) {
		this.postDt = postDt;
	}
	public String getPostCategorySt() {
		return postCategorySt;
	}
	public void setPostCategorySt(String postCategorySt) {
		this.postCategorySt = postCategorySt;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostSubTitle() {
		return postSubTitle;
	}
	public void setPostSubTitle(String postSubTitle) {
		this.postSubTitle = postSubTitle;
	}
	public String getPostCtt() {
		return postCtt;
	}
	public void setPostCtt(String postCtt) {
		this.postCtt = postCtt;
	}
}

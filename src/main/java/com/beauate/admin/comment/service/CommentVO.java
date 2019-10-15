package com.beauate.admin.comment.service;

import java.io.Serializable;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class CommentVO extends CommDefaultVO implements Serializable {
	/** 댓글순번 */
	private String commentId;
	/** 후기아이디 */
	private String reviewId;
	/** 댓글작성일 */
	private String commentDt;
	/** 댓글내용 */
	private String commentCtt;
	
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public String getCommentDt() {
		return commentDt;
	}
	public void setCommentDt(String commentDt) {
		this.commentDt = commentDt;
	}
	public String getCommentCtt() {
		return commentCtt;
	}
	public void setCommentCtt(String commentCtt) {
		this.commentCtt = commentCtt;
	}
}

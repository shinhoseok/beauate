package com.beauate.review.service;

import java.io.Serializable;

import com.beauate.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class ReviewVO extends CommDefaultVO implements Serializable {
	/** 리뷰아이디 */
	private String reviewId;
	/** 클래스아이디 */
	private String classId;
	/** 리뷰작성일 */
	private String reviewDt;
	/** 커리큘럼평점 */
	private String curriculum;
	/** 친절도평점 */
	private String kindness;
	/** 시간준수평점 */
	private String timePro;
	/** 전달력평점 */
	private String community;
	/** 후기내용 */
	private String reviewCtt;
	/** 삭제여부 */
	private String delYn;
	/** 관리자페이지여부(사용자/관리자 쿼리구분) */
	private boolean adminYn = false;
	/** 클래스제목 */
	private String classTitle;
	/** 코멘트아이디 */
	private String commentId;
	/** 댓글 */
	private String commentCtt;
	
	public String getCommentCtt() {
		return commentCtt;
	}
	public void setCommentCtt(String commentCtt) {
		this.commentCtt = commentCtt;
	}
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	public String getClassTitle() {
		return classTitle;
	}
	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}
	public boolean isAdminYn() {
		return adminYn;
	}
	public void setAdminYn(boolean adminYn) {
		this.adminYn = adminYn;
	}
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getReviewDt() {
		return reviewDt;
	}
	public void setReviewDt(String reviewDt) {
		this.reviewDt = reviewDt;
	}
	public String getCurriculum() {
		return curriculum;
	}
	public void setCurriculum(String curriculum) {
		this.curriculum = curriculum;
	}
	public String getKindness() {
		return kindness;
	}
	public void setKindness(String kindness) {
		this.kindness = kindness;
	}
	public String getTimePro() {
		return timePro;
	}
	public void setTimePro(String timePro) {
		this.timePro = timePro;
	}
	public String getCommunity() {
		return community;
	}
	public void setCommunity(String community) {
		this.community = community;
	}
	public String getReviewCtt() {
		return reviewCtt;
	}
	public void setReviewCtt(String reviewCtt) {
		this.reviewCtt = reviewCtt;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
}

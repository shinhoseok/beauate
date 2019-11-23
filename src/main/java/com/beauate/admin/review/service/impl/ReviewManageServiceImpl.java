package com.beauate.admin.review.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.beauate.admin.comment.service.CommentDao;
import com.beauate.admin.comment.service.CommentVO;
import com.beauate.admin.review.service.ReviewManageService;

import com.beauate.review.service.ReviewDao;
import com.beauate.review.service.ReviewVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("reviewManageService")
public class ReviewManageServiceImpl extends EgovAbstractServiceImpl implements ReviewManageService {
	
	@Resource(name="reviewDao")
	private ReviewDao reviewDao;
	
	@Resource(name="commentDao")
	private CommentDao commentDao;
	
	@Resource(name = "commentIdGnrService")
	private EgovIdGnrService commentIdGnrService;
	
	/**
	 * <pre>
	 * 1. 개요 : 후기 리스트
	 * 2. 처리내용 : 후기 리스트
	 * </pre>
	 * @Method Name : selectReviewList
	 * @date : 2019. 10. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param reviewVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectReviewList(ReviewVO reviewVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(reviewVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(reviewVO.getPageUnit());
		paginationInfo.setPageSize(reviewVO.getPageSize());
		
		reviewVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		reviewVO.setLastIndex(paginationInfo.getLastRecordIndex());
		reviewVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<ReviewVO> selectList = null;
		
		//총 카운트 
		int cnt = reviewDao.selectReviewListCnt(reviewVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//리스트
			selectList = reviewDao.selectReviewList(reviewVO);
		}
		rsltMap.put("selectListCnt", cnt);
		rsltMap.put("selectList", selectList);
		rsltMap.put("paginationInfo", paginationInfo);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 후기삭제/취소(delYn)
	 * 2. 처리내용 :  후기삭제/취소(delYn)
	 * </pre>
	 * @Method Name : updateReviewProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param reviewVO
	 * @return void
	 * @throws Exception
	 */ 
	public void updateReviewProc(ReviewVO reviewVO) throws Exception {
		String[] updateReviewList = reviewVO.getReviewId().split(",");
		if(updateReviewList.length == 1) {
			reviewDao.updateReviewProc(reviewVO);
		} else {
			for(String reviewId : updateReviewList) {
				reviewVO.setReviewId(reviewId);
				reviewDao.updateReviewProc(reviewVO);
			}
		}
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 후기 상세
	 * 2. 처리내용 :  후기 상세
	 * </pre>
	 * @Method Name : selectReviewMngDetail
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param reviewVO
	 * @return ReviewVO
	 * @throws Exception
	 */ 
	public ReviewVO selectReviewMngDetail(ReviewVO reviewVO) throws Exception {
		
		return reviewDao.selectReviewMngDetail(reviewVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 댓글등록
	 * 2. 처리내용 :  댓글등록
	 * </pre>
	 * @Method Name : insertCommentMngProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param commentVO
	 * @return void
	 * @throws Exception
	 */ 
	public void insertCommentMngProc(CommentVO commentVO) throws Exception {
		commentVO.setCommentId(commentIdGnrService.getNextStringId());
		commentDao.insertCommentMngProc(commentVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 댓글 수정/삭제
	 * 2. 처리내용 :  댓글 수정/삭제
	 * </pre>
	 * @Method Name : updateCommentProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param commentVO
	 * @return Integer
	 * @throws Exception
	 */ 
	public void updateCommentProc(CommentVO commentVO) throws Exception {
		commentDao.updateCommentProc(commentVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 댓글 삭제
	 * 2. 처리내용 :  댓글 삭제
	 * </pre>
	 * @Method Name : deleteCommentProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param commentVO
	 * @return void
	 * @throws Exception
	 */ 
	public void deleteCommentProc(CommentVO commentVO) throws Exception {
		commentDao.deleteCommentProc(commentVO);
	}
}

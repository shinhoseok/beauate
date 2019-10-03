package com.beauate.board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.admin.board.service.BoardDao;
import com.beauate.admin.board.service.BoardVO;
import com.beauate.board.service.BoardService;
import com.beauate.common.StringUtil;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "boardDao")
	private BoardDao boardDao;
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 리스트
	 * 2. 처리내용 : 게시판 리스트
	 * </pre>
	 * @Method Name : selectBoardList
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public Map<String, Object> selectBoardList(BoardVO boardVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		
		log.debug("postCategorySt 카테고리 탭번호 >>>>>>>>>>>>> "+boardVO.getPostCategorySt());
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		if(boardVO.getPostCategorySt().equals("2")) {
			boardVO.setPageUnit(5);//자격증
		} else if(boardVO.getPostCategorySt().equals("4")) {
			boardVO.setPageUnit(10);//페이징 게시물 수 공지사항
		} else {
			boardVO.setPageUnit(16);//페이징 게시물 수 (제품소개,박람회)
		}
		
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());
		
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<BoardVO> selectList = null;
		
		//어드민은 이미지를 안보여주고, 
		//사용자만 이미지를 보여주는 구분 N으로 넣으면 이미지 보임
		boardVO.setAdminYn("N");
		
		int cnt = boardDao.selectBoardMngListCnt(boardVO);
		paginationInfo.setTotalRecordCount(cnt);

		log.debug(">>>>> BoardServiceImpl CNT >>>>>>>"+cnt);
		if(cnt > 0){
			selectList = boardDao.selectBoardMngList(boardVO);
			//이미지 경로수정 yyyyMM/파일명
			for(int i=0; i<selectList.size(); i++) {
				String tempSrc = selectList.get(i).getImgSrc();
				log.debug(">> origin Path >> "+tempSrc);
				if(!StringUtil.isEmpty(tempSrc)) {
					String resultSrc = tempSrc.substring(tempSrc.indexOf("\\")+1);
					log.debug(">> result Path >> "+resultSrc);
					selectList.get(i).setImgSrc(resultSrc);
					log.debug(">> vo Path >> "+selectList.get(i).getImgSrc());
				}
			}
		}
		log.debug(">>> selectBoardMngList, boardVO"+boardVO);
		rsltMap.put("paginationInfo", paginationInfo);
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 상세화면
	 * 2. 처리내용 : 게시판 상세화면
	 * </pre>
	 * @Method Name : selectBoardDetail
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @return BoardVO
	 * @throws Exception
	 */
	public BoardVO selectBoardDetail(BoardVO boardVO) throws Exception {
		boardVO.setAdminYn("N");
		BoardVO resultVO = boardDao.selectBoardMngDetail(boardVO);
		String tempSrc = resultVO.getImgSrc();
		log.debug(">> origin Path >> "+tempSrc);
		if(!StringUtil.isEmpty(tempSrc)) {
			String resultSrc = tempSrc.substring(tempSrc.indexOf("\\")+1);
			log.debug(">> result Path >> "+resultSrc);
			resultVO.setImgSrc(resultSrc);
			log.debug(">> vo Path >> "+resultVO.getImgSrc());
		}
		return resultVO;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 관리 상세 다음글, 이전글
	 * 2. 처리내용 : 게시판 관리 상세 다음글, 이전글
	 * </pre>
	 * @Method Name : selectBoardNextPrev
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @return BoardVO
	 * @throws Exception
	 */
	public BoardVO selectBoardNextPrev(BoardVO boardVO) throws Exception {
		
		log.debug(">>> 게시아이디 자르기전 >>> " + boardVO.getPostId());
		String tmpPostId = boardVO.getPostId();
		boardVO.setPostId(boardVO.getPostId().substring(4));
		log.debug(">>> 게시아이디 자른 후 >>> " + boardVO.getPostId());
		BoardVO resultVO = boardDao.selectBoardNextPrev(boardVO);
		if(resultVO == null) { //다음 혹은 이전 글이 없는 경우
			boardVO.setPostId(tmpPostId);
			log.debug(">>> resultVO NULL >>> " + boardVO.getPostId());
			return boardVO;
		} else {
			log.debug(">>> resultVO NOT NULL >>> " + boardVO.getPostId());
			String tempSrc = resultVO.getImgSrc();
			log.debug(">> origin Path >> "+tempSrc);
			if(!StringUtil.isEmpty(tempSrc)) {
				String resultSrc = tempSrc.substring(tempSrc.indexOf("\\")+1);
				log.debug(">> result Path >> "+resultSrc);
				resultVO.setImgSrc(resultSrc);
				log.debug(">> vo Path >> "+resultVO.getImgSrc());
			}
			return resultVO;
		}
	}
}

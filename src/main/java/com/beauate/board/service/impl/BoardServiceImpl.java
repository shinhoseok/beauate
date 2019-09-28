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
	 * @date : 2019. 5. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param programVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	public Map<String, Object> selectBoardList(BoardVO boardVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(16); //제품정보 한페이지에 16개 게시물
		paginationInfo.setPageSize(boardVO.getPageSize());
		
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<BoardVO> selectList = null;
		
		//제품소개1, 자격증2, 박람회3, 공지사항4 탭일 때마다 postCategorySt 값을 달리줘야함.
		if(StringUtil.isEmpty(boardVO.getPostCategorySt())) {
			boardVO.setPostCategorySt("1");
		}
		boardVO.setAdminYn("N");
		
		int cnt = boardDao.selectBoardMngListCnt(boardVO);
		paginationInfo.setTotalRecordCount(cnt);
		
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
}

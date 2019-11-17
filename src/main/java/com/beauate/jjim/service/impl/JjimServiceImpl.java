package com.beauate.jjim.service.impl;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.jjim.service.JjimDao;
import com.beauate.jjim.service.JjimService;
import com.beauate.jjim.service.JjimVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("jjimService")
public class JjimServiceImpl extends EgovAbstractServiceImpl implements JjimService {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="jjimDao")
	private JjimDao jjimDao;
	
	@Resource(name = "jjimIdGnrService")
	private EgovIdGnrService jjimIdGnrService;
	
	/**
	 * <pre>
	 * 1. 개요 : 찜 조회 후 삭제 혹은 등록처리
	 * 2. 처리내용 :  찜 조회 후 삭제 혹은 등록처리
	 * </pre>
	 * @Method Name : selectJjimProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param jjimVO
	 * @return String
	 * @throws Exception
	 */ 
	public String selectJjimProc(JjimVO jjimVO) throws Exception {
		JjimVO selectVO = jjimDao.selectJjim(jjimVO);
		
		String resultYn = "";
		//찜을 안했다면 찜등록
		if(selectVO == null) {
			jjimVO.setJjimId(jjimIdGnrService.getNextStringId());
			jjimDao.insertJjimProc(jjimVO);
			resultYn = "Y";
		} else {//했다면 삭제
			jjimDao.deleteJjimProc(jjimVO);
			resultYn = "N";
		}
		
		return resultYn;
	}
}

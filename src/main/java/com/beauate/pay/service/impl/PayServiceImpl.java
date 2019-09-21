package com.beauate.pay.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.pay.service.PayDao;
import com.beauate.pay.service.PayService;
import com.beauate.pay.service.PayVO;

@Service("payService")
public class PayServiceImpl implements PayService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="payDao")
	private PayDao payDao;
	
	public List<PayVO> selectPayByUserSq(PayVO payVO) throws Exception {
		
		List<PayVO> selectList = payDao.selectPayByUserSq(payVO);
		
		return selectList;
	}
	
}

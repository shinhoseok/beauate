package com.beauate.pay.service.impl;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.pay.service.PayDao;
import com.beauate.pay.service.PayService;

@Service("payService")
public class PayServiceImpl implements PayService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="payDao")
	private PayDao payDao;
	
	
	
}

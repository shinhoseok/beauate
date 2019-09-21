package com.beauate.pay.service;

import java.util.List;

public interface PayService {
	public List<PayVO> selectPayByUserSq(PayVO payVO) throws Exception;
}

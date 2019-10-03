package com.beauate.pay.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("payDao")
public interface PayDao {
	List<PayVO> selectPayByUserSq(PayVO payVO) throws Exception;

	void insertPay(PayVO payVO);

	PayVO selectPayByUsrSqAndClsSq(PayVO payVO);

	PayVO selectPayByPaySq(PayVO payVO);
}

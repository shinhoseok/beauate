package com.beauate.jjim.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("jjimDao")
public interface JjimDao {
	JjimVO selectJjimByUSqAndCSq(JjimVO jjimVO) throws Exception;
	void insertJjimByUSqAndCSq(JjimVO jjimVO) throws Exception;
	void deleteJjimByUSqAndCSq(JjimVO jjimVO);
}

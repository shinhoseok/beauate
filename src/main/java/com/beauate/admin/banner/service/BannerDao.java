package com.beauate.admin.banner.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("bannerDao")
public interface BannerDao {
	
	List<BannerVO> selectBannerList(BannerVO bannerVO) throws Exception;
}

package com.beauate.admin.banner.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.admin.banner.service.BannerDao;
import com.beauate.admin.banner.service.BannerService;
import com.beauate.admin.banner.service.BannerVO;

@Service("bannerService")
public class BannerServiceImpl implements BannerService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="bannerDao")
	private BannerDao bannerDao;

	@Override
	public List<BannerVO> selectBannerList(BannerVO bannerVO) throws Exception {
		return bannerDao.selectBannerList(bannerVO);
	}

	
}
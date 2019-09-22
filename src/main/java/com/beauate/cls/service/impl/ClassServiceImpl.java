package com.beauate.cls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.admin.classmng.service.ClassDao;
import com.beauate.admin.classmng.service.ClassVO;
import com.beauate.cls.service.ClassService;

@Service("classService")
public class ClassServiceImpl implements ClassService {
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name="classDao")
	private ClassDao classDao;
	
	@Override
	public List<ClassVO> selectClassList() {
		return classDao.selectClassList();
	}
	
}

package com.beauate.cls.service;

import java.util.List;

import com.beauate.admin.classmng.service.ClassVO;

public interface ClassService {

	List<ClassVO> selectClassList(ClassVO paramVO);
	int selectClassListCnt(ClassVO paramVO);
	
}

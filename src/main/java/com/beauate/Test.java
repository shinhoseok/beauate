package com.beauate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RestController;

import com.beauate.admin.user.service.UserVO;

@RestController
public class Test {
	
	public static void main(String[] args) {
		UserVO userVO = new UserVO();
		String today = userVO.getChartDate();
	}
}

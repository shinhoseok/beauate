package com.beauate.common;

public class GlobalConstants {

	//세션에 로그인 정보 키값
	public static final String LOGIN_SESSION_KEY = "loginVO";
	
	public static String RESULT_CODE_SUCCEED = "succeed";
	public static String RESULT_CODE_FAILED = "failed";
	//세션에 담을 메일 인증키값
	public static String MAIL_SECURE_KEY = "mailSecureKey";
	
	//------------------------코드값------------------------------------------------------
	//사용자권한 디폴트값(관리자,유저중 유저)
	public static String USER_AUTHORITY_DEFAULT = "ROL-000001";
	//사용자계정상태 대분류 코드값(휴면,탈퇴,정상..)
	public static String USER_ACCOUNT_STATS = "UST";
	//권한 대분류 코드값(유저,관리자...)
	public static String ROLE_CODE_NAME = "RCD";
	//지역 대분류 코드값(서울,경기..)
	public static String AREA_CODE = "ARA";
	//클래스카테고리 대분류 코드값(헤어,메이크업...)
	public static String CLASS_CATEGORY_CODE = "CCT";
	//클래스구분 대분류 코드값(내부,외부)
	public static String CLASS_GUBUN_CODE = "CGB";
	//클래스상태 대분류 코드값(오픈중,마감...)
	public static String CLASS_STATUS_CODE = "CST";
	//정상,휴면,탈퇴회원중 정상회원 코드값
	public static String NORMAL_MEMBER_CODE = "1";
	//게시판 카테고리 대분류 코드(제품정보, 박람회, 자격증..)
	public static String BOARD_CATEGORY_CODE = "BCT";
	//------------------------코드값------------------------------------------------------
	
	//로그인이 실패된 상태에서 탑메뉴 이동
	public static String FREE_URI_MAIN = "home";
	//로그인이 실패된 상태에서 탑메뉴 이동
	public static String FREE_URI_LOGIN = "/login/a/";
	//비회원 전용 아이디, 이메일
	public static String NON_MEMBER = "USR-000001";
	//비회원 전용 패스워드
	public static String NON_MEMEBER_PWD = "06f1ac6173b0b9659e251e59a489078f4d60613f223410fb40c325716c9b9709";
	
	public static String BANNER_SPECIAL_LEFT = "SPECIAL_LEFT";
	public static String BANNER_LONG_BANNER = "LONG_BANNER";

	public static int CLASS_CATEGORY_HAIR = 1;
	public static int CLASS_CATEGORY_MAKEUP = 2;
	public static int CLASS_CATEGORY_EYELASHES = 3;
	public static int CLASS_CATEGORY_WAXING = 4;
	public static int CLASS_CATEGORY_NAIL = 5;
	public static int CLASS_CATEGORY_ETC = 6;
}

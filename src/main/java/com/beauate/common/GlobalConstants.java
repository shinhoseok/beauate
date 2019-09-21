package com.beauate.common;

public class GlobalConstants {

	//세션에 로그인 정보 키값
	public static final String LOGIN_SESSION_KEY = "loginVO";
	
	public static String RESULT_CODE_SUCCEED = "succeed";
	public static String RESULT_CODE_FAILED = "failed";
	//사용자권한 디폴트값
	public static String USER_AUTHORITY_DEFAULT = "ROL-000001";
	//사용자계정상태 대분류 코드값
	public static String USER_ACCOUNT_STATS = "UST";
	//권한 대분류 코드값
	public static String ROLE_CODE_NAME = "RCD";
	//정상,휴면,탈퇴회원중 정상회원 코드값
	public static String NORMAL_MEMBER_CODE = "1";
	//로그인이 실패된 상태에서 탑메뉴 이동
	public static String FREE_URI_MAIN = "home";
	//로그인이 실패된 상태에서 탑메뉴 이동
	public static String FREE_URI_LOGIN = "/login/a/";
	//비회원 전용 아이디, 이메일
	public static String NON_MEMBER = "USR-000001";
	//비회원 전용 패스워드
	public static String NON_MEMEBER_PWD = "06f1ac6173b0b9659e251e59a489078f4d60613f223410fb40c325716c9b9709";
}

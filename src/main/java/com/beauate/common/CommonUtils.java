package com.beauate.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Service;

@Service("commonUtils")
public class CommonUtils {
	/**
	 * <pre>
	 * 1. 개요 : 패스워드 암호화
	 * 2. 처리내용 : 패스워드 암호화
	 * 3. 설명 : 한국정보보호진흥원 및 국제사회에서 MD5, SHA1 해시 알고리즘이 깨졌다고 보고 있고 
	 * 대안으로 SHA256, SHA512 알고리즘으로 변경하도록 권고하고 있다고 한다.
	 * SHA256 64자리의 16진수 문자열이 출력되며, SHA512는 128자리의 16진수 문자열이 출력된다.
	 * 4. 사용법 : encryption으로 true를 리턴받고, 하위 getter를 통해 암호화된 패스워드를 리턴받는다.
	 * </pre>
	 * @Method Name : encryption
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userPassword
	 * @return 암호화 된 사용자 패스워드 boolean / 암호화 방식 : SHA-256
	 * 
	 */
	public String encryption(String userPassword) {
		
		MessageDigest md;
		String tempPassword = "";
        
        try {
        	//MessageDigest.getInstance : Java에서 지원하는 암호화 알고리즘
        	//SHA-1, SHA-256, SHA-384, SHA-512를 지원한다.
        	//암호화 방식를 변경하려면 getInstance인자값의 "SHA-512" 부분만 해당값으로 변경하면 된다.
        	//ex) MessageDigest.getInstance("SHA-256")  >> MessageDigest.getInstance("SHA-256")
            md = MessageDigest.getInstance("SHA-256");
            //update : 데이터를 hash함, String을 byte[]로 변환시 윈도우에서 구동하는 프로그램과
            //UNIX에서 구동하는 프로그램이 동시에 서로 암호화를 할 경우 한글 등을 처리할 때 문제가
            //발생될 수 있으므로 인코딩 지정
            md.update(userPassword.getBytes());
            //digest : 바이트배열로 hash를 반환, 적은 데이터일 경우 digest에 직접입력가능
            StringBuffer sb = new StringBuffer();
            byte[] mb = md.digest();
            for(int i = 0 ; i < mb.length ; i++){
                sb.append(Integer.toString((mb[i]&0xff) + 0x100, 16).substring(1));
            }

            tempPassword = sb.toString();

        } catch (NoSuchAlgorithmException e) {
        	tempPassword = null;
            return tempPassword;
        }
        return tempPassword;
    }
}

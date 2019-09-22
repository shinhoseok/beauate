<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!-- 팝업 : 로그인 -->
<form:form commandName="loginVO" id="loginVO" name="loginVO" method="post" action="${basePath}/login/a/n/afterLogin.do">
	<h2>sign in</h2>
	<p class="title-desc">오늘도 힘내세요</p>
	<ul class="input-area">
		<li>
			<form:input path="emailAddr" id="emailAddr" placeholder="이메일" title="이메일을 입력해주세요." maxlength="21" />
			<span style="display: none;" id="emailAddrChk" class="emp"> 이메일을 다시 확인해주세요</span>
		</li>
		<li>
			<form:password id="usrPw" path="usrPw" onkeypress=" if(event.keyCode==13){fn_login();} " placeholder="비밀번호" title="비밀번호를 입력해주세요." maxlength="21" />
		</li>
	</ul>
	<div class="btn-area"><button type="button" class="btn" id="loginBtn" onclick="fn_login();"><span>로그인</span></button></div>
	<div class="login-link">
		<a href="#">회원가입</a>
		<a href="#">비밀번호찾기</a>
	</div>
	<a href="javascript:void(0);" onclick="fn_loginPopClose();" rel="modal:close" class="modal-close">닫기</a>
</form:form>
<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
<script type="text/javascript" src="${scriptPath}/common.js"></script>
<script type="text/javascript">
//login

var fn_login = function() {
	var emailAddr = $("#emailAddr").val();
	var usrPw = $("#usrPw").val()
	if(!$.trim(emailAddr)){
		alert("아이디를 입력해 주십시오.");
		return;
	}
	if(!$.trim(usrPw)){
		alert("비밀번호를 입력해 주십시오.");
		return;
	}
	if (!TypeChecker.email($("#loginVO #emailAddr").val())) {
		alert("이메일은 "+TypeChecker.emailText);
		$("#loginVO #emailAddr").focus();
		return;
	}
	//패스워드조합3가지
	if(!fn_checkPass("usrPw")) {
		return;
	}
	//아이디체크
	$.ajax({ 	
		url: "${basePath}/login/a/n/selectIdPwdcheck.do",
		type: 'POST',
		dataType : "json",
		data : {"emailAddr" : emailAddr, "usrPw" : usrPw},
		error: function(){
			 alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) { 
			if(r.message == 'N') {
				$("#emailAddrChk").show();
				$("#emailAddr").focus();
				return;
			} else{
				$("#loginVO").submit();
			}
		}
	});
};
</script>
</body>
</html>
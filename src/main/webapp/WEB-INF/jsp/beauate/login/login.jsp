<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!-- 팝업 : 로그인 -->
<form:form commandName="loginVO" id="loginForm" name="loginForm" method="post" action="${basePath}/login/a/n/afterLogin.do">
	<h2>sign in</h2>
	<p class="title-desc">오늘도 힘내세요</p>
	<ul class="input-area">
		<li>
			<input type="text" id="emailAddr" name="emailAddr" placeholder="이메일" title="이메일을 입력해주세요." maxlength="21" />
			<span style="display: none;" id="emailAddrChk" class="emp"> 이메일을 다시 확인해주세요</span>
		</li>
		<li>
			<input type="password" id="usrPw" name="usrPw" placeholder="비밀번호" title="비밀번호를 입력해주세요." maxlength="21" />
		</li>
	</ul>
	<div class="btn-area"><button type="button" class="btn" id="loginBtn"><span>로그인</span></button></div>
	<div class="login-link">
		<a href="#">회원가입</a>
		<a href="#">비밀번호찾기</a>
	</div>
	<a href="javascript:void(0);" onclick="fn_loginPopClose();" rel="modal:close" class="modal-close">닫기</a>
</form:form>
<script type="text/javascript">
//login
$("#loginBtn").click(function () {
	if(!$.trim($("#emailAddr").val())){
		alert("아이디를 입력해 주십시오.");
		return;
	}
	if(!$.trim($("#usrPw").val())){
		alert("비밀번호를 입력해 주십시오.");
		return;
	}
	$("#loginForm").submit();
	//아이디체크
	/* $.ajax({ 	
		url: "${basePath}/login/a/n/selectIdPwdcheck.do",
		type: 'POST',
		dataType : "json",
		data : $("#userVO").serialize(),
		error: function(){
			 alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) { 
			alert(r.message);
			if(r.message == 'N') {
				$("emailAddrChk").show();
				$("#emailAddr").focus();
				return;
			} else{
				alert($("#emailAddr").val()+" >>> "+$("#usrPw").val());
				$("#loginForm").submit();
			}
		}
	}); */
});
</script>
</body>
</html>
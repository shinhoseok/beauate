<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1280"/>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BEAUATE</title>
<link rel="stylesheet" type="text/css" href="${cssPath}/common.css"/>
<link rel="stylesheet" type="text/css" href="${cssPath}/contents.css"/>
<script type="text/javascript" src="${scriptPath}/jquery.min.js"></script>
<script type="text/javascript" src="${scriptPath}/jquery.modal.min.js"></script>
<script type="text/javascript" src="${scriptPath}/jquery.blockUI.js"></script>
<script type="text/javascript" src="${scriptPath}/ui.front.js"></script>
</head>
<body>
<div id="wrap">
	<div id="skip">
		<a href="#container">본문 내용 바로가기</a>
	</div>
	<!-- header -->
	<div id="header">
		<jsp:include page="/WEB-INF/jsp/beauate/ucommon/top.jsp" flush="false" />
	</div>
	<!-- //header -->
	<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
	<script type="text/javascript" src="${scriptPath}/common.js"></script>
	<script>
	$(document).ready(function($){
		$("#userVO span.emp").hide();
		$("#userVO input").on('keyup change', function(e) {
			fn_updateUserPasswordProc(e);
	    });
	});
	//저장
	var isValid;
	fn_updateUserPasswordProc = function(e){
		isValid = true;
		$("#userVO span.emp").hide();
		if(!$.trim($("#userVO #usrPw").val())) {
			$("#userVO #usrPw").parent().next().text("패스워드 입력해 주세요").show();
			//$("#userVO #usrPw").focus();
			isValid = false;
		}
		//패스워드조합3가지
		if((e.type=='keyup' || e.type=='change')==false){
			if(!fn_checkPass("usrPw")) {
				isValid = false;
			}
		}
		if($("#userVO #usrPw").val() != $("#userVO #user_pw_confirm").val()) {
//				alert($("#userVO #user_pw").val() +" >> "+$("#userVO #user_pw_confirm").val())
			$("#userVO #user_pw_confirm").next().text("패스워드를 확인해주세요").show();
			//$("#userVO #user_pw_confirm").focus();
			isValid = false;
		}
		if(!isValid){
			return;
		}

		if((e.type=='keyup' || e.type=='change')==true){
			return;
		}
		if(!confirm("수정 하시겠습니까?")){
			return;
		}
		$.ajax({ 	
			url: "${basePath}/user/w/n/userPasswordChangeProc.do",    
			type: 'POST',
			dataType : "json",
			data : $("#userVO").serialize(),
			error: function(r){
				$("#modal-certify p.txt").text(r.message);
				$("#modal-certify a.modal-close").click(function(){document.location.href='#'});
				$("#modal-certify").modal('show');
			},
			success: function(r) {
				$("#modal-certify p.txt").text(r.message);
				$("#modal-certify a.modal-close").click(function(){document.location.href='${basePath}'+r.redirectUrl});
				$("#modal-certify").modal('show'); 
			}
		}); 
	};
	</script>
	<div id="container">

		<!-- content -->
		<div class="content">
			<div class="page-title">
				<div class="content-inner">
					<h2 class="title"><img src="${imagePath}/common/tit_cont_password.png" alt="password"></h2>
					<p class="title-desc">새 비밀번호 설정</p>
				</div>
			</div>
			<div class="content-inner">
				<!-- 비밀번호 찾기-->
				<form:form commandName="userVO" name="userVO" id="userVO" method="post" action="${basePath}/user/w/n/userPasswordChange.do" onsubmit="return false;">
					<fieldset>
						<legend>새 비밀번호 설정</legend>
						<div class="pwd-search">
							<p class="msg">새 비밀번호를 입력해주세요.</p>
							<ul class="input-area">
								<li><form:password path="usrPw" id="usrPw" value="" placeholder="새 비밀번호 입력" title="새 비밀번호 입력해주세요." maxlength="21" /><span class="emp"> 이메일 형식이 맞지 않습니다.</span></li></li>
								<li><input id="user_pw_confirm" type="password" value="" placeholder="비밀번호 확인" title="새 비밀번호 한번더 입력해주세요." maxlength="21" /><span class="emp"> 이메일 형식이 맞지 않습니다.</span></li></li>
							</ul>
							<div class="btn-area"><button onclick="fn_updateUserPasswordProc(this);" class="btn"><span>비밀번호 변경</span></button></div>
						</div>
					</fieldset>
				</form:form>
				<!-- //비밀번호 찾기-->
				<!-- 팝업 : 비밀번호 변경 -->
				<div id="modal-certify" class="modal">
				  <p class="txt">비밀번호가 변경되었습니다.</p>
				  <a href="#" rel="modal:close" class="modal-close">닫기</a>
				</div>
			</div>
		</div>
		<!-- //content -->


	</div>
	<!-- //container -->
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
	<!-- //footer -->
</div>
</body>
</html>

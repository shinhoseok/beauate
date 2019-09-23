<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1280"/>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BEAUATE</title>
<link rel="stylesheet" type="text/css" href="${cssPath}/contents.css"/>
<script type="text/javascript" src="${scriptPath}/jquery.min.js"></script>
<script type="text/javascript" src="${scriptPath}/jquery.modal.min.js"></script>
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
	<!-- container -->
	<div id="container">
		<!-- content -->
		<div class="content">
			<div class="page-title">
				<div class="content-inner">
					<h2 class="title"><img src="${imagePath}/common/tit_cont_password.png" alt="password"></h2>
					<p class="title-desc">비밀번호 찾기</p>
				</div>
			</div>
			<div class="content-inner">
				<!-- 비밀번호 찾기-->
<%-- 				<form:form commandName="loginVO" id="loginVO" name="loginVO" method="post" > --%>
					<fieldset>
						<legend>비밀번호찾기</legend>
						<div class="pwd-search">
							<p class="msg">가입하신 이메일 주소를 입력해주세요. <br />인증 번호를 보내드립니다.</p>
							<ul class="input-area">
								<li><input type="text" id="emailAddr1" onkeypress="if(event.keyCode==13){fn_certify();} " placeholder="이메일 입력 (name@mail.com)" title="이메일을 입력해주세요." maxlength="21" /></li>
							</ul>
							<div class="btn-area"><button class="btn" type="button" id="" onclick="javascript:fn_certify();"><span>인증 번호받기</span></button></div>
						</div>						
					</fieldset>
<%-- 				</form:form> --%>
				<div id="modal-certify" class="modal"></div>

<!-- 				<p><a href="#modal-certify" rel="modal:open">인증 번호받기 팝업</a></p> -->
			</div>
		</div>
		<!-- //content -->
	</div>
	<!-- //container -->
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
	<!-- //footer -->
	<form action="${basePath}/login/a/n/pwdMailSearch2.do" id="emailForm" name="emailForm">
		<input type="hidden" id="emailAddr" name="emailAddr"> 
	</form>
</div>
<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
<script type="text/javascript" src="${scriptPath}/common.js"></script>
<script type="text/javascript">
var fn_certify = function () {
	var emailAddr = $("#emailAddr1").val()
	if(!$.trim(emailAddr)){
		alert("이메일을 입력해 주십시오.");
		return;
	}
	if (!TypeChecker.email(emailAddr)) {
		alert("이메일은 "+TypeChecker.emailText);
		$("#emailAddr1").focus();
		return;
	}
	var resultHtml ="";
	$.ajax({ 	
		url: "${basePath}/login/a/n/pwdMailSearch.do",
		type: 'POST',
		dataType : "json",
		data : {"emailAddr" : emailAddr},
		error: function(){
			 alert("현재 메일 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 fn_mailPopClose();
			 return;
		},
		success: function(r) { 
			if(r.rslt.result == 'N') {
				alert("현재 메일 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
				fn_loginPopClose();
				return;
			} else{
				resultHtml += '<p class="txt">인증번호가 발송되었습니다</p>';
				resultHtml += '<a href="#" rel="modal:close" class="modal-close" onclick="javascript:fn_mailSuccessClose();">닫기</a>';
				$("#modal-certify").html(resultHtml);
				$("#emailAddr").val(r.rslt.emailAddr);
			}
		}
	});
	$.blockUI({message:$("#modal-certify"),css:{width:"0px",height:"0px",position:"absolute",left:"40%",top:"35%", textAlign:"left"}});
};

//팝업 닫기
var fn_mailPopClose = function() {
	$.unblockUI();
	$("#modal-certify").empty();
};

var fn_mailSuccessClose = function() {
	fn_mailPopClose();
	$("#emailForm").submit();
};

</script>
</body>
</html>

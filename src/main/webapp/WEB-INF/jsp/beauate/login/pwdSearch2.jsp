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
<!-- 	<div id="header"> -->
		<jsp:include page="/WEB-INF/jsp/beauate/ucommon/top.jsp" flush="false" />
<!-- 	</div> -->
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
				<form action="">
					<fieldset>
						<legend>비밀번호찾기</legend>
						<div class="pwd-search">
							<p class="msg">메일로 받으신 인증번호를 입력해주세요.<br />본인인증 후 비밀번호를 변경하실 수 있습니다.</p>
							<ul class="input-area">
								<li><input id="mailSecureKey" type="password" value="" placeholder="인증번호 6자리 숫자 입력" title="인증번호를 입력해주세요." maxlength="21" /></li>
							</ul>
							<div class="btn-area"><button type="button" class="btn" onclick="javascript:fn_mailSecure();"><span>본인인증</span></button></div>
						</div>						
					</fieldset>
				</form>
				<!-- //비밀번호 찾기-->				
				<!-- 팝업 : 본인인증 -->
				<div id="modal-certify" class="modal">
				  <p class="txt">본인 인증이 완료 되었습니다.</p>
				  <a href="#" rel="modal:close" class="modal-close" onclick="javascript:mailSuccess();">닫기</a>
				</div>
				<p style="display: none;"><a href="#modal-certify" id="popOne" rel="modal:open">본인인증팝업</a></p>
			</div>
		</div>
		<!-- //content -->
	</div>
	<form action="${basePath}/login/a/n/pwdChange.do" name="pwdChgForm" id="pwdChgForm">
		<input type="hidden" id="emailAddr" name="emailAddr">
	</form>
	<!-- //container -->
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
	<!-- //footer -->
</div>
<script type="text/javascript">
var fn_mailSecure = function() {
	
	var mailSecureKey = $("#mailSecureKey").val();
	if(!$.trim(mailSecureKey)){
		alert("인증키를 입력해 주십시오.");
		return;
	}
	$.ajax({ 	
		url: "${basePath}/login/a/n/pwdMailSearch3.do",
		type: 'POST',
		dataType : "json",
		data : {"mailSecureKey" : mailSecureKey, "emailAddr" : "${loginVO.emailAddr}" },
		error: function(){
			 alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 fn_mailPopClose();
			 return;
		},
		success: function(r) { 
			if(r.rslt.result == 'N') {
				alert("인증키가 일치하지 않습니다.\n다시 이용해 주십시요.");
				return;
			} else{
				$("#emailAddr").val(r.rslt.emailAddr);
				$("#popOne").click();
			}
		}
	});
};

var mailSuccess = function() {
	$("#pwdChgForm").submit();
};
</script>
</body>
</html>

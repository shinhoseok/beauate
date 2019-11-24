<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1280"/>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="naver-site-verification" content="c03e63b14e10bb3c48bb213c40e148287b19ea7f"/>
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
					<p class="title-desc">새 비밀번호 설정</p>
				</div>
			</div>
			<div class="content-inner">
				<!-- 비밀번호 찾기-->
				<form action="">
					<fieldset>
						<legend>새 비밀번호 설정</legend>
						<div class="pwd-search">
							<p class="msg">새 비밀번호를 입력해주세요.</p>
							<ul class="input-area">
								<li><input type="password" id="usrPw" value="" placeholder="새 비밀번호 입력" title="새 비밀번호 입력해주세요." maxlength="21" /></li>
								<li><input type="password" id="usrPwConfirm" onkeypress="if(event.keyCode==13){fn_pwdChange();} " value="" placeholder="비밀번호 확인" title="새 비밀번호 한번더 입력해주세요." maxlength="21" /></li>
						</ul>
							<div class="btn-area"><button type="button" class="btn" onclick="javascript:fn_pwdChange();"><span>비밀번호 변경</span></button></div>
						</div>
					</fieldset>
				</form>
				<!-- //비밀번호 찾기-->
				<!-- 팝업 : 비밀번호 변경 -->
				<div id="modal-certify" class="modal">
				  <p class="txt">비밀번호가 변경되었습니다.</p>
				  <a href="#" rel="modal:close" class="modal-close" onclick="javascript:mailSuccess();">닫기</a>
				</div>
				<p style="display: none;"><a href="#modal-certify" id="popOne" rel="modal:open">비밀번호 변경 팝업</a></p>
			</div>
		</div>
		<!-- //content -->
	</div>
	<!-- //container -->
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
	<!-- //footer -->
</div>
<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
<script type="text/javascript" src="${scriptPath}/common.js"></script>
<script type="text/javascript">
var fn_pwdChange = function() {
	var usrPw = $("#usrPw").val();
	var usrPwConfirm = $("#usrPwConfirm").val();
	if(!$.trim(usrPw)){
		alert("비밀번호를 입력해 주십시오.");
		$("#usrPw").focus();
		return;
	}
	if(!$.trim(usrPwConfirm)){
		alert("비밀번호 확인을 입력해 주십시오.");
		$("#usrPwConfirm").focus();
		return;
	}
	//패스워드조합3가지
	if(!fn_checkPass("usrPw")) {
		return;
	}
	
	if(usrPw != usrPwConfirm) {
		alert("비밀번호가 일치하지 않습니다. \n다시 입력해 주십시오");
		$("#usrPw").focus();
		return;
	}
	$.ajax({ 	
		url: "${basePath}/login/a/n/updatePwdChange.do",
		type: 'POST',
		dataType : "json",
		data : {"emailAddr" : "${userVO.emailAddr}", "usrPw" : usrPw},
		error: function(){
			 alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 fn_mailPopClose();
			 return;
		},
		success: function(r) { 
			if(r.updateCnt > 0 ){
				$("#popOne").click();
			}else{
				alert("현재 비밀번호 변경 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			}
		}
	});
};

var mailSuccess = function() {
	fn_loginPopUpLayer();
};
</script>
</body>
</html>

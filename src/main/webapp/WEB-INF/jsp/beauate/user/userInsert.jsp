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
<!-- 	<div id="header"> -->
		<jsp:include page="/WEB-INF/jsp/beauate/ucommon/top.jsp" flush="false" />
<!-- 	</div> -->
	<!-- //header -->
	<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
	<script type="text/javascript" src="${scriptPath}/common.js"></script>
	<script>
	$(document).ready(function($){
		$("#userVO span.emp").hide();
		$("#userVO input").on('keyup change', function(e) {
			fn_insertUserProc(e);
	    });
	});
	//저장
	var isValid;
	fn_insertUserProc = function(e){
		isValid = true;
		$("#userVO span.emp").hide();
		if((e.type=='keyup' || e.type=='change')==false){
			if($("#userVO #termsAgree").is(":checked")==false){
				alert("뷰아떼 약관에 동의해 주세요.");
				isValid = false;
			}
		}
		if(!$.trim($("#userVO #emailAddr").val())) {
			$("#userVO #emailAddr").next().text("이메일을 입력해 주세요").show();
			//$("#userVO #emailAddr").focus();
			isValid = false;
		}
		if(!$.trim($("#userVO #usrNm").val())) {
			$("#userVO #usrNm").next().text("이름을 입력해 주세요").show();
			//$("#userVO #usrNm").focus();
			isValid = false;
		}
		
		if (!TypeChecker.korEng($("#userVO #usrNm").val())) {
			$("#userVO #usrNm").next().text("이름은 "+TypeChecker.korEngText).show();
			//$("#userVO #usrNm").focus();
			isValid = false;
		}
		if(!$.trim($("#userVO #usrPw11").val())) {
			$("#userVO #usrPw11").next().text("패스워드 입력해 주세요").show();
			//$("#userVO #usrPw").focus();
			isValid = false;
		}
		//패스워드조합3가지
		if((e.type=='keyup' || e.type=='change')==false){
			if(!fn_checkPass("usrPw11")) {
				isValid = false;
			}
		}
		if($("#userVO #usrPw11").val() != $("#userVO #user_pw_confirm").val()) {
//				alert($("#userVO #user_pw").val() +" >> "+$("#userVO #user_pw_confirm").val())
			$("#userVO #user_pw_confirm").next().text("패스워드를 확인해주세요").show();
			//$("#userVO #user_pw_confirm").focus();
			isValid = false;
		}
		if (!TypeChecker.email($("#userVO #emailAddr").val())) {
			$("#userVO #emailAddr").next().text("이메일은 "+TypeChecker.emailText).show();
			//$("#userVO #emailAddr").focus();
			isValid = false;
		}
		
		if (!TypeChecker.number($("#userVO #mblPno").val())) {
			$("#userVO #mblPno").next().text("휴대폰 번호는 "+TypeChecker.numberText).show();
			//$("#userVO #mblPno").focus();
			isValid = false;
		}
		if(!isValid){
			return;
		}

		if((e.type=='keyup' || e.type=='change')==true){
			return;
		}
		if(!confirm("등록 하시겠습니까?")){
			return;
		}
		//중복체크
		$.ajax({ 	
			url: "${basePath}/usermgr/a/n/userIdChk.do",    
			type: 'POST',
			dataType : "json",
			data : $("#userVO").serialize(),
			error: function(r){
				$("#modal-joincomfirm p.txt").text(r.message);
				$("#modal-joincomfirm a.modal-close").click(function(){document.location.href='#'});
				$("#modal-joincomfirm").modal('show');
				return;
			},
			success: function(r) { 
				if(r.chkResult == 'N') {
					$("#userVO #emailAddr").next().text("사용자 아이디와 중복되었습니다 다른값으로 입력바랍니다.").show();
					$("#emailAddr").focus();
					return;
				} else{
					//document.userVO.submit();
					//모달창으로 결과 알려줘야하기 때문에 아래 ajax 수행
					$.ajax({ 	
						url: "${basePath}/user/w/n/userInsertProc.do",    
						type: 'POST',
						dataType : "json",
						data : $("#userVO").serialize(),
						error: function(r){
							$("#modal-joincomfirm p.txt").text(r.message);
							$("#modal-joincomfirm a.modal-close").click(function(){document.location.href='#'});
							$("#modal-joincomfirm").modal('show');
						},
						success: function(r) {
							$("#modal-joincomfirm p.txt").text(r.message);
							$("#modal-joincomfirm a.modal-close").click(function(){document.location.href='${basePath}'+r.redirectUrl});
							$("#modal-joincomfirm").modal('show'); 
							//임시쿠폰적용 로직
						}
					}); 
				}
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
					<p class="title-desc">뷰아떼 회원가입을 환영합니다.</p>
				</div>
			</div>
			<div class="content-inner">
				<!-- 회원가입-->
				<form:form commandName="userVO" name="userVO" id="userVO" method="post" action="${basePath}/user/w/n/userInsertProc.do" onsubmit="return false;">
					<fieldset>
						<legend>회원가입</legend>
						<div class="member-join">
							<div class="member-join-inner">
								<h3>약관동의<em>뷰아떼는 멘티, 멘토의 <br />개인정보를 위해 개인 정보  <br />보호 관련 법규를 준수합니다.</em></h3>
								<div class="rcont">
									<label><input id="termsAgree" type="checkbox" /><em>필수</em> 뷰아떼의 이용약관, 개인정보 취급방침, 멘티약관, 멘토약관에 동의합니다.</label>
								</div>
							</div>
							<div class="member-join-inner">
								<h3>정보입력</h3>
								<div class="rcont">
									<ul class="input-area">
										<li><form:input path="emailAddr" id="emailAddr" value="" placeholder="이메일 입력 (name@mail.com)" title="이메일을 입력해주세요." maxlength="21" /><span class="emp"> 이메일 형식이 맞지 않습니다.</span></li>
										<li><form:password path="usrPw" id="usrPw11" value="" placeholder="비밀번호 (최소 8자 이상)" title="비밀번호를 입력해주세요." maxlength="21" /><span class="emp"> 이메일 형식이 맞지 않습니다.</span></li>
										<li><input id="user_pw_confirm" type="password" value="" placeholder="비밀번호 확인" title="비밀번호 다시 입력해주세요." maxlength="21" /><span class="emp"> 이메일 형식이 맞지 않습니다.</span></li>
										<li><form:input path="usrNm" id="usrNm" value="" placeholder="이름" title="이름을 입력해주세요." maxlength="21" /><span class="emp"> 이메일 형식이 맞지 않습니다.</span></li>
										<li><form:input path="mblPno" id="mblPno" value="" placeholder="휴대전화 ('-'없이 숫자만 입력)" title="휴대전화 ('-'없이 숫자만 입력)을 입력해주세요." maxlength="21" /><span class="emp"> 이메일 형식이 맞지 않습니다.</span></li>
									</ul>
									<div class="btn-area"><button onclick="fn_insertUserProc(this);" class="btn"><span>가입하기</span></button></div>
								</div>
							</div>
						</div>				
					</fieldset>
				</form:form>
				<!-- //회원가입---->				
				<!-- 팝업 : 회원가입 완료 -->
				<div id="modal-joincomfirm" class="modal">
				  <p><img src="${imagePath}/txt/img-txt-welcome.png" alt="welcome" /></p>
				  <p class="txt">회원가입이 완료되었습니다</p>
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

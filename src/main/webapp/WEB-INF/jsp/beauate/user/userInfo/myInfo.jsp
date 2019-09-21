<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
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
			$("#userVO #emailAddr").parent().next().text("이메일을 입력해 주세요").show();
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
		if(!$.trim($("#userVO #usrPw").val())) {
			$("#userVO #usrPw").next().text("패스워드 입력해 주세요").show();
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
		if (!TypeChecker.email($("#userVO #emailAddr").val())) {
			$("#userVO #emailAddr").parent().next().text("이메일은 "+TypeChecker.emailText).show();
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
					$("#userVO #emailAddr").parent().next().text("사용자 아이디가 중복되었습니다 다른값으로 입력바랍니다.").show();
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
						}
					}); 
				}
			}
		}); 
	};
	</script>

				<!-- 비밀번호 찾기-->
				<form action="">
					<fieldset>
						<legend>비밀번호찾기</legend>
						<div class="pwd-search">
							<p class="msg">가입하신 이메일 주소를 입력해주세요. <br />인증 번호를 보내드립니다.</p>
							<ul class="input-area">
								<li><input type="password" value="" placeholder="이메일 입력 (name@mail.com)" title="이메일을 입력해주세요." maxlength="21" /></li>
							</ul>
							<div class="btn-area"><button class="btn"><span>인증 번호받기</span></button></div>
						</div>						
					</fieldset>
				</form>
				<!-- //비밀번호 찾기-->				
				<!-- 팝업 : 인증 번호받기 -->
				<div id="modal-certify" class="modal">
				  <p class="txt">인증번호가 발송되었습니다</p>
				  <a href="#" rel="modal:close" class="modal-close">닫기</a>
				</div>

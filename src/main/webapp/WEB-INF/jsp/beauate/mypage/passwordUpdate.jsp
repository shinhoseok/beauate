<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<div class="myinfo_pwd_left">
	<ul>
		<li>현재 비밀번호</li>
		<li>새 비밀번호</li>
		<li>새 비밀번호 확인</li>
	</ul>
</div>
<form name="userVO" id="userVO" method="post" action="${basePath}/mypage/w/n/updatePasswordProc.do" onsubmit="return false;">
	<div class="myinfo_right">
		<ul class="myinfo_pwd_input">
			<li><input name="usrPw" id="usrPw" type="password" value="" placeholder="" title="현재 비밀번호" maxlength="21" style="height: 40px;"/><span class="emp"></span></li>
			<li><input name="newUsrPw" id="newUsrPw" type="password" value="" placeholder="" title="새 비밀번호" maxlength="21" style="height: 40px;"/><span class="emp"></span></li>
			<li><input id="newUsrPw_confirm" type="password" value="" placeholder="" title="새 비밀번호 확인" maxlength="21" style="height: 40px;"/><span class="emp"></span></li>
			<li>
				<span class="myinfo_pwd_cancle_btn"><a href="javascript:void(0);" onclick="fn_updatePassword(1)">취소</a></span>
				<span class="myinfo_pwd_save_btn"><a href="javascript:void(0);" onclick="javascript:fn_updatePasswordProc(this);">저장</a></span>
			</li>

		</ul>
	</div>
</form>

<script type="text/javascript">
$(document).ready(function() {
// 	$("#userVO span.emp").hide();
	$("#userVO input").on('keyup change', function(e) {
		fn_updatePasswordProc(e);
	});
});

//비밀번호 수정
var isValid;
var fn_updatePasswordProc = function(e) {
	isValid = true;
	$("#userVO span.emp").hide();
	if(!$.trim($("#userVO #usrPw").val())) {
		$("#userVO #usrPw").parent().find(".emp").text("패스워드 입력해 주세요.").show();
		isValid = false;
	}
	if(!$.trim($("#userVO #newUsrPw").val())) {
		$("#userVO #newUsrPw").parent().find(".emp").text("패스워드 입력해 주세요.").show();
		isValid = false;
	}
	//패스워드조합3가지
	if((e.type=='keyup' || e.type=='change')==false){
		if(!fn_checkPass2("newUsrPw")) {
			isValid = false;
		}
	}
	if($("#userVO #newUsrPw").val() != $("#userVO #newUsrPw_confirm").val()) {
		$("#userVO #newUsrPw_confirm").parent().find(".emp").text("패스워드가 다릅니다.").show();
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
	//현재 비밀번호 정합성 체크
	$.ajax({
		url: "${basePath}/mypage/r/n/selectPasswordChk.do",
		type: 'POST',
		dataType : "json",
		data : $("#userVO").serialize(),
		error: function(){
			 alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) { 
			if(r.result) {
				document.userVO.submit();
			} else{
				$("#userVO #usrPw").parent().find(".emp").text("기존 패스워드와 다릅니다.").show();
				return;
			}
		}
	}); 
};

//비밀번호 체크  (숫자, 문자, 특수문자 1개 이상 반드시 포함 8자리 이상 20자리 이하)
var fn_checkPass2 = function(objId){
	 var alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	 var number = "1234567890";
	 var sChar = "-_=+\|()*&^%$#@!~`?></;,.:'";
	 
	 var sChar_Count = 0;
	 var alphaCheck = false;
	 var numberCheck = false;
	 
	 var pw = $("#"+objId).val();
	 if(9 <= pw.length && pw.length <= 20){
	 	for(var i=0; i<pw.length; i++){
	   		if(sChar.indexOf(pw.charAt(i)) != -1){
	   			sChar_Count++;
	   		}
	   		if(alpha.indexOf(pw.charAt(i)) != -1){
	    		alphaCheck = true;
	   		}
	   		if(number.indexOf(pw.charAt(i)) != -1){
	    		numberCheck = true;
	   		}
	  	}//for
	 	
	  	if(sChar_Count < 1 || alphaCheck != true || numberCheck != true){
	  		$("#"+objId).val("");
	  		$("#"+objId).focus();
	  		$("#userVO #newUsrPw").parent().find(".emp").text("비밀번호는 영문,숫자,특수문자 1자이상(%,$,#,@,!)\n모두 포함하여 9~20자로 조합해주세요").show();
	   		return;
	  	}//if
	  
	 }else{
		 $("#"+objId).val("");
		 $("#"+objId).focus();
		 $("#userVO #newUsrPw").parent().find(".emp").text("비밀번호는 영문,숫자,특수문자 1자이상(%,$,#,@,!)\n모두 포함하여 9~20자로 조합해주세요").show();
	  	return;
	 }//else
	 return true;
};
</script>
</body>
</html>

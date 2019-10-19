<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<div class="myinfo_left">
	<ul>
		<li>이메일 주소</li>
		<li>비밀번호</li>
		<li>이름</li>
		<li>휴대폰</li>
	</ul>
</div>
<div class="myinfo_right">
	<ul class="myinfo_input">
		<li><c:out value="${resultVO.emailAddr}"/></li>
		<li>.........<span class="myinfo_fix_btn">
			<a href="javascript:void(0);" onclick="javascript:fn_updatePassword('2');">변경</a></span>
		</li>
		<li><c:out value="${resultVO.usrNm}"/></li>
		<li id="mblPnoLi"><c:out value="${resultVO.mblPno}"/><span class="myinfo_fix_btn"><a href="javascript:void(0);" onclick="javascript:fn_updateMblPno('doing');">변경</a></span></li>
		<li id="mblPnoChgLi" style="display: none;">
			<input id="mblPnoChg" type="text" value="" placeholder="01011112222" title="휴대폰 번호를 입력해주세요." maxlength="21" style="height: 40px;"/>
			<span class="myinfo_save_btn"><a href="javascript:void(0);" onclick="javascript:fn_updateMblPnoProc(this);">저장</a></span><span class="myinfo_cancle_btn">
			<a href="javascript:void(0);" onclick="javascript:fn_updateMblPno('cancel');">취소</a></span><span class="emp"></span></li>
		</li>
	</ul>
</div>
<form name="mblUpdateVO" id="mblUpdateVO" method="post" action="${basePath}/mypage/w/n/updateMblPnoProc.do" onsubmit="return false;">
	<input type="hidden" name="mblPno" id="mblPnoChg1">
</form>
<script type="text/javascript">
//휴대폰 변경 클릭시
var fn_updateMblPno = function(param) {
	if(param == "doing") {
		$("#mblPnoLi").hide();
		$("#mblPnoChgLi").show();
	} else {
		$("#mblPnoLi").show();
		$("#mblPnoChgLi").hide();
		$("#mblPnoChg").val("");
		$("#mblPnoChg").parent().find(".emp").text("");
	}
};

//휴대폰 변경 처리
var isValidChk;
var fn_updateMblPnoProc = function(e) {
	isValidChk = true;
	if(!$.trim($("#mblPnoChg").val())) {
		$("#mblPnoChg").parent().find(".emp").text("휴대폰 번호를 입력해 주세요.").show();
		isValidChk = false;
	}
	if (!TypeChecker.number($("#mblPnoChg").val())) {
		$("#mblPnoChg").parent().find(".emp").text("숫자형식으로 기입해주세요. (ex : 01011112222)").show();
		$("#mblPnoChg").focus();
		isValidChk = false;
	}
	if(isValidChk) {
		if(!confirm("수정 하시겠습니까?")){
			return;
		}
		var mblPnoChg = $("#mblPnoChg").val();
		$("#mblUpdateVO #mblPnoChg1").val(mblPnoChg);
		document.mblUpdateVO.submit();
	}
	
}
</script>
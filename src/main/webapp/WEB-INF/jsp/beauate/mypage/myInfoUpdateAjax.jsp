<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!-- 내 정보 수정-->
<div class="cpn">
	<div class="h5-head">
		<div class="myinfo_out_btn">
			<a href="javascript:void(0);" onclick="javascript:fn_deleteMemberProc();">회원탈퇴</a>
		</div>
	</div>
	<!--내용-->
	<div class="myinfo_con" id="myInfo_target"></div>
	<!--//내용-->
</div>
</div>
<form name="userInfoForm" id="userInfoForm" method="post" action="">
</form>
<!--//내 정보 수정-->
<script type="text/javascript">
var myInfoTabId = 1; //탭번호 전역변수(첫페이지 1탭)
$(function() {
	fn_updatePassword(1);
});

//비밀번호 탭은 아니지만 탭과 동일함
var fn_updatePassword = function(tabId) {
	myInfoTabId = tabId;
	fn_myInfoCommonAjax(myInfoTabId)
};

//개인정보수정, 비밀번호변경수정 ajax
var fn_myInfoCommonAjax = function(myInfoTabId) {
	var url = "";
	if(myInfoTabId == '1') {
		url = "${basePath}/mypage/r/n/updateMyInfoChild.do";
	} else {
		url = "${basePath}/mypage/r/n/updatePassword.do";
	}
	$.ajax({
		url: url,
// 		data: params,
		type: 'POST',
		dataType: 'html',
		cache: false,
		success: function(r) {
			$('#myInfo_target').children().remove();
			$('#myInfo_target').html(r);
		},
		error : function() {
		  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};

//회원탈퇴
var fn_deleteMemberProc = function() {
	if(confirm("탈퇴 하시겠습니까?")){
		location.href='${basePath}/mypage/w/n/deleteMemberProc.do';
	}
};
</script>

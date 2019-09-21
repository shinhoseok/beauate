<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<div class="header-wrap">
	<div class="header-inner">
		<h1 class="header-logo"><a href="#">BEAUATE</a></h1>			
		<ul class="header-util header-util-left">
			<li><a href="#">오프라인 클래스</a></li>
			<li><a href="#">온라인 클래스</a></li>
			<li><a href="#">제품소개</a></li>
			<li><a href="#">뷰아떼 스토리</a></li>
		</ul>
		<ul class="header-util header-util-right">
			<li><a href="javascript:void(0);" onclick="fn_loginPopUpLayer();">로그인</a></li>
			<li><a href="#">회원가입</a></li>
			<li><a href="#" class="line">멘토지원</a></li>
		</ul>
	</div>
</div>
<div id="modal-login" class="modal"></div>
<script type="text/javascript">
	//로그인 팝업
	var fn_loginPopUpLayer = function() {
		$.ajax({
			url: "${basePath}/login/a/n/login.do",
			type: 'POST',
			dataType : "html",
			error: function(){
				 alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
				 return;
			},
			success: function(r) { 
				$("#modal-login").html(r);
			}
		});
		$.blockUI({message:$("#modal-login"),css:{width:"0px",height:"0px",position:"absolute",left:"35%",top:"20%", textAlign:"left"}});
	};
	//로그인 팝업 닫기
	var fn_loginPopClose = function () {
		$.unblockUI();
		$("#windowLoginPopup").empty();
	};
</script>

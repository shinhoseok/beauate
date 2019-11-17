<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<script type="text/javascript" src="${scriptPath}/jquery.blockUI.js"></script>
<div id="header">
	<div class="header-wrap">
		<div class="header-inner">
			<h1 class="header-logo"><a href="${basePath}/home/a/n/main.do">BEAUATE</a></h1>			
			<ul class="header-util header-util-left">
				<li><a href="${basePath}/offclass/a/t/selectOffClassList.do">오프라인 클래스</a></li>
				<li><a href="javascript:void(0);" onclick="javascript:fn_onlineClass();">온라인 클래스</a></li>
				<li><a href="${basePath}/board/a/t/selectBoardList.do">뷰티정보</a></li>
				<li><a href="${basePath}/intro/a/n/intro.do"">뷰아떼 스토리</a></li>
			</ul>
			<ul class="header-util header-util-right">
				<c:choose>
				<c:when test="${sessionScope.loginVO != null && sessionScope.loginVO.emailAddr != null}">
<%-- 					<strong>${sessionScope.loginVO.usrNm}</strong> 님 환영합니다. --%>
					<li><a href="${basePath}/mypage/r/t/selectMyClassList.do">마이페이지</a></li>
					<li><a href="${basePath}/user/w/t/userPasswordChange.do">비밀번호 변경</a></li>
					<li><a href="javascript:void(0);" onclick="fn_logout();">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:void(0);" onclick="javascript:fn_loginPopUpLayer();">로그인</a></li>
					<li><a href="${basePath}/user/a/t/userInsert.do">회원가입</a></li>
					<li><a href="${basePath}/mento/a/n/mentoApply.do" class="line">멘토지원</a></li>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</div>
<div id="modal-login" class="modal"></div>
<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
<script type="text/javascript" src="${scriptPath}/common.js"></script>
<script type="text/javascript">
	//로그인 팝업
	var fn_loginPopUpLayer = function() {
// 		$("#loginPopOpen").get(0).click();	

		$.ajax({ 
			url: "${basePath}/login/a/n/login.do",
			type: 'POST',
			dataType : 'html',
			error: function(){
				alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			},
			success: function(r){
				//타입까지 비교
				$("#modal-login").html(r);
			}
		}); 
		$.blockUI({message:$("#modal-login"),css:{width:"0px",height:"0px",position:"absolute",left:"35%",top:"20%", textAlign:"left"}});
	};
	
	var fn_loginPopClose = function() {
		$.unblockUI();
		$("#modal-login").empty();
	};

	var fn_logout = function() {
		if(confirm("로그아웃 하시겠습니까?")){
			document.location.href="${basePath}/user/a/n/logOut.do";
		}
	};
	
	//온라인클래스 준비중
	var fn_onlineClass = function() {
		alert("준비 중 입니다.");
	};
</script>

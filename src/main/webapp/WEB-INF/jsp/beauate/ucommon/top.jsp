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
				<li><a href="${basePath}/board/a/t/selectBoardList.do">제품소개</a></li>
				<li><a href="javascript:void(0);" onclick="javascript:fn_onlineClass();">뷰아떼 스토리</a></li>
			</ul>
			<ul class="header-util header-util-right">
				<c:choose>
				<c:when test="${sessionScope.loginVO != null && sessionScope.loginVO.emailAddr != null}">
					<strong>${sessionScope.loginVO.usrNm}</strong> 님 환영합니다.
					<li><a href="${basePath}/mypage/r/t/selectMyClassList.do">마이페이지</a></li>
					<li><a href="${basePath}/user/w/t/userPasswordChange.do">비밀번호 변경</a></li>
					<li><a href="javascript:void(0);" onclick="fn_logout();">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:void(0);" onclick="javascript:fn_loginPopUpLayer();">로그인</a></li>
					<li><a href="${basePath}/user/a/t/userInsert.do">회원가입</a></li>
					<li><a href="javascript:void(0);" onclick="javascript:fn_onlineClass();" class="line">멘토지원</a></li>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</div>
<!-- container -->
<div id="container" style="display: none;">
	<!-- content -->
	<div class="content">
		<div class="content-inner">			
			<!-- 팝업 : 로그인 -->
			<div id="modal-login" class="modal">
				<form id="loginVO" name="loginVO" method="post" action="${basePath}/login/a/n/afterLogin.do">
					<h2>sign in</h2>
					<p class="title-desc">오늘도 힘내세요</p>
					<ul class="input-area">
						<li>
							<input type="text" name="emailAddr" id="emailAddr" placeholder="이메일" title="이메일을 입력해주세요." maxlength="21" />
							<span style="display: none;" id="emailAddrChk" class="emp"> 이메일을 다시 확인해주세요</span>
						</li>
						<li>
							<input type="password" id="usrPw" name="usrPw" placeholder="비밀번호" onkeypress="if(event.keyCode==13){fn_login();} " title="비밀번호를 입력해주세요." maxlength="21" />
						</li>
					</ul>
					<div class="btn-area"><button type="button" class="btn" id="loginBtn" onclick="fn_login();"><span>로그인</span></button></div>
					<div class="login-link">
						<a href="#">회원가입</a>
						<a href="${basePath}/login/a/n/selectPwdSearch.do">비밀번호찾기</a>
					</div>
					<a href="javascript:void(0);" rel="modal:close" class="modal-close">닫기</a>
				</form>
			</div>
			<p style="display: none;"><a href="#modal-login" rel="modal:open" id="loginPopOpen">로그인 팝업</a></p>
		</div>
	</div>
	<!-- //content -->
</div>
<!-- <div id="modal-login" class="modal"></div> -->
<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
<script type="text/javascript" src="${scriptPath}/common.js"></script>
<script type="text/javascript">
	//로그인 팝업
	var fn_loginPopUpLayer = function() {
		$("#loginPopOpen").get(0).click();
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
	
	//login
	var fn_login = function() {
		var emailAddr = $("#emailAddr").val();
		var usrPw = $("#usrPw").val();
		if(!$.trim(emailAddr)){
			alert("아이디를 입력해 주십시오.");
			return;
		}
		if(!$.trim(usrPw)){
			alert("비밀번호를 입력해 주십시오.");
			return;
		}
		if (!TypeChecker.email($("#loginVO #emailAddr").val())) {
			alert("이메일은 "+TypeChecker.emailText);
			$("#loginVO #emailAddr").focus();
			return;
		}
		//패스워드조합3가지
		if(!fn_checkPass("usrPw")) {
			return;
		}
		//아이디체크
		$.ajax({ 	
			url: "${basePath}/login/a/n/selectIdPwdcheck.do",
			type: 'POST',
			dataType : "json",
			data : {"emailAddr" : emailAddr, "usrPw" : usrPw},
			error: function(){
				 alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
				 return;
			},
			success: function(r) { 
				if(r.message == 'N') {
					$("#emailAddrChk").show();
					$("#emailAddr").focus();
					return;
				} else{
					$("#loginVO").submit();
				}
			}
		});
	};
</script>

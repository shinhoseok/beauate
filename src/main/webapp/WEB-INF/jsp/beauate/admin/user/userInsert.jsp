<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>BASIC</title>
<!--공통css-->
<link rel="stylesheet" type="text/css" href="${cssPath}/common.css">
<!--현업 main page-->
<link rel="stylesheet" type="text/css" href="${cssPath}/worksite.css">
<!-- 스크립트 선언 -->
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js"></script>
</head>
<body>
	<!-- header Start -->
	<div class="header">
		<jsp:include page="/WEB-INF/jsp/beauate/common/top.jsp" flush="false" />
	</div>
	<!--header End-->
	<div class="wrap">
		<div class="container">
			<!-- left_menu Start -->
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp" %>
			<!-- left_menu End -->
			<div class="contents">
				<p class="contentTitle">사용자 등록</p>
				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<!-- sub_path End -->
				<h4 class="contentTitle_h4">회원 등록</h4>
				<form:form commandName="userVO" name="userVO" id="userVO" method="post" action="${basePath}/usermgr/w/n/userInsertProc.do" onsubmit="return false;">
					<div class="tableLayer">
						<table class="table">
							<caption></caption>
							<colgroup>
								<col width="150px">
								<col width="340px">
								<col width="150px">
								<col width="340px">
							</colgroup>
							<tbody class="line">
								<tr>
									<th class="bullet_orange">E-mail</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label> 
											<form:input path="emailAddr" id="emailAddr" style="width: 320px;" onfocus="checker(this, 100 , 'nbytes_emailAddr');" onblur="stopchecker();"/>
										</div>
									</td>
									<th class="bullet_orange">이름</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label> 
											<form:input path="usrNm" id="usrNm" style="width: 320px;" onfocus="checker(this, 100 , 'nbytes_usrNm');" onblur="stopchecker();"/>
										</div>
									</td>
								</tr>
								<tr>
									<th class="bullet_orange">패스워드</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label> 
											<form:password path="usrPw" id="usrPw" style="width: 320px; height:28px; border: 1px solid #D4D4D4;" onfocus="checker(this, 80 , 'nbytes_usrPw');" onblur="stopchecker();"/>
										</div>
									</td>
									<th>핸드폰번호</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label> 
											<form:input path="mblPno" id="mblPno" style="width: 320px;" onfocus="checker(this, 50 , 'nbytes_pno');" onblur="stopchecker();"/>
										</div>
									</td>
								</tr>
								<tr>
									<th>패스워드 확인</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label> 
											<input type="password" id="user_pw_confirm" style="width: 320px; height:28px; border: 1px solid #D4D4D4;" onfocus="checker(this, 20 , 'nbytes_usrPw');" onblur="stopchecker();" autocomplete="off" style="width: 180px;"/> &nbsp; 
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form:form>
				<div class="T_btnLayer fr">
					<a href="javascript:void(0);" onclick="fn_insertUserProc();"><button type="button" class="blueBtn L">등록</button></a>
					<a href="${basePath}/usermgr/r/m/userList.do"><button type="button" class="blueBtn L">취소</button></a>
				</div>
			</div>
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<!-- footer Start-->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- footer End -->

	<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
	<script type="text/javascript" src="${scriptPath}/common.js"></script>
	<script type="text/javascript">
		//저장
		fn_insertUserProc = function(){
			
			if(!$.trim($("#userVO #usrNm").val())) {
				alert("이름을 입력해 주세요");	
				$("#userVO #usrNm").focus();
				return;
			}
			
			if(!$.trim($("#userVO #emailAddr").val())) {
				alert("이메일을 입력해 주세요");	
				$("#userVO #emailAddr").focus();
				return;
			}
			
			if (!TypeChecker.korEng($("#userVO #usrNm").val())) {
				alert("이름은 "+TypeChecker.korEngText);
				$("#userVO #usrNm").focus();
				return;
			}
			
			if(!$.trim($("#userVO #usrPw").val())) {
				alert("패스워드 입력해 주세요");	
				$("#userVO #usrPw").focus();
				return;
			}
			//패스워드조합3가지
			if(!fn_checkPass("usrPw")) {
				return;
			}
			if($("#userVO #usrPw").val() != $("#userVO #user_pw_confirm").val()) {
// 				alert($("#userVO #user_pw").val() +" >> "+$("#userVO #user_pw_confirm").val())
				alert("패스워드를 확인해주세요");
				$("#userVO #user_pw").focus();
				return;
			}
			if (!TypeChecker.email($("#userVO #emailAddr").val())) {
				alert("이메일은 "+TypeChecker.emailText);
				$("#userVO #emailAddr").focus();
				return;
			}
			
			if (!TypeChecker.number($("#userVO #mblPno").val())) {
				alert("휴대폰 번호는 "+TypeChecker.numberText);
				$("#userVO #mblPno").focus();
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
				error: function(){
					 alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
					 return;
				},
				success: function(r) { 
					if(r.chkResult == 'N') {
						alert("사용자 아이디가 중복되었습니다 다른값으로 입력바랍니다.");
						$("#usrId").focus();
						return;
					} else{
						document.userVO.submit();
					}
				}
			}); 
		};
	</script>
</body>
</html>

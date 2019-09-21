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
				<p class="contentTitle">사용자 수정</p>
				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<!-- sub_path End -->
				<h4 class="contentTitle_h4">회원 수정</h4>
				<form:form commandName="userVO" name="userVO" id="userVO" method="post" action="${basePath}/usermgr/w/n/userUpdateProc.do" onsubmit="return false;">
					<form:hidden path="usrId" id="usrId"/>
					<input type="hidden" id="pwChangeGubun" name="pwChangeGubun" value="N"></input>
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
									<td><c:out value="${userVO.emailAddr}"/></td>
									</td>
									<th class="bullet_orange">패스워드</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:password path="usrPw" id="usrPw" readonly="true" onfocus="checker(this, 20 , 'nbytes_usrPw');" onblur="stopchecker();" autocomplete="off" style="width: 180px;"/> &nbsp; 
											<label class="blind" for=""></label>
											<input type="checkbox" value="" id="pwChange"></input>체크시 패스워드 변경
										</div>
									</td>
								</tr>
								<tr>
									<th class="bullet_orange">이름</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label> 
											<form:input path="usrNm" onfocus="checker(this, 100 , 'nbytes_usrNm');" onblur="stopchecker();" style="width: 320px;" type="text" placeholder="${userVO.usrNm}"/>
										</div>
									</td>
									<th>휴대폰</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label> 
											<form:input path="mblPno" style="width: 320px;" onfocus="checker(this, 50 , 'nbytes_mblPno');" onblur="stopchecker();" placeholder="${userVO.mblPno}"/>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form:form>
				<div class="T_btnLayer fr">
					<a href="javascript:void(0);" onclick="javascript:fn_updateUserProc();"><button type="button" class="blueBtn L">수정</button></a>
					<a href="${basePath}/usermgr/r/m/userView.do?usrId=${userVO.usrId}"><button type="button" class="blueBtn L">취소</button></a>
				</div>
			</div>
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<!-- footer Start-->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- footer End -->

	<script type="text/javascript" src="${scriptPath}/common.js"></script>
	<script type="text/javascript">
		//수정
		fn_updateUserProc = function(){
			if(!$.trim($("#userVO #usrNm").val())) {
				alert("이름을 입력해 주세요");	
				$("#userVO #usrNm").focus();
				return;
			}
			
			if($("#pwChange").is(':checked')){
				$("#pwChangeGubun").val("Y");
				if(!$.trim($("#userVO #usrPw").val())) {
					alert("패스워드 변경을 체크하셨습니다. \n패스워드를 입력해 주세요");	
					$("#userVO #usrPw").focus();
					return;
				}
			}else{
				$("#pwChangeGubun").val("N");
			};
			
				
		   	if(!confirm("수정 하시겠습니까?")){
		   		return;
		   	}
			
			document.userVO.submit();
		};
	
		$(document).ready(function() {
			$("#pwChange").click(function() {
				if($("#pwChange").is(':checked')){
					$("#usrPw").attr('readonly',false);
				}else{
					$("#usrPw").attr('readonly',true);
				}
			});
		});
	</script>
</body>
</html>

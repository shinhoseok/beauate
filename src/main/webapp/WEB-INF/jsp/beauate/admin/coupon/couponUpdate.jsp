<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="naver-site-verification" content="c03e63b14e10bb3c48bb213c40e148287b19ea7f"/>
<title>BASIC</title>
<!--공통css-->
<link rel="stylesheet" type="text/css" href="${cssPath}/common.css">
<!--현업 main page-->
<link rel="stylesheet" type="text/css" href="${cssPath}/worksite.css">
<link rel="stylesheet" href="${scriptPath}/jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css" />
<!-- 스크립트 선언 -->
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="${scriptPath}/jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
<script type="text/javascript" src="${scriptPath}/common.js"></script>
<script type="text/javascript" src="${scriptPath}/commonDate.js"></script>
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
				<p class="contentTitle">쿠폰 수정</p>
				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<form:form commandName="resultVO" name="couponVO" id="couponVO" method="post" action="${basePath}/cpnmng/w/m/updateCpnMngProc.do" onsubmit="return false;">
					<form:hidden path="couponId"/>
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
									<th>쿠폰명</th>
									<td colspan="3">
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="couponNm" onfocus="checker(this, 50 , 'nbytes_couponNm');" onblur="stopchecker();" style="width: 810px;"/>
											&nbsp;[<span id="nbytes_couponNm" class="color_red">0</span>/50]byte
										</div>
									</td>
								</tr>
								<tr>
									<th>사용조건</th>
									<td colspan="3">
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="couponCdt" onfocus="checker(this, 50 , 'nbytes_couponCdt');" onblur="stopchecker();" style="width: 810px;"/>
											&nbsp;[<span id="nbytes_couponCdt" class="color_red">0</span>/50]byte
										</div>
									</td>
								</tr>
								<tr>
									<th class="bullet_orange">할인율</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="couponRate" onfocus="checker(this, 30 , 'nbytes_couponRate');" onblur="stopchecker();" style="width: 320px;"/>
											&nbsp;[<span id="nbytes_couponRate" class="color_red">0</span>/20]byte
										</div>
									</td>
									<th>만료기간</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="couponEndDt" type="text" id="couponEndDt" readonly="true" style="width: 280px;"/>
										</div>
									</td>
								</tr>
								<tr>
									<th class="bullet_orange">쿠폰상태</th>
									<td colspan="3">
										<form:select path="couponSt" id="couponSt" class="w30p">
											<form:options items="${couponStList}" itemLabel="mclsNm"  itemValue="mclsCd"/>
										</form:select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form:form>
				<div class="T_btnLayer fr">
					<a href="#" onclick="javascript:fn_updateCpnMngProc();"><button type="button" class="blueBtn L">수정</button></a>
					<a href="#" onclick="javascript:fn_selectCpnMngList();"><button type="button" class="blueBtn L">취소</button></a>
				</div>
			</div>
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<!-- footer Start-->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- footer End -->
</body>

<script type="text/javascript">
$(document).ready(function(){
	DefaultDatePicker($("#couponEndDt"), "yy-mm-dd", 10, "${imagePath}");
});

//등록하기
var fn_updateCpnMngProc = function(){
	if (!TypeChecker.required($("#couponNm").val())) {
		alert("'쿠폰명'은  "+ TypeChecker.requiredText);
		$("#couponNm").focus();
		return;
	}
	
	if (!TypeChecker.required($("#couponRate").val())) {
		alert("'쿠폰 할인율'은  "+ TypeChecker.requiredText);
		$("#couponRate").focus();
		return;
	}
	
// 	if (!TypeChecker.alphanum($("#couponEndDt").val())) {
// 		alert("'쿠폰 만료기간'은 "+TypeChecker.requiredText);
// 		$("#couponEndDt").focus();
// 		return;
// 	}

	if (!confirm("수정 하시겠습니까?")) {
		return;
	}
	
	document.couponVO.submit();
};

//등록 취소 - 프로그램 목록으로 돌아감
var fn_selectCpnMngList = function() {
	var frm = document.couponVO;
	frm.action = "<c:url value='${basePath}/cpnmng/r/m/selectCouponMngList.do'/>";
	frm.submit();
};
</script>
</html>

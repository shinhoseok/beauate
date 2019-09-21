<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Basic</title>
	
	<link rel="stylesheet" type="text/css" href="${cssPath}/common.css">
	<link rel="stylesheet" type="text/css" href="${cssPath}/worksite.css">
	<link rel="stylesheet" type="text/css" href="${cssPath}/buttonStyle.css">
	
	<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js" ></script>
</head>
<body>
<!-- Top -->
<div class="header">
	<jsp:include page="/WEB-INF/jsp/beauate/common/top.jsp" flush="false" />
</div>

<div class="wrap">
	<div class="container">

		<!-- 좌측메뉴리스트 left_menu -->
		<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp" %>
		
		<!-- 본문 시작 -->
		<div class="contents">
			<p class="contentTitle">권한관리</p>
				<p class="sub_path">
					<img src="${imagePath}/ico_home.png" width="10" height="9" />
					&nbsp;〉&nbsp;포탈관리〉&nbsp;권한관리&nbsp;〉&nbsp;권한그룹관리
				</p>

				<h4 class="contentTitle_h4">권한그룹 정보</h4>
				<form:form commandName="roleVO" method="post" id="detailForm">
					<form:hidden path="pageIndex"/>
					<form:hidden path="rlId"/>
					<form:hidden path="searchCondition"/>
					<form:hidden path="searchKeyword"/>
					<div class="tableLayer">
						<table class="table">
							<caption></caption>
							<colgroup>
								<col width="150px;">
								<col width="*">
							</colgroup>
							<tbody class="line">
								<tr>
									<th><c:out value="권한코드"/></th>
									<td><c:out value="${tempVO.rlCd}"/></td>
								</tr>
								<tr>
									<th><c:out value="권한그룹명"/></th>
									<td><c:out value="${tempVO.rlName}"/></td>
								</tr>
								<tr>
									<th><c:out value="권한분류"/></th>
									<td><c:out value="${tempVO.rlCls}"/></td>
								</tr>
								<tr>
									<th><c:out value="권한설명"/></th>
									<td><c:out value="${tempVO.rlDes}"/></td>
								</tr>
							</tbody>
						</table>
					</div>
				</form:form>

				<div class="T_btnLayer fr">
					<a href="#"><button type="button" class="blueBtn L" onclick="fn_update();">수정</button></a>
					<a href="#"><button type="button" class="blueBtn L" onclick="fn_deleteProc();">삭제</button></a>
					<a href="#"><button type="button" class="blueBtn L" onclick="fn_list();">목록</button></a>
				</div>

		</div>
	</div>
</div>

<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>

<script type="text/javascript">
fn_deleteProc = function () {
	if (!confirm("삭제 하시겠습니까?")) {
		return false;
	}
	$("#detailForm").attr("action", "${basePath}/role/w/n/deleteRoleProc.do").submit();
};

fn_update = function () {
	$("#detailForm").attr("action", "${basePath}/role/w/m/updateRoleGroup.do").submit();
};

fn_list = function () {
	$("#detailForm").attr("action", "${basePath}/role/r/m/selectRoleGroupList.do").submit();
};

</script>
</body>
</html>





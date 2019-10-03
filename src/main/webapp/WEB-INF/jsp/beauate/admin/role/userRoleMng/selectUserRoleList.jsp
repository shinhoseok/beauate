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
	
	<!-- layerPop -->
	<link rel="stylesheet" type="text/css" href="${cssPath}/windowPop.css">
	
	<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js" ></script>
	<script type="text/javascript" src="${scriptPath}/jquery/jquery.blockUI.js" ></script>
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
		<div class="contents">
			<p class="contentTitle">사용자별 권한관리</p>
			<p class="sub_path">
				<img src="${imagePath}/ico_home.png" width="10" height="9" />&nbsp;〉&nbsp;포탈관리〉&nbsp;권한관리&nbsp;〉&nbsp;사용자별 권한 관리
			</p>
<form:form commandName="userVO" method="post" id="listForm">
	<form:hidden path="pageIndex"/>
	<form:hidden path="sortSubject"/>
	<form:hidden path="sortDescend"/>
			<div class="selectBox">
				<form:select path="searchCondition" class="w13p">
					<form:option value="usrId" label="사용자 ID"/>
					<form:option value="usrNm" label="사용자 명"/>
				</form:select>
				<form:input path="searchKeyword" cssStyle="width: 737px;" cssClass="searchName"/>
				<button type="button" class="grayBtn ico" onclick="fn_search(1);">
					<img src="${imagePath}/ico_search.png"> 검색
				</button>
			</div>

			<div class="tableLayer">
				<table class="tableList">
					<caption></caption>
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="*%">
					</colgroup>
					<thead>
						<th class="noBg">사용자ID
							<span class="arrow_ascending"><a href="#"></a></span>
							<span class="arrow_descending"><a href="#"></a></span>
						</th>
						<th>사용자명
							<span class="arrow_ascending"><a href="#"></a></span>
							<span class="arrow_descending"><a href="#"></a></span>
						</th>
						<th>등록권한</th>
					</thead>
					<tbody>
					<!-- foreach 로 제어 될 부분 -->
					<c:choose>
						<c:when test="${not empty rslt.userRoleList}">
							<c:forEach items="${rslt.userRoleList}" var="list" varStatus="st">
								<tr class="row">
									<td><c:out value="${list.usrId}"/></td>
									<td><c:out value="${list.usrNm}"/></td>
									<td><button type="button" class="grayBtn S" onclick="fn_popUpLayer('${list.usrId}');">확인</button></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">
									<c:out value="데이터가 없습니다."/>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
			<div class="paging_place">
				<div class="paging_wrap">
<%-- 					<ui:pagination paginationInfo="${rslt.paginationInfo}" type="image" jsFunction="fn_search"/> --%>
					<comTag:paging totalCount="${rslt.userRoleListCnt}" pageNo="${userVO.pageIndex}" pageSize="${userVO.pageSize}" clickPage="fn_search"/>
				</div>
			</div>
</form:form>
		</div>
	</div>
</div>

<div id="windowPopup" style="display: none;"></div>

<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
<script type="text/javascript">
/* 권한별 사용자 등록 팝업 Layer */
fn_popUpLayer = function (_userId) {
	var _url = "${basePath}/userrole/z/n/selectUserRolePopList.do";
	$.ajax({
		url : _url
		, data : {
			usrId : _userId
		}
	}).done(function (res) {
		$("#windowPopup").html(res);
	});
	$.blockUI({message:$("#windowPopup"),css:{width:"0px",height:"0px",position:"absolute",left:"25%",top:"20%", textAlign:"left"}});
};

fn_search = function (_pageNo) {
	$("#pageIndex").val(_pageNo);
	$("#listForm").attr("action", "${basePath}/userrole/z/m/selectUserRoleList.do").submit();
};

fn_PopClose = function () {
	$.unblockUI();
	$("#windowPopup").empty();
};
</script>
</body>
</html>
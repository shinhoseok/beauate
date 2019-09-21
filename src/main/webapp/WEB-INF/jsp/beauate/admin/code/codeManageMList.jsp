<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE html>
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
<script type="text/javascript"
	src="${scriptPath}/jquery/jquery-1.12.3.min.js"></script>
</head>
<body>
	<!-- header Start -->
	<div class="header">
		<jsp:include page="/WEB-INF/jsp/beauate/common/top.jsp" flush="false" />
	</div>
	<!-- header End -->

	<!-- wrap Start -->
	<div class="wrap">
		<!-- container Start -->
		<div class="container">
			<!-- left_menu Start -->
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp"%>
			<!-- left_menu End -->

			<!-- contents Start -->
			<div class="contents">
				<p class="contentTitle">공통코드관리</p>

				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list">
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<!-- sub_path End -->

				<form:form commandName="codeVO" id="listForm" name="listForm" method="post">
					<form:hidden path="pageIndex" />
					<form:hidden path="searchCondition" />
					<form:hidden path="searchKeyword" />
					<form:hidden path="lclsId" />
					<!-- 등록박스// -->
					<h4 class="contentTitle_h4">코드관리 등록</h4>
					<div class="tableLayer">
						<table class="table">
							<caption>권한관리생성</caption>
							<colgroup>
								<col width="15%" />
								<col width="35%" />
								<col width="15%" />
								<col width="35%" />
							</colgroup>
							<tbody class="line">
								<tr>
									<th>대분류코드</th>
									<td><c:out value='${rsltMap.lclsCd}' /></td>
									<th>대분류명</th>
									<td><c:out value='${rsltMap.lclsNm}' /></td>
								</tr>
								<tr>
									<th>대분류코드설명</th>
									<td colspan="3"><c:out value='${rsltMap.lclsEpl}' /></td>
								</tr>
								<tr>
									<th>사용여부</th>
									<td colspan="3"><c:out value='${rsltMap.useYn}' /></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //등록박스 -->
					<!-- 게시판리스트// -->
					<div class="tableLayer">
						<table class="tableList">
							<caption>프로그램관리 검색</caption>
							<colgroup>
								<col width="25%" />
								<col width="25%" />
								<col width="20%" />
								<col width="20%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr>
									<th>소분류코드</th>
									<th>소분류명</th>
									<th>설 명</th>
									<th>순 서</th>
									<th>사용유무</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(rsltMap.codeList) != 0}">
										<c:forEach items="${rsltMap.codeList }" var="list"
											varStatus="i">
											<tr class="row">
												<td class="mclsCd" title="<c:out value='${list.mclsCd}'/>"><c:out
														value='${list.mclsCd}' /></td>
												<td class="mclsNm" title="<c:out value='${list.mclsNm}'/>">
													<a
													href="${basePath}/code/r/m/selectMCodeList.do?mclsId=<c:out value='${list.mclsId}'/>&lclsId=<c:out value='${list.lclsId}'/>"><c:out
															value='${list.mclsNm}' /></a>
												</td>
												<td class="mclsEpl" title="<c:out value='${list.mclsEpl}'/>"><c:out
														value='${list.mclsEpl}' /></td>
												<td class="ord" title="<c:out value='${list.ord}'/>"><c:out
														value='${list.ord}' /></td>
												<td class="useYn2" title="<c:out value='${list.useYn2}'/>"><c:out
														value='${list.useYn2}' /></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<td colspan="5">데이터가 없습니다.</td>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<!-- //게시판리스트 -->
					<!-- 버튼// -->
					<div class="T_btnLayer fr">
						<c:if test="${ sessionScope.loginVO.menuRlDiv == 'z'}">
							<a href="#"
								onclick="javascript:fn_updateCode('${rsltMap.lclsId}');"><button
									type="button" class="blueBtn L">수정</button></a>
						</c:if>
						<a href="#" onclick="javascript:fn_codeManageList();"><button
								type="button" class="blueBtn L">목록</button></a>
					</div>
					<!-- //버튼 -->

				</form:form>
			</div>
			<!-- contents End -->


		</div>
		<!--container End-->

	</div>
	<!--wrap End-->

	<!-- footer // -->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- // footer -->

<script>
	fn_updateCode = function(lclsId) {
		$("#lclsId").val(lclsId);
		$("#listForm").attr("action","${basePath}/code/z/m/updateLCodeListPage.do");
		$("#listForm").submit();
	};
	
	//목록으로 이동
	fn_codeManageList = function() {
		$("#listForm").attr("action","${basePath}/code/r/m/selectCodeManageList.do");
		$("#listForm").submit();
	};
</script>
</body>
</html>
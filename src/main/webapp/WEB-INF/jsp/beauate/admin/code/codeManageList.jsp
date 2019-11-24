<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE html>
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
<!-- 스크립트 선언 -->
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js"></script>
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
					<input type="hidden" id="pageIndex" name="pageIndex" value="${codeVO.pageIndex }"/>
					<input type="hidden" id="lclsCd" name="lclsCd"/>

					<div class="selectBox">
						<form:select path="searchCondition">
							<form:option value="lclsNm" label="대분류명"></form:option>
							<form:option value="lclsCd" label="대분류코드"></form:option>
						</form:select>
						<form:input path="searchKeyword" class="searchName" cssStyle="width: 733px;" onkeydown="if(event.keyCode==13){javascript:fn_searchList(1);}"></form:input>
						<a href="#" onclick="javascript:fn_searchList(1);"><button type="button" class="grayBtn ico"><img src="${imagePath }/ico_search.png"> 검색</button></a>
					</div>

					<div class="tableLayer">
						<table class="tableList">
							<caption></caption>
							<colgroup>
								<col width="25%">
								<col width="25%">
								<col width="35%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr>
									<th class="noBg">대분류코드</th>
									<th>대분류명</th>
									<th>설명</th>
									<th>사용유무</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(codeList) != 0}">
										<c:forEach items="${codeList }" var="list" varStatus="i">
											<tr>
												<td title="<c:out value='${list.lclsCd}'/>"><c:out value='${list.lclsCd}' /></td>
												<td title="<c:out value='${list.lclsNm}'/>"><a href="javascript:void(0);" onclick="fn_selectDetail('${list.lclsId}');"><c:out value='${list.lclsNm}' /></a></td>
												<td title="<c:out value='${list.lclsEpl}'/>"><c:out value='${list.lclsEpl}' /></td>
												<td title="<c:out value='${list.useYn}'/>"><c:out value='${list.useYn}' /></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<td colspan="4">데이터가 없습니다.</td>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>

					<div class="T_btnLayer fr">
						<c:if test="${ sessionScope.loginVO.menuRlDiv == 'z'}">
							<a href="#" onclick="javascript:fn_insertCode();"><button type="button" class="blueBtn L">등록</button></a>
						</c:if>
					</div>

					<!-- 페이징// -->
					<div class="paging_place">
						<div class="paging_wrap">
<%-- 							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_searchList" /> --%>
							<comTag:paging totalCount="${codeListCnt}" pageNo="${codeVO.pageIndex}" pageSize="${codeVO.pageSize}" clickPage="fn_searchList"/>
						</div>
					</div>
					<!-- 페이징// -->
				</form:form>
			</div>

		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<!-- footer // -->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- // footer -->

	<script type="text/javascript">
		//검색
		fn_searchList = function(pageNo){
			$("#pageIndex").val(pageNo);
			$('#listForm').attr("action","${basePath }/code/r/m/selectCodeManageList.do");				
			$('#listForm').submit();
		};
		
		fn_selectDetail = function(lclsId){
			$('#listForm').attr("action","${basePath }/code/r/m/selectLCodeList.do?lclsId=" + lclsId);				
			$('#listForm').submit();
		};
		
		//코드 등록
		fn_insertCode = function() {
			$('#listForm').attr("action","${basePath }/code/z/m/insertCodePage.do");				
			$('#listForm').submit();
		};
	</script>
</body>
</html>

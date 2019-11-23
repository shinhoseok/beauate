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
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="${scriptPath}/jui/chart/core.js" ></script>
<script type="text/javascript" src="${scriptPath}/jui/chart/chart.min.js" ></script>
</head>
<body>
	<!-- header Start -->
	<div class="header">
		<jsp:include page="/WEB-INF/jsp/beauate/mcommon/top.jsp" flush="false" />
	</div>
	<!-- header End -->
	<div class="wrap">
		<div class="container">
			<!-- left_menu Start -->
			<%@ include file="/WEB-INF/jsp/beauate/mcommon/leftMenu.jsp"%>
			<!-- left_menu End -->
			<div class="contents">
				<p class="contentTitle">클래스 리스트</p>
				<p class="sub_path">
					<p class="sub_path"><img src="${imagePath}/ico_home.png" width="10" height="9" />&nbsp;〉&nbsp;멘토&nbsp;〉&nbsp;클래스관리〉&nbsp;클래스 수정요청</p>
				</p>
				<form:form commandName="classVO" id="classVO" name="listForm" method="post" action="${basePath}/offclassm/r/m/selectOffClassList.do">
					<form:hidden path="classId"/>
					<form:hidden path="pageIndex" id="pageIndex" />
					<form:hidden path="sortSubject" />
					<form:hidden path="sortDescend" />
					<div class="selectBox">
						<form:select path="searchCondition" class="w13p">
							<form:option value="classTitle" label="클래스명"></form:option>
							<form:option value="classCtSt" label="클래스카테고리"></form:option>
						</form:select> 
						<form:input path="searchKeyword" onkeydown="if(event.keyCode==13){javascript:fn_searchList(1);}" class="searchName" style="width: 737px;"></form:input>
						<button type="button" class="grayBtn ico" onclick="javascript:fn_searchList(1);"><img src="${imagePath }/ico_search.png"> 검색</button>
					</div>
				</form:form>
				<div class="tableLayer">
					<table class="tableList">
						<caption></caption>
						<colgroup>
							<col width="*">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<th sortId="classTitle">클래스 제목
								<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>									
							</th>
							<th>클래스시작일</th>
							<th>클래스종료일</th>
							<th>클래스상태</th>
							<th>클래스구분</th>
							<th>클래스카테고리</th>
							<th>지역</th>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(rslt.selectList) != 0}">
									<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
										<tr class="row" style="cursor: pointer;" onclick="javascript:fn_offClassDetail('${list.classId}');">
											<td style="text-align: left;"><c:out value="${list.classTitle}"/></td>
											<td>
												<fmt:parseDate value="${list.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
												<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
											</td>
											<td>
												<fmt:parseDate value="${list.classEndDt}" var="classEndDt" pattern="yyyy-MM-dd"/> 
												<fmt:formatDate value="${classEndDt}" pattern="yyyy-MM-dd"/>
											</td>
											<td>
												<c:choose>
													<c:when test="${list.classGb eq '2'}">
														외부
													</c:when>
													<c:otherwise>
														내부
													</c:otherwise>
												</c:choose>
											</td>
											<td>
												<c:choose>
													<c:when test="${list.classSt eq '1'}">
														오픈전
													</c:when>
													<c:when test="${list.classSt eq '2'}">
														오픈중
													</c:when>
													<c:when test="${list.classSt eq '3'}">
														신청마감
													</c:when>
													<c:otherwise>
														클래스종료
													</c:otherwise>
												</c:choose>
											</td>
											<td>
												<c:choose>
													<c:when test="${list.classCtSt eq '1'}">
														헤어
													</c:when>
													<c:when test="${list.classCtSt eq '2'}">
														메이크업
													</c:when>
													<c:when test="${list.classCtSt eq '3'}">
														속눈썹/반영구
													</c:when>
													<c:when test="${list.classCtSt eq '4'}">
														피부/왁싱
													</c:when>
													<c:when test="${list.classCtSt eq '5'}">
														네일
													</c:when>
													<c:otherwise>
														기타
													</c:otherwise>
												</c:choose>
											</td>
											<td><c:out value="${list.classAreaStNm}"/></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<td colspan="8">데이터가 없습니다.</td>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<div class="T_btnLayer fr">
						<a href="https://forms.gle/3Bi1mRtwbUTg8w3f9" target="_blank"><button type="button" class="blueBtn L">수정</button></a>
					</div>
				</div>
				<!-- 페이징// -->
				<div class="paging_place">
					<div class="paging_wrap">
<%-- 						<ui:pagination paginationInfo="${rslt.paginationInfo}" type="image" jsFunction="fn_searchList" /> --%>
						<comTag:paging totalCount="${rslt.selectListCnt}" pageNo="${classVO.pageIndex}" pageSize="${classVO.pageSize}" clickPage="fn_searchList"/>
					</div>
				</div>
				<!-- 페이징// -->
			</div>
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<!-- footer // -->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- // footer -->
	
<script type="text/javascript">
//정렬
var fn_sort = function(obj) {
	var frm = document.listForm;
	frm.sortDescend.value = obj.className == "arrow_ascending" ? "asc" : "desc";
	frm.sortSubject.value = obj.parentNode.getAttributeNode("sortId").value;
	frm.submit();
};

//검색, 페이지 이동
var fn_searchList = function(pageNo){
	var frm = document.listForm;
	frm.pageIndex.value = pageNo;
	frm.submit();
};

//오프라인클래스 상세정보
var fn_offClassDetail = function(classId) {
	var frm = document.listForm;
	frm.classId.value = classId;
	frm.action = "<c:url value='${basePath}/offclassm/r/n/selectOffClassDetail.do'/>";
	frm.submit();
};
</script>
</body>
</html>

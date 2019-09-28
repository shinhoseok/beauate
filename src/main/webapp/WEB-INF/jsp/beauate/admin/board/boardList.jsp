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
	<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js" ></script>
</head>
<body>
	<!-- header Start -->
	<div class="header">
		<jsp:include page="/WEB-INF/jsp/beauate/common/top.jsp" flush="false" />
	</div>
	<!-- header End -->
	<div class="wrap">
		<div class="container">
			<!-- left_menu Start -->
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp" %>
			<!-- left_menu End -->
			<div class="contents">
				<p class="contentTitle">게시판 관리</p>
				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<!-- sub_path End -->
				<form:form commandName="boardVO" id="listForm" name="listForm" method="post" action="${basePath}/boardm/r/m/selectBoardMngList.do">
					<form:hidden path="postId"/>
					<form:hidden path="sortSubject"/>
					<form:hidden path="sortDescend"/>
					<form:hidden path="pageIndex"/>
					<div class="selectBox">
						<form:select path="searchCondition" class="w13p">
							<form:option value="post_title" label="제목"></form:option>
						</form:select> 
						<form:input path="searchKeyword" onkeydown="if(event.keyCode==13){javascript:fn_searchList(1);}" class="searchName" style="width: 737px;"></form:input>
						<button type="button" class="grayBtn ico" onclick="javascript:fn_searchList(1);"><img src="${imagePath }/ico_search.png"> 검색</button>
					</div>
					<div class="tableLayer">
						<table class="tableList">
							<caption></caption>
							<colgroup>
								<col width="5%">
								<col width="20%">
								<col width="*">
								<col width="20%">
							</colgroup>
							<thead>
								<th sortId="postId" class="noBg">게시글_ID
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>									
								</th>
								<th sortId="postCategorySt">카테고리
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>				
								</th>
								<th sortId="postTitle">제목
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>		
								</th>
								<th sortId="postDt">등록일자
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${rslt.selectListCnt != 0}">
										<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
											<tr class="row" onclick="javascript:fn_boardDetail('${list.postId}')" style="cursor: pointer;">
												<td><c:out value="${list.postId}"/></td>
												<td>
												<c:choose>
													<c:when test="${list.postCategorySt eq '1'}">
														제품정보
													</c:when>
													<c:when test="${list.postCategorySt eq '2'}">
														자격증
													</c:when>
													<c:when test="${list.postCategorySt eq '3'}">
														박람회
													</c:when>
													<c:otherwise>
														공지사항
													</c:otherwise>
												</c:choose>
												</td>
												<td><c:out value="${list.postTitle}"/></td>
												<td><fmt:formatDate value="${list.postDt}" pattern="yyyy-MM-dd"/></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<td  colspan="4">데이터가 없습니다.</td>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="T_btnLayer fr">
							<a href="${basePath }/boardm/r/m/insertBoardMng.do"><button type="button" class="blueBtn L">등록</button></a>
						</div>
					</div>
				</form:form>
				<!--paging Start -->
				<div class="paging_place">
					<div class="paging_wrap">
						<ui:pagination paginationInfo="${rslt.paginationInfo}" type="image" jsFunction="fn_searchList" />
					</div>
				</div>
				<!--paging End -->
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
//정렬
fn_sort = function(obj) {
	var frm = document.listForm;
	frm.sortDescend.value = obj.className == "arrow_ascending" ? "asc" : "desc";
	frm.sortSubject.value = obj.parentNode.getAttributeNode("sortId").value;
	frm.submit();
};

//상세정보
fn_boardDetail = function(postId) {
	var frm = document.listForm;
	frm.postId.value = postId;
	frm.action = "<c:url value='${basePath}/boardm/r/m/selectBoardMngDetail.do'/>";
	frm.submit();
};

//검색, 페이지 이동
fn_searchList = function(pageNo){
	var frm = document.listForm;
	frm.pageIndex.value = pageNo;
	frm.submit();
};
</script>
</html>

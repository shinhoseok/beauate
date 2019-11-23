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
<script type="text/javascript" src="${scriptPath}/common.js"></script>
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
				<p class="contentTitle">후기 리스트</p>
				<!-- sub_path Start -->
				<p class="sub_path">
					<p class="sub_path"><img src="${imagePath}/ico_home.png" width="10" height="9" />&nbsp;〉&nbsp;멘토&nbsp;〉&nbsp;클래스 후기 관리〉&nbsp;후기 리스트</p>
				</p>
				<!-- sub_path End -->
				<form:form commandName="reviewVO" id="reviewVO" name="listForm" method="post" action="${basePath}/mento/r/n/selectOffClassReviewList.do">
					<form:hidden path="pageIndex" id="pageIndex" />
					<form:hidden path="sortSubject" />
					<form:hidden path="sortDescend" />
					<div class="selectBox">
						<form:select path="searchCondition" class="w13p">
							<form:option value="usrNm" label="이름"></form:option>
							<form:option value="emailAddr" label="이메일"></form:option>
						</form:select> 
						<form:input path="searchKeyword" onkeydown="if(event.keyCode==13){javascript:fn_searchList(1);}" class="searchName" style="width: 737px;"></form:input>
						<button type="button" class="grayBtn ico">
							<img src="${imagePath}/ico_search.png"> 검색
						</button>
					</div>
					<div class="tableLayer">
						<table class="tableList">
							<caption></caption>
							<colgroup>
								<col width="*">
								<col width="10%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead>
								<th sortId="emailAddr">클래스제목
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th sortId="usrNm">이름
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th sortId="curriculum">커리큘럼
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th sortId="kindness">친절도
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th sortId="timePro">시간준수
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th sortId="community">전달력
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th sortId="reviewDt">등록일
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th sortId="cmtDelYn">댓글여부
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${rslt.selectListCnt != 0}">
										<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
											<tr class="row" style="cursor: pointer;" onclick="javascript:fn_selectReviewMngDetail('${list.reviewId}','${list.commentId}');">
												<td style="text-align: left;"><c:out value="${list.classTitle}"/></td>
												<td><c:out value="${list.usrNm}"/></td>
												<td><c:out value="${list.curriculum}"/></td>
												<td><c:out value="${list.kindness}"/></td>
												<td><c:out value="${list.timePro}"/></td>
												<td><c:out value="${list.community}"/></td>
												<td>
													<fmt:parseDate value="${list.reviewDt}" var="reviewDt" pattern="yyyy-MM-dd"/> 
													<fmt:formatDate value="${reviewDt}" pattern="yyyy-MM-dd"/>
												</td>
												<c:choose>
													<c:when test="${not empty list.commentId}">
														<td>Y</td>
													</c:when>
													<c:otherwise>
														<td>N</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<td colspan="8">데이터가 없습니다.</td>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
<!-- 						<div class="T_btnLayer fr"> -->
<!-- 							<a href="javascript:void(0);" onclick="fn_updateReviewMngProc('Y');"><button type="button" class="blueBtn L">삭제</button></a> -->
<!-- 							<a href="javascript:void(0);" onclick="fn_updateReviewMngProc('N');"><button type="button" class="blueBtn L">삭제취소</button></a> -->
<!-- 						</div> -->
					</div>
				</form:form>
				<!-- 페이징// -->
				<div class="paging_place">
					<div class="paging_wrap">
						<comTag:paging totalCount="${rslt.selectListCnt}" pageNo="${reviewVO.pageIndex}" pageSize="${reviewVO.pageSize}" clickPage="fn_searchList"/>
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
//검색, 페이지 이동
var fn_searchList = function(pageNo){
	var forms = document.listForm;
	forms.pageIndex.value = pageNo;
	forms.submit();
};

//정렬
var fn_sort = function(obj) {
	var frm = document.listForm;
	frm.sortDescend.value = obj.className == "arrow_ascending" ? "asc" : "desc";
	frm.sortSubject.value = obj.parentNode.getAttributeNode("sortId").value;
	frm.submit();
};

//후기리스트 상세보기
var fn_selectReviewMngDetail = function(reviewId, commentId) {
	location.href = "${basePath}/mento/r/n/selectReviewMngDetail.do?reviewId="+reviewId+"&commentId="+commentId;
};
</script>
</body>
</html>

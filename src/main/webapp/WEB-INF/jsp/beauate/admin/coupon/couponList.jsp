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
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp" %>
			<div class="contents">
				<p class="contentTitle">쿠폰 관리</p>
				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<form:form commandName="couponVO" id="listForm" name="listForm" method="post" action="${basePath}/cpnmng/r/m/selectCouponMngList.do">
					<form:hidden path="couponId"/>
					<form:hidden path="sortSubject"/>
					<form:hidden path="sortDescend"/>
					<form:hidden path="pageIndex"/>
					<!-- sub_path End -->
					<div class="selectBox">
						<select name="select" class="w13p">
							<option>2014</option>
						</select>
						<input class="searchName" name="" type="text" />
						<button type="button" class="grayBtn ico">
							<img src="${imagePath }/ico_search.png"> 검색
						</button>
						<button type="button" class="grayBtn02 ico">초기화</button>
					</div>
					<div class="tableLayer">
						<table class="tableList">
							<caption></caption>
							<colgroup>
								<col width="10%">
								<col width="20%">
								<col width="*%">
								<col width="5%">
								<col width="20%">
								<col width="5%">
							</colgroup>
							<thead>
								<th class="noBg">쿠폰번호</th>
								<th>생성일
									<span class="arrow_ascending"><a href="#"></a></span>
									<span class="arrow_descending"><a href="#"></a></span>
								</th>
								<th>쿠폰명
									<span class="arrow_ascending"><a href="#"></a></span>
									<span class="arrow_descending"><a href="#"></a></span>
								</th>
								<th>할인율</th>
								<th>만료기간
									<span class="arrow_ascending"><a href="#"></a></span>
									<span class="arrow_descending"><a href="#"></a></span>
								</th>
								<th>상태</th>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${rslt.selectListCnt != 0}">
										<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
											<tr class="row">
												<td><c:out value="${list.couponId}"/></td>
												<td>
													<fmt:parseDate value="${list.couponStartDt}" var="couponStartDt" pattern="yyyy-MM-dd"/> 
													<fmt:formatDate value="${couponStartDt}" pattern="yyyy-MM-dd"/>
												</td>
												<td>
													<a href="${basePath}/cpnmng/r/m/selectCpnMngDetail.do?couponId=<c:out value='${list.couponId}'/>">
													<c:out value="${list.couponNm}"/>
												</td>
												<td><c:out value="${list.couponRate}"/>%</td>
												<td>
													<fmt:parseDate value="${list.couponEndDt}" var="couponEndDt" pattern="yyyy-MM-dd"/> 
													<fmt:formatDate value="${couponEndDt}" pattern="yyyy-MM-dd"/>
												</td>
												<td><c:out value="${list.couponSt}"/></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<td colspan="6">데이터가 없습니다.</td>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="T_btnLayer fr">
							<a href="${basePath}/cpnmng/w/m/insertCpnMng.do"><button type="button" class="blueBtn L">등록</button></a>
						</div>
					</div>
				</form:form>
				<!--페이징-->
				<div class="paging_place">
					<div class="paging_wrap">
						<comTag:paging totalCount="${rslt.selectListCnt}" pageNo="${couponVO.pageIndex}" pageSize="${couponVO.pageSize}" clickPage="fn_searchList"/>
					</div>
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
</html>

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
				<p class="contentTitle">클래스 신청 리스트</p>
				<p class="sub_path">
					<p class="sub_path"><img src="${imagePath}/ico_home.png" width="10" height="9" />&nbsp;〉&nbsp;멘토&nbsp;〉&nbsp;클래스 신청자 관리〉&nbsp;클래스 신청자 리스트</p>
				</p>
				<div class="selectBox">
                	<select name="select" class="w13p">
                        <option>이메일</option>
                        <option>이름</option>
                    </select>
                    <input class="searchName" name="" type="text"/>
                    <button type="button" class="grayBtn ico"><img src="${imagePath}/ico_search.png"> 검색</button>
                </div> 	
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
							<th class="noBg">이메일</th>
							<th>이름</th>
							<th>휴대폰</th>
							<th>결제금액</th>
							<th>결제상태</th>
							<th>결제일</th>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${rslt.selectListCnt != 0}">
									<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
										<tr class="row">
											<td><c:out value="${list.emailAddr}"/></td>
											<td><c:out value="${list.usrNm}"/></td>
											<td><c:out value="${list.mblPno}"/></td>
											<td><c:out value="${list.payCostNo}"/></td>
											<td><c:out value="${list.payStNm}"/></td>
											<td><fmt:formatDate value="${list.payDt}" pattern="yyyy-MM-dd"/></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<td colspan="8">데이터가 없습니다.</td>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
<!-- 					<div class="T_btnLayer fr"> -->
<!-- 						<a href="https://forms.gle/3Bi1mRtwbUTg8w3f9" target="_blank"><button type="button" class="blueBtn L">수정</button></a> -->
<!-- 					</div> -->
				</div>
				<!-- 페이징// -->
				<div class="paging_place">
					<div class="paging_wrap">
<%-- 						<ui:pagination paginationInfo="${rslt.paginationInfo}" type="image" jsFunction="fn_searchList" /> --%>
						<comTag:paging totalCount="${rslt.selectListCnt}" pageNo="${payVO.pageIndex}" pageSize="${payVO.pageSize}" clickPage="fn_searchList"/>
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
</script>
</body>
</html>

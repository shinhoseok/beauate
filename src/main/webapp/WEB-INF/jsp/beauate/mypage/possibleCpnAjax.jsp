<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<h3 class="h3-head3-1"></h3>
<ul class="cpn-list1">
	<c:choose>
		<c:when test="${rslt.selectListCnt != 0}">
			<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
				<li>
					<div class="cpn-title"><c:out value="${list.couponNm}"/></div>
					<div class="cpn-one">
						<span><c:out value="${list.couponRate}"/>%</span>
					</div>
					<p class="p1">사용조건</p>
					<p class="p2"><c:out value="${list.couponCdt}"/></p>
					<p class="p3">쿠폰만료일</p>
					<p class="p4"><c:out value="${list.couponEndDt}"/></p>
				</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<li>데이터가 없습니다.</li>
		</c:otherwise>
	</c:choose>
</ul>
<!-- 페이징// -->
<div class="paging">
	<ui:pagination paginationInfo="${rslt.paginationInfo}" type="image" jsFunction="fn_couponSearchList" />
</div>
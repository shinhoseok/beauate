<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<ul class="product-list-01" data-column="4">
	<c:choose>
		<c:when test="${rslt.selectListCnt != 0}">
			<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
				<li>
					<a href="#">
						<div class="thumb"><img src="${uploadPath}/<c:out value="${list.imgSrc }"/>" alt="커버력 끝판왕 인생 파운데이션" /></div>
						<div class="title"><c:out value="${list.postTitle}"/></div>
						<div class="desc"><c:out value="${list.postSubTitle}"/></div>
						<div class="date"><fmt:formatDate value="${list.postDt}" pattern="yy.MM.dd"/></div>
					</a>
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
<%-- 	<ui:pagination paginationInfo="${rslt.paginationInfo}" type="front" jsFunction="fn_searchList" /> --%>
	<ui:pagination paginationInfo="${rslt.paginationInfo}" type="image" jsFunction="fn_searchList" />
</div>
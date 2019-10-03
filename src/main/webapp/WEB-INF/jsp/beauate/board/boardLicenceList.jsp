<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<div class="content-inner">
	<ul class="license-list">
	<c:choose>
		<c:when test="${rslt.selectListCnt != 0}">
			<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
				<li>
					<a href="javascript:void(0);" onclick="javascript:fn_boardCommonDetail('${list.postId }');">
						<div class="thumb"><img src="${uploadPath}/<c:out value="${list.imgSrc }"/>" alt="아름다움을 끌어내주는 전문가가 되어보자, 피부미용사 자격증!" /></div>
						<div class="rcont">
							<div class="title"><c:out value="${list.postTitle}"/></div>
							<div class="desc"><c:out value="${list.postSubTitle}"/></div>
							<div class="date"><fmt:formatDate value="${list.postDt}" pattern="yy.MM.dd"/></div>
						</div>
					</a>
				</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<li>데이터가 없습니다.</li>
		</c:otherwise>
	</c:choose>
	</ul>
</div><br/>
<!-- 페이징// -->
<div class="paging">
<%-- 	<ui:pagination paginationInfo="${rslt.paginationInfo}" type="front" jsFunction="fn_searchList" /> --%>
	<ui:pagination paginationInfo="${rslt.paginationInfo}" type="image" jsFunction="fn_searchList" />
</div>
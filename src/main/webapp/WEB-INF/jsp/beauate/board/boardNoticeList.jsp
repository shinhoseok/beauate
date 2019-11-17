<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<div class="content-inner">
	<!-- Notice -->
	<div class="notice">
		<h3>Notice</h3>
		<ul class="notice-list">
			<c:choose>
				<c:when test="${rslt.selectListCnt != 0}">
					<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
						<li>
							<c:if test="${list.postSubTitle eq 'A'}"><span class="emp">*중요</span></c:if>
							<a href="javascript:void(0);" onclick="javascript:fn_boardCommonDetail('${list.postId }');">
								<span class="title"><c:out value="${list.postTitle}"/></span>
								<span class="date"><fmt:formatDate value="${list.postDt}" pattern="yy.MM.dd"/></span>
							</a>
						</li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<li>데이터가 없습니다.</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div><br/>
<!-- 페이징// -->
<div class="paging">
	<ui:pagination paginationInfo="${rslt.paginationInfo}" type="image" jsFunction="fn_searchList" />
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<div class="h3-head4-1"></div>
<ul class="pay-list1">
	<c:choose>
		<c:when test="${rslt.selectListCnt != 0}">
			<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
				<!--긴박스 하나-->
				<li class="pay-li">
					<div class="p-left">
						<p class="p-p1">주문번호</p>
						<p class="p-p2"><c:out value="${list.payId}"/></p>
						<p class="p-p3"><c:out value="${list.payStNm}"/></p>
					</div>
					<div class="p-center-img">
						<img src="${uploadPath}/<c:out value="${list.imgSrc3 }"/>"/>
					</div>
					<div class="p-center">
						<p class="p-p4"><c:out value="${list.classTitle}"/></p>
						<p>
							<c:out value="${list.classStNm}"/> | 
							<fmt:parseDate value="${list.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
							<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
						</p>
					</div>
					<div class="p-right">
						<p class="p-p5">총 결제금액
						<p class="p-p6"><fmt:formatNumber value="${list.payCostNo }" pattern="#,###" /></p>
						</p>
						<p class="p-p7">결제일
						<p class="p-p8">
							<fmt:formatDate value="${list.payDt}" pattern="yyyy-MM-dd"/>
						</p>
						</p>
						<p class="p-p9">결제수단
						<p class="p-p10"><c:out value="${list.payMethodNm}"/></p>
						</p>
					</div>
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
	<ui:pagination paginationInfo="${rslt.paginationInfo}" type="image" jsFunction="fn_paySearchList" />
</div>
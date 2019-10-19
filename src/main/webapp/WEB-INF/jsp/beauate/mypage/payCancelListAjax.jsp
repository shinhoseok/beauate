<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<div class="h3-head4-2"></div>
<ul class="pay-list2">
	<c:choose>
		<c:when test="${rslt.selectListCnt != 0}">
			<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
				<li class="pay2-li">
					<div class="p2-left">
						<p class="p2-p1">주문번호</p>
						<p class="p2-p2"><c:out value="${list.payId}"/></p>
						<c:choose>
							<c:when test="${list.paySt eq '2'}">
								<p class="p2-p3-2">취소완료</p>
							</c:when>
							<c:when test="${list.paySt eq '3'}">
								<p class="p2-p3-3">환불처리중</p>
							</c:when>
							<c:when test="${list.paySt eq '4'}">
								<p class="p2-p3-2">환불완료</p>
							</c:when>
						</c:choose>
					</div>
					<div class="p2-center-img">
						<img src="${uploadPath}/<c:out value="${list.imgSrc3 }"/>"/>
					</div>
					<div class="p2-center">
						<p class="p-p4"><c:out value="${list.classTitle}"/></p>
						<p>
							<c:out value="${list.classStNm}"/> | 
							<fmt:parseDate value="${list.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
							<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
						</p>
					</div>
					<div class="p2-right">
						<p class="p2-p5">총 결제금액
						<p class="p2-p6"><fmt:formatNumber value="${list.payCostNo }" pattern="#,###" /></p>
						</p>
						<p class="p2-p7">결제일
						<p class="p2-p8"><fmt:formatDate value="${list.payDt}" pattern="yyyy-MM-dd"/></p>
						</p>
						<p class="p2-p9">결제수단
						<p class="p2-p10"><c:out value="${list.payMethodNm}"/></p>
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
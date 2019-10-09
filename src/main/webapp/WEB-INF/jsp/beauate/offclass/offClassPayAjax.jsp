<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<li>
	<span class="txt">상품금액</span>
	<span class="price"><fmt:formatNumber value="${classCost }" pattern="#,###" />원</span>
</li>
<c:choose>
	<c:when test="${not empty couponVO.couponId }">
		<li>
			<span class="txt">쿠폰사용</span>
			<c:set var="couponMoney" value="${classCost * couponVO.couponRate / 100}"/>
			<span class="price"><fmt:formatNumber value="${couponMoney}" pattern="#,###" /></span>
		</li>
		<li class="total-sum">
			<span class="txt">총 결제금액</span>
			<c:set var="totalMoney" value="${classCost - couponMoney}"/>
			<span class="price"><fmt:formatNumber value="${totalMoney}" pattern="#,###" /><span class="unit">원</span></span>
		</li>
	</c:when>
	<c:otherwise>
		<li class="total-sum">
			<span class="txt">총 결제금액</span>
			<span class="price"><fmt:formatNumber value="${classCost }" pattern="#,###" />원</span></span>
		</li>
	</c:otherwise>
</c:choose>
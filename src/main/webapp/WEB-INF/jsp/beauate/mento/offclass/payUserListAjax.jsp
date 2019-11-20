<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<div class="tableLayer">
	<table class="tableList" >
		<caption></caption>
		<colgroup>
			<col width="*">
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
	<div class="T_btnLayer fr">
		<a href="javascript:void(0);"><button type="button" class="blueBtn L">엑셀다운로드</button></a>
	</div>
</div>
<!-- 페이징// -->
<div class="paging_place">
	<div class="paging_wrap">
		<comTag:paging totalCount="${rslt.selectListCnt}" pageNo="${payVO.pageIndex}" pageSize="${payVO.pageSize}" clickPage="fn_selectUserList"/>
	</div>
</div>

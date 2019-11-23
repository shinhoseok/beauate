<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<div class="tableLayer">
	<table class="tableList" >
		<caption></caption>
		<colgroup>
			<col width="*">
			<col width="20%">
			<col width="20%">
			<col width="30%">
		</colgroup>
		<thead>
			<th class="noBg">이메일</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>클래스명</th>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${rslt.selectListCnt != 0}">
					<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
						<tr class="row">
							<td><c:out value="${list.emailAddr}"/></td>
							<td><c:out value="${list.usrNm}"/></td>
							<td><c:out value="${list.mblPno}"/></td>
							<td><c:out value="${list.classTitle}"/></td>
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
		<comTag:paging totalCount="${rslt.selectListCnt}" pageNo="${jjimVO.pageIndex}" pageSize="${jjimVO.pageSize}" clickPage="fn_selectUserList"/>
	</div>
</div>

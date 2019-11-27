<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<span class="color_red">접속인원 : ${rslt.selectListCnt}</span>
<div class="tableLayer">
	<table class="tableList">
		<caption></caption>
		<colgroup>
			<col width="5%">
			<col width="20%">
			<col width="25%">
			<col width="20%">
			<col width="20%">
		</colgroup>
		<thead>
			<th class="noBg">번호</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>아이피</th>
			<th>접속일</th>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${rslt.selectListCnt != 0}">
					<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
						<tr class="row">
							<td><c:out value="${list.rNum}"/></td>
							<td><c:out value="${list.usrId}"/></td>
							<td><c:out value="${list.emailAddr}"/></td>
							<td><c:out value="${list.accessIp}"/></td>
							<td><c:out value="${list.accessDt}"/></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<td colspan="5">데이터가 없습니다.</td>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
<!-- 	<div class="T_btnLayer fr"> -->
<!-- 		<a href="#"><button type="button" class="blueBtn L">등록</button></a> -->
<!-- 	</div> -->
</div>
<!--페이징-->
<div class="paging_place">
	<div class="paging_wrap">
		<comTag:paging totalCount="${rslt.selectListCnt}" pageNo="${userStatsVO.pageIndex}" pageSize="${userStatsVO.pageSize}" clickPage="fn_searchList"/>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<span class="color_red">회원가입 인원 : ${rslt.selectListCnt}</span>
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
			<th>이름</th>
			<th>이메일</th>
			<th>휴대폰</th>
			<th>회원가입일</th>
			<th>마지막접속일</th>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${rslt.selectListCnt != 0}">
					<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
						<tr class="row">
							<td><c:out value="${list.RNUM}"/></td>
							<td><c:out value="${list.usrNm}"/></td>
							<td><c:out value="${list.emailAddr}"/></td>
							<td><c:out value="${list.mblPno}"/></td>
							<td><fmt:formatDate value="${list.joinDt}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${list.loginDt}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<td colspan="6">데이터가 없습니다.</td>
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
		<comTag:paging totalCount="${rslt.selectListCnt}" pageNo="${userVO.pageIndex}" pageSize="${userVO.pageSize}" clickPage="fn_searchList"/>
	</div>
</div>
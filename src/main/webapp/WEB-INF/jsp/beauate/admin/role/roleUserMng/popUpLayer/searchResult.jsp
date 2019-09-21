<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>

<table class="tableList2">
	<caption></caption>
	<colgroup>
		<col width="40px">
		<col width="118px">
		<col width="160px">
		<col width="133px">
	</colgroup>
	<thead>
		<th class="noBg">
			<label class="blind" for=""></label>
			<input type="checkbox" id="allCheck" onclick="fn_allCheckToggle(this, 'usrId');"/>
		</th>
		<th>사용자 ID</th>
		<th>사용자 명</th>
		<th>권한 코드</th>
	</thead>
	<tbody>
		<!-- 해당 권한이 없는 사용자 목록 -->
		<c:choose>
			<c:when test="${not empty roleUserListForUpdate}">
				<c:forEach items="${roleUserListForUpdate}" var="list" varStatus="st">
					<tr class="row popUpList">
						<td>
							<label class="blind" for=""></label>
							<input type="checkbox" id="target0${st.index}" name="usrId" value="${list.usrId}" />
						</td>
						<td><c:out value="${list.usrId}"/></td>
						<td><c:out value="${list.usrNm}"/></td>
						<td><c:out value="${list.rlCd}"/></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="row">
					<td colspan="4">데이터가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

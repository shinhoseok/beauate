<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>

<h4 class="h4_other">사용자 정보</h4>
<span class="total">총 <span class="color_red"><c:out value="${fn:length(roleUserList)}"/></span> 명
</span>
<form id="deleteForm" method="post">
	<div class="menuBigTable">
		<select multiple="multiple" style="width: 470px; height: 400px; overflow-y : auto;" name="usrId">
			<c:forEach items="${roleUserList}" var="list">
				<option label="<c:out value='${list.usrId} / ${list.usrNm}'/>" value="${list.usrId}"/>
			</c:forEach>
		</select>
	</div>
</form>

<input type="hidden" id="roleGroup" value="${roleGroup}">
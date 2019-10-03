<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<form:form commandName="menuStatsVO" id="listForm" name="listForm">
<form:hidden path="pageIndex"/>
<form:hidden path="sortSubject"/>
<form:hidden path="sortDescend"/>
	(${menuChartListCnt} 건)
	<table class="tableList">
		<caption></caption>
		<colgroup>
			<col width="15%">
			<col width="20%">
			<col width="25%">
			<col width="10%">
			<col width="10%">
		</colgroup>
		<thead>
			<th sortId="visitDate">날짜 
				<c:choose>
					<c:when test="${menuStatsVO.sortSubject == 'visitDate'}">
						<span class="${menuStatsVO.sortDescend == 'desc' ? 'arrow_ascending' : 'arrow_descending'}"><a href="#" onclick="javascript:fn_sort(this);"></a></span>
					</c:when>
					<c:otherwise>
						<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this);"></a></span>
						<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this);"></a></span>  
					</c:otherwise>
				</c:choose>
			</th>
			<th sortId="menuName">메뉴명
				<c:choose>
					<c:when test="${menuStatsVO.sortSubject == 'menuName'}">
						<span class="${menuStatsVO.sortDescend == 'desc' ? 'arrow_ascending' : 'arrow_descending'}"><a href="#" onclick="javascript:fn_sort(this);"></a></span>
					</c:when>
					<c:otherwise>
						<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this);"></a></span>
						<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this);"></a></span>  
					</c:otherwise>
				</c:choose>
			<th sortId="accessUrl">URL
				<c:choose>
					<c:when test="${menuStatsVO.sortSubject == 'accessUrl'}">
						<span class="${menuStatsVO.sortDescend == 'desc' ? 'arrow_ascending' : 'arrow_descending'}"><a href="#" onclick="javascript:fn_sort(this);"></a></span>
					</c:when>
					<c:otherwise>
						<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this);"></a></span>
						<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this);"></a></span>  
					</c:otherwise>
				</c:choose>
			</th>
			<th sortId="accessIp">접속IP
				<c:choose>
					<c:when test="${menuStatsVO.sortSubject == 'accessIp'}">
						<span class="${menuStatsVO.sortDescend == 'desc' ? 'arrow_ascending' : 'arrow_descending'}"><a href="#" onclick="javascript:fn_sort(this);"></a></span>
					</c:when>
					<c:otherwise>
						<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this);"></a></span>
						<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this);"></a></span>  
					</c:otherwise>
				</c:choose>
			</th>
			<th sortId="usrId">아이디
				<c:choose>
					<c:when test="${menuStatsVO.sortSubject == 'usrId'}">
						<span class="${menuStatsVO.sortDescend == 'desc' ? 'arrow_ascending' : 'arrow_descending'}"><a href="#" onclick="javascript:fn_sort(this);"></a></span>
					</c:when>
					<c:otherwise>
						<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this);"></a></span>
						<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this);"></a></span>  
					</c:otherwise>
				</c:choose>
			</th>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${fn:length(menuChartList) != 0}">
				<c:forEach items="${menuChartList}" var="list" varStatus="status">
					<tr class="row">
						<td><c:out value="${list.accessDate}"/></td>
						<td><c:out value="${list.menuName}"/></td>
						<td><c:out value="${list.accessUrl}"/></td>
						<td><c:out value="${list.accessIp}"/></td>
						<td><c:out value="${list.usrId}"/></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<td colspan="5">데이터가 없습니다.</td>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	<div class="T_btnLayer fr">
		<button type="button" class="blueBtn L" onclick="javascript:fn_excelDownload();">
			<img src="${imagePath }/icon_excel.png" alt="조회 버튼" /> 엑셀다운로드
		</button>
	</div>
	<div class="paging_place mb20">
		<div class="paging_wrap">
<%-- 			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_loadContents" /> --%>
			<comTag:paging totalCount="${menuChartListCnt}" pageNo="${menuStatsVO.pageIndex}" pageSize="${menuStatsVO.pageSize}" clickPage="fn_searchList"/>
		</div>
	</div>
</form:form>
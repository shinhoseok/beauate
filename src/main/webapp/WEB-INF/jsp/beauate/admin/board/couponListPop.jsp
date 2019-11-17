<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<form:form commandName="couponVO" id="listForm" name="listForm" method="post" action="${basePath }/menu/r/n/selectProgramPopList.do" onsubmit="return false;">
	<input type="hidden" id="pageIndex" name="pageIndex" value="1" />
	<p class="windowTitle">쿠폰 리스트</p>
	<span class="btn_close"><a href="javascript:void();" onclick="javascript:fn_PopClose();"><img src="${imagePath }/btn_close.gif" width="27" height="27" /></a>
	</span>
	<div class="w_potalMenu">
<!-- 		<div class="selectBox"> -->
<%-- 			<form:select path="searchCondition"> --%>
<%-- 				<form:option value="couponNm" label="쿠폰명"></form:option> --%>
<%-- 				<form:option value="couponCdt" label="사용조건"></form:option> --%>
<%-- 			</form:select> --%>
<%-- 			<form:input path="searchKeyword" class="searchName" name="" type="text" cssStyle="width: 737px;" onkeypress="if( event.keyCode==13 ){fn_searchList('1');}" /> --%>
<!-- 			<button type="button" class="grayBtn ico" onclick="javascript:fn_programListPopOpen(1);"> -->
<%-- 				<img src="${imagePath }/ico_search.png"> 검색 --%>
<!-- 			</button> -->
<!-- 		</div> -->
		<div class="tableLayer">
			<table class="tableList">
				<caption></caption>
				<colgroup>
					<col width="5%">
					<col width="25%">
					<col width="5%">
					<col width="10%">
					<col width="10%">
					<col width="*">
				</colgroup>
				<thead>
					<th class="noBg">선택</th>
					<th>쿠폰명</th>
					<th>할인율</th>
					<th>생성일</th>
					<th>만료일</th>
					<th>사용조건</th>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${rslt.selectListCnt != 0}">
							<c:forEach items="${rslt.selectList }" var="list" varStatus="i">
								<tr>
									<td>
										<input type="radio" name="couponId" value="<c:out value='${list.couponId}'/>" />
									</td>
									<td>
										<c:out value="${list.couponNm}" />
									</td>
									<td>
										<c:out value="${list.couponRate}" />
									</td>
									<td>
										<c:out value="${list.couponStartDt}" />
									</td>
									<td>
										<c:out value="${list.couponEndDt}" />
									</td>
									<td>
										<c:out value="${list.couponCdt}" />
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<td colspan="4">데이터가 없습니다.</td>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	<div class="T_btnLayer fr">
		<a href="javascript:void();" onclick="javascript:fn_selectPopProgram();"><button type="button" class="blueBtn L">선택</button></a>
		<a href="javascript:void();" onclick="javascript:fn_PopClose();"><button type="button" class="blueBtn L">취소</button></a>
	</div>

	<!--페이징-->
	<div class="paging_place">
		<div class="paging_wrap">
			<comTag:paging totalCount="${rslt.selectListCnt}" pageNo="${couponVO.pageIndex}" pageSize="${couponVO.pageSize}" clickPage="fn_searchList" />
		</div>
	</div>
</form:form>

<script type="text/javascript">
//선택
var fn_selectPopProgram = function(){
	var couponId = $('input:radio[name="couponId"]:checked').val();
	
	if(couponId == null){
		alert("쿠폰을 선택하세요");
		return;
	}

	fn_PopClose(couponId);
};
</script>

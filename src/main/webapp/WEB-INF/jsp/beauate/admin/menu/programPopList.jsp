<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<form:form commandName="programVO" id="listForm" name="listForm" method="post" target="modal" action="${basePath }/menu/r/n/selectProgramPopList.do" onsubmit="return false;">
	<input type="hidden" id="pageIndex" name="pageIndex" value="1"/>
	<p class="windowTitle">프로그램 리스트</p>
	<span class="btn_close">
		<a href="javascript:void();" onclick="javascript:fn_PopClose();"><img src="${imagePath }/btn_close.gif" width="27" height="27" /></a>
	</span>
	<div class="w_potalMenu">
		<div class="selectBox">
			<form:select path="searchCondition">
  				<form:option value="pgmName" label="프로그램명" ></form:option>
  				<form:option value="pgmParam" label="변수명"></form:option>
  			</form:select>	
			<form:input path="searchKeyword" class="searchName" name="" type="text" cssStyle="width: 737px;" onkeypress="if( event.keyCode==13 ){fn_searchList('1');}"/>
			<button type="button" class="grayBtn ico" onclick="javascript:fn_programListPopOpen(1);"><img src="${imagePath }/ico_search.png"> 검색</button>
		</div>
		<div class="tableLayer">
			<table class="tableList">
				<caption></caption>
				<colgroup>
					<col width="7%">
					<col width="25%">
					<col width="25%">
					<col width="43%">
				</colgroup>
				<thead>
					<th class="noBg">선택</th>
					<th>프로그램명</th>
					<th>변수명</th>
					<th>프로그램 대표 URL</th>
				</thead>
				<tbody>
				<c:choose>
                 	<c:when test="${fn:length(programList) != 0}">
                 		<c:forEach items="${programList }" var="list" varStatus="i">
							<tr>
								<td><input type="radio" name="pgmId" value="<c:out value='${list.pgmId}'/>" /></td>
								<td title="<c:out value='${list.pgmName}'/>"  >
									<input type="hidden" id="<c:out value='${list.pgmId}'/>" value="<c:out value="${list.pgmName}"/>"/>
									<c:out value="${list.pgmName}"/>
								</td>
	                        	<td title="<c:out value='${list.pgmParam}'/>"><c:out value="${list.pgmParam}"/></td>
	                        	<td title="<c:out value='${list.pgmUrl}'/>"><c:out value="${list.pgmUrl}"/></td>
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
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_searchList" />
		</div>
	</div>
</form:form>

<script type="text/javascript">
//검색, 페이징 이동
fn_searchList = function(pageNo){
	fn_programListPopOpen(pageNo);
};

//선택
fn_selectPopProgram = function(){
	var pgmId = $('input:radio[name="pgmId"]:checked').val();
	
	if(pgmId == null){
		alert("프로그램을 선택하세요");
		return;
	}
	
	var v_return = new Array();
	v_return[0]= pgmId;
	v_return[1]= $('#'+pgmId).val();

	fn_PopClose(v_return);
};
</script>

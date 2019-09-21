<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<h4 class="contentTitle_h4">메뉴상세정보</h4>
<!--메뉴체계도-->
<div class="menuBigTable">
	<p class="detailTitle">메뉴정보</p>
	<form:form commandName="menuVO" id="detailForm" name="detailForm" method="post" >
		<form:hidden path="menuId"/>
		<form:hidden path="uprMenuId"/>
		<form:hidden path="menuLvl" /> 
		<form:hidden path="menuLup" />   
		<table class="menu_table">
			<caption></caption>
			<colgroup>
				<col width="148px">
				<col width="212px">
				<col width="148px">
				<col width="212px">
			</colgroup>
			<tbody class="line">
				<c:choose>
					<c:when test="${!empty menuVO.menuId}">
						<tr>
							<th class="bullet_orange">메뉴명</th>
							<td>
								<c:out value="${menuVO.menuName}"/>
							</td>
							<th>메뉴구분</th>
							<td>
			              		<c:if test="${empty menuVO.uprMenuId}">ROOT</c:if>
			              		<c:if test="${!empty menuVO.uprMenuId && menuVO.menuDiv eq '1'}">일반</c:if>
			              		<c:if test="${!empty menuVO.uprMenuId && menuVO.menuDiv eq '2'}">관리자</c:if>
			              	</td>
			              	<form:hidden path="menuDiv"/>
						</tr>
						<tr>
							<th>사용유무</th>
							<td>
								<c:if test="${menuVO.useYn eq 'Y' }">사용</c:if>
			                   	<c:if test="${menuVO.useYn eq 'N' }">미사용</c:if>
							</td>
							<th>정렬순서</th>
							<td><c:out value="${menuVO.menuLup}"/></td>
						</tr>
						<tr>
							<th>메뉴설명</th>
							<td colspan="4">
								<div class="commonSearch_wrap">
									<label class="blind" for=""></label>
									<c:out value="${menuVO.menuDes }"/>
								</div>
							</td>
						</tr>
						<tr>
							<th rowspan="2">대상연결</th>
							<td colspan="4">
								<c:if test="${!empty menuVO.pgmId }"><c:out value="${menuVO.pgmName }"></c:out>(프로그램)</c:if>
								<c:if test="${!empty menuVO.otUrl }"><c:out value="${menuVO.otUrl }"></c:out>(URL)</c:if>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr><td colspan="4">데이터가 없습니다</td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<br />
		<c:if test="${!empty menuVO.uprMenuId}">
			<p class="detailTitle">권한정보</p>
			<span class="fr"><a href="#" onclick="javascript:fn_PgmRoleListPop('R');"><button type="button" class="grayBtn S">권한설정</button></a></span>        
			<table class="tableList2">
				<caption></caption>
				<colgroup>
					<col width="150px">
		           	<col width="298px">
		           	<col width="93px">
		           	<col width="93px">
		           	<col width="93px">
				</colgroup>
				<thead>
					<th class="noBg">권한정보</th>
					<th>권한그룹명</th>
					<th>조회</th>
					<th>등록</th>
					<th>관리</th>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${fn:length(menuVO.roleMappList) > 0 }">
						<c:forEach items="${menuVO.roleMappList }" var="list" varStatus="status">
						<spring:nestedPath path="roleMappList[${status.index}]">
							<tr class="row">
								<td><c:out value="${list.rlCd }" /></td>
	                    		<td><c:out value="${list.rlName }" /></td>
	                    		<td><c:if test="${list.rlDiv eq 'r' }">O</c:if>&nbsp;</td>
	                    		<td><c:if test="${list.rlDiv eq 'w' }">O</c:if>&nbsp;</td>
	                    		<td><c:if test="${list.rlDiv eq 'z' }">O</c:if>&nbsp;</td>
	            			</tr>
            			</spring:nestedPath>
           				</c:forEach>
           			</c:when>
           			<c:otherwise>
           				<tr class="row"><td colspan="5">맵핑된 권한 정보가 없습니다.</td></tr>	
           			</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</c:if>
	</form:form>
</div>
<div class="T_btnLayer fr">
	<c:if test="${!empty menuVO.uprMenuId}">
		<a href="javascript:void(0);" onclick="javascript:fn_updateMenu();"><button type="button" class="blueBtn L">수정</button></a>
	</c:if>
	<!--a href="#"><button type="button" class="blueBtn L">취소</button></a-->
</div> 

<script>
//수정
fn_updateMenu = function(){
	if(!confirm("현재 메뉴를 수정하시겠습니까?")){
		return;
	}
	
	var menuLvl = $("#detailForm #menuLvl").val();
	
	//1레벨의 ROOT 일반과 관리자는 지워지지 않는다 
	if(menuLvl == 1){
		alert("ROOT 메뉴는 수정할수 없습니다");
		return;
	}
	
	var url = "${basePath}/menu/z/n/updateMenu.do";

	$.ajax({ 
		url: url,    
		type: 'POST',    
		dataType: 'html', 
		data : $("#detailForm").serialize(),
		error: function(){
		  	alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
		},
		success: function(r){ 
	  		$("#menuContents").html(r);
		}
	}); 
};
</script>
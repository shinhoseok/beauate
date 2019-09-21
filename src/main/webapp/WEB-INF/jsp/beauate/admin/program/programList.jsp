<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	
	<title>BASIC</title>
	<!--공통css-->
	<link rel="stylesheet" type="text/css" href="${cssPath}/common.css">
	<!--현업 main page-->
	<link rel="stylesheet" type="text/css" href="${cssPath}/worksite.css">
	<!-- 스크립트 선언 -->
	<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js" ></script>
</head>
<body>
	<!-- header Start -->
	<div class="header">
		<jsp:include page="/WEB-INF/jsp/beauate/common/top.jsp" flush="false" />
	</div>
	<!-- header End -->
	
	<!-- wrap Start -->
	<div class="wrap">
		<!-- container Start -->
		<div class="container">
			<!-- left_menu Start -->
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp" %>
			<!-- left_menu End -->

			<!-- contents Start -->
			<div class="contents">
				<p class="contentTitle">프로그램 관리</p>

				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<!-- sub_path End -->

				<form:form commandName="programVO" id="listForm" name="listForm" method="post" action="${basePath}/program/r/m/selectProgramList.do">
					<form:hidden path="pgmId"/>
					<form:hidden path="sortSubject"/>
					<form:hidden path="sortDescend"/>
					<form:hidden path="pageIndex"/>
					
					<!-- selectBox Start -->
					<div class="selectBox">
						<form:select path="searchCondition" class="w13p">
							<form:option value="pgmName" label="프로그램명"></form:option>
							<form:option value="pgmParam" label="변수명"></form:option>
						</form:select> 
						<form:input path="searchKeyword" onkeydown="if(event.keyCode==13){javascript:fn_searchList(1);}" class="searchName" style="width: 737px;"></form:input>
						<button type="button" class="grayBtn ico" onclick="javascript:fn_searchList(1);"><img src="${imagePath }/ico_search.png"> 검색</button>
					</div>
					<!-- selectBox End -->

					<!-- program_list_board Start -->
					<div class="tableLayer">
						<table class="tableList">
							<caption>프로그램관리</caption>
							<colgroup>
								<col width="18%">
								<col width="18%">
								<col width="18%">
								<col width="46%">
							</colgroup>
							<thead>
								<tr>
									<th sortId="brdId" class="noBg">프로그램_ID
										<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
										<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>									
									</th>
									<th sortId="pgmName">프로그램명
										<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
										<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>				
									</th>
									<th sortId="pgmParam">변수명
										<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
										<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>		
									</th>
									<th>프로그램 대표 URL</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(programList) != 0}">
										<c:forEach items="${programList}" var="list" varStatus="i">
											<tr class="row">
												<td title="<c:out value='${list.pgmId}'/>">
													<c:out value="${list.pgmId}"/>
												</td>
												<td>
													<a href="javascript:fn_programDetail('${list.pgmId}');" style="cursor: pointer;">
														<c:out value="${list.pgmName}"></c:out>
													</a>
												</td>
												<td>
													<div title='<c:out value="${list.pgmParam }"/>'>
														<c:out value="${list.pgmParam}"></c:out>
													</div>
												</td>
												<td>
													<div title='<c:out value="${list.pgmUrl }"/>'>
														<c:out value="${list.pgmUrl}"></c:out>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<td  colspan="4">데이터가 없습니다.</td>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<!-- program_list_board End -->

					<!-- register button Start -->
					<div class="T_btnLayer fr">
<%-- 						<c:if test="${sessionScope.loginVO.menuRlDiv >= 'w'}"> --%>
							<a href="#" onclick="javascript:fn_excelDownload();"><button type="button" class="blueBtn L"><img src="${imagePath }/icon_excel.png" alt="조회 버튼" />엑셀다운로드</button></a>
							<a href="#" onclick="javascript:fn_insertProgram();"><button type="button" class="blueBtn L">등록</button></a>
<%-- 						</c:if> --%>
					</div>
					<!-- register button End -->

					<!--paging Start -->
					<div class="paging_place">
						<div class="paging_wrap">
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_searchList" />
						</div>
					</div>
					<!--paging End -->
				</form:form>
			</div>
			<!-- contents End -->
		</div>
		<!-- container End -->
	</div>
	<!-- wrap End -->

	<!-- footer Start-->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- footer End -->

	<script>
		//정렬
 		fn_sort = function(obj) {
			var frm = document.listForm;
			frm.sortDescend.value = obj.className == "arrow_ascending" ? "asc" : "desc";
			frm.sortSubject.value = obj.parentNode.getAttributeNode("sortId").value;
			frm.submit();
		};

		//프로그램 상세정보
		fn_programDetail = function(pgmId) {
			var frm = document.listForm;
			frm.pgmId.value = pgmId;
			frm.action = "<c:url value='${basePath}/program/r/m/selectProgram.do'/>";
			frm.submit();
		};
		
		//프로그램 등록
		fn_insertProgram = function() {
			var frm = document.listForm;
			frm.action = "<c:url value='${basePath}/program/w/m/insertProgram.do'/>";
			frm.submit();
		};
		
		//검색, 페이지 이동
		fn_searchList = function(pageNo){
			var frm = document.listForm;
			frm.pageIndex.value = pageNo;
			frm.submit();
		};
		
		//프로그램목록 엑셀 다운로드
		fn_excelDownload = function(){
			var frm = document.listForm;
			var tmpUrl = frm.action;
			frm.action = "<c:url value='${basePath}/program/r/m/programListExcelDownload.do'/>";
			frm.submit();
			frm.action = tmpUrl;
		};
	</script>
</body>
</html>
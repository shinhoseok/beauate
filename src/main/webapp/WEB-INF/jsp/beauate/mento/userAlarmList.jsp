<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE html>
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
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js"></script>
</head>
<body>
	<!-- header Start -->
	<div class="header">
		<jsp:include page="/WEB-INF/jsp/beauate/mcommon/top.jsp" flush="false" />
	</div>
	<!-- header End -->
	<div class="wrap">
		<div class="container">
			<!-- left_menu Start -->
			<%@ include file="/WEB-INF/jsp/beauate/mcommon/leftMenu.jsp"%>
			<!-- left_menu End -->
			<div class="contents">
				<p class="contentTitle">알람신청 리스트</p>
				<p class="sub_path">
					<p class="sub_path"><img src="${imagePath}/ico_home.png" width="10" height="9" />&nbsp;〉&nbsp;멘토&nbsp;〉&nbsp;클래스 신청자 관리〉&nbsp;알람 신청 리스트</p>
				</p>
				<form:form commandName="alarmVO" id="alarmVO" name="listForm" method="post" action="${basePath}/mento/r/n/selectOffClassAlarmList.do">
					<form:hidden path="pageIndex" id="pageIndex" />
					<form:hidden path="sortSubject" />
					<form:hidden path="sortDescend" />
					<div class="selectBox">
						<form:select path="searchCondition" class="w13p">
							<form:option value="usrNm" label="이름"></form:option>
							<form:option value="classTitle" label="클래스제목"></form:option>
						</form:select> 
						<form:input path="searchKeyword" onkeydown="if(event.keyCode==13){javascript:fn_searchList(1);}" class="searchName" style="width: 737px;"></form:input>
						<button type="button" class="grayBtn ico" onclick="javascript:fn_searchList(1);"><img src="${imagePath }/ico_search.png"> 검색</button>
					</div>
					<div class="tableLayer">
						<table class="tableList">
							<caption></caption>
							<colgroup>
								<col width="*">
								<col width="30%">
								<col width="30%">
							</colgroup>
							<thead>
								<th class="noBg">클래스제목</th>
								<th sortId="usrNm">신청자
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th sortId="alarmDt">신청일
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${rslt.selectListCnt != 0}">
										<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
											<tr class="row">
												<td><c:out value="${list.classTitle}"/></td>
												<td><c:out value="${list.usrNm}"/></td>
												<td>
													<fmt:parseDate value="${list.alarmDt}" var="alarmDt" pattern="yyyy-MM-dd"/> 
													<fmt:formatDate value="${alarmDt}" pattern="yyyy-MM-dd"/>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<td colspan="3">데이터가 없습니다.</td>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>

					<!--페이징-->
					<div class="paging_place">
						<div class="paging_wrap">
							<comTag:paging totalCount="${rslt.selectListCnt}" pageNo="${alarmVO.pageIndex}" pageSize="${alarmVO.pageSize}" clickPage="fn_searchList"/>
						</div>
					</div>
				</form:form>
			</div>
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<!-- footer // -->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- // footer -->
<!-- // footer -->
	<script type="text/javascript" src="${scriptPath}/common.js"></script>
	<script type="text/javascript">
	//검색, 페이지 이동
	var fn_searchList = function(pageNo){
		var forms = document.listForm;
		forms.pageIndex.value = pageNo;
		forms.submit();
	};
	
	//정렬
	var fn_sort = function(obj) {
		var frm = document.listForm;
		frm.sortDescend.value = obj.className == "arrow_ascending" ? "asc" : "desc";
		frm.sortSubject.value = obj.parentNode.getAttributeNode("sortId").value;
		frm.submit();
	};
	</script>
</body>
</html>
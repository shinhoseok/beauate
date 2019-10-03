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
<link rel="stylesheet" href="${scriptPath}/jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css" />
<!--현업 main page-->
<link rel="stylesheet" type="text/css" href="${cssPath}/worksite.css">
<!-- 스크립트 선언 -->
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="${scriptPath}/jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
<script type="text/javascript" src="${scriptPath}/commonDate.js"></script>
<script type="text/javascript" src="${scriptPath}/validation/validation.js" ></script>
<script type="text/javascript" src="${scriptPath}/jui/chart/core.js" ></script>
<script type="text/javascript" src="${scriptPath}/jui/chart/chart.min.js" ></script>
</head>
<body>
	<!-- header Start -->
	<div class="header">
		<jsp:include page="/WEB-INF/jsp/beauate/common/top.jsp" flush="false" />
	</div>
	<!--header End-->
	<div class="wrap">
		<div class="container">
			<!-- left_menu Start -->
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp" %>
			<!-- left_menu End -->
			<div class="contents">
				<p class="contentTitle">사용자 관리</p>
				<p class="sub_path">
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<form:form commandName="userStatsVO" name="listForm" id="listForm" method="post" action="${basePath}/userstats/r/m/selectuserStatistics.do">
					<form:hidden path="pageIndex"/>
					<form:hidden path="sortSubject"/>
					<form:hidden path="sortDescend"/>
					<form:hidden path="chartDate"/>
					<!--검색, 달력-->
					<div class="selectBox">
						<span class="search_bullet">날짜</span><span class="contents_search_bar"></span>
						<div class="calendar_wrap">
							<label for=" " class="blind">등록 시작일</label> 
<%-- 							<c:set var="todayYear" value="${fn:split(today,'-')}"/> --%>
<%-- 							<form:input path="startDate" type="text" id="startDate" placeholder="${todayYear[0]}-01-01"/> ~  --%>
							<form:input path="endDate" type="text" id="endDate"/>
						</div>
						<div class="T_btnLayer cn">
							<button type="button" class="grayBtn ico" onclick="javascript:fn_searchList(1);">
								<img src="${imagePath }/ico_search.png" alt="조회 버튼" /> 조회
							</button>
						</div>
					</div>
					<!--select 박스-->
					<div class="selectBox">
						<form:select path="searchCondition" class="w13p" id="searchCondition">
							<form:option value="searchNm" label="성명"/>
							<form:option value="searchId" label="아이디"/>
						</form:select> 
						<form:input class="searchName" path="searchKeyword" type="text" id="searchKeyword"/>
						<button type="button" class="grayBtn02 ico" onclick="fn_initialization();">초기화</button>
					</div>
					<!--그래프-->
					<div id="resss"></div>
					<div class="potalBig_Menu" id="result" style="height: 300px;"></div>
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
								<tr>
									<th class="noBg">번호</th>
									<th>아이디 
										<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this, 'searchId');"></a></span>
										<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this, 'searchId');"></a></span>
									</th>
									<th>성명
										<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this, 'searchNm');"></a></span>
										<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this, 'searchNm');"></a></span>
									</th>
									<th>IP</th>
									<th>가입일자 
										<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this, 'searchDate');"></a></span>
										<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this, 'searchDate');"></a></span>
									</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${userStatsListCnt > 0}">
										<c:forEach items="${userStatsList}" var="list" varStatus="i">
											<tr class="row">
												<td><c:out value="${list.rNum}"/></td>
												<td><c:out value="${list.accessId}"/></td>
												<td><c:out value="${list.usrNm}"/></td>
												<td><c:out value="${list.accessIp}"/></td>
												<td><fmt:formatDate value="${list.accessDate}"/> </td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr class="row">
											<td colspan="5">조회된 데이터가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
								
							</tbody>
						</table>
					</div>
					<!--paging Start -->
					<div class="paging_place">
						<div class="paging_wrap">
<%-- 							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_searchList" /> --%>
							<comTag:paging totalCount="${userStatsListCnt}" pageNo="${userStatsVO.pageIndex}" pageSize="${userStatsVO.pageSize}" clickPage="fn_searchList"/>
						</div>
					</div>
					<!--paging End -->
				</form:form>
			</div>
			<!-- contents End -->
		</div>
		<!--container End-->

	</div>
	<!--wrap End-->
	<!--wrap End-->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!--//footer-->

	<script type="text/javascript">
	$(function() {
		DefaultDatePicker($("#endDate"), "yy-mm-dd", 10, "${imagePath}");
		
		$("#searchKeyword").keydown(function(event) {
			if(event.keyCode == 13) {
				fn_searchList(1);
			}
		});
	});
	
	//등록일 조회
	fn_searchList = function(pageNo) {
		if(!TypeChecker.date($("#endDate").val())) {
			alert("날짜 형식만 가능합니다. 예)2016-01-01");
			$("#endDate").focus();
			return;
		}
		
		var frm = document.listForm;
		frm.pageIndex.value = pageNo;
		frm.submit();
	};
	
	//초기화
	fn_initialization = function() {
		document.getElementById("searchKeyword").value = "";
		$("#searchCondition").find("option:nth-child(1)").attr("selected", true);
	};
	
	//정렬
	fn_sort = function(obj, target) {
		var frm = document.listForm;
		var descend = ( $(obj.parentNode).hasClass("arrow_ascending") ) ?  "asc" : "desc";
		frm.sortDescend.value = descend;
		frm.sortSubject.value = target;
		frm.submit();
	};
	
	//HTML 로딩후
	var chart = jui.include("chart.builder");
	var data = ${resultChartList};
	
	var tpl_tooltip =
	'<div id="chart_tooltip" class="popover popover-top">' +
	    '<div class="head"></div>' +
	    '<div class="body">' +
	        '<div class="image"><i class="icon-caution"></i></div>' +
	        '<div class="message"><b>접속자수</b>: <!= data.AC_CNT !></div>' +
	    '</div>' +
	'</div>';
	
	var c = chart("#result", {
	    axis : [{
	        x : {
	            type : "block",
	            domain : "AC_DATE",
	            line : true,
	            textRotate : -10
	        },
	        y : {
	            type : "range",
	            domain : function(d) {
	                return Math.max(d.AC_CNT);
	            },
	            step : 5,
	            line : true
	        },
	        data : data
	    }],
	    brush : [{
	        type : "line",
	        target : [ "AC_CNT", "AC_CNT" ]
	    }, {
	        type : "scatter",
	        display : "all",
	        target : [ "AC_CNT", "AC_CNT" ]
	    }],
	    widget : [ {
			type : "title",
			text : "사용자통계",
			orient : "top"
		}, {
			type : "tooltip",
			format : function(data) {
				return data.AC_CNT + " : " + data.AC_CNT;
			}
		} ]
	});

	</script>
</body>
</html>

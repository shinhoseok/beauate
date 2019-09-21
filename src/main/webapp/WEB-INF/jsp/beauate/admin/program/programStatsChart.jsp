<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">

<title>BASIC</title>
<!--공통css-->
<link rel="stylesheet" type="text/css" href="${cssPath }/common.css">
<!--현업 main page-->
<link rel="stylesheet" type="text/css" href="${cssPath }/worksite.css">

<link rel="stylesheet" href="${scriptPath}/jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css" />

<!-- 스크립트 선언 -->
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js" ></script>
<script type="text/javascript" src="${scriptPath}/jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>

<script type="text/javascript" src="${scriptPath}/jui/chart/core.js" ></script>
<script type="text/javascript" src="${scriptPath}/jui/chart/chart.min.js" ></script>
	
<script type="text/javascript" src="${scriptPath}/common.js" ></script>
<script type="text/javascript" src="${scriptPath}/commonDate.js"></script>
<script type="text/javascript" src="${scriptPath}/validation/validation.js" ></script>
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

				<!-- form Start -->
				<form:form commandName="menuStatsVO" id="pgmChartForm" name="pgmChartForm">
					<!-- search Start -->
					<div class="selectBox">
						<span class="search_bullet">시작/종료일자</span> 
						<span class="contents_search_bar"></span>
						<div class="calendar_wrap">
							<label for="" class="blind">시작/종료일자</label> 
							<form:input type="text" path="startDate"/>
							<span class="during">~</span>
							<form:input type="text" path="endDate"/>
						</div>
						<div class="T_btnLayer cn">
							<button type="button" class="grayBtn ico" onclick="javascript:searchPgmChart();">
								<img src="${imagePath }/ico_search.png" alt="조회 버튼" /> 조회
							</button>
						</div>
					</div>
					<!-- search End -->
					
					<!-- chart Start -->
					<div class="potalBig_Menu" id="pgmChartArea" style="height: 500px; overflow:auto; overflow-x:hidden;"></div>
					<!-- chart End -->
					
					<div class="T_btnLayer fr">
						<c:if test="${sessionScope.loginVO.menuRlDiv >= 'w'}">
							<a href="#" onclick="javascript:fn_excelDownload();"><button type="button" class="blueBtn L"><img src="${imagePath }/icon_excel.png" alt="조회 버튼" />엑셀다운로드</button></a>
						</c:if>
					</div>
				</form:form>
				<!-- form End -->
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
	//HTML 로딩후
	$(document).ready(function() {
		//달력
		DefaultDatePicker($("#startDate"), "yy-mm-dd", 10, "${imagePath}");
		DefaultDatePicker($("#endDate"), "yy-mm-dd", 10, "${imagePath}");
		//데이타 없이 차트를 그림
		drawChart();
		//초기값 현재날짜를 시작,종료일로 해서 검색해서 차트에 데이타를 갱신
		searchPgmChart();
	});
	
	//프로그램이용률을 시작/종료일자로 검색해서 chart영역의 데이타를 갱신해줌
	var searchPgmChart = function(){
		var sDats = document.getElementById("startDate").value,
			eDats = document.getElementById("endDate").value;
		
		if (!_compareTwoDate(sDats, eDats)) {
			return;
		};
		$.ajax({
			url: "${basePath}/programStats/r/m/selectProgramChart.do",
			type: 'POST',
			dataType: 'json',
			data : $("#pgmChartForm").serialize(),
			error: function(){
			 	alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			},
			success: function(r){
				vChart.axis(0).update(r.chartDataList);

				$("#startDate").val(r.menuStatsVO.startDate);
				$("#endDate").val(r.menuStatsVO.endDate);
			}
		}); 
	};
	
	//jui
	var vChart;
	var drawChart = function(jsonData) {
		var chart = jui.include("chart.builder");

		vChart = chart("#pgmChartArea", {
		    axis : [{
		        x : {
		            type : "range",
		            domain : "cnt",
		            step : 10,
		            line : "dashed",
		           orient : "top"
		        },
		        y : {
		            type : "block",
		            domain : "pgmName",
		            line : "rect"
		        },
		        area : {
		        	x : 150,
		        	width : "70%"
		        }
		    }],
		    brush : [{
		        type : "bar",
		        target : "cnt",
		        display : "all",
		        activeEvent : "mouseover",
		        colors : [ "#7BBAE7" ],
		        outerPadding : 10,
		        animate : true
		    }],
		    widget : [{
		        type : "title",
		        text : "<프로그램별 이용률>",
		        align : "start"
		    }, {
		    	type : "tooltip",
		    	format : function(data) {
		    		return data.pgmName + " : " + data.pgmUrl + ", 이용률: " + data.cnt;
		    	}
		    }]
		});
	};
	
	//프로그램통계 엑셀 다운로드
	fn_excelDownload = function(){
		var frm = document.pgmChartForm;
		var tmpUrl = frm.action;
		frm.action = "<c:url value='${basePath}/programStats/r/m/programStatsExcelDownload.do'/>";
		frm.submit();
		frm.action = tmpUrl;
	};
	</script>
</body>
</html>
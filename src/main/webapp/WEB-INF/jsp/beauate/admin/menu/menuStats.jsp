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
	<!-- top -->
	<div class="header">
		<jsp:include page="/WEB-INF/jsp/beauate/common/top.jsp"
			flush="false" />
	</div>
	<div class="wrap">
		<div class="container">
			<!-- 좌측메뉴리스트 left_menu// -->
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp"%>
			<!-- //좌측메뉴리스트  left_menu -->
			<div class="contents">
				<p class="contentTitle">메뉴통계</p>
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
                    	&nbsp;〉&nbsp;<c:out value="${list.menuName }"></c:out>
                    </c:forEach>
				</p>
				<form:form commandName="menuStatsVO" id="listForm" name="listForm" action="${basePath }/menuStats/r/m/selectMenuChart.do">
					<!--검색, 달력-->
					<div class="selectBox">
						<span class="search_bullet">시작/종료일자</span> 
						<span class="contents_search_bar"></span>
						<div class="calendar_wrap">
							<label for="" class="blind">시작/종료일자</label> 
							<form:input type="text" path="startDate" id="startDate"/>
							<form:input type="text" path="endDate" id="endDate"/>
						</div>
						<div class="T_btnLayer cn">
							<button type="button" class="grayBtn ico" onclick="javascript:fn_searchList();">
								<img src="${imagePath }/ico_search.png" alt="조회 버튼" /> 조회
							</button>
						</div>
					</div>
					<!--그래프-->
					<div class="potalBig_Menu" id="mb15" style="height: 300px;"></div>
					<div class="tableLayer" id="menuContents"></div>
				</form:form>
			</div>
		</div>
	</div>
	<!--paging End -->
	<!--wrap End-->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!--//footer-->
	
<script type="text/javascript">
	fn_excelDownload = function(){
		if(!confirm("엑셀 다운로드 하시겠습니까?")){
			return;
		}
		$("#listForm").attr("action","${basePath}/menuStats/r/m/menuChartListExcelDownload.do");
		$("#listForm").submit();
	};

	// 검색바
	fn_searchList = function(){
		var sDats = $("#startDate").val();
		var eDats = $("#endDate").val();
		if(!_compareTwoDate(sDats, eDats)){
			return;
		};
		$("#listForm").attr("action","${basePath }/menuStats/r/m/selectMenuChart.do");
		$("#listForm").submit();
	};
	
	// 메뉴 리스트 
	fn_loadContents = function(pageNo){
		$("#pageIndex").val(pageNo);
		var url = "${basePath}/menuStats/r/m/selectMenuChartList.do";
		$.ajax({ 
			url: url,    
			type: 'POST',    
			dataType: 'html',
			data : $("#listForm").serialize(),
			error: function(){
			 	alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			},
			success: function(r){ 
				$("#menuContents").html(r);
			}
		}); 
	};
	
	//정렬
	fn_sort = function(obj) {
		var descend = ($(obj).parent().hasClass("arrow_ascending") ) ?  "asc" : "desc";
		$("#sortDescend").val(descend);
		$("#sortSubject").val($(obj).parent().parent().attr("sortId"));
		fn_loadContents(1);
	};
	
	//HTML 로딩후
	$(document).ready(function() {
		//달력
		DefaultDatePicker($("#startDate"), "yy-mm-dd", 10, "${imagePath}");
		DefaultDatePicker($("#endDate"), "yy-mm-dd", 10, "${imagePath}");
		
		fn_loadContents(1);
	});

	//HTML 로딩후
	var chart1 = ${menuStatsChartJson};
	var chart = jui.include("chart.builder");
	chart("#mb15", {
		axis : [ {
			x : {
				type : "block",
				domain : "menuName",
				textRotate : -20
			},
			y : {
				type : "range",
				domain : "rowSpan1",
				step : 10,
				line : true
			},
			data : chart1
		} ],
		brush : [ {
			type : "column",
			outerPadding : 20,
			target : [ "rowSpan1" ],
			display : "all",
			animate : true,
			activeEvent : "mouseover",
			colors : [ "#7BBAE7" ]
		} ],
		widget : [ {
			type : "title",
			text : "메뉴통계",
			orient : "top"
		}, {
			type : "tooltip",
			format : function(data) {
				return data.menuName + " : " + data.rowSpan1;
			}
		} ],style : {
	        gridTickBorderSize : 7,
	        gridTickPadding : 10
	    }
	});
</script>
</body>
</html>
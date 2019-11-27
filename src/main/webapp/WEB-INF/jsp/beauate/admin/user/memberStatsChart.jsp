<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="naver-site-verification" content="c03e63b14e10bb3c48bb213c40e148287b19ea7f"/>
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
	<!-- header End -->
	<div class="wrap">
		<div class="container">
			<!-- left_menu Start -->
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp"%>
			<!-- left_menu End -->
			<div class="contents">
				<p class="contentTitle">회원가입 통계</p>
				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<!-- sub_path End -->
				<div class="selectBox">
					<span class="search_bullet">시작/종료일자</span> 
					<span class="contents_search_bar"></span>
					<div class="calendar_wrap">
						<label for="" class="blind">시작/종료일자</label> 
						<input type="text" path="startDate" id="startDate" readonly="readonly" value="${userStatsVO.startDate }"/> ~ 
						<input type="text" path="endDate" id="endDate" readonly="readonly" value="${userStatsVO.endDate }"/>
					</div>
					<div class="T_btnLayer cn">
						<button type="button" class="grayBtn ico" onclick="javascript:fn_selectUserStatisticsList();">
							<img src="${imagePath }/ico_search.png"> 검색
						</button>
					</div>
				</div>
				<!-- 차트 -->
				<div class="potalBig_Menu" id="result" style="height: 300px;"></div><br/><br/>
				<div id="target"></div>
			</div>
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<!-- footer // -->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- // footer -->
	<!--//footer-->
<script type="text/javascript">
	var chartJsonData = ${resultChartList};
	$(function() {
		//달력
		DefaultDatePicker($("#startDate"), "yy-mm-dd", 10, "${imagePath}");
		DefaultDatePicker($("#endDate"), "yy-mm-dd", 10, "${imagePath}");
		fn_searchList(1, "${firstDate}", 0);
// 		fn_commonChartDraw(chartJsonData, 0);
		
	});
	var fn_commonChartDraw = function(jsonData, chartIdx) {
		//차트
		var chart = jui.include("chart.builder");
		var data = jsonData;
		if(chartIdx == 'undefined') {
			chartIdx = 0;
		}
		var c = chart("#result", {
			padding : {
				bottom : 90,
				right : 30,
				top : 40,
				left : 40
			},
		    axis : {
		        x : {
		            type : "block",
		            domain : "accessDt",
		            line : true,
		            textRotate : 90 //x축 글자 꺽기
		        },
		        y : {
		            type : "range",
		            domain : function(d) { return [d.cnt ]; },
		            step : 5,
		            line : true,
		        },
//	 	        buffer : 3,
		        data : data
		    },
		    brush : [
		    	{ type : "line", target : [ "cnt" ] }, 
		    	{ type : "scatter", target : [ "cnt" ]},
		    	{ type : "focus", start : chartIdx, end : chartIdx}
		    ],
		    widget : [
		    	{ type : "title", text : "회원가입 통계" },
		    	{ type : "legend", filter : true },
		    	{ type : "tooltip" }
//	 	    	{ type : "scroll" },
// 		    	{ type : "tooltip" }
		    ],
		    event : {
		    	"mousedown" : function(d) {
					activeEvent = d.dataIndex;
					cnt = d.data.cnt;
					accessDt = d.dataKey;
					fn_searchList(1,d.data.accessDt,d.dataIndex);
				}
		    },
		    style : {
		        gridTickPadding : 16 // x,y축 컬럼명과 그리드같의 여백 간격 설정, 축을 회전을 주어 그리드에 텍스트가 가려지므로, 약간 아래쪽으로 여백을 둠
			}
		});
	};
	
	var cuurPage = 1;
	var staticAccessDt = "";
	var staticDataIndex = "";
	function fn_searchList(page, accessDt, dataIndex){
		if(accessDt !== undefined ) {
			staticAccessDt = accessDt;
			staticDataIndex = dataIndex;
		}
		
		$("#result").children().remove();
		fn_commonChartDraw(chartJsonData , staticDataIndex );
		
		cuurPage= page;
		var params = {};
		params.pageIndex = cuurPage;
		params.chartDate = staticAccessDt;
		$.ajax({
			url: "${basePath}/userstats/r/m/selectMemberStatsAjax.do",
			data: params,
			type: 'POST',
			dataType: 'html',
			cache: false,
			success: function(r) {
				$('#target').children().remove();
				$('#target').html(r);
			},
			error : function() {
			  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
			}
		});
	}
	
	//날짜에 따른 접속리스트
	var fn_selectUserStatisticsList = function() {
		var sDats = $("#startDate").val();
		var eDats = $("#endDate").val();
		if(sDats == null || sDats == "") {
			alert("시작일을 입력해주세요.");
			$("#startDate").focus();
			return;
		}
		if(eDats == null || eDats == "") {
			alert("종료일을 입력해주세요.");
			$("#endDate").focus();
			return;
		}
		if(!fn_dateCompare(sDats, eDats)){
			return;
		};

		var ar1 = sDats.split('-');
		var ar2 = eDats.split('-');
		var da1 = new Date(ar1[0], ar1[1], ar1[2]);
		var da2 = new Date(ar2[0], ar2[1], ar2[2]);
		var dif = da2 - da1;
		var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
		if(parseInt(dif/cDay) > 60) {
			alert("최대 2개월까지 조회가 가능합니다.");
			$("#startDate").focus();
			return;
		}
		location.href="${basePath}/memstats/r/m/selectUserInsertChart.do?startDate="+sDats+"&endDate="+eDats;
	};
</script>
</body>
</html>

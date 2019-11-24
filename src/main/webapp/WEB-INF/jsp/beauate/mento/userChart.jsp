<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="naver-site-verification" content="c03e63b14e10bb3c48bb213c40e148287b19ea7f"/>
<title>BASIC</title>
<!--공통css-->
<link rel="stylesheet" type="text/css" href="${cssPath}/common.css">
<!--현업 main page-->
<link rel="stylesheet" type="text/css" href="${cssPath}/worksite.css">
<!-- 스크립트 선언 -->
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="${scriptPath}/jui/chart/core.js" ></script>
<script type="text/javascript" src="${scriptPath}/jui/chart/chart.min.js" ></script>
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
				<p class="contentTitle">찜&결제 리스트</p>
				<p class="sub_path"><img src="${imagePath}/ico_home.png" width="10" height="9" />&nbsp;〉&nbsp;멘토&nbsp;〉&nbsp;클래 신청자 관리〉&nbsp;찜&결제 리스트</p>
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
	
<script type="text/javascript">
//차트
var chart = jui.include("chart.builder");
var data = ${rslt.chartJson};

var c = chart("#result", {
    axis : {
        x : {
            type : "block",
            domain : "c_title",
            line : true
        },
        y : {
            type : "range",
            domain : function(d) { return [d.결제, d.찜 ]; },
            step : 5,
            line : true,
        },
        buffer : 3,
        data : data
    },
    brush : {
        type : "column",
        size : 50,
        target : [ "결제", "찜" ]
    },
    widget : [
    	{ type : "title", text : "클래스별 통계" },
    	{ type : "legend", filter : true },
    	{ type : "scroll" },
    	{ type : "tooltip" }
    ],
    event : {
    	"mousedown" : function(d) {
			activeEvent = d.dataIndex;
			chartClassId = d.data.c_sq;
			chartDataKey = d.dataKey;
			fn_selectUserList(1);
		}
    }
});
var chartDataKey = "";
var chartClassId = "";

//차트클릭시
var fn_selectUserList = function(pageNo) {
	var params = {};
	var url = "";
	params.pageIndex = pageNo;
	params.classId = chartClassId;
	if(chartDataKey == "결제") {
		url = "/mento/r/n/selectMentoPayUserList.do";
	} else { //찜
		url = "/mento/r/n/selectMentoJjimUserList.do";
	}
	$.ajax({
		url: url,
		type: 'post',
		dataType : "html",
		data : params,
		error: function(){
			 alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) { 
			$("#target").children().remove();
			$("#target").html(r);
		}
	}); 
};
</script>
</body>
</html>
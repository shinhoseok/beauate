<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<div class="potalBig_Menu" id="result" style="height: 300px;"></div>
<script type="text/javascript">
$(function() {
	var chart = jui.include("chart.builder");

	var dataSource = [
	    { date : "2013", profit1 : 300000, profit2 : 58 },
	    { date : "2014", profit1 : 300000, profit2 : 104 },
	    { date : "2015", profit1 : 500000, profit2 : 357 },
	    { date : "2016", profit1 : 500000, profit2 : 294 },
	    { date : "2017", profit1 : 500000, profit2 : 367 },
	    { date : "2019", profit1 : 500000, profit2 : 285 },
	    { date : "2020", profit1 : 500000, profit2 : 340 },
	];

	chart("#result", {
	    padding : {
	        left : 60
	    },
	    height : 400,
	    axis : [{
	        data : dataSource,
	        x : {
	            type : "block",
	            domain : "date"
	        },
	        y : {
	            type : "range",
	            domain : [ 0, 500000 ],
	            step : 4,
	            line : true
	        },
	        area : {
	            width : "100%",
	            height : "100%"
	        }
	    }, {
	        x : {
	            hide : true
	        },
	        y : {
	            domain : [ 0, 500 ],
	            orient : "right"
	        },
	        area : {
	            width : "100%",
	            height : "100%"
	        },
	        extend : 0
	    }],
	    brush : [{
	        type : "column",
	        target : "profit1",
	        axis : 0,
	        colors : [ 0 ],
	        animate : true
	    }, {
	        type : "line",
	        target : "profit2",
	        axis : 1,
	        colors : [ 2 ],
	        animate : true
	    }],
	    widget : [{
	        type : "title",
	        text : "Sales Overview",
	        align : "start"
	    }, {
	        type : "title",
	        text : "Net Profit",
	        align : "start",
	        orient : "center",
	        dx : -55,
	        dy : -90
	    }],
	    style : {
	        scatterBorderWidth : 1.5,
	        titleFontSize : "11px",
	        titleFontWeight : "bold"
	    },
	    format : function(v) {
	        if(typeof(v) == "number") {
	            return ((v > 1000) ? Math.floor(v / 1000) + "k" : v);
	        }

	        return v;
	    }
	});

});

</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!-- 신청한 클래스-->
<div class="cpn">
	<div class="myclass-left">
		<ul class="myclass_tabs">
			<li tabId="1"><a href="javascript:void(0);" class="active">신청한 클래스</a></li>
			<li tabId="2"><a href="javascript:void(0);">찜한 클래스</a></li>
		</ul>
	</div>
	<div class="myclass-right" id="myclass_right">
	</div>
</div>
<!--//신청한 클래스-->


<script>
var myClassTabId = 1; //탭번호 전역변수(첫페이지 1탭)
var myClassCuurPage = 1; //현재페이지 전역변수

$(function() {
	$("ul.myclass_tabs li").click(function() {
		$("ul.myclass_tabs li").children("a").removeClass("active");
		$(this).children("a").addClass("active");
		myClassTabId = $(this).attr("tabId");
		fn_myClassSearchList(1);
	});
	fn_myClassSearchList(1);
});

//신청한 클래스, 찜한 클래스 탭
var fn_myClassSearchList = function(page) {
	myClassCuurPage= page;
	var params = {};
	params.pageIndex = myClassCuurPage;
	params.mypageTab = myClassTabId; //카테고리(탭구분값 1,2탭)
	fn_myClassCommonAjax(params);
};

//신청한 클래스, 찜한 클래스 Ajax
var fn_myClassCommonAjax = function(params) {
	var url = "";
	if(params.mypageTab == '1') {
		url = "${basePath}/mypage/r/t/selectMyClassTabList.do";
	} else {
		url = "${basePath}/mypage/r/n/selectMyJjimClassList.do";
	}
	$.ajax({
		url: url,
		data: params,
		type: 'POST',
		dataType: 'html',
		cache: false,
		success: function(r) {
			$('#myclass_right').children().remove();
			$('#myclass_right').html(r);
		},
		error : function() {
		  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};

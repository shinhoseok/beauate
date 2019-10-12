<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!-- 신청한 클래스-->
<div class="cpn">
	<div class="myclass-left">
		<ul class="hoogi_tabs">
			<li tabId="1"><a href="javascript:void(0);" class="active">작성 가능한 후기</a></li>
			<li tabId="2"><a href="javascript:void(0);">내가 작성한 후기</a></li>
		</ul>
	</div>
	<div class="myclass-right" id="hoogiTarget"></div>
</div>
<!--//신청한 클래스-->
<script>
var hoogiTabId = 1; //탭번호 전역변수(첫페이지 1탭)
var hoogiCuurPage = 1; //현재페이지 전역변수

$(function() {
	$("ul.hoogi_tabs li").click(function() {
		$("ul.hoogi_tabs li").children("a").removeClass("active");
		$(this).children("a").addClass("active");
		hoogiTabId = $(this).attr("tabId");
		fn_hoogiSearchList(1);
	});
	fn_hoogiSearchList(1);
});

//신청한 클래스, 찜한 클래스 탭
var fn_hoogiSearchList = function(page) {
	hoogiCuurPage= page;
	var params = {};
	params.pageIndex = hoogiCuurPage;
	params.mypageTab = hoogiTabId; //카테고리(탭구분값 1,2탭)
	fn_hoogiCommonAjax(params);
};

//신청한 클래스, 찜한 클래스 Ajax
var fn_hoogiCommonAjax = function(params) {
	var url = "";
	if(params.mypageTab == '1') {
		url = "${basePath}/mypage/r/t/selectWritePossibleReviewList.do";
	} else {
		url = "${basePath}/mypage/r/n/selectMyWriteReviewList.do";
	}
	$.ajax({
		url: url,
		data: params,
		type: 'POST',
		dataType: 'html',
		cache: false,
		success: function(r) {
			$('#hoogiTarget').children().remove();
			$('#hoogiTarget').html(r);
		},
		error : function() {
		  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};
</script>
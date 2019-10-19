<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!-- 결제내역-->
<div class="cpn">
	<div class="myclass-left">
		<ul class="pay_tabs">
			<li tabId="1"><a href="javascript:void(0);" class="active">결제내역</a></li>
			<li tabId="2"><a href="javascript:void(0);">취소/환불</a></li>
		</ul>
	</div>
	<div class="myclass-right" id="payTarget"></div>
</div>
<!--//결제내역-->


<script type="text/javascript">
var payTabId = 1; //탭번호 전역변수(첫페이지 1탭)
var payCuurPage = 1; //현재페이지 전역변수

$(function() {
	$("ul.pay_tabs li").click(function() {
		$("ul.pay_tabs li").children("a").removeClass("active");
		$(this).children("a").addClass("active");
		payTabId = $(this).attr("tabId");
		fn_paySearchList(1);
	});
	fn_paySearchList(1);
});

//사용가능한 쿠폰, 사용/만료 쿠폰 탭
var fn_paySearchList = function(page) {
	payCuurPage = page;
	var params = {};
	params.pageIndex = payCuurPage;
	params.mypageTab = payTabId; //카테고리(탭구분값 1,2탭)
	fn_payCommonAjax(params);
};

//사용가능한 쿠폰, 사용/만료 쿠폰 Ajax
var fn_payCommonAjax = function(params) {
	var url = "";
	if(params.mypageTab == '1') {
		url = "${basePath}/mypage/r/t/selectPayHisotryAjaxList.do";
	} else {
		url = "${basePath}/mypage/r/n/selectPayCancelList.do";
	}
	$.ajax({
		url: url,
		data: params,
		type: 'POST',
		dataType: 'html',
		cache: false,
		success: function(r) {
			$('#payTarget').children().remove();
			$('#payTarget').html(r);
		},
		error : function() {
		  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};
</script>
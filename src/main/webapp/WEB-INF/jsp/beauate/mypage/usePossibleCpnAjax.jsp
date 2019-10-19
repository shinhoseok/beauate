<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!-- 수강 가능한 쿠폰-->
<div class="cpn">
	<div class="myclass-left">
		<ul class="coupon_tabs">
			<li tabId="1"><a href="javascript:void(0);" class="active">사용가능한 쿠폰</a></li>
			<li tabId="2"><a href="javascript:void(0);">사용/만료 쿠폰</a></li>
		</ul>
	</div>
	<div class="myclass-right" id="couponTarget"></div>
</div>
<!--//수강 가능한 쿠폰-->


<script type="text/javascript">
var couponTabId = 1; //탭번호 전역변수(첫페이지 1탭)
var couponCuurPage = 1; //현재페이지 전역변수

$(function() {
	$("ul.coupon_tabs li").click(function() {
		$("ul.coupon_tabs li").children("a").removeClass("active");
		$(this).children("a").addClass("active");
		couponTabId = $(this).attr("tabId");
		fn_couponSearchList(1);
	});
	fn_couponSearchList(1);
});

//사용가능한 쿠폰, 사용/만료 쿠폰 탭
var fn_couponSearchList = function(page) {
	hoogiCuurPage= page;
	var params = {};
	params.pageIndex = hoogiCuurPage;
	params.mypageTab = couponTabId; //카테고리(탭구분값 1,2탭)
	fn_couponCommonAjax(params);
};

//사용가능한 쿠폰, 사용/만료 쿠폰 Ajax
var fn_couponCommonAjax = function(params) {
	var url = "";
	if(params.mypageTab == '1') {
		url = "${basePath}/mypage/r/t/selectPossibleCouponList.do";
	} else {
		url = "${basePath}/mypage/r/n/selectManRyoCouponList.do";
	}
	$.ajax({
		url: url,
		data: params,
		type: 'POST',
		dataType: 'html',
		cache: false,
		success: function(r) {
			$('#couponTarget').children().remove();
			$('#couponTarget').html(r);
		},
		error : function() {
		  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};
</script>
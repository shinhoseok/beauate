<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1280" />
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="naver-site-verification" content="c03e63b14e10bb3c48bb213c40e148287b19ea7f"/>
<title>BEAUATE</title>
<link rel="stylesheet" type="text/css" href="${cssPath}/contents.css" />
<link rel="stylesheet" type="text/css" href="${cssPath}/contents-my1.css" />
<script type="text/javascript" src="${scriptPath}/jquery.min.js"></script>
<script type="text/javascript" src="${scriptPath}/jquery.modal.min.js"></script>
<script type="text/javascript" src="${scriptPath}/swiper.min.js"></script>
<script type="text/javascript" src="${scriptPath}/ui.front.js"></script>
<script type="text/javascript" src="${scriptPath}/library.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="skip">
			<a href="#container">본문 내용 바로가기</a>
		</div>
		<!-- header -->
<!-- 		<div id="header"> -->
			<jsp:include page="/WEB-INF/jsp/beauate/ucommon/top.jsp" flush="false" />
<!-- 		</div> -->
		<!-- //header -->
		<!-- container -->
		<div id="container">
			<!-- content -->
			<div class="content cont-mypage">
				<div class="page-title">
					<div class="content-inner">
						<h2 class="title">
							<img src="${imagePath}/txt/img-txt-mypage.png" alt="MY PAGE">
						</h2>
						<p class="title-desc"><c:out value="${sessionScope.loginVO.usrNm}"/>님, 반갑습니다.</p>
					</div>
				</div>
				<div class="cont-nav">
					<ul class="tabs">
						<li tabId="1"><a href="javascript:void(0);" class="active">My 클래스</a></li>
						<li tabId="2"><a href="javascript:void(0);">수강후기</a></li>
						<li tabId="3"><a href="javascript:void(0);">할인쿠폰</a></li>
						<li tabId="4"><a href="javascript:void(0);">결제내역</a></li>
						<li tabId="5"><a href="javascript:void(0);" id="myInfoBtn">내 정보 수정</a></li>
					</ul>
				</div>
				<div class="content-inner" id="content-inner"></div>
			</div>
			<!-- //content -->
		</div>
		<!-- //container -->
		<!-- footer -->
		<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
		<!-- //footer -->
	</div>
<script type="text/javascript">
var tabId = 1; //탭번호 전역변수(첫페이지 1탭)
var cuurPage = 1; //현재페이지 전역변수

$(function() {
	//내정보 수정에서 비밀번호 변경 후 info로..
	var mypageTab = "${mypageTab}";
	if(mypageTab == "5") {
		tabId = mypageTab;
		$("#myInfoBtn").get(0).click();
		$("ul.tabs li").children("a").removeClass("active");
		$("#myInfoBtn").addClass("active");
	}
	//탭이벤트
	$("ul.tabs li").click(function() {
		$("ul.tabs li").children("a").removeClass("active");
		$(this).children("a").addClass("active");
		tabId = $(this).attr("tabId");
		fn_searchList(1);
	});
	fn_searchList(1);
});

var fn_searchList = function(page) {
	cuurPage= page;
	var params = {};
	params.pageIndex = cuurPage;
	params.mypageTab = tabId; //카테고리(탭구분값 1,2,3,4탭)
	fn_myPageCommonAjax(params);
};

//공통탭 Ajax
var fn_myPageCommonAjax = function(params) {
	var url = "";
	if(params.mypageTab == '1') {
		url = "${basePath}/mypage/r/n/selectApplyClassList.do";
	} else if(params.mypageTab == '2') {
		url = "${basePath}/mypage/r/n/selectClassReviewList.do";
	} else if(params.mypageTab == '3') {
		url = "${basePath}/mypage/r/n/selectUsePossibleCpnList.do";
	} else if(params.mypageTab == '4') {
		url = "${basePath}/mypage/r/n/selectPayHistoryList.do";
	} else {
		url = "${basePath}/mypage/r/n/updateMyInfo.do";
	}
	$.ajax({
		url: url,
		data: params,
		type: 'POST',
		dataType: 'html',
		cache: false,
		success: function(r) {
			$('#content-inner').children().remove();
			$('#content-inner').html(r);
		},
		error : function() {
		  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};
</script>
</body>
</html>

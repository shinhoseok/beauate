<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1280"/>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="naver-site-verification" content="c03e63b14e10bb3c48bb213c40e148287b19ea7f"/>
<title>BEAUATE</title>
<link rel="stylesheet" type="text/css" href="${cssPath}/contents.css"/>
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
<!-- 	<div id="header"> -->
		<jsp:include page="/WEB-INF/jsp/beauate/ucommon/top.jsp" flush="false" />
<!-- 	</div> -->
	<!-- //header -->
	<!-- container -->
	<div id="container">
		<!-- content -->
		<div class="content">
			<div class="page-title">
				<div class="content-inner">
					<h2 class="title"><img src="${imagePath}/txt/tit_cont_info.png" alt="info"></h2>
					<p class="title-desc">뷰아떼가 전하는 뷰티정보, 놓치지 마세요</p>
				</div>
			</div>
			<div class="cont-nav">
				<ul class="tabs">
					<c:if test="${fn:length(boardCateGoryList)>0}">
						<c:forEach var="list" items="${boardCateGoryList}" varStatus="i">
							<c:choose>
								<c:when test="${i.count == 1}">
									<li id="tab${i.count }" tabId="${i.count }"><a href="javascript:void(0);" class="active">${list.mclsNm}</a></li>
								</c:when>
								<c:otherwise>
									<li id="tab${i.count }" tabId="${i.count }"><a href="javascript:void(0);"">${list.mclsNm}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			<div class="content-inner">
				<!-- 제품소개 info -->
				<div class="slider-banner-info">
				   <!-- Swiper -->
				   <div class="swiper-container">
					<div class="swiper-wrapper">
					  <div class="swiper-slide"><img src="${imagePath}/empty/img-banner-info.png" alt="1" /></div>
					  <div class="swiper-slide"><img src="${imagePath}/empty/img-banner-info.png" alt="2" /></div>
					  <div class="swiper-slide"><img src="${imagePath}/empty/img-banner-info.png" alt="3" /></div>
					</div>
					<div class="swiper-info">
						 <div class="swiper-button-prev"></div>
						 <div class="swiper-pagination"></div>
						 <div class="swiper-button-next"></div>
					</div>
				  </div>
				  <script tyle="text/javascript">
					var swiper = new Swiper('.swiper-container', {
					  pagination: {
						el: '.swiper-pagination',
						type: 'fraction',
					  },
					  navigation: {
						nextEl: '.swiper-button-next',
						prevEl: '.swiper-button-prev',
					  },
					});
				  </script>
				</div>
				<!-- 리스트 Ajax Target -->
				<div id="div_tab1"></div>
				<!-- //제품소개 info -->
			</div>
		</div>
		<!-- //content -->
	</div>
	<!-- //container -->
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
	<!-- //footer -->
</div>

<script type="text/javascript">
//탭번호 전역변수(첫페이지 1탭)
var tabId = 1;

$(function() {
	$("#div_tab2").hide();
	$("#div_tab1").show();
	$("ul.tabs li").click(function() {
		$("ul.tabs li").children("a").removeClass("active");
		$(this).children("a").addClass("active");
		//탭번호 셋팅(1~4번탭)
		tabId = $(this).attr("tabId");
		fn_searchList(1);
	});
	//처음은 1번탭 호출
	fn_searchList(1);
});

//현재페이지 전역변수
var cuurPage = 1;
//param : 클릭페이지, 탭번호,
function fn_searchList(page){
	cuurPage= page;
	var params = {};
	params.pageIndex = cuurPage;
	params.postCategorySt = tabId; //카테고리(탭구분값 1,2,3,4탭)
	fn_boardCommonAjax(params);
}

//공통탭 Ajax
var fn_boardCommonAjax = function(params) {
	$.ajax({	
		url: "${basePath}/board/a/t/selectBoardAjaxList.do",
		data: params,
		type: 'POST',
		dataType: 'html',
		cache: false,
		success: function(r) {
			$('#div_tab1').children().remove();
			$('#div_tab1').html(r);
		},
		error : function() {
		  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};

//게시판 공통 상세보기
var fn_boardCommonDetail = function(postId) {
	$.ajax({	
		url: "${basePath}/board/a/t/selectBoardDetail.do",
		data: { 'postId' : postId },
		type: 'POST',
		dataType: 'html',
		cache: false,
		success: function(r) {
			$('#div_tab1').children().remove();
			$('#div_tab1').html(r);
		},
		error : function() {
		  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};
</script>
</body>
</html>

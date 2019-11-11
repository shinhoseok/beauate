<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1280" />
<meta http-equiv="X-UA-Compatible" content="ie=edge">
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
	<div id="wrap" class="offline">
		<div id="skip">
			<a href="#container">본문 내용 바로가기</a>
		</div>
		<!-- header -->
		<div id="header">
			<jsp:include page="/WEB-INF/jsp/beauate/ucommon/top.jsp" flush="false" />
		</div>
		<!-- //header -->
		<!-- container -->
		<div id="container">
			<!-- content -->
			<div class="content">
				<div class="off_title">
					<div class="content-inner">
						<h2 class="title"></h2>
					</div>
				</div>
				<!-- 뷰티 type -->
				<div class="content-inner">
					<div class="off_list">
						<h3>뷰티전문가를 만나보세요</h3>
						<p>뷰아떼가 소개하는 다양한 뷰티 오프라인 클래스</p>
						<ul>
							<li><a href="${basePath }/offclass/a/t/selectOffClassTabList.do?classCtSt=1">헤어</a></li>
							<li><a href="${basePath }/offclass/a/t/selectOffClassTabList.do?classCtSt=2">메이크업</a></li>
							<li><a href="${basePath }/offclass/a/t/selectOffClassTabList.do?classCtSt=3">속눈썹/반영구</a></li>
							<li><a href="${basePath }/offclass/a/t/selectOffClassTabList.do?classCtSt=4">피부/왁싱</a></li>
							<li><a href="${basePath }/offclass/a/t/selectOffClassTabList.do?classCtSt=5">네일</a></li>
							<li><a href="${basePath }/offclass/a/t/selectOffClassTabList.do?classCtSt=6">기타</a></li>
						</ul>
					</div>
				</div>
				<!-- //뷰티 type -->
				<!-- 베스트 클래스 -->
				<div class="besthair">
					<div class="content-inner">
						<div class="bestoff-title">
							<h3>off line Class</h3>
							<span class="stxt">지금 뷰아떼에서 핫한 멘토 수업을 만나보세요</span> <span class="stitle-best">BEST</span>
						</div>
						<div class="besthair-list">
							<!-- swiper -->
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<ul class="product-list-02" data-column="4">
											<li>
												<a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-1.png" alt="" />
													</div>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-2.png" alt="" />
													</div>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-3.png" alt="" />
													</div>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-4.png" alt="" />
													</div>
												</a>
											</li>
										</ul>
									</div>
									<div class="swiper-slide">
										<ul class="product-list-02" data-column="4">
											<li>
												<a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-1.png" alt="" />
													</div>
												</a></li>
											<li>
												<a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-2.png" alt="" />
													</div>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-3.png" alt="" />
													</div>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-4.png" alt="" />
													</div>
												</a>
											</li>
										</ul>
									</div>
								</div>
								<div class="swiper-button-next"></div>
								<div class="swiper-button-prev"></div>
							</div>
							<script type="text/javascript">
								var swiper = new Swiper('.besthair-list .swiper-container', {
									navigation: {
										nextEl: '.swiper-button-next',
										prevEl: '.swiper-button-prev',
									},
								});
							</script>
						</div>
					</div>
				</div>
				<!--//베스트 클래스 -->
				<!-- 헤어 -->
				<div class="content-inner">
					<div class="off_tit off_hair">
						<h3>오프라인 헤어 클래스</h3>
						<ul class="product-list-01" data-column="4">
							<c:choose>
								<c:when test="${fn:length(rslt.hairList) != 0}">
									<c:forEach items="${rslt.hairList}" var="list" varStatus="i">
										<%@ include file="/WEB-INF/jsp/beauate/offclass/offClassListCommon.jsp"%>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li>데이터가 없습니다.</li>
								</c:otherwise>
							</c:choose>
						</ul>
						<div class="off_more">
							<a href="${basePath }/offclass/a/t/selectOffClassTabList.do?classCtSt=1">헤어 클래스 더보기<img src="${imgPath}/btn_arrow.png" /></a>
						</div>
					</div>
				</div>
				<!-- //헤어-->
				<!-- slider banner -->
				<div class="slider-banner">
					<div class="content-inner">
						<!-- Swiper -->
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<img src="${imagePath}/empty/img_banner-offline.png" alt="1" />
								</div>
								<div class="swiper-slide">
									<img src="${imagePath}/empty/img_banner-offline.png" alt="2" />
								</div>
							</div>
							<div class="swiper-info">
								<div class="swiper-button-prev"></div>
								<div class="swiper-pagination"></div>
								<div class="swiper-button-next"></div>
							</div>
						</div>
						<script tyle="text/javascript">
							var swiper = new Swiper(
									'.slider-banner .swiper-container', {
										pagination : {
											el : '.swiper-pagination',
											type : 'fraction',
										},
										navigation : {
											nextEl : '.swiper-button-next',
											prevEl : '.swiper-button-prev',
										},
									});
						</script>
					</div>
				</div>
				<!-- slider banner -->
				<!-- 메이크업 -->
				<div class="content-inner">
					<div class="off_tit off_makeup">
						<h3>오프라인 메이크업 클래스</h3>
						<ul class="product-list-01" data-column="4">
							<c:choose>
								<c:when test="${fn:length(rslt.makeUpList) != 0}">
									<c:forEach items="${rslt.makeUpList}" var="list" varStatus="i">
										<%@ include file="/WEB-INF/jsp/beauate/offclass/offClassListCommon.jsp"%>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li>데이터가 없습니다.</li>
								</c:otherwise>
							</c:choose>
						</ul>
						<div class="off_more">
							<a href="${basePath }/offclass/a/t/selectOffClassTabList.do?classCtSt=2">메이크업 클래스 더보기<img src="${imgPath}/btn_arrow.png" /></a>
						</div>
					</div>
				</div>
				<!-- //메이크업-->
				
				<!-- 전체 -->
				<div class="content-inner">
					<form:form commandName="classVO" name="classVO" id="classVO" method="post" action="" >
						<div class="list-top">
<!-- 							<h3>전체</h3> -->
							<div class="sort-list">
								<form:select style="width: 90px;" path="classAreaSt" id="classAreaSt" onchange="javascript:fn_selectBoxAreaClass();">
									<option value="">전체</option>
									<form:options items="${rslt.classAreaList}" itemLabel="mclsNm"  itemValue="mclsCd" />
								</form:select>
							</div>
						</div>
						<div id="targetAllOffList"></div>
					</form:form>
				</div>
				<!-- //검색결과 -->
			</div>
			<!-- //content -->
		</div>
		<!-- //container -->
		<!-- footer -->
		<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
		<!-- //footer -->
	</div>
	
<script type="text/javascript">
$(function() {
	//첫페이지 호출시 전체 Ajax
	fn_searchList(1, "");
});

//전체페이지 셀렉트박스 변환시
var fn_selectBoxAreaClass = function() {
	fn_searchList(cuurPage, $("#classAreaSt").val())
};

//현재페이지 전역변수
var cuurPage = 1;
var classAreaSt = "";
function fn_searchList(page, areaParam){
	cuurPage= page;
	var params = {};
	params.pageIndex = cuurPage;
	params.classAreaSt = areaParam;
	$.ajax({	
		url: "${basePath}/offclass/a/t/selectOffClassAjaxList.do",
		data: params,
		type: 'POST',
		dataType: 'html',
		cache: false,
		success: function(r) {
			$('#targetAllOffList').children().remove();
			$('#targetAllOffList').html(r);
		},
		error : function() {
		  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
}
</script>
</body>
</html>

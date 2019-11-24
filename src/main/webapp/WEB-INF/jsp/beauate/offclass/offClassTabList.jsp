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
	<div id="wrap" class="offline">
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
			<div class="content">
				<div>
					<div>
						<c:choose>
							<c:when test="${classVO.classCtSt eq '1'}">
								<div class="offclass_tit offtit_hair"></div>
							</c:when>
							<c:when test="${classVO.classCtSt eq '2'}">
								<div class="offclass_tit offtit_makeup"></div>
							</c:when>
							<c:when test="${classVO.classCtSt eq '3'}">
								<div class="offclass_tit offtit_eyelash"></div>
							</c:when>
							<c:when test="${classVO.classCtSt eq '4'}">
								<div class="offclass_tit offtit_skin"></div>
							</c:when>
							<c:when test="${classVO.classCtSt eq '5'}">
								<div class="offclass_tit offtit_nail"></div>
							</c:when>
							<c:otherwise>
								<div class="offclass_tit offtit_etc"></div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>





				<!-- 뷰티 type  -->
				<div class="content-inner">
					<div class="beauty-list">
						<h3>뷰티전문가를 만나보세요</h3>
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
				<!--//뷰티 type -->
				<!-- 스페셜  -->
				<div class="content-inner">
					<div class="specialmentor">
						<h3>special mentor 스페셜 뷰아떼 멘토</h3>
						<div class="specialmentor-inner">
							<div class="cont-left">
								<div class="mentor-list">
									<!-- Swiper -->
									<div class="swiper-container">
										<div class="swiper-wrapper">
											<div class="swiper-slide">
												<a href="#">
													<div class="mentor-link">
														<p class="txt-name">이산 원장님</p>
														<p class="txt-msg01">컷트도 과학이다.</p>
														<p class="txt-msg02">포토로 컷트를 분석하는 법을 배워보세요.</p>
													</div>
												</a>
											</div>
											<div class="swiper-slide">
												<a href="#">
													<div class="mentor-link">
														<p class="txt-name">이산 원장님2222</p>
														<p class="txt-msg01">컷트도 과학이다.22222</p>
														<p class="txt-msg02">포토로 컷트를 분석하는 법을 배워보세요.</p>
													</div>
												</a>
											</div>
										</div>
										<div class="swiper-info">
											<div class="swiper-button-prev"></div>
											<div class="swiper-pagination"></div>
											<div class="swiper-button-next"></div>
										</div>
									</div>
									<script tyle="text/javascript">
										var swiper = new Swiper('.mentor-list .swiper-container',{
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
								<div class="link-mentor">
									<a href="#"> <span class="txt01">멘토지원</span> <span class="txt02">세미나 등록을 원하시면</span>
									</a>
								</div>
							</div>
							<div class="cont-right">
								<ul class="product-list-01" data-column="2">
									<c:choose>
										<c:when test="${fn:length(rslt.selectNewList) != 0}">
											<c:forEach items="${rslt.selectNewList}" var="list" varStatus="i">
												<%@ include file="/WEB-INF/jsp/beauate/offclass/offClassListCommon.jsp"%>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<li>데이터가 없습니다.</li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!--//스페셜 -->
				<!-- best hair class   -->
				<div class="besthair">
					<div class="content-inner">
						<div class="besthair-title">
							<h3>
								<img src="${imagePath}/txt/txt_offline.svg" / alt="헤어클래스 베스트">
							</h3>
							<span class="stxt">지금 뷰아떼에서 핫한 멘토 수업을 만나보세요</span> <span class="stitle-best">BEST</span>
						</div>
						<div class="besthair-list">
							<!-- swiper -->
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<ul class="product-list-02" data-column="4">
											<li><a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-1.png" alt="" />
													</div>
											</a></li>
											<li><a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-2.png" alt="" />
													</div>
											</a></li>
											<li><a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-3.png" alt="" />
													</div>
											</a></li>
											<li><a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-4.png" alt="" />
													</div>
											</a></li>
										</ul>
									</div>
									<div class="swiper-slide">
										<ul class="product-list-02" data-column="4">
											<li><a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-1.png" alt="" />
													</div>
											</a></li>
											<li><a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-2.png" alt="" />
													</div>
											</a></li>
											<li><a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-3.png" alt="" />
													</div>
											</a></li>
											<li><a href="#">
													<div class="thumb">
														<img src="${imgPath}/img-tumb-300-4.png" alt="" />
													</div>
											</a></li>
										</ul>
									</div>
								</div>
								<div class="swiper-button-next"></div>
								<div class="swiper-button-prev"></div>
							</div>
							<script type="text/javascript">
								var swiper = new Swiper('.besthair-list .swiper-container', {
									navigation : {
										nextEl : '.swiper-button-next',
										prevEl : '.swiper-button-prev',
									},
								});
							</script>
						</div>
					</div>
				</div>
				<!--//best hair class  -->
				<!-- hurruy up -->
				<div class="content-inner">
					<div class="hurruyup">
						<h3>hurruyup class 마감임박</h3>
						<ul class="product-list-01" data-column="4">
							<c:choose>
								<c:when test="${fn:length(rslt.selectHurryList) != 0}">
									<c:forEach items="${rslt.selectHurryList}" var="list" varStatus="i">
										<%@ include file="/WEB-INF/jsp/beauate/offclass/offClassListCommon.jsp"%>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li>데이터가 없습니다.</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
				<!-- //hurruy up -->
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
				<!-- 검색결과 -->
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
</body>

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
	params.classCtSt = "${classVO.classCtSt}";
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
</html>
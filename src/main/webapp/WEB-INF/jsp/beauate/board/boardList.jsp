<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1280"/>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
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
	<div id="header">
		<jsp:include page="/WEB-INF/jsp/beauate/ucommon/top.jsp" flush="false" />
	</div>
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
							<li id="tab_${i.count }"><a href="${basePath}/board/r/m/selectBoardList.do?postCategorySt=${list.mclsCd}"" class="active">${list.mclsNm}</a></li>
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
				<ul class="product-list-01" data-column="4">
					<c:choose>
						<c:when test="${rslt.selectListCnt != 0}">
							<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
								<li>
									<a href="#">
										<div class="thumb"><img src="${uploadPath}/<c:out value="${list.imgSrc }"/>" alt="커버력 끝판왕 인생 파운데이션" /></div>
										<div class="title"><c:out value="${list.postTitle}"/></div>
										<div class="desc"><c:out value="${list.postSubTitle}"/></div>
										<div class="date"><fmt:formatDate value="${list.postDt}" pattern="yy.MM.dd"/></div>
									</a>
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li>데이터가 없습니다.</li>
						</c:otherwise>
					</c:choose>
				</ul>
				<div class="paging">
					<button type="button" class="btn-prev"><span>이전</span></button>
					<ul>
						<li class="active"><span>1</span></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
					</ul>
					<button type="button" class="btn-next"><span>다음</span></button>
				</div>
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
$(function() {
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
	});
});
</script>
</body>
</html>

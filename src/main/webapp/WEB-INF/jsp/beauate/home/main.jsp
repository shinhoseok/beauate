<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1280"/>
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
			<div class="main-title">
				<div class="content-inner">
					<h2 class="title"></h2>
				</div>
			</div>
			
			<!--new 클래스-->
				<div class="content-inner new_class">
					<h3>new class</h3>
						<p>신규클래스<span class="label_new">N</span></p>
							<ul>
								<c:if test="${fn:length(classListTop)>0}">
								<c:forEach var="cls" items="${classListTop}" begin="0" end="${fn:length(classListTop)-1}">
									<fmt:parseDate var="parsedClsSDt" value="${cls.classStartDt}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
									<fmt:formatDate var="etcDtStr" value="${parsedClsSDt}" pattern="yyyy-MM-dd(E)" />
								    <fmt:parseNumber
								    value="${ parsedClsSDt.time }"
								    integerOnly="true" var="classDays" scope="request"/>
									<c:set var="img" value=""/>
								    <c:if test="${fn:length(cls.classFileList)>0}">
										<c:forEach var="clsImg" items="${cls.classFileList}" begin="0" end="${fn:length(cls.classFileList)-1}">
											<c:if test="${clsImg.fileCn=='M1'}">
											<c:set var="path" value="${fn:split(fileStreCours, '/')}" />
											<c:set var="img" value="${uploadPath}/${path[fn:length(path)-1]}${clsImg.streFileNm}.${clsImg.fileExtsn}"/>
											</c:if>
										</c:forEach>
									</c:if>
									<li>
										<a href="#">
											<img src="${img}"/>
											<div>${cls.classTitle}</div><!-- 클래스제목 -->
											<div class="new_sub">${cls.classAreaStNm}</div><!-- 클레스서브제목 -->
											<div class="new_mentor">${etcDtStr}</div><!-- 멘토이름 -->
										</a>
									</li>
									</c:forEach>
							</c:if>
							</ul>
							<div class="off_more"><a href="${basePath}/class/a/t/classMainList.do">클래스 더보기<img src="${imgPath}/btn_arrow.png"></a></div>	
				</div>
			<!--//new 클래스---->
			<!-- slider banner2 -->
			<c:if test="${fn:length(longBannerList)>0}">
			<div class="slider-banner2">
				<div class="content-inner">
				   <!-- Swiper -->
				   <div class="swiper-container">
				    <div class="swiper-wrapper">
					<c:forEach var="banner" items="${longBannerList}" begin="0" end="${fn:length(longBannerList)-1}">
				      <div class="swiper-slide">
						<c:choose>
						<c:when test="${specialMento.bannerFileNm == null or specialMento.bannerFileNm == ''}">
						<img src="${imagePath}${specialMento.bannerFileNm}" alt="" />
						</c:when>
						<c:otherwise>
						<img src="${specialMento.bannerUrl}" alt="" />
						</c:otherwise>
						</c:choose>
				      </div>
				      </c:forEach>
				    </div>
				    <div class="swiper-info">
						 <div class="swiper-button-prev"></div>
						 <div class="swiper-pagination"></div>
						 <div class="swiper-button-next"></div>
				    </div>
				  </div>
				  <script tyle="text/javascript">
				    var swiper = new Swiper('.slider-banner2 .swiper-container', {
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
			</div>
			</c:if>
			<!-- slider banner -->
			<!-- 스페셜  -->
			<div class="content-inner marBig">
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
							    var swiper = new Swiper('.mentor-list .swiper-container', {
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
							<div class="link-mentor">
								<a href="#">
									<span class="txt01">멘토지원</span>
									<span class="txt02">세미나 등록을 원하시면</span>
								</a>
							</div>
						</div>
						<div class="cont-right">
							<ul class="product-list-01" data-column="2">
								<li>
									<a href="#">
										<div class="thumb">
											<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
											<div class="count"><span>1일 남았어요!</span></div>
										</div>
										<div class="title">강남</div>
										<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
										<div class="etc">
											<span>개강일</span>
											<span>7월 23일(화)</span>
										</div>
									</a>
								</li>
								<li>
									<a href="#">
										<div class="thumb">
											<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
										</div>
										<div class="title">강남</div>
										<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
										<div class="etc">
											<span>개강일</span>
											<span>7월 23일(화)</span>
										</div>
									</a>
								</li>
								<li>
									<a href="#">
										<div class="thumb">
											<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
											<div class="soldout"></div>
											<div class="soldout-txt">신청마감</div>
										</div>
										<div class="title">강남</div>
										<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
										<div class="etc">
											<span>개강일</span>
											<span>7월 23일(화)</span>
										</div>
									</a>
								</li>
								<li>
									<a href="#">
										<div class="thumb">
											<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
										</div>
										<div class="title">강남</div>
										<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
										<div class="etc">
											<span>개강일</span>
											<span>7월 23일(화)</span>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--//스페셜 -->
			<!-- 스페셜2  -->
			<div class="content-inner marBing">
				<div class="specialmentor">
					<h3>special mentor 스페셜 뷰아떼 멘토</h3>
						<div class="specialmentor-inner">
							<div class="cont-left2">
								<ul class="product-list-01" data-column="2">
											<li>
												<a href="#">
													<div class="thumb">
														<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
														<div class="count"><span>1일 남았어요!</span></div>
													</div>
													<div class="title">강남</div>
													<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
													<div class="etc">
														<span>개강일</span>
														<span>7월 23일(화)</span>
													</div>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="thumb">
														<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
													</div>
													<div class="title">강남</div>
													<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
													<div class="etc">
														<span>개강일</span>
														<span>7월 23일(화)</span>
													</div>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="thumb">
														<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
														<div class="soldout"></div>
														<div class="soldout-txt">신청마감</div>
													</div>
													<div class="title">강남</div>
													<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
													<div class="etc">
														<span>개강일</span>
														<span>7월 23일(화)</span>
													</div>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="thumb">
														<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
													</div>
													<div class="title">강남</div>
													<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
													<div class="etc">
														<span>개강일</span>
														<span>7월 23일(화)</span>
													</div>
												</a>
											</li>
								</ul>
							</div>
							<div class="cont-right2">
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
											var swiper = new Swiper('.mentor-list .swiper-container', {
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
										<div class="link-mentor">
											<a href="#">
												<span class="txt01">멘토지원</span>
												<span class="txt02">세미나 등록을 원하시면</span>
											</a>
										</div>
							</div>
					</div>
				</div>
			</div>
			<!--//스페셜2 -->
			<!--오프라인 리스트-->
			<div class="content-inner off_list">
				<h3>뷰티전문가를 만나보세요</h3>
				<p>뷰아떼가 소개하는 다양한 뷰티 오프라인 클래스</p>
				<ul>
				<c:if test="${fn:length(classCategoryList)>0}">
					<c:forEach var="classCategory" items="${classCategoryList}" begin="0" end="${fn:length(classCategoryList)-1}">
						<li><a href="${basePath}/class/a/t/classList.do?classCtSt=${classCategory.mclsCd}"">${classCategory.mclsNm}</a></li>
					</c:forEach>
				</c:if>
				</ul>
			</div>
			<!--//오프라인 리트스---->

		</div>
		<!-- //content -->
	</div>
	<!-- //container -->
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
	<!-- //footer -->
</div>
</body>
</html>

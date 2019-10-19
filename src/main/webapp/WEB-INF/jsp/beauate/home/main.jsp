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
				<div class="main-title">
					<div class="content-inner">
						<h2 class="title"></h2>
					</div>
				</div>
				<!--new 클래스-->
				<div class="content-inner new_class">
					<h3>new class</h3>
					<p>
						신규클래스<span class="label_new">N</span>
					</p>
					<ul>
						<li><a href="#"> <img src="${imgPath}/list_main_new_01.jpg" />
								<div>연령과 커트 스타일에 맞는 드라이 디자인 연출법</div>
								<div class="new_sub">처음 단계인 디자인 구상부터 제작, 보정, 마무리(제품사용)까지</div>
								<div class="new_mentor">최수연</div>
						</a></li>
						<li><a href="#"> <img src="${imgPath}/list_main_new_01.jpg" />
								<div>연령과 커트 스타일에 맞는 드라이 디자인 연출법</div>
								<div class="new_sub">처음 단계인 디자인 구상부터 제작, 보정, 마무리(제품사용)까지</div>
								<div class="new_mentor">최수연</div>
						</a></li>
						<li><a href="#"> <img src="${imgPath}/list_main_new_01.jpg" />
								<div>연령과 커트 스타일에 맞는 드라이 디자인 연출법</div>
								<div class="new_sub">처음 단계인 디자인 구상부터 제작, 보정, 마무리(제품사용)까지</div>
								<div class="new_mentor">최수연</div>
						</a></li>
						<li><a href="#"> <img src="${imgPath}/list_main_new_01.jpg" />
								<div>연령과 커트 스타일에 맞는 드라이 디자인 연출법</div>
								<div class="new_sub">처음 단계인 디자인 구상부터 제작, 보정, 마무리(제품사용)까지</div>
								<div class="new_mentor">최수연</div>
						</a></li>
						<li><a href="#"> <img src="${imgPath}/list_main_new_01.jpg" />
								<div>연령과 커트 스타일에 맞는 드라이 디자인 연출법</div>
								<div class="new_sub">처음 단계인 디자인 구상부터 제작, 보정, 마무리(제품사용)까지</div>
								<div class="new_mentor">최수연</div>
						</a></li>
						<li><a href="#"> <img src="${imgPath}/list_main_new_01.jpg" />
								<div>연령과 커트 스타일에 맞는 드라이 디자인 연출법</div>
								<div class="new_sub">처음 단계인 디자인 구상부터 제작, 보정, 마무리(제품사용)까지</div>
								<div class="new_mentor">최수연</div>
						</a></li>
					</ul>
					<div class="off_more">
						<a href="${basePath}/offclass/a/t/selectOffClassList.do">클래스 더보기<img src="${imgPath}/btn_arrow.png"></a>
					</div>
				</div>
				<!--//new 클래스---->
				<!-- slider banner2 -->
				<div class="slider-banner2">
					<div class="content-inner">
						<!-- Swiper -->
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<img src="${imgPath}/bn_main_product.jpg" alt="1" />
								</div>
								<div class="swiper-slide">
									<img src="${imgPath}/bn_main_product.jpg" alt="2" />
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
									'.slider-banner2 .swiper-container', {
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
										var swiper = new Swiper(
												'.mentor-list .swiper-container',
												{
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
									<li><a href="#">
											<div class="thumb">
												<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
												<div class="count">
													<span>1일 남았어요!</span>
												</div>
											</div>
											<div class="title">강남</div>
											<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
											<div class="etc">
												<span>개강일</span> <span>7월 23일(화)</span>
											</div>
									</a></li>
									<li><a href="#">
											<div class="thumb">
												<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
											</div>
											<div class="title">강남</div>
											<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
											<div class="etc">
												<span>개강일</span> <span>7월 23일(화)</span>
											</div>
									</a></li>
									<li><a href="#">
											<div class="thumb">
												<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
												<div class="soldout"></div>
												<div class="soldout-txt">신청마감</div>
											</div>
											<div class="title">강남</div>
											<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
											<div class="etc">
												<span>개강일</span> <span>7월 23일(화)</span>
											</div>
									</a></li>
									<li><a href="#">
											<div class="thumb">
												<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
											</div>
											<div class="title">강남</div>
											<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
											<div class="etc">
												<span>개강일</span> <span>7월 23일(화)</span>
											</div>
									</a></li>
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
									<li><a href="#">
											<div class="thumb">
												<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
												<div class="count">
													<span>1일 남았어요!</span>
												</div>
											</div>
											<div class="title">강남</div>
											<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
											<div class="etc">
												<span>개강일</span> <span>7월 23일(화)</span>
											</div>
									</a></li>
									<li><a href="#">
											<div class="thumb">
												<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
											</div>
											<div class="title">강남</div>
											<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
											<div class="etc">
												<span>개강일</span> <span>7월 23일(화)</span>
											</div>
									</a></li>
									<li><a href="#">
											<div class="thumb">
												<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
												<div class="soldout"></div>
												<div class="soldout-txt">신청마감</div>
											</div>
											<div class="title">강남</div>
											<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
											<div class="etc">
												<span>개강일</span> <span>7월 23일(화)</span>
											</div>
									</a></li>
									<li><a href="#">
											<div class="thumb">
												<img src="libs/images/empty/img-tumb-290x295_2.png" alt="" />
											</div>
											<div class="title">강남</div>
											<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
											<div class="etc">
												<span>개강일</span> <span>7월 23일(화)</span>
											</div>
									</a></li>
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
										var swiper = new Swiper(
												'.mentor-list .swiper-container',
												{
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
						</div>
					</div>
				</div>
				<!--//스페셜2 -->
				<!--오프라인 리스트-->
				<div class="content-inner off_list">
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

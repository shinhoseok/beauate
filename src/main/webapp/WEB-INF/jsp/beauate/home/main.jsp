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
<SCRIPT type="text/javascript">
	var mobilecheck = function () {
	var check = false;
	(function(a,b){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))check = true})(navigator.userAgent||navigator.vendor||window.opera);
	return check;
	}
	if(mobilecheck()){
		location.href='http://m.beauate.com';
		//모바일로 접속시 이동 경로
	}
</SCRIPT>
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

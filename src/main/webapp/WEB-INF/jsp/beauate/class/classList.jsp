<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
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
<div id="wrap" class="offline">
	<div id="skip">
		<a href="#container">본문 내용 바로가기</a>
	</div>
	<!-- header -->
	<div id="header">
		<jsp:include page="/WEB-INF/jsp/beauate/ucommon/top.jsp" flush="false" />
	</div>
	<!-- //header -->
	<div id="container">

		<!-- content -->
		<div class="content">
			<div class="page-title">
				<div class="content-inner">
					<h2 class="title"><img src="${imagePath}/txt/tit_hairclass.png" alt="hair class"></h2>
				</div>
			</div>
			<!-- 뷰티 type  -->
			<div class="content-inner">
				<div class="beauty-list">
					<h3>뷰티전문가를 만나보세요</h3>
					<ul>
						<li><a href="#">헤어</a></li>
						<li><a href="#">메이크업</a></li>
						<li><a href="#">속눈썹/반영구</a></li>
						<li><a href="#">피부/왁싱</a></li>
						<li><a href="#">네일</a></li>
						<li><a href="#">기타</a></li>
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
								<c:forEach var="cls" items="${classList}" begin="0" end="3">
								<li>
									<a href="#">
										<div class="thumb">
											<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
											<div class="count"><span>1일 남았어요!${cls.classStartDt}${now}</span></div>
										</div>
										<div class="title">${cls.classAdr}</div>
										<div class="desc">${cls.classTitle}</div>
										<div class="etc">
											<span>개강일</span>
											<span>${cls.classStartDt}7월 23일(화)</span>
										</div>
									</a>
								</li>
								</c:forEach>
								<li>
									<a href="#">
										<div class="thumb">
											<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
											<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
											<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
											<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
			<!-- best hair class   -->
			<div class="besthair">
				<div class="content-inner">
					<div class="besthair-title">
						<h3>Hair Class </h3>
						<span class="stxt">지금 뷰아떼에서 핫한 멘토 수업을 만나보세요</span>
						<span class="stitle">BEST</span>
					</div>
					<div class="besthair-list">
					 <!-- swiper -->
					  <div class="swiper-container">
						<div class="swiper-wrapper">
						  <div class="swiper-slide">
								<ul class="product-list-02" data-column="4">
									<li>
										<a href="#">
											<div class="thumb"><img src="${imagePath}/empty/img-tumb-300.png" alt="" /></div>
											<div class="mento">유혜인</div>
										</a>
									</li>
									<li>
										<a href="#">
											<div class="thumb"><img src="${imagePath}/empty/img-tumb-300.png" alt="" /></div>
											<div class="mento">유혜인</div>
										</a>
									</li>
									<li>
										<a href="#">
											<div class="thumb"><img src="${imagePath}/empty/img-tumb-300.png" alt="" /></div>
											<div class="mento">유혜인</div>
										</a>
									</li>
									<li>
										<a href="#">
											<div class="thumb"><img src="${imagePath}/empty/img-tumb-300.png" alt="" /></div>
											<div class="mento">유혜인</div>
										</a>
									</li>
								</ul>
						  </div>
						  <div class="swiper-slide">
								<ul class="product-list-02" data-column="4">
									<li>
										<a href="#">
											<div class="thumb"><img src="${imagePath}/empty/img-tumb-300.png" alt="" /></div>
											<div class="mento">유혜인</div>
										</a>
									</li>
									<li>
										<a href="#">
											<div class="thumb"><img src="${imagePath}/empty/img-tumb-300.png" alt="" /></div>
											<div class="mento">유혜인</div>
										</a>
									</li>
									<li>
										<a href="#">
											<div class="thumb"><img src="${imagePath}/empty/img-tumb-300.png" alt="" /></div>
											<div class="mento">유혜인</div>
										</a>
									</li>
									<li>
										<a href="#">
											<div class="thumb"><img src="${imagePath}/empty/img-tumb-300.png" alt="" /></div>
											<div class="mento">유혜인</div>
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
			<!--//best hair class  -->
			<!-- hurruy up -->
			<div class="content-inner">
				<div class="hurruyup">
					<h3>hurruyup class 마감임박</h3>
					<ul class="product-list-01" data-column="4">
						<li>
							<a href="#">
								<div class="thumb">
									<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
									<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
									<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
									<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
									<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
									<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
									<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
									<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
				      <div class="swiper-slide"><img src="${imagePath}/empty/img_banner-offline.png" alt="1" /></div>
				      <div class="swiper-slide"><img src="${imagePath}/empty/img_banner-offline.png" alt="2" /></div>
				    </div>
				    <div class="swiper-info">
						 <div class="swiper-button-prev"></div>
						 <div class="swiper-pagination"></div>
						 <div class="swiper-button-next"></div>
				    </div>
				  </div>
				  <script tyle="text/javascript">
				    var swiper = new Swiper('.slider-banner .swiper-container', {
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
			<!-- slider banner -->
			<!-- 검색결과 -->
			<div class="content-inner">
				<div class="list-top">
					<h3>전체</h3>
					<div class="sort-list">
						<select style="width:90px;">
							<option selected>지역 1</option>
							<option>지역 2</option>
							<option>지역 3</option>
						</select>
					</div>
				</div>
				<ul class="product-list-01" data-column="4">
					<li>
						<a href="#">
							<div class="thumb"><img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" /></div>
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
								<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
								<div class="soldout"></div>
								<div class="soldout-txt">종료</div>
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
								<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
							<div class="thumb"><img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" /></div>
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
								<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
							<div class="thumb"><img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" /></div>
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
							<div class="thumb"><img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" /></div>
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
							<div class="thumb"><img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" /></div>
							<div class="title">강남</div>
							<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
							<div class="etc">
								<span>개강일</span>
								<span>7월 23일(화)</span>
							</div>
						</a>
					</li><li>
						<a href="#">
							<div class="thumb"><img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" /></div>
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
								<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
								<div class="soldout"></div>
								<div class="soldout-txt">종료</div>
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
								<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
							<div class="thumb"><img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" /></div>
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
								<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
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
							<div class="thumb"><img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" /></div>
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
							<div class="thumb"><img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" /></div>
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
							<div class="thumb"><img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" /></div>
							<div class="title">강남</div>
							<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
							<div class="etc">
								<span>개강일</span>
								<span>7월 23일(화)</span>
							</div>
						</a>
					</li>
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
</html>

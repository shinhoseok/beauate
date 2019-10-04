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
				<div class="content-inner">
					<!-- 우측 퀵 영역 -->
					<div class="quick-class">
						<div class="quick-class-inner">
							<ul class="product-list-01" data-column="1">
								<li><a href="#">
										<div class="thumb">
											<img src="${uploadPath}/<c:out value="${rslt.resultVO.imgSrc }"/>" alt="" />
											<!-- 오늘날짜 todayNum -->
											<fmt:parseDate value="${rslt.today}" var="todayParseDate" pattern="yyyy-MM-dd"/> 
											<fmt:parseNumber value="${todayParseDate.time / (1000*60*60*24)}" integerOnly="true" var="todayNum"/>
											<!-- 개강일 classStartDtNum -->
											<fmt:parseDate value="${rslt.resultVO.classStartDt}" var="classStartDtParseDate" pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${classStartDtParseDate.time / (1000*60*60*24)}" integerOnly="true" var="classStartDtNum"/>
											<!-- 종료일 classEndDtNum -->
											<fmt:parseDate value="${rslt.resultVO.classEndDt}" var="classEndDtParseDate" pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${classEndDtParseDate.time / (1000*60*60*24)}" integerOnly="true" var="classEndDtNum"/>
											<c:if test="${(todayNum - classStartDtNum) <= 0 and classEndDtNum - todayNum > 0 and classStartDtNum - todayNum >= 0}">
												<div class="count"><span>${((todayNum - classStartDtNum)*-1) +1 }일 남았어요!</span></div>
											</c:if>
											<span class="label">20%</span>
										</div>
										<div class="title"><c:out value="${rslt.resultVO.classAreaStNm}"/></div>
										<div class="desc"><c:out value="${rslt.resultVO.classTitle}"/></div>
										<div class="etc">
											<fmt:parseDate value="${rslt.resultVO.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
											<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
										</div>
								</a></li>
							</ul>
							<button type="button" class="btn-share">
								<span>공유하기</span>
							</button>
							<dl class="totalprice">
								<dt>총 결제금액</dt>
								<dd>
									234,500<span class="unit">원</span><span class="discount">124,000</span>
								</dd>
							</dl>
						</div>
						<div class="btn-area">
							<button type="button" class="btn-util">클래스 신청</button>
							<button type="button" class="btn-wish">찜하기</button>
						</div>
						<div class="btn-area">
							<button type="button" class="btn-util">
								<span>클래스 외부접수</span>
							</button>
							<button type="button" class="btn-wish">찜하기</button>
						</div>
						<div class="btn-area">
							<a href="#modal-alarm" rel="modal:open" class="btn-util">알람신청</a>
							<button type="button" class="btn-wish active">찜하기</button>
							<!-- 찜되었을때 class="active" 추가 -->
						</div>
						<!-- 팝업 : 알람신청 -->
						<div id="modal-alarm" class="modal">
							<h2>sign in</h2>
							<p class="title-desc">알람신청</p>
							<div class="item">
								<div class="thumb">
									<img src="${imagePath}/empty/img-tumb-290x295_2.png" alt="" />
								</div>
								<div class="rcont">
									<div class="desc">인기상승! 속눈썹 연장술에 필요한 특수모 선정방법 및 연장 요령</div>
									<div class="etc">
										<span>개강일</span> <span>7월 23일(화)</span>
									</div>
								</div>
							</div>
							<dl class="alarm-phone">
								<dt>휴대폰</dt>
								<dd>010 - 1234 - 5689</dd>
							</dl>
							<div class="my-modify">
								<span>번호변경을 원하실 경우 마이페이지에 변경하실 수 있습니다.</span> <a href="#">내 정보수정</a>
							</div>
							<div class="btn-area">
								<button class="btn">
									<span>알람신청</span>
								</button>
							</div>
							<a href="#" rel="modal:close" class="modal-close">닫기</a>
						</div>
					</div>
					<!-- //우측 퀵 영역 -->
					<div class="offline-view">
						<!-- view banner -->
						<div class="view-banner">
							<!-- Swiper -->
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<img src="${imagePath}/empty/img-tumb-850.jpg" alt="1" />
									</div>
									<div class="swiper-slide">
										<img src="${imagePath}/empty/img-tumb-850.jpg" alt="2" />
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
										'.view-banner .swiper-container', {
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
						<!-- //view banner -->
						<div class="offline-view-title">
							<p class="title"><c:out value="${rslt.resultVO.classTitle}"/></p>
<!-- 							<p class="desc">저는 혈액순환, 림프순환 그리고 근막 테라피를 접목한 저만의 경락 마사지법을 개발하고 선보이고 있습니다</p> -->
						</div>
						<div class="cont-nav">
							<ul>
								<li><a href="#class_intro" class="active">클래스 소개</a></li>
								<li><a href="class_map">오시는길</a></li>
								<li><a href="#">문의하기</a></li>
								<li><a href="#">클래스 후기</a></li>
								<li><a href="#">취소/환불 정책</a></li>
							</ul>
						</div>
						<!--클래스 상세-->
						<div class="offline-view-cont">
							<div>
								<img src="${uploadPath}/<c:out value="${rslt.resultVO.imgSrc2 }"/>" />
							</div>
							<!--오시는 길-->
							<div class="class_map">
								<div class="class_map_inner">
									<div class="info_text_wrap">
										<div class="text_left">
											<ul>
												<li>일시</li>
												<li>시간</li>
												<li>인원</li>
												<li>장소</li>
											</ul>
										</div>
										<div class="text_right">
											<ul>
												<li>
													<fmt:parseDate value="${rslt.resultVO.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
													<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
												</li>
												<li>
													<c:out value="${rslt.resultVO.classTime }"/>
												</li>
												<li>최소 <c:out value="${rslt.resultVO.classSmallNo }"/>명 / 최대 <c:out value="${rslt.resultVO.classBigNo }"/>명</li>
												<li><c:out value="${rslt.resultVO.classAdr }"/></li>
											</ul>
										</div>
									</div>
									<div class="info_map">
										<img src="${imagePath}/sub/class_map.jpg" />
									</div>
								</div>
							</div>
							<!--// 오시는 길-->
							<div class="class_ask">
								<span class="class_ask_inner"> <span> <strong>멘토</strong> <span>뷰아떼님</span>
								</span> <span> <strong>문의</strong> <span class="num">010-1234-5678</span>
								</span> <span class="kakao_wrap"> <span class="icon_kakao">플러스친구 :</span> <span>박승철헤어스투디오도곡동</span>
								</span>
								</span>
							</div>
						</div>
						<!--// 클래스 상세 -->
						<!-- 리뷰 -->
						<div class="review">
							<h3>Review class 수강후기</h3>
							<div class="grade">
								<p class="grade-num">4.5</p>
								<ul class="grade-list">
									<li><span class="tit">커리큘럼</span> <span class="star"><span style="width: 80%;"></span></span></li>
									<li><span class="tit">시간준수</span> <span class="star"><span style="width: 100%;"></span></span></li>
									<li><span class="tit">전달력</span> <span class="star"><span style="width: 80%;"></span></span></li>
									<li><span class="tit">친절도</span> <span class="star"><span style="width: 40%;"></span></span></li>
								</ul>
							</div>
							<ul class="review-list">
								<li>
									<div class="review-info">
										<span class="name">박소*</span> <span class="date">19.08.27</span>
									</div>
									<p class="txt">2시간 알찬 수업이었어요! 전 쿨톤임에도 불구하고 메이업이나 옷은 웜톤으로 입고 있다는 걸 알았어요ㅎㅎㅎ 수업을 통해 제매력을 더 뿜뿜할 수 있는 색을 찾아서 뿌듯해요</p>
								</li>
								<li>
									<div class="review-info">
										<span class="name">박소*</span> <span class="date">19.08.27</span>
									</div>
									<p class="txt">2시간 알찬 수업이었어요! 전 쿨톤임에도 불구하고 메이업이나 옷은 웜톤으로 입고 있다는 걸 알았어요ㅎㅎㅎ 수업을 통해 제매력을 더 뿜뿜할 수 있는 색을 찾아서 뿌듯해요</p>
									<div class="reply">
										<a href="#">댓글보기<span class="cnt">2</span></a>
									</div>
								</li>
								<li>
									<div class="review-info">
										<span class="name">박소*</span> <span class="date">19.08.27</span>
									</div>
									<p class="txt">2시간 알찬 수업이었어요! 전 쿨톤임에도 불구하고 메이업이나 옷은 웜톤으로 입고 있다는 걸 알았어요ㅎㅎㅎ 수업을 통해 제매력을 더 뿜뿜할 수 있는 색을 찾아서 뿌듯해요</p>
									<div class="reply">
										<a href="#">댓글보기<span class="cnt">2</span></a>
									</div>
								</li>
								<li>
									<div class="review-info">
										<span class="name">박소*</span> <span class="date">19.08.27</span>
									</div>
									<p class="txt">2시간 알찬 수업이었어요! 전 쿨톤임에도 불구하고 메이업이나 옷은 웜톤으로 입고 있다는 걸 알았어요ㅎㅎㅎ 수업을 통해 제매력을 더 뿜뿜할 수 있는 색을 찾아서 뿌듯해요</p>
									<div class="reply">
										<a href="#">댓글보기<span class="cnt">2</span></a>
									</div>
								</li>
								<li>
									<div class="review-info">
										<span class="name">박소*</span> <span class="date">19.08.27</span>
									</div>
									<p class="txt">2시간 알찬 수업이었어요! 전 쿨톤임에도 불구하고 메이업이나 옷은 웜톤으로 입고 있다는 걸 알았어요ㅎㅎㅎ 수업을 통해 제매력을 더 뿜뿜할 수 있는 색을 찾아서 뿌듯해요</p>
									<div class="reply">
										<a href="#">댓글보기<span class="cnt">2</span></a>
									</div>
								</li>
							</ul>
							<div class="paging">
								<button type="button" class="btn-prev">
									<span>이전</span>
								</button>
								<ul>
									<li class="active"><span>1</span></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
								</ul>
								<button type="button" class="btn-next">
									<span>다음</span>
								</button>
							</div>
						</div>
						<!-- //리뷰 -->
					</div>
					<br />
				</div>
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" scope="request"/>
<fmt:parseNumber
    value="${ now.time }"
    integerOnly="true" var="nowDays" scope="request"/>
<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1280"/>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BEAUATE</title>
<link rel="stylesheet" type="text/css" href="${cssPath}/contents.css"/>
<link rel="stylesheet" type="text/css" href="${cssPath}/contents-my1.css"/>
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
			<c:if test= "${cls != null}">
			
			<div class="content-inner">
				<!-- 우측 퀵 영역 -->
				<div class="quick-class">
					<div class="quick-class-inner">
						<fmt:parseDate var="parsedClsSDt" value="${cls.classStartDt}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
						<fmt:formatDate var="etcDtStr" value="${parsedClsSDt}" pattern="yyyy-MM-dd(E)" />
					    <fmt:parseNumber
					    value="${ parsedClsSDt.time}"
					    integerOnly="true" var="classDays" scope="request"/>
						<c:set var="img" value=""/>
					    <c:if test="${fn:length(cls.classFileList)>0}">
							<c:forEach var="clsImg" items="${cls.classFileList}" begin="0" end="${fn:length(cls.classFileList)-1}">
								<c:if test="${clsImg.fileCn=='M1'}">
								<c:set var="path" value="${fn:split(clsImg.fileStreCours, '/')}" />
								<c:set var="path" value="${path[fn:length(path)-1]}" />
								<c:set var="path" value="${fn:replace(path,'\\\\','/')}" />
								<c:set var="img" value="${uploadPath}${path}/${clsImg.streFileNm}"/>
								</c:if>
							</c:forEach>
						</c:if>
						 <c:set var="remainDays" value="${classDays-nowDays}"/>
						<c:set var="remainDays" value="${(remainDays)/ (1000*60*60*24)}"/>
						<fmt:formatNumber var="remainDays" value="${remainDays+(1-(remainDays%1))%1}" type="number"/>
						<ul class="product-list-01" data-column="1">
							<li>
								<a href="#">
									<div class="thumb">
										<img src="${img}" alt="" />
										<c:choose>
											<c:when test="${cls.classStNm  == '오픈전' || cls.classStNm  == '오픈중' || cls.classStNm  == '신청마감'}">
												<c:choose>
												<c:when test="${remainDays<=7}">
													<div class="count"><span>${remainDays==-0?0:remainDays}일 남았어요!</span></div>
												</c:when>
												<c:otherwise>
												</c:otherwise>
												</c:choose>
											</c:when>
											<c:when test="${cls.classStNm  == '종료'}">
												<div class="soldout">${cls.classStNm}</div>
												<div class="soldout-txt">${cls.classStNm}</div>
											</c:when>
											<c:otherwise>
												<c:choose>
												<c:when test="${remainDays<=7 and remainDays>=0}">
													<div class="count"><span>${remainDays==-0?0:remainDays}일 남았어요!</span></div>
												</c:when>
												<c:when test="${remainDays<0}">
													<div class="soldout"></div>
													<div class="soldout-txt">신청마감</div>
												</c:when>
												<c:otherwise>
												</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
										<span class="label">20%???</span>
									</div>
									<div class="title">${cls.classAreaStNm}</div>
									<div class="desc">${cls.classTitle}</div>
									<div class="etc">
										<span>개강일</span>
										<span>${etcDtStr}</span>
									</div>
								</a>
							</li>
						</ul>
						<button type="button" class="btn-share"><span>공유하기</span></button>
						<dl class="totalprice">
							<dt>총 결제금액</dt>
							<dd><fmt:formatNumber value="${cls.classCost}" pattern="#,###" /><span class="unit">원</span><span class="discount">124,000??</span></dd>
						</dl>
					</div>
					<c:if test="${cls.classSt==2}">
					<div class="btn-area">
						<button type="button" class="btn-util">클래스 신청</button>
						<button type="button" class="btn-wish">찜하기</button>
					</div>
						<c:if test="${cls.classWebAdr!='' and cls.classWebAdr!=null}">
					<div class="btn-area">
						<button type="button" class="btn-util"><span>클래스 외부접수</span></button>
						<button type="button" class="btn-wish">찜하기</button>
					</div>
						</c:if>
					</c:if>
					<div class="btn-area">
						<a href="#modal-alarm" rel="modal:open" class="btn-util">알람신청</a>
						<button type="button" class="btn-wish active">찜하기</button> <!-- 찜되었을때 class="active" 추가 -->
					</div>
					<!-- 팝업 : 알람신청 -->
					<div id="modal-alarm" class="modal">
					 	<h2>sign in</h2>
						<p class="title-desc">알람신청</p>
						<div class="item">
							<div class="thumb">
								<img src="${img}" alt="" />
							</div>
							<div class="rcont">
								<div class="desc">${cls.classAreaStNm}</div>
								<div class="etc">
									<span>개강일</span>
									<span>${etcDtStr}</span>
								</div>
							</div>
						</div>
						<dl class="alarm-phone">
							<dt>휴대폰</dt>
							<dd>
								${sessionScope.loginVO.mblPno}
							</dd>
						</dl>
						<div class="my-modify">
							<span>번호변경을 원하실 경우 마이페이지에 변경하실 수 있습니다.</span>
							<a href="#">내 정보수정</a>
						</div>
						<div class="btn-area"><button class="btn"><span>알람신청</span></button></div>
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
						
					    <c:if test="${fn:length(cls.classFileList)>0}">
							<c:forEach var="clsImg" items="${cls.classFileList}" begin="0" end="${fn:length(cls.classFileList)-1}" varStatus="status">
								<c:if test="${fn:indexOf(clsImg.fileCn,'S')>-1}">
								<c:set var="path" value="${fn:split(clsImg.fileStreCours, '/')}" />
								<c:set var="path" value="${path[fn:length(path)-1]}" />
								<c:set var="path" value="${fn:replace(path,'\\\\','/')}" />
								<c:set var="img" value="${uploadPath}${path}/${clsImg.streFileNm}"/>
								<div class="swiper-slide"><img src="${img}" alt="${status.count}" /></div>
								</c:if>
								
							</c:forEach>
						</c:if>
						</div>
						<div class="swiper-info">
							 <div class="swiper-button-prev"></div>
							 <div class="swiper-pagination"></div>
							 <div class="swiper-button-next"></div>
						</div>
					  </div>
					  <script tyle="text/javascript">
						var swiper = new Swiper('.view-banner .swiper-container', {
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
					<!-- //view banner -->
					<div class="offline-view-title">
						<p class="title">${cls.classTitle}</p>
						<p class="desc">저는 혈액순환, 림프순환 그리고 근막 테라피를 접목한 저만의 경락 마사지법을 개발하고 선보이고 있습니다</p>
					</div>
					<div class="cont-nav">
						<ul>
							<li><a href="#" class="active">클래스 소개</a></li>
							<li><a href="#">오시는길</a></li>
							<li><a href="#">문의하기</a></li>
							<li><a href="#">클래스 후기</a></li>
							<li><a href="#">취소/환불 정책</a></li>
						</ul>
					</div>
					<div class="offline-view-cont">컨텐츠영역</div>
					<!-- 리뷰 -->
					<div class="review">
						<h3>Review class 수강후기</h3>
						<div class="grade">
							<p class="grade-num">${scoAvr}</p>
							<ul class="grade-list">
								<li>
									<span class="tit">커리큘럼</span>
									<span class="star"><span style="width:${sco1}%;"></span></span>
								</li>
								<li>
									<span class="tit">시간준수</span>
									<span class="star"><span style="width:${sco2}%;"></span></span>
								</li>
								<li>
									<span class="tit">전달력</span>
									<span class="star"><span style="width:${sco3}%;"></span></span>
								</li>
								<li>
									<span class="tit">친절도</span>
									<span class="star"><span style="width:${sco4}%;"></span></span>
								</li>
							</ul>
						</div>
						<ul class="review-list">
							<li>
								<div class="review-info">
									<span class="name">박소*</span>
									<span class="date">19.08.27</span>
								</div>
								<p class="txt">2시간 알찬 수업이었어요! 전 쿨톤임에도 불구하고 메이업이나 옷은 웜톤으로 입고 있다는 걸 알았어요ㅎㅎㅎ 수업을 통해 제매력을 더 뿜뿜할 수 있는 색을 찾아서 뿌듯해요</p>
							</li>
							<li>
								<div class="review-info">
									<span class="name">박소*</span>
									<span class="date">19.08.27</span>
								</div>
								<p class="txt">2시간 알찬 수업이었어요! 전 쿨톤임에도 불구하고 메이업이나 옷은 웜톤으로 입고 있다는 걸 알았어요ㅎㅎㅎ 수업을 통해 제매력을 더 뿜뿜할 수 있는 색을 찾아서 뿌듯해요</p>
								<div class="reply"><a href="#">댓글보기<span class="cnt">2</span></a></div>
							</li>
							<li>
								<div class="review-info">
									<span class="name">박소*</span>
									<span class="date">19.08.27</span>
								</div>
								<p class="txt">2시간 알찬 수업이었어요! 전 쿨톤임에도 불구하고 메이업이나 옷은 웜톤으로 입고 있다는 걸 알았어요ㅎㅎㅎ 수업을 통해 제매력을 더 뿜뿜할 수 있는 색을 찾아서 뿌듯해요</p>
								<div class="reply"><a href="#">댓글보기<span class="cnt">2</span></a></div>
							</li>
							<li>
								<div class="review-info">
									<span class="name">박소*</span>
									<span class="date">19.08.27</span>
								</div>
								<p class="txt">2시간 알찬 수업이었어요! 전 쿨톤임에도 불구하고 메이업이나 옷은 웜톤으로 입고 있다는 걸 알았어요ㅎㅎㅎ 수업을 통해 제매력을 더 뿜뿜할 수 있는 색을 찾아서 뿌듯해요</p>
								<div class="reply"><a href="#">댓글보기<span class="cnt">2</span></a></div>
							</li>
							<li>
								<div class="review-info">
									<span class="name">박소*</span>
									<span class="date">19.08.27</span>
								</div>
								<p class="txt">2시간 알찬 수업이었어요! 전 쿨톤임에도 불구하고 메이업이나 옷은 웜톤으로 입고 있다는 걸 알았어요ㅎㅎㅎ 수업을 통해 제매력을 더 뿜뿜할 수 있는 색을 찾아서 뿌듯해요</p>
								<div class="reply"><a href="#">댓글보기<span class="cnt">2</span></a></div>
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
					<!-- //리뷰 -->

				</div>
				<br />
		</div> <!-- content-inner -->
		</c:if>
		<!-- //content -->


	</div>
	<!-- //container -->
	<script>
	function fn_ajaxList(pageNo){
		var forms = document.classBottomList;
		var listUrl = forms.action;
		forms.pageIndex.value = pageNo;
		var inputs = $('input',forms);
		var param = {};
		inputs.each(function(){
			param[this.name] = $(this).val();
		});
		var selects = $('select',forms);
		selects.each(function(){
			param[this.name] = $(this).val();
		});
		$.ajax({						
			type: 'POST',						
			url : listUrl,						
			data: param,						
			dataType: "html",						
			success: function(data){
				$("#classBottomList>dummy").empty();
				$("#classBottomList>dummy").append(data);				
			}					
		});		
	};
	$(document).ready(function($){
		$("#classBottomList select").on('change', function(e) {
			var forms = document.classBottomList;
			fn_ajaxList(forms.pageIndex.value);
	    });
	});
	</script>
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
	<!-- //footer -->
</div>
</body>
</html>

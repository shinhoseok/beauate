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
<!-- 		<div id="header"> -->
			<jsp:include page="/WEB-INF/jsp/beauate/ucommon/top.jsp" flush="false" />
<!-- 		</div> -->
		<!-- //header -->
		<!-- container -->
		<div id="container">
			<!-- content -->
			<div class="content">
				<div class="content-inner">
					<!-- 우측 퀵 영역 -->
					<div class="quick-class" id="quick-class">
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
<!-- 											<span class="label">20%</span> -->
										</div>
										<div class="title"><c:out value="${rslt.resultVO.classAreaStNm}"/></div>
										<div class="desc"><c:out value="${rslt.resultVO.classTitle}"/></div>
										<div class="etc">
											<fmt:parseDate value="${rslt.resultVO.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
											<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
										</div>
								</a></li>
							</ul>
							<button type="button" class="btn-share" onclick="fn_shareOffClass('<c:out value="${rslt.resultVO.classId}"/>')">
								<span>공유하기</span>
							</button>
							<dl class="totalprice">
								<dt>총 결제금액</dt>
								<dd>
									<fmt:formatNumber value="${rslt.resultVO.classCost }" pattern="#,###" /><span class="unit">원</span>
<!-- 									<span class="discount">124,000</span> -->
								</dd>
							</dl>
						</div>
						<c:choose>
							<c:when test="${rslt.resultVO.classSt eq '3' or rslt.resultVO.classSt eq '4' or todayNum >= classStartDtNum}"> <!-- 마감되었거나, 사람꽉찻을때 -->
								<div class="btn-area">
									<a href="#modal-alarm" class="btn-util" id="alarmBtn" onclick="javascript:fn_selectAlarmPop();">알람신청</a>
									<c:choose>
										<c:when test="${not empty rslt.jjimVO}">
											<button type="button" class="btn-wish active" id="jjimBtn" onclick="javascript:fn_selectJjimProc('<c:out value="${rslt.resultVO.classId}"/>');">찜하기</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn-wish" id="jjimBtn" onclick="javascript:fn_selectJjimProc('<c:out value="${rslt.resultVO.classId}"/>');">찜하기</button>
										</c:otherwise>
									</c:choose>
								</div>
							</c:when>
							<c:otherwise>
								<c:if test="${rslt.resultVO.classGb eq '1'}"><!-- 내부일때 -->
									<div class="btn-area">
										<button type="button" class="btn-util" onclick="javascript:fn_selectOffClassApply('<c:out value="${rslt.resultVO.classId}"/>');">클래스 신청</button>
										<c:choose>
											<c:when test="${not empty rslt.jjimVO}">
												<button type="button" class="btn-wish active" id="jjimBtn" onclick="javascript:fn_selectJjimProc('<c:out value="${rslt.resultVO.classId}"/>');">찜하기</button>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn-wish" id="jjimBtn" onclick="javascript:fn_selectJjimProc('<c:out value="${rslt.resultVO.classId}"/>');">찜하기</button>
											</c:otherwise>
										</c:choose>
									</div>
								</c:if>
								<c:if test="${rslt.resultVO.classGb eq '2'}"><!-- 외부일때 -->
									<div class="btn-area">
										<button type="button" class="btn-util" onclick="javascript:fn_outWebAdrOffClass('<c:out value="${rslt.resultVO.classWebAdr}"/>');">
											<span>클래스 외부접수</span>
										</button>
										<c:choose>
											<c:when test="${not empty rslt.jjimVO}">
												<button type="button" class="btn-wish active" id="jjimBtn" onclick="javascript:fn_selectJjimProc('<c:out value="${rslt.resultVO.classId}"/>');">찜하기</button>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn-wish" id="jjimBtn" onclick="javascript:fn_selectJjimProc('<c:out value="${rslt.resultVO.classId}"/>');">찜하기</button>
											</c:otherwise>
										</c:choose>
									</div>
								</c:if>
							</c:otherwise>
						</c:choose>
						<!-- 팝업 : 알람신청 -->
						<div id="modal-alarm" class="modal">
							<h2>sign in</h2>
							<p class="title-desc">알람신청</p>
							<div class="item">
								<div class="thumb">
									<img src="${uploadPath}/<c:out value="${rslt.resultVO.imgSrc3 }"/>" alt="" />
								</div>
								<div class="rcont">
									<div class="desc"><c:out value="${rslt.resultVO.classTitle}"/></div>
									<div class="etc">
										<span>개강일</span>
										<span>
											<fmt:parseDate value="${rslt.resultVO.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
											<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
										</span>
									</div>
								</div>
							</div>
							<dl class="alarm-phone" id="alarm-phone">
								<dt>휴대폰</dt>
								<dd></dd>
							</dl>
							<div class="my-modify">
								<span>번호변경을 원하실 경우 마이페이지에 변경하실 수 있습니다.</span> <a href="#">내 정보수정</a>
							</div>
							<div class="btn-area">
								<button class="btn" type="button" onclick="javascript:fn_selectAlarmProc('<c:out value="${rslt.resultVO.classId}"/>');">
									<span>알람신청</span>
								</button>
							</div>
							<a href="#" rel="modal:close" class="modal-close" id="alarm_modal_close">닫기</a>
						</div>
					</div>
					<!-- //우측 퀵 영역 end -->
					
					<div class="offline-view">
						<!-- view banner -->
						<div class="view-banner">
							<!-- Swiper -->
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<c:choose>
										<c:when test="${fn:length(rslt.sideImgVO) != 0}">
											<c:forEach items="${rslt.sideImgVO}" var="list" varStatus="i">
												<div class="swiper-slide">
													<img src="${uploadPath}/<c:out value="${list.imgSrc }"/>" alt="1" />
												</div>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<div class="swiper-slide">데이터가 없습니다.</div>
										</c:otherwise>
									</c:choose>
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
						</div>
						<div class="cont-nav">
							<ul>
								<li><a href="#class_intro" class="active" onclick="fn_move('offline-view-cont');">클래스 소개</a></li>
								<li><a href="javascript:void(0);" onclick="fn_move('class_map');">오시는길</a></li>
								<li><a href="javascript:void(0);" onclick="fn_move('class_ask');">문의하기</a></li>
								<li><a href="javascript:void(0);" onclick="fn_move('review');">클래스 후기</a></li>
								<li><a href="javascript:void(0);">취소/환불 정책</a></li>
							</ul>
<%-- 							<input type="text" style="position:absolute;top:-9999em;" id="shareUrlAddress" value="${basePath}/offclass/a/t/selectOffClassDetail.do?classId=${rslt.resultVO.classId}"> --%>
						</div>
						<!--클래스 상세-->
						<div class="offline-view-cont" id="offline-view-cont">
							<div>
								<img src="${uploadPath}/<c:out value="${rslt.resultVO.imgSrc2 }"/>" />
							</div>
							<!--오시는 길-->
							<div class="class_map" id="class_map">
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
									<div class="info_map" id="class_ask">
										<img src="${imagePath}/sub/class_map.jpg" />
									</div>
								</div>
							</div>
							<!--// 오시는 길-->
							<div class="class_ask">
								<span class="class_ask_inner">
								<span><strong>멘토</strong><span><c:out value="${rslt.resultVO.usrNm }"/></span></span>
								<span> <strong>문의</strong> <span class="num"><c:out value="${rslt.resultVO.mblPno }"/></span></span>
<!-- 								<span class="kakao_wrap"> <span class="icon_kakao">플러스친구 :</span> <span>박승철헤어스투디오도곡동</span></span> -->
								</span>
							</div>
						</div>
						<!--// 클래스 상세 -->
						<!-- 리뷰 -->
						<div class="review" id="review"></div>
						<!-- //리뷰 -->
					</div>
					<br />
				</div>
			</div>
			<!-- //content -->
		</div>
		<form name="detailForm" id="detailForm" method="post" action="/offclass/r/t/selectOffClassApplyDetail.do">
			<input type="hidden" id="classId" name="classId">
		</form>
		<!-- //container -->
		<!-- footer -->
		<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
		<!-- //footer -->
	</div>
<script type="text/javascript">
$(function() {
	//리뷰리스트
	fn_searchReviewList(1);
	
	//따라다니는 메뉴
	var floatPosition = parseInt($("#quick-class").css('top'));
	var footerTop = $("#footer").offset().top;
	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
		$("#quick-class").css("position", "absolue");
		$("#quick-class").stop().animate({
			"top" : newPosition
		}, 500);
	}).scroll();
	
	//마이페이지 후기등록 후 이동될 탭
	var detailGoTab = '<c:out value="${classVO.detailGoTab }"/>';
	if(detailGoTab != null || detailGoTab != "" || detailGoTab != "undefined") {
		fn_move(detailGoTab);
	}
});

//리뷰 현재페이지 전역변수
var cuurPage = 1;

//param : 클릭페이지
function fn_searchReviewList(page){
	cuurPage= page;
	var params = {};
	params.pageIndex = cuurPage;
	fn_selectReviewList(params);
}

//리뷰 페이지 ajax
var fn_selectReviewList = function(params) {
	$.ajax({	
		url: "${basePath}/offclass/a/n/selectReviewList.do",
		data: params,
		type: 'POST',
		dataType: 'html',
		success: function(r) {
			$('#review').children().remove();
			$('#review').html(r);
		},
		error : function() {
		  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};

//탭메뉴 이동(클래스소개, 오시는길, 문의하기)
var fn_move = function(param) {
	var offset = $("#"+param).offset();
	$("html, body").animate({scrollTop : offset.top}, 400);
};

//공유하기
var fn_shareOffClass = function(classId) {
// 	$("#shareUrlAddress").val(window.document.location.href);
	// 최신 브라우저에서도 복사되도록 함
	var textArea = document.createElement("textarea");
	// 임시로 textarea 생성
	textArea.style.position = 'fixed';
	textArea.style.top = 0;
	textArea.style.left = 0;
	textArea.style.width = '2em';
	textArea.style.height = '2em';
	textArea.style.padding = 0;
	textArea.style.border = 'none';
	textArea.style.outline = 'none';
	textArea.style.boxShadow = 'none';
	textArea.style.background = 'transparent';
	textArea.value = window.document.location.href;
	document.body.appendChild(textArea);
	// text를 넣은 후 선택
	textArea.select();
	// 복사 시도
	try {
		var successful = document.execCommand('copy');
		if(successful) alert("주소가 복사되었습니다.");
	} catch (err) {
		console.log('Unable to copy');
	}
	// textarea 삭제
	document.body.removeChild(textArea);
};

//찜하기
var fn_selectJjimProc = function(classId) {
	var usrId = "${sessionScope.loginVO.usrId}";
	if(usrId == null || usrId == "") {
		alert("로그인 후 사용이 가능합니다.");
		fn_loginPopUpLayer();
		return;
	}
	var params = {};
	params.usrId = usrId;
	params.classId = classId;
	
	$.ajax({ 	
		url: "${basePath}/jjim/w/n/selectJjimProc.do",
		type: 'POST',
		dataType : "json",
		data : params,
		error: function(){
			 alert("현재 찜 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) { 
			if(r.resultYn == 'Y') { //찜함
				$(".btn-wish").css("background-color", "#6a2cfe");
				$(".btn-wish active").css("background-color", "#6a2cfe");
			} else{ //찜취소
				$(".btn-wish").css("background-color", "#000");
				$(".btn-wish active").css("background-color", "#000");
			}
		}
	}); 
};

//외부주소링크
var fn_outWebAdrOffClass = function(classWebAdr) {
	if(classWebAdr == null || classWebAdr == "") {
		alert("외부링크 주소가 잘못되었습니다.\n관리자에게 문의하세요.");
		return;
	}
	window.open(classWebAdr, "_blank");
	return;
};

//알람신청 팝업
var fn_selectAlarmPop = function() {
	var usrId = "${sessionScope.loginVO.usrId}";
	if(usrId == null || usrId == "") {
		alert("로그인 후 사용이 가능합니다.");
		fn_loginPopUpLayer();
		return;
	}
	$("#alarmBtn").attr("rel", "modal:open");
	
	$.ajax({ 	
		url: "${basePath}/alarm/r/n/selectUserPhon.do",
		type: 'POST',
		dataType : "json",
		data : { "usrId" : usrId},
		error: function(){
			 alert("현재 알람신청 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) { 
			if(r.mblPno != "N") {
				$("#alarm-phone").children("dd").remove();
				$("#alarm-phone").append("<dd>"+r.mblPno+"</dd>");
			} else {
				$("#alarm-phone").children("dd").remove();
				$("#alarm-phone").append("<dd>등록하신 연락처가 없습니다.</dd>");
			}
			
		}
	}); 
};

//알람신청을 하면 알람신청이 되었는지 확인하고 되었으면 리턴 안되었으면 인서트
var fn_selectAlarmProc = function(classId) {
	var usrId = "${sessionScope.loginVO.usrId}";
	var params = {};
	params.usrId = usrId;
	params.classId = classId;
	
	$.ajax({ 	
		url: "${basePath}/alarm/w/n/selectAlarmProc.do",
		type: 'POST',
		dataType : "json",
		data : params,
		error: function(){
			 alert("현재 알람신청 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) { 
			if(r.resultYn == 'Y') {
				alert("알람신청이 완료되었습니다.\n클래스가 새로 오픈되는대로 문자로 발송드리겠습니다.");
				$("#alarm_modal_close").get(0).click();
				return;
			} else{
				alert("이미 알람신청이 되어있습니다.\n클래스가 새로 오픈되는대로 문자로 발송드리겠습니다.");
				$("#alarm_modal_close").get(0).click();
				return;
			}
		}
	});
};

//끝판왕 클래스 신청 안녕~~
var fn_selectOffClassApply = function(classId) {
	var usrId = "${sessionScope.loginVO.usrId}";
	if(usrId == null || usrId == "") {
		alert("로그인 후 사용이 가능합니다.");
		fn_loginPopUpLayer();
		return;
	}
	var frm = document.detailForm;
	frm.classId.value=classId;
	frm.submit();
};
</script>
</body>
</html>

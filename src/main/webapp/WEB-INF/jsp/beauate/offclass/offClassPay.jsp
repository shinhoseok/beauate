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
					<h2 class="title"><img src="${imagePath}/txt/tit_class_pay.png" alt="클래스 결제하기"></h2>
				</div>
			</div>
			<div class="content-inner">
				<!-- 우측 퀵 영역 -->
				<div class="quick-payinfo">
					<div class="quick-payinfo-inner">
						<h3>결제정보</h3>
						<div class="class-info-item">
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
						<ul class="pay-priceinfo" id="pay-priceinfo">
							<li>
								<span class="txt">상품금액</span>
								<span class="price"><fmt:formatNumber value="${rslt.resultVO.classCost }" pattern="#,###" />원</span>
							</li>
							<c:choose>
								<c:when test="${not empty rslt.couponList[0].couponId }">
									<li>
										<span class="txt">쿠폰사용</span>
										<c:set var="couponMoney" value="${rslt.resultVO.classCost * rslt.couponList[0].couponRate / 100}"/>
										<span class="price"><fmt:formatNumber value="${couponMoney}" pattern="#,###" /></span>
									</li>
									<li class="total-sum">
										<span class="txt">총 결제금액</span>
										<c:set var="totalMoney" value="${rslt.resultVO.classCost - couponMoney}"/>
										<span class="price"><fmt:formatNumber value="${totalMoney}" pattern="#,###" /><span class="unit">원</span></span>
									</li>
								</c:when>
								<c:otherwise>
									<li class="total-sum">
										<span class="txt">총 결제금액</span>
										<span class="price"><fmt:formatNumber value="${rslt.resultVO.classCost }" pattern="#,###" />원</span></span>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
						<ul class="check-area">
							<li><label><input id="necessayPayCheck1" type="checkbox" data-child-check="all" /><em>필수</em>개인정보 제 3자 제공 동의</label></li>
							<li><label><input id="necessayPayCheck2" type="checkbox" data-child-check="all" /><em>필수</em>취소/환불약관 동의</label></li>
						</ul>
					</div>
					<div class="btn-area">
						<button type="button" class="btn_pay" onclick="javascript:fn_payment()">결제하기</button>
					</div>
				</div>
				<!-- //우측 퀵 영역 -->
				<!-- 클래스 결제하기 -->
				<div class="classpay">
					<h3>멘티 정보</h3>
					<div class="mento-info">
						<dl>
							<dt>이름</dt>
							<dd><c:out value="${sessionScope.loginVO.usrNm}"/></dd>
						</dl>
						<dl>
							<dt>휴대전화</dt>
							<dd><c:out value="${menTiMblPno}"/></dd>
						</dl>
						<div class="etc">
							<span>내 정보 수정을 원하실 경우 마이페이지에 변경하실 수 있습니다.</span>
							<a href="#">내 정보수정</a>
						</div>
					</div>
					<h3>클래스 정보</h3>
					<div class="class-info">
						<div class="class-info-item">
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
						<ul class="class-info-desc">
							<li>
								<span class="tit">일시</span>
								<fmt:parseDate value="${rslt.resultVO.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
								<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
							</li>
							<li>
								<span class="tit">시간</span><c:out value="${rslt.resultVO.classTime}"/>
							</li>
							<li>
								<span class="tit">인원</span>최소 <c:out value="${rslt.resultVO.classSmallNo}"/>명  / 최대  <c:out value="${rslt.resultVO.classBigNo}"/>명 / 현재  <c:out value="${rslt.resultVO.classApplyNo}"/>명
							</li>
							<li>
								<span class="tit">장소</span><c:out value="${rslt.resultVO.classAdr}"/>
							</li>
							<li>
								<span class="tit">문의</span><c:out value="${rslt.userVO.mblPno}"/>
							</li>
						</ul>
					</div>
					<c:if test="${not empty rslt.couponList[0].couponId }">
						<h3>할인적용</h3>
						<div class="discount-apply">
							<dl>
								<dt>할인쿠폰</dt>
								<dd>
									<select id="couponSelectBox" onchange="javascript:fn_couponSelect();">
										<c:forEach items="${rslt.couponList}" var="list" varStatus="i">
											<c:if test="${i.first}">
												<option selected="selected" value="${list.couponId}">${list.couponNm}</option>
											</c:if>
											<c:if test="${!i.first}">
												<option value="${list.couponId}">${list.couponNm}</option>
											</c:if>
										</c:forEach>
										<option value="">선택안함</option>
									</select>
								</dd>
							</dl>
						</div>
					</c:if>
				</div>
				<!-- //클래스 결제하기 -->
			</div>
		</div>
		<!-- //content -->
	</div>
	<form name="payVO" id="payVO" method="post" action="/offclass/w/t/insertPayProc.do">
		<input type="hidden" id="classId" name="classId" value="${rslt.resultVO.classId}">
		<input type="hidden" name="couponId" id="couponId">
		<input type="hidden" name="couponMoney" id="couponMoney">
		<input type="hidden" name="payMethodSt" id="payMethodSt">
		<input type="hidden" name="payCostNo" id="payCostNo">
		<input type="hidden" name="classApplyNo" id="classApplyNo">
		<input type="hidden" name="classBigNo" id="classBigNo">
		<input type="hidden" name="mentoMblPno" value="${rslt.userVO.mblPno}">
	</form>
	<!-- //container -->
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
	<!-- //footer -->
<script type="text/javascript">
//쿠폰 셀렉트박스 선택시
var fn_couponSelect = function() {
	var params = {}; 
	params.couponId = $("#couponSelectBox option:selected").val();
	params.classCost = "${rslt.resultVO.classCost }";
	
	$.ajax({	
		url: "${basePath}/offclass/r/n/selectClassCoupon.do",
		data: params,
		type: 'POST',
		dataType: 'html',
		cache: false,
		success: function(r) {
			$('#pay-priceinfo').children().remove();
			$('#pay-priceinfo').html(r);
		},
		error : function() {
		  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};

//결제하전 밸리데이션
var fn_payment = function() {
	var couponId = $("#couponSelectBox option:selected").val();
	var classId = $("#payVO #classId").val();
	
	//상품, 결제금액, 할인금액, 클래스아이디
	if(!$("#necessayPayCheck1").is(":checked")) {
		alert("개인정보 제3자 제공 동의는 필수로 체크하셔야 합니다.");
		$("#necessayCheck1").focus();
		return;
	}
	if(!$("#necessayPayCheck2").is(":checked")) {
		alert("취소/환불약관 동의는 필수로 체크하셔야 합니다.");
		$("#necessayCheck2").focus();
		return;
	}
	
	//클래스인원이 찼는지 체크
	$.ajax({ 	
		url: "${basePath}/offclass/r/n/selectClassMemChk.do",
		type: 'POST',
		dataType : "json",
		data : {"classId" : classId},
		error: function(){
			 alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) {
			if(!r.rslt.resultYn) {
				alert("클래스가 종료되었습니다.\n다른 클래스를 이용해 주십시요.");
				location.href = "${basePath}/offclass/a/t/selectOffClassList.do";
			} else {//param : 신청인원, 최대인원
				offClassPaymenting(r.rslt.resultVO.classApplyNo, r.rslt.resultVO.classBigNo); 
			}
		}
	});
	
	
};

//결제진행
var offClassPaymenting = function(classApplyNo, classBigNo) {
	var frm = document.payVO;
	frm.classApplyNo.value = classApplyNo;
	frm.classBigNo.value = classBigNo;
	var couponId = $("#couponSelectBox option:selected").val();
	if(couponId == null || couponId == "" || couponId == undefined) {
		frm.payCostNo.value = "${rslt.resultVO.classCost }"; //쿠폰없는 토탈금액
	} else {
		frm.couponId.value = couponId
		frm.couponMoney.value = "${couponMoney}"; //쿠폰금액
		frm.payCostNo.value = "${totalMoney}"; //토탈금액
	}
	frm.submit();
};
</script>
</div>
</body>
</html>

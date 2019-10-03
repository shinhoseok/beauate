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
								<img src="${img}" alt="" />
							</div>
							<div class="rcont">
								<div class="desc">${cls.classTitle}</div>
								<div class="etc">
									<span>개강일</span>
									<fmt:parseDate var="parsedClsSDt" value="${cls.classStartDt}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
									<fmt:formatDate var="etcDtStr" value="${parsedClsSDt}" pattern="yyyy-MM-dd(E)" />
									<span>${etcDtStr}</span>
								</div>
							</div>
						</div>
						<ul class="pay-priceinfo">
							<li>
								<span class="txt">상품금액</span>
								<span class="price"><fmt:formatNumber value="${cls.classCost}" pattern="#,###" />원</span>
							</li>
							<c:choose>
							<c:when test="${discountPercent != null and discountPercent != 0}">
								<li>
									<span class="txt">쿠폰사용</span>
									<span class="price">-<fmt:formatNumber value="${(cls.classCost*discountPercent/100)}" pattern="#,###" />원</span>
								</li>
								<li class="total-sum">
									<span class="txt">총 결제금액</span>
									<span class="price"><fmt:formatNumber value="${cls.classCost-(cls.classCost*discountPercent/100)}" pattern="#,###" /><span class="unit">원</span></span>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<span class="txt">쿠폰사용</span>
									<span class="price">-<fmt:formatNumber value="${discountAmount}" pattern="#,###" />원</span>
								</li>
								<li class="total-sum">
									<span class="txt">총 결제금액</span>
									<span class="price"><fmt:formatNumber value="${cls.classCost-discountAmount}" pattern="#,###" /><span class="unit">원</span></span>
								</li>
							</c:otherwise>
							</c:choose>
						</ul>
						<ul class="check-area">
							<li><label><input id="term1"  type="checkbox" data-child-check="all" /><em>필수</em>개인정보 제 3자 제공 동의</label></li>
							<li><label><input id="term2" type="checkbox" data-child-check="all" /><em>필수</em>취소/환불약관 동의</label></li>
						</ul>
					</div>
					<div class="btn-area">
						<button type="button" class="btn_pay" onclick="javascript:fn_topay('${cls.classId}');">결제하기</button>
					</div>
				</div>
				<!-- //우측 퀵 영역 -->
				<!-- 클래스 결제하기 -->
				<div class="classpay">
					<h3>멘티 정보</h3>
					<div class="mento-info">
						<dl>
							<dt>이름</dt>
							<dd>${sessionScope.loginVO.usrNm}</dd>
						</dl>
						<dl>
							<dt>휴대전화</dt>
							<c:set value="${sessionScope.loginVO.mblPno}" var="uPhone"/>
								<c:if test="${fn:length(uPhone)==11 and uPhone.indexOf('-')==-1}">
								<c:set var="uPhone" value="${fn:substring(uPhone, 0, 3)} - ${fn:substring(uPhone, 3, 7)} - ${fn:substring(uPhone, 7, 11)}"/>
							</c:if>
							<dd>${uPhone}</dd>
						</dl>
						<div class="etc">
							<span>내 정보 수정을 원하실 경우 마이페이지에 변경하실 수 있습니다.</span>
							<a href="${basePath}/user/w/t/userInfo.do">내 정보수정</a>
						</div>
					</div>
					<h3>클래스 정보</h3>
					<div class="class-info">
						<div class="class-info-item">
						    <c:if test="${fn:length(cls.classFileList)>0}">
								<c:forEach var="clsImg" items="${cls.classFileList}" begin="0" end="${fn:length(cls.classFileList)-1}">
									<c:if test="${clsImg.fileCn=='M1'}">
									<c:set var="path" value="${fn:split(clsImg.fileStreCours, '/')}" />
									<c:set var="path" value="${path[fn:length(path)-1]}" />
									<c:set var="path" value="${fn:replace(path,'\\\\','/')}" />
									<c:set var="img" value="${uploadPath}${path}/${clsImg.streFileNm}"/>
									</c:if>
								</c:forEach>
								<div class="thumb">
									<img src="${img}" alt="" />
								</div>
							</c:if>
							<div class="rcont">
								<div class="desc">${cls.classTitle}</div>
								<div class="etc">
									<span>개강일</span>
									<span>${etcDtStr}</span>
								</div>
							</div>
						</div>
						<ul class="class-info-desc">
							<li>
								<span class="tit">일시</span>${etcDtStr}
							</li>
							<li>
								<span class="tit">시간</span>${cls.classTime}
							</li>
							<li>
								<span class="tit">인원</span>최소 ${cls.classApplyNo}명  / 최대  ${cls.classBigNo}명
							</li>
							<li>
								<span class="tit">장소</span> ${cls.classAdr}
							</li>
							<li>
								<span class="tit">문의</span>010-1234-4567
							</li>
						</ul>
					</div>
					<h3>할인적용</h3>
					<div class="discount-apply">
						<dl>
							<dt>할인쿠폰</dt>
							<dd>
								<select style="">
									<option selected>사용가능한 쿠폰 1장</option>
									<option>선택안함</option>
									<!-- <option>첫구매 10% 할인쿠폰 / 최대 1만원 할인</option> -->
								</select>
							</dd>
						</dl>
					</div>
				</div>
				<!-- //클래스 결제하기 -->
			</div>
		</div> <!-- content-inner -->
		<!-- //content -->
		<form:form commandName="payVO" name="payVO" id="payVO" method="post" action="${basePath}/class/r/t/classRegistProc.do" onsubmit="return false;">
			<form:hidden path="cSq" id="cSq" value="${cls.classId}"/>
			<form:hidden path="uSq" id="uSq" value="${sessionScope.loginVO.usrId}"/>
			<c:choose>
			<c:when test="${discountPercent != null and discountPercent != 0}">
				<form:hidden path="payCostNo" id="payCostNo" value="${cls.classCost-(cls.classCost*discountPercent/100)}"/>
			</c:when>
			<c:otherwise>
				<form:hidden path="payCostNo" id="payCostNo" value="${cls.classCost}"/>
			</c:otherwise>
			</c:choose>
			<form:hidden path="payMethodSt" id="payMethodSt" value="1"/>
			<form:hidden path="paySt" id="paySt" value="1"/>
		</form:form>

	</div>
	<!-- //container -->
	<script>
	function fn_topay(cSq){
		<c:choose>
		<c:when test="${sessionScope.loginVO == null || sessionScope.loginVO.emailAddr == null}">
			alert("로그인이 필요한 서비스입니다.");
		</c:when>
		<c:otherwise>
		var isValid = true;
		if($("#term1").is(":checked")==false){
			isValid = false;
		}
		if($("#term2").is(":checked")==false){
			isValid = false;
		}
		if(!isValid){
			alert("필수 약관에 동의해 주세요.");
			return false;
		}
		$.ajax({ 	
			url: "${basePath}/class/w/n/classRegistProc.do",    
			type: 'POST',
			dataType : "json",
			data : $("#payVO").serialize(),
			error: function(r){
				$("#modal-joincomfirm p.txt").text(r.message);
				$("#modal-joincomfirm a.modal-close").click(function(){document.location.href='#'});
				$("#modal-joincomfirm").modal('show');
			},
			success: function(r) {
				$("#modal-joincomfirm p.txt").text(r.message);
				$("#modal-joincomfirm a.modal-close").click(function(){document.location.href='${basePath}'+r.redirectUrl});
				$("#modal-joincomfirm").modal('show'); 
			}
		}); 
		</c:otherwise>
		</c:choose>
	}
	</script>
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
	<!-- //footer -->
</div>
</body>
</html>

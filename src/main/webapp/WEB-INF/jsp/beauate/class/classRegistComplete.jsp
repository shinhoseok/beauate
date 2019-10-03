<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" scope="request"/>
<fmt:parseNumber
    value="${ now.time }"
    integerOnly="true" var="nowDays" scope="request"/>
<fmt:parseDate var="parsedClsSDt" value="${pay.cls.classStartDt}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
<fmt:formatDate var="etcDtStr" value="${parsedClsSDt}" pattern="yyyy-MM-dd(E)" />
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
		<div class="content payEnd_inner">
			<!-- 결제완료 -->
			<div class="payEnd_info_say">
				<p>결제가 완료되었습니다.</p>
				<img src="${imgPath}/img-txt-thanks.png"/>
				<div><a href="${basePath}/home/a/n/main.do">메인으로</a></div>
			</div>
			<!-- //결제완료 -->

			<!-- 결제정보 (멘티정보/결제정보)-->
			<div class="payEnd_info_2">
				<div class="payEnd_info_mentee">
						<div class="payEnd_info_tit">멘티 정보</div>
						<div class="payEnd_left">
							<ul>
								<li>이름</li>
								<li>휴대전화</li>
							</ul>
						</div>
						<div class="payEnd_right">
							<ul>
								<li>뷰아떼</li>
								<li class="payEnd_num">
									<c:set value="${pay.user.mblPno}" var="uPhone"/>
									<c:choose>
									<c:when test="${fn:length(uPhone)==11 and uPhone.indexOf('-')==-1}">
									${fn:substring(uPhone, 0, 3)}
									<span class="myinfo_dash">
									-
									</span>
									${fn:substring(uPhone, 3, 7)}
									<span class="myinfo_dash">
									-
									</span>
									${fn:substring(uPhone, 7, 11)}
									</c:when>
									<c:otherwise>
									${uPhone}
									</c:otherwise>
									</c:choose>
							</ul>
						</div>
				</div>
				<div class="payEnd_info_money">
						<div class="payEnd_info_tit">결제 정보</div>
						<div class="payEnd_left">
								<ul>
									<li>상품금액</li>
									<li>할인금액</li>
								</ul>
							</div>
							<div class="payEnd_right">
								<ul>
									<li class="payEnd_num">
									<fmt:formatNumber value="${pay.cls.classCost}" pattern="#,###" />
									<span>원</span></li>
									<c:choose>
									<c:when test="${discountPercent != null and discountPercent != 0}">
									<li class="payEnd_num">
									-<fmt:formatNumber value="${(pay.cls.classCost*discountPercent/100)}" pattern="#,###" />원</span>
									<span>원</span></li>
									</c:when>
									<c:otherwise>
									</c:otherwise>
									</c:choose>
								</ul>
							</div>
				</div>
			</div>
			<!-- 결제정보 (멘티정보/결제정보)-->

			<!-- 결제정보 (클래스정보)-->
			<div class="payEnd_info_class">
				<div class="payEnd_info_tit payEnd_margin">클래스 정보</div>
				<div class="payEnd_list">
					<ul>
						<li>
						<c:set var="img" value=""/>
					    <c:if test="${fn:length(pay.cls.classFileList)>0}">
							<c:forEach var="clsImg" items="${pay.cls.classFileList}" begin="0" end="${fn:length(pay.cls.classFileList)-1}">
								<c:if test="${clsImg.fileCn=='M1'}">
								<c:set var="path" value="${fn:split(clsImg.fileStreCours, '/')}" />
								<c:set var="path" value="${path[fn:length(path)-1]}" />
								<c:set var="path" value="${fn:replace(path,'\\\\','/')}" />
								<c:set var="img" value="${uploadPath}${path}/${clsImg.streFileNm}"/>
								</c:if>
							</c:forEach>
						</c:if>
						<img src="${img}"/>
						</li>
						
							<li>${pay.cls.classTitle}</li>
							<li>${pay.cls.classAreaStNm}<span>|</span>${etcDtStr}</li>
						
					</ul>
				</div>
				<div class="payEnd_money">
					<ul>
						<li>총 결제금액</li>
						<li><fmt:formatNumber value="${pay.payCostNo}" pattern="#,###" /><span>원</span></li>
					</ul>
				</div>
				<div class="payEnd_info_detail">
					<div class="payEnd_left">
						<ul>
							<li>일시</li>
							<li>시간</li>
							<li>인원</li>
							<li>장소</li>
							<li>문의</li>
						</ul>
					</div>
					<div class="payEnd_right">
						<ul>
							<li>${etcDtStr}</li>
							<li>${pay.cls.classTime}</li>
							<li>최소 ${pay.cls.classSmallNo}명  / 최대  ${pay.cls.classBigNo}명</li>
							<li>${pay.cls.classAdr}</li>
							<li class="payEnd_num">
								<c:set value="${pay.cls.mentor.mblPno}" var="mPhone"/>
								<c:choose>
								<c:when test="${fn:length(mPhone)==11 and mPhone.indexOf('-')==-1}">
									${fn:substring(mPhone, 0, 3)}
									<span class="myinfo_dash">-</span>
									${fn:substring(mPhone, 3, 7)}
									<span class="myinfo_dash">-</span>
									${fn:substring(mPhone, 7, 11)}
								</c:when>
								<c:otherwise>
									${mPhone}
								</c:otherwise>
								</c:choose>
							</li>
						</ul>
						
					</div>

				</div>

			</div>
			<!-- //결제정보 (클래스정보)-->
		
	</div>
	<!-- //container -->
	<script>
	</script>
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
	<!-- //footer -->
</div>
</body>
</html>

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
							<li>${sessionVO.usrNm }</li>
<!-- 							<li class="payEnd_num">010<span class="myinfo_dash">-</span>1234<span class="myinfo_dash">-</span>5678 -->
							<li>${userMblPno }</li>
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
					<c:choose>
						<c:when test="${not empty payVO.couponId }">
							<div class="payEnd_right">
								<ul>
									<c:set var="sumMoney" value="${payVO.payCostNo*1 + payVO.couponMoney*1}"/>
									<li class="payEnd_num"><fmt:formatNumber value="${sumMoney}" pattern="#,###" /><span>원</span></li>
									<li class="payEnd_num"">-<fmt:formatNumber value="${payVO.couponMoney*1 }" pattern="#,###" /><span>원</span></li>
								</ul>
							</div>
						</c:when>
						<c:otherwise>
							<div class="payEnd_right">
								<ul>
									<li class="payEnd_num"><fmt:formatNumber value="${payVO.payCostNo*1}" pattern="#,###" /><span>원</span></li>
								</ul>
							</div>
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>
			<!-- 결제정보 (멘티정보/결제정보)-->

			<!-- 결제정보 (클래스정보)-->
			<div class="payEnd_info_class">
				<div class="payEnd_info_tit payEnd_margin">클래스 정보</div>
				<div class="payEnd_list">
					<ul>
						<li>
							<img src="${uploadPath}/<c:out value="${resultVO.imgSrc3 }"/>"/>
						</li>
						<li><c:out value="${resultVO.classTitle}"/></li>
						<li>${resultVO.classAreaStNm}<span>|</span>${resultVO.classStartDt}</li>
					</ul>
				</div>
				<div class="payEnd_money">
					<ul>
						<li>총 결제금액</li>
						<li><fmt:formatNumber value="${payVO.payCostNo}" pattern="#,###" /><span>원</span></li>
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
							<li>
								<fmt:parseDate value="${resultVO.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
								<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
							</li>
							<li><c:out value="${resultVO.classTime}"/></li>
							<li>최소 <c:out value="${resultVO.classSmallNo}"/>명  / 최대 <c:out value="${resultVO.classBigNo}"/>명 / 현재  <c:out value="${resultVO.classApplyNo}"/>명</li>
							<li><c:out value="${resultVO.classAdr}"/></li>
							<li class="payEnd_num">${mentoMblPno }</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //결제정보 (클래스정보)-->
		</div>
		<!-- //content -->
	</div>
	<!-- //container -->
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
	<!-- //footer -->
	<script type="text/javascript">
	</script>
</div>
</body>
</html>

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
								<img src="${uploadPath}/<c:out value="${list.imgSrc3 }"/>" alt="" />
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
						<ul class="pay-priceinfo">
							<li>
								<span class="txt">상품금액</span>
								<span class="price"><fmt:formatNumber value="${rslt.resultVO.classCost }" pattern="#,###" />원</span>
							</li>
							<li>
								<span class="txt">쿠폰사용</span>
								<span class="price">-4,000원???</span>
							</li>
							<li class="total-sum">
								<span class="txt">총 결제금액</span>
								<span class="price">132,000????<span class="unit">원</span></span>
							</li>
						</ul>
						<ul class="check-area">
							<li><label><input type="checkbox" data-child-check="all" /><em>필수</em>개인정보 제 3자 제공 동의</label></li>
							<li><label><input type="checkbox" data-child-check="all" /><em>필수</em>취소/환불약관 동의</label></li>
						</ul>
					</div>
					<div class="btn-area">
						<button type="button" class="btn_pay">결제하기</button>
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
								<img src="${uploadPath}/<c:out value="${list.imgSrc3 }"/>" alt="" />
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
								<span class="tit">인원</span>최소 <c:out value="${rslt.resultVO.classSmallNo}"/>명  / 최대  <c:out value="${rslt.resultVO.classBigNo}"/>명
							</li>
							<li>
								<span class="tit">장소</span><c:out value="${rslt.resultVO.classAdr}"/>
							</li>
							<li>
								<span class="tit">문의</span><c:out value="${rslt.userVO.mblPno}"/>
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
									<option>첫구매 10% 할인쿠폰 / 최대 1만원 할인</option>
								</select>
							</dd>
						</dl>
					</div>
				</div>
				<!-- //클래스 결제하기 -->
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

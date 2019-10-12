<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!-- 신청한 클래스-->
<div class="cpn">
	<div class="myclass-left">
		<ul>
			<li><a href="#" class="active">신청한 클래스</a></li>
			<li><a href="#">찜한 클래스</a></li>
		</ul>
	</div>
	<div class="myclass-right">
		<h3 class="h3-head1">
			<div class="my-btn1">
				<a href="javascript:void(0);" onclick="javascript:fn_mypageAllCheck();"><span>전체선택</span></a>
			</div>
			<div class="my-btn2">
				<a href="javascript:void(0);" onclick="javascript:fn_mypageChkDel();"><span>삭제</span></a>
			</div>
		</h3>
		<ul>
			<c:choose>
				<c:when test="${rslt.selectListCnt != 0}">
					<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
						<li>
							<ul class="my-c" payId="${list.payId}">
								<!--체크박스-->
								<a href="javascript:void(0);" class="myChkBox"><li class="my-c1"></li></a>
								<!--가운데 회색영역-->
								<li class="my-c2">
									<div class="c2-img">
										<!-- 오늘날짜 todayNum -->
										<fmt:parseDate value="${rslt.today}" var="todayParseDate" pattern="yyyy-MM-dd"/> 
										<fmt:parseNumber value="${todayParseDate.time / (1000*60*60*24)}" integerOnly="true" var="todayNum"/>
										<!-- 개강일 classStartDtNum -->
										<fmt:parseDate value="${list.classStartDt}" var="classStartDtParseDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${classStartDtParseDate.time / (1000*60*60*24)}" integerOnly="true" var="classStartDtNum"/>
										<img src="${uploadPath}/<c:out value="${list.imgSrc2 }"/>"/>
										<c:choose>
											<c:when test="${list.paySt eq 1}">
												<c:if test="${list.classSt eq 3}">
													<div class="img-list-black2"></div>
													<p class="c2-img-txt22">신청마감</p>
												</c:if>
												<c:if test="${list.classSt eq 4 and classStartDtNum <= todayNum }">
													<div class="img-list-black2"></div>
													<p class="c2-img-txt33">종료</p>
												</c:if>
												<div class="c2-img-txt">결제완료</div>
											</c:when>
											<c:when test="${list.paySt eq 2}">
												<c:if test="${list.classSt eq 3}">
													<div class="img-list-black2"></div>
													<p class="c2-img-txt22">신청마감</p>
												</c:if>
												<c:if test="${list.classSt eq 4 and classStartDtNum <= todayNum }">
													<div class="img-list-black2"></div>
													<p class="c2-img-txt33">종료</p>
												</c:if>
												<div class="c2-img-txt2">취소완료</div>
											</c:when>
											<c:when test="${list.paySt eq 3}">
												<c:if test="${list.classSt eq 3}">
													<div class="img-list-black2"></div>
													<p class="c2-img-txt22">신청마감</p>
												</c:if>
												<c:if test="${list.classSt eq 4 and classStartDtNum <= todayNum }">
													<div class="img-list-black2"></div>
													<p class="c2-img-txt33">종료</p>
												</c:if>
												<div class="c2-img-txt3">환불신청중</div>
											</c:when>
											<c:otherwise>
												<c:if test="${list.classSt eq 3}">
													<div class="img-list-black2"></div>
													<p class="c2-img-txt22">신청마감</p>
												</c:if>
												<c:if test="${list.classSt eq 4 and classStartDtNum <= todayNum }">
													<div class="img-list-black2"></div>
													<p class="c2-img-txt33">종료</p>
												</c:if>
												<div class="c2-img-txt2">환불완료</div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="c2-center-txt">
										<p class="center-txt1"><c:out value="${list.areaNm }"/> | 
											<fmt:parseDate value="${list.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/>
											<fmt:formatDate value="${classStartDt}" pattern="yy.MM.dd"/>
										</p>
										<p class="center-txt2"><c:out value="${list.classTitle }"/></p>
										<p class="center-txt3"><c:out value="${list.classAdr }"/></p>
										<p class="center-txt4">
											<a href="javascipt:void(0);" onclick="javascript:fn_applyClassMapView();">지도보기<img src="${imgPath}/semo.png" class="semo"></a>
										</p>
									</div>
								</li>
								<!--오른쪽 회색 테두리 영역-->
								<li class="my-c3">
									<!--20% 동그라미-->
									<c:if test="${not empty list.couponId}">
										<div class="c2-one">
											<sapn class="one-per"><c:out value="${list.cpnRate }"/>%</sapn>
										</div>
									</c:if>
									<div class="c3-txt-all">
										<p class="c3-txt1">총 결제 금액</p>
										<p class="c3-txt2"><fmt:formatNumber value="${list.payCostNo }" pattern="#,###" />원</p>
										<c:set var="couponMoney" value="${(list.classCostNo*1) - (list.payCostNo*1)}"/>
										<c:choose>
											<c:when test="${not empty list.couponId }">
												<p class="c3-txt3"><fmt:formatNumber value="${couponMoney }" pattern="#,###" /></p>
											</c:when>
											<c:otherwise>
												<p class="c3-txt3"></p>
											</c:otherwise>
										</c:choose>
										<c:if test="${classStartDtNum < todayNum and list.classSt eq 1 or list.classSt eq 2}">
											<div class="c3-btn">
												<c:choose>
													<c:when test="${list.paySt eq 1}">
														<a href="javascript:void(0);" onclick="fn_payCancel('${list.payId }', '${list.classId }');"><span>참여취소</span></a>
													</c:when>
													<c:otherwise>
														<a href="javascript:void(0);" onclick="alert('이미 취소처리가 완료되었습니다.')"><span>취소완료</span></a>
													</c:otherwise>
												</c:choose>
												
											</div>
										</c:if>
									</div>
								</li>
							</ul>
						</li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<li>데이터가 없습니다.</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>
<!--//신청한 클래스-->
<!--페이징-->
<div class="paging">
	<ui:pagination paginationInfo="${rslt.paginationInfo}" type="image" jsFunction="fn_searchList" />
</div>
<form name="myAppClassDelForm" id="myAppClassDelForm" method="post" action="" >
	<input type="hidden" id="payId" name="payId">
	<input type="hidden" id="classId" name="classId">
</form>

<script>
//지도보기
var fn_applyClassMapView = function() {
	alert("준비중 입니다.");
};

//전체체크
var fn_mypageAllCheck = function() {
	var gb = $(".myChkBox").children("li").attr("class");
	if(gb == "my-c1") {
		$(".myChkBox").children("li").removeClass("my-c1");
		$(".myChkBox").children("li").addClass("my-c11").append('<img class="imgChkBox" src="${imgPath}/check.png">');
	} else {
		$(".myChkBox").children("li").children().remove();
		$(".myChkBox").children("li").removeClass("my-c11");
		$(".myChkBox").children("li").addClass("my-c1");
	}
};

//하나씩 체크
$(".myChkBox").click(function() {
	var gb = $(this).children("li").attr("class");
	if(gb == "my-c1") {
		$(this).children("li").removeClass("my-c1");
		$(this).children("li").addClass("my-c11").append('<img class="imgChkBox" src="${imgPath}/check.png">');
	} else {
		$(this).children("li").children().remove();
		$(this).children("li").removeClass("my-c11");
		$(this).children("li").addClass("my-c1");
	}
});

//체크박스 선택삭제
var fn_mypageChkDel = function() {
	if($(".imgChkBox").length > 0) {
		var result = confirm("선택하신 결제내역을 삭제하시겠습니까?");
		if(result) {
			var payId = "";
			var comFlag = "";
			$(".imgChkBox").each(function(i) {
				if(i > 0) {
					comFlag = ",";
				}
				var attrId = ($(this).parent().parent().parent().attr("payId"));
				payId = payId + comFlag + String(attrId);
			});
			$('#myAppClassDelForm').attr("action","${basePath}/mypage/w/n/deletePayProc.do");
			$("#myAppClassDelForm #payId").val(payId);
			$("#myAppClassDelForm").submit();
		}
	} else {
		alert("삭제하실 결제내역을 선택해주세요.");
	}
};

//참여취소
var fn_payCancel = function(payId, classId) {
	var result = confirm("신청하신 클래스를 취소하시겠습니까?");
	if(result) {
		//결제상태 취소2로, 취소환불테이블 인서트, 클래스인원 1증가
		$('#myAppClassDelForm').attr("action","${basePath}/mypage/w/n/updatePayRefundProc.do");
		$("#myAppClassDelForm #payId").val(payId);
		$("#myAppClassDelForm #classId").val(classId);
		$("#myAppClassDelForm").submit();
	}
};
</script>
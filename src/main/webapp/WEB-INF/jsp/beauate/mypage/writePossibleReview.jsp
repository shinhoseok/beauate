<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<style>
.starR{
	background: url('${imgPath}/ico_review.png') no-repeat right 0;
	background-size: auto 100%;
	width: 18px;
	height: 18px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
}
.starR.on{background-position:0 0;}
</style>
<h3 class="h3-head2-1"></h3>
<ul>
	<c:choose>
		<c:when test="${rslt.selectListCnt != 0}">
			<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
				<li>
					<ul class="my-r-c">
						<!--가운데 회색영역-->
						<li class="my-r-c2">
							<!-- 오늘날짜 todayNum -->
							<fmt:parseDate value="${rslt.today}" var="todayParseDate" pattern="yyyy-MM-dd"/> 
							<fmt:parseNumber value="${todayParseDate.time / (1000*60*60*24)}" integerOnly="true" var="todayNum"/>
							<!-- 개강일 classStartDtNum -->
							<fmt:parseDate value="${list.classStartDt}" var="classStartDtParseDate" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber value="${classStartDtParseDate.time / (1000*60*60*24)}" integerOnly="true" var="classStartDtNum"/>
							<div class="c2-img">
								<img src="${uploadPath}/<c:out value="${list.imgSrc2 }"/>"/>
								<div class="c2-img-txt2">수강완료</div>
							</div>
							<div class="c2-center-txt">
								<p class="center-txt1"><c:out value="${list.classTitle }"/> | 7월 23일 (화)</p>
								<p class="center-txt2"><c:out value="${list.areaNm }"/></p>
								<p class="center-txt3"><c:out value="${list.classAdr }"/></p>
								<p class="center-txt4">
									<a href="javascipt:void(0);" onclick="javascript:fn_reviewMapView();">지도보기<img src="${imgPath}/semo.png" class="semo"></a>
								</p>
							</div>
						</li>
						<!--오른쪽 회색 테두리 영역-->
						<li class="my-r-c3">
							<!--20% 동그라미-->
							<c:if test="${not empty list.couponId}">
								<div class="c2-one2">
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
								<div class="c3-btn-review">
									<a href="javascript:void(0);" onclick="javascript:fn_insertReview('<c:out value="${list.classId }"/>')"><span>후기작성</span></a>
								</div>
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
<!--페이징-->
<div class="paging">
	<ui:pagination paginationInfo="${rslt.paginationInfo}" type="image" jsFunction="fn_hoogiSearchList" />
</div>

<div class="content" style="display: none;">
	<!-- 리뷰작성 팝업 -->
	<div id="review-modal" class="modal" style="width: 30%;">
		<div class="mypageR_inner">
		<div>
			<div class="close">
				<a href="javascript:void(0);" rel="modal:close" class="modal-close"><img src="${imgPath}/btn_close.png" /></a>
			</div>
			<p>클래스 후기작성</p>
			<div class="mypageR_list">
				<ul>
					<li><img src="${imgPath}/my-r-img.jpg" /></li>
					<li>Self-하루만에 배우는 감쪽같은 속눈썹</li>
					<li>강남<span>|</span>7월 23일(화)
					</li>
				</ul>
			</div>
			<!--별점-->
			<div class="mypageR_star">
				<ul>
					<li>커리큘럼</li>
					<li>친절도</li>
					<li>시간준수</li>
					<li>전달력</li>
				</ul>
				
				<ul class="star2">
					<li style="cursor: pointer;" class="starRev" id="curriculum">
						<span class="starR on">별1</span>
						<span class="starR on">별2</span>
						<span class="starR on">별3</span>
						<span class="starR on">별4</span>
						<span class="starR on">별5</span>
					</li>
					<li style="cursor: pointer;" class="starRev" id="kindness">
						<span class="starR on">별1</span>
						<span class="starR on">별2</span>
						<span class="starR on">별3</span>
						<span class="starR on">별4</span>
						<span class="starR on">별5</span>
					</li>
					<li style="cursor: pointer;" class="starRev" id="timePro">
						<span class="starR on">별1</span>
						<span class="starR on">별2</span>
						<span class="starR on">별3</span>
						<span class="starR on">별4</span>
						<span class="starR on">별5</span>
					</li>
					<li style="cursor: pointer;" class="starRev" id="community">
						<span class="starR on">별1</span>
						<span class="starR on">별2</span>
						<span class="starR on">별3</span>
						<span class="starR on">별4</span>
						<span class="starR on">별5</span>
					</li>
				</ul>
			</div>
			<!--내용작성-->
			<div class="mypageR_ctt">
				<textarea id="reviewCttTextArea" name="reviewCttTextArea" rows="5" onfocus="checker(this, 200 , 'nbytes_reviewCtt');" onblur="stopchecker();" placeholder="멘티님께 어떤 도움이 되었나요?"></textarea>
				<div class="ctt-300">(<span id="nbytes_reviewCtt" class="color_red">0</span>/300)</div>
			</div>

			<!--후기등록버튼-->
			<div class="mypageR_btn">
				<a href="javascript:void(0);" onclick="javascript:fn_insertReviewProc();">
					<p>후기등록</p>
				</a>
			</div>
			<p style="display: none;"><a href="#review-modal" rel="modal:open" id="reviewPopOpen">로그인 팝업</a></p>
		</div>
		<!-- //리뷰작성 팝업 -->
		</div>
	</div>
</div>
<form name="reviewWriteForm" id="reviewWriteForm" method="post" action="${basePath}/mypage/w/n/insertReviewProc.do">
	<input type="hidden" id="curriculum" name="curriculum">
	<input type="hidden" id="kindness" name="kindness">
	<input type="hidden" id="timePro" name="timePro">
	<input type="hidden" id="community" name="community">
	<input type="hidden" id="reviewCtt" name="reviewCtt">
	<input type="hidden" id="classId" name="classId">
</form>

<script type="text/javascript" src="${scriptPath}/star.js" ></script>
<script>
//클래스아이디 전역변수
var reviewClassId = "";

//지도보기
var fn_reviewMapView = function() {
	alert("준비중 입니다.");
};

//후기작성
var fn_insertReview = function(classId) {
	reviewClassId = classId;
	//유저는 같은 클래스에서 한번만 후기작성 가능
	$.ajax({ 	
		url: "${basePath}/mypage/r/n/selectUserReviewCnt.do",
		type: 'POST',
		dataType : "json",
		data : {"classId" : classId},
		error: function(){
			 alert("현재 찜 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) { 
			if(r.cnt == 0) {
				$("#reviewPopOpen").get(0).click();
			} else{
				alert("해당 클래스에 이미 작성된 리뷰가 있습니다.");
			}
		}
	});
};

//로그인 팝업 닫기
// var fn_reviewPopClose = function () {
// 	$.unblockUI();
// 	$("#reviewPop").empty();
// };

//별점 클릭
$(".starRev span").click(function(){
	var classAttr = $(this).attr("class");
	if(classAttr == "starR") {
		$(this).addClass('on').prevAll('span').addClass('on');
	} else { //starR on
		$(this).removeClass('on').nextAll('span').removeClass('on');
	}
	return false;
});

//후기등록
var fn_insertReviewProc = function() {
	var curriculum = $("#curriculum > .starR.on").length*1;
	var kindness = $("#kindness > .starR.on").length*1;
	var timePro = $("#timePro > .starR.on").length*1;
	var community = $("#community > .starR.on").length*1;
	var reviewCtt = $("#reviewCttTextArea").val();
	$("#reviewWriteForm #reviewCtt").val(reviewCtt); //리뷰내용
	$("#reviewWriteForm #classId").val(reviewClassId); //클래스아이디
	$("#reviewWriteForm #curriculum").val(curriculum); //커리큘럼평점
	$("#reviewWriteForm #kindness").val(kindness); //친절도평점
	$("#reviewWriteForm #timePro").val(timePro); //시간준수 평점
	$("#reviewWriteForm #community").val(community); //전달력 평점
	
	if(reviewCtt == null && reviewCtt == "") {
		alert("후기를 등록해주세요.");
		$("#reviewCtt").focus();
		return;
	}
	
	$("#reviewWriteForm").submit();
};

</script>
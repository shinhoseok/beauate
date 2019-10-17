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
<h3 class="h3-head2-2"></h3>
<ul>
	<c:choose>
		<c:when test="${rslt.selectListCnt != 0}">
			<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
				<li class="my-review">
					<!--회색영역-->
					<div class="my-r1">
						<div class="r1-img">
							<img src="${uploadPath}/<c:out value="${list.imgSrc3 }"/>" alt=""/>
						</div>
						<div class="r1-txt-all">
							<div class="r1-txt1"><c:out value="${list.classTitle }"/></div>
							<div class="r1-txt2">
								작성일 <span class="r1-line">|</span>
								<span>
									<fmt:parseDate value="${list.reviewDt}" var="reviewDt" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${reviewDt}" pattern="yyyy.MM.dd"/>
								</span>
							</div>
						</div>
						<div class="my-r1-btn">
							<a href="javascript:void(0);" onclick="fn_updateReview('${list.reviewId}', '${list.imgSrc3}', '${list.classTitle}', '${list.curriculum}', '${list.timePro}', '${list.community}', '${list.kindness}');"><span>수정</span></a>
						</div>
						<div class="my-r1-btn2">
							<a href="javascript:void(0);" onclick="fn_deleteReview('${list.reviewId}', '${list.classId}');"><span>삭제</span></a>
						</div>
					</div> <!--별점영역-->
					<div class="my-r2">
						<ul>
							<li>
								<span>커리큘럼</span>
								<c:choose>
									<c:when test="${list.curriculum eq '0'}">
										<img src="${imgPath}/star_0.png" alt="" />
									</c:when>
									<c:when test="${list.curriculum eq '1'}">
										<img src="${imgPath}/star_1.png" alt="" />
									</c:when>
									<c:when test="${list.curriculum eq '2'}">
										<img src="${imgPath}/star_2.png" alt="" />
									</c:when>
									<c:when test="${list.curriculum eq '3'}">
										<img src="${imgPath}/star_3.png" alt="" />
									</c:when>
									<c:when test="${list.curriculum eq '4'}">
										<img src="${imgPath}/star_4.png" alt="" />
									</c:when>
									<c:otherwise>
										<img src="${imgPath}/star_5.png" alt="" />
									</c:otherwise>
								</c:choose>
							</li>
							<li>
								<span>시간준수</span>
								<c:choose>
									<c:when test="${list.timePro eq '0'}">
										<img src="${imgPath}/star_0.png" alt="" />
									</c:when>
									<c:when test="${list.timePro eq '1'}">
										<img src="${imgPath}/star_1.png" alt="" />
									</c:when>
									<c:when test="${list.timePro eq '2'}">
										<img src="${imgPath}/star_2.png" alt="" />
									</c:when>
									<c:when test="${list.timePro eq '3'}">
										<img src="${imgPath}/star_3.png" alt="" />
									</c:when>
									<c:when test="${list.timePro eq '4'}">
										<img src="${imgPath}/star_4.png" alt="" />
									</c:when>
									<c:otherwise>
										<img src="${imgPath}/star_5.png" alt="" />
									</c:otherwise>
								</c:choose>
							</li>
							<li>
								<span>전달력</span>
								<c:choose>
									<c:when test="${list.community eq '0'}">
										<img src="${imgPath}/star_0.png" alt="" />
									</c:when>
									<c:when test="${list.community eq '1'}">
										<img src="${imgPath}/star_1.png" alt="" />
									</c:when>
									<c:when test="${list.community eq '2'}">
										<img src="${imgPath}/star_2.png" alt="" />
									</c:when>
									<c:when test="${list.community eq '3'}">
										<img src="${imgPath}/star_3.png" alt="" />
									</c:when>
									<c:when test="${list.community eq '4'}">
										<img src="${imgPath}/star_4.png" alt="" />
									</c:when>
									<c:otherwise>
										<img src="${imgPath}/star_5.png" alt="" />
									</c:otherwise>
								</c:choose>
							</li>
							<li>
								<span>친절도</span>
								<c:choose>
									<c:when test="${list.kindness eq '0'}">
										<img src="${imgPath}/star_0.png" alt="" />
									</c:when>
									<c:when test="${list.kindness eq '1'}">
										<img src="${imgPath}/star_1.png" alt="" />
									</c:when>
									<c:when test="${list.kindness eq '2'}">
										<img src="${imgPath}/star_2.png" alt="" />
									</c:when>
									<c:when test="${list.kindness eq '3'}">
										<img src="${imgPath}/star_3.png" alt="" />
									</c:when>
									<c:when test="${list.kindness eq '4'}">
										<img src="${imgPath}/star_4.png" alt="" />
									</c:when>
									<c:otherwise>
										<img src="${imgPath}/star_5.png" alt="" />
									</c:otherwise>
								</c:choose>
							</li>
						</ul>
					</div>
					<div class="my-r3"><c:out value="${list.reviewCtt }"/></div>
					<c:if test="${fn:length(list.commentList) != 0}">
						<div class="my-r4">
							<div class="my-r4-i">
								<a href="javascript:void(0);" onclick="javascript:fn_commentShowOrHide();">댓글보기<span class="my-r4-no">${fn:length(list.commentList)}</span></a>
							</div>
						</div>
						<c:forEach items="${list.commentList}" var="commList" varStatus="i">
							<div class="my-r4-m" id="my_r4_m" style="display: none;">
								<p class="r4-m-nm">
									<c:choose>
										<c:when test="${commList.usrId eq 'USR-000000'}">
											<img src="${imgPath}/my-r4-admin.png" alt="" /><c:out value="${commList.usrNm }"/>
										</c:when>
										<c:otherwise>
											<img src="${imgPath}/my-r4-m.png" alt="" /><c:out value="${commList.usrNm }"/>
										</c:otherwise>
									</c:choose>
									<span>
										<fmt:parseDate value="${commList.commentDt}" var="commentDt" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${commentDt}" pattern="yyyy.MM.dd"/>
									</span>
								</p>
								<p class="cmt-m">
									<c:out value="${commList.commentCtt }"/>
								</p>
							</div> <!--마지막 선-->
							<div class="my-last-line"></div>
						</c:forEach>
					</c:if>
					<c:set var="areaNm" value="${list.areaNm }"/>
				</li>
				<!--//수강후기 -->
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

<!-- 리뷰작성 팝업 -->
<div id="update_review_modal" class="modal" style="width: 30%;">
	<div class="mypageR_inner">
		<div class="close">
			<a href="javascript:void(0);" rel="modal:close" class="modal-close"><img src="${imgPath}/btn_close.png" /></a>
		</div>
		<p>클래스 후기작성</p>
		<div class="mypageR_list">
			<ul>
				<li><img id="reviewPopImg" src=""/></li>
				<li id="classTitle"></li>
				<li id="areaNmAndReviewDt"></li>
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
					<span class="starR">별1</span>
					<span class="starR">별2</span>
					<span class="starR">별3</span>
					<span class="starR">별4</span>
					<span class="starR">별5</span>
				</li>
				<li style="cursor: pointer;" class="starRev" id="kindness">
					<span class="starR">별1</span>
					<span class="starR">별2</span>
					<span class="starR">별3</span>
					<span class="starR">별4</span>
					<span class="starR">별5</span>
				</li>
				<li style="cursor: pointer;" class="starRev" id="timePro">
					<span class="starR">별1</span>
					<span class="starR">별2</span>
					<span class="starR">별3</span>
					<span class="starR">별4</span>
					<span class="starR">별5</span>
				</li>
				<li style="cursor: pointer;" class="starRev" id="community">
					<span class="starR">별1</span>
					<span class="starR">별2</span>
					<span class="starR">별3</span>
					<span class="starR">별4</span>
					<span class="starR">별5</span>
				</li>
			</ul>
		</div>
		<!--내용작성-->
		<div class="mypageR_ctt">
<!-- 			<p id="reviewCtt"></p> -->
			<textarea id="reviewCttTextArea" name="reviewCttTextArea" rows="5" onfocus="checker(this, 200 , 'nbytes_reviewCtt');" onblur="stopchecker();" placeholder="멘티님께 어떤 도움이 되었나요?"></textarea>
			<div class="ctt-300">(<span id="nbytes_reviewCtt" class="color_red">0</span>/300)</div>
		</div>

		<!--후기수정버튼-->
		<div class="mypageR_btn">
			<a href="javascript:void(0);" onclick="javascript:fn_updateReviewProc();">
				<p>후기수정</p>
			</a>
		</div>
		<p style="display: none;"><a href="#update_review_modal" rel="modal:open" id="updateReviewPopOpen">로그인 팝업</a></p>
	</div>
	<!-- //리뷰작성 팝업 -->
</div>
<form name="reviewWriteForm" id="reviewWriteForm" method="post" action="${basePath}/mypage/w/n/updateReviewProc.do">
	<input type="hidden" id="curriculum" name="curriculum">
	<input type="hidden" id="kindness" name="kindness">
	<input type="hidden" id="timePro" name="timePro">
	<input type="hidden" id="community" name="community">
	<input type="hidden" id="reviewCtt" name="reviewCtt">
	<input type="hidden" id="reviewId" name="reviewId">
	<input type="hidden" id="classId" name="classId">
</form>

<form name="reviewDeleteForm" id="reviewDeleteForm" method="post" action="${basePath}/mypage/w/n/deleteReviewProc.do">
	<input type="hidden" id="reviewId" name="reviewId">
	<input type="hidden" id="classId" name="classId">
</form>
<script type="text/javascript">
//댓글보기 show&hide
var fn_commentShowOrHide = function() {
	if($("#my_r4_m").css("display") == "none") {
		$("#my_r4_m").show();
	} else {
		$("#my_r4_m").hide();
	}
};

//후기수정
var fn_updateReview = function(reviewId, imgSrc3, classTitle, curriculum, timePro, community, kindness) {
	$("#reviewPopImg").attr("src", "${uploadPath}/"+imgSrc3);

	$("#classTitle").text(classTitle);
	
	for(var i=0; i < curriculum; i++) {
		$("#curriculum").children(":eq("+i+")").addClass('on');
	}
	for(var i=0; i < timePro; i++) {
		$("#timePro").children(":eq("+i+")").addClass('on');
	}
	for(var i=0; i < community; i++) {
		$("#community").children(":eq("+i+")").addClass('on');
	}
	for(var i=0; i < kindness; i++) {
		$("#kindness").children(":eq("+i+")").addClass('on');
	}
	$.ajax({ 	
		url: "${basePath}/mypage/r/n/updateHoogiPop.do",
		type: 'POST',
		dataType : "json",
		data : {"reviewId" : reviewId},
		error: function(){
			 alert("현재 찜 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) { 
			var areaNmAndReviewDt = r.resultVO.areaNm+"<span>|</span>"+r.resultVO.reviewDt
			$("#areaNmAndReviewDt").html(areaNmAndReviewDt);
			$("#reviewCttTextArea").text(r.resultVO.reviewCtt);
			updateReviewProcReviewId = r.resultVO.reviewId;
			updateReviewProcClassId = r.resultVO.classId;
		}
	});
	$("#updateReviewPopOpen").get(0).click();
};

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

//후기수정
var updateReviewProcReviewId = "";
var updateReviewProcClassId = "";
var fn_updateReviewProc = function() {
	var curriculum = $("#curriculum > .starR.on").length*1;
	var kindness = $("#kindness > .starR.on").length*1;
	var timePro = $("#timePro > .starR.on").length*1;
	var community = $("#community > .starR.on").length*1;
	var reviewCtt = $("#reviewCttTextArea").val();
	$("#reviewWriteForm #reviewCtt").val(reviewCtt); //리뷰내용
	$("#reviewWriteForm #reviewId").val(updateReviewProcReviewId); //리뷰아이디
	$("#reviewWriteForm #classId").val(updateReviewProcClassId); //클래스아이디
	$("#reviewWriteForm #curriculum").val(curriculum); //커리큘럼평점
	$("#reviewWriteForm #kindness").val(kindness); //친절도평점
	$("#reviewWriteForm #timePro").val(timePro); //시간준수 평점
	$("#reviewWriteForm #community").val(community); //전달력 평점
	
	$("#reviewWriteForm").submit();
};

//후기삭제
var fn_deleteReview = function(reviewId, classId) {
	$("#reviewDeleteForm #reviewId").val(reviewId); //리뷰아이디
	$("#reviewDeleteForm #classId").val(classId); //클래스아이디
	$("#reviewDeleteForm").submit();
};
</script>
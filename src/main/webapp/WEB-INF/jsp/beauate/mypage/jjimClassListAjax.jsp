<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<h3 class="h3-head1-2">
	<div class="my-btn1">
		<a href="javascript:void(0);" onclick="javascript:fn_jjimAllCheck();"><span>전체선택</span></a>
	</div>
	<div class="my-btn2">
		<a href="javascript:void(0);" onclick="javascript:fn_jjimChkDel();"><span>삭제</span></a>
	</div>
</h3>
<ul class="l-list">
	<c:choose>
		<c:when test="${rslt.selectListCnt != 0}">
			<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
				<li class="l-list-li">
					<!-- 오늘날짜 todayNum -->
					<fmt:parseDate value="${rslt.today}" var="todayParseDate" pattern="yyyy-MM-dd"/> 
					<fmt:parseNumber value="${todayParseDate.time / (1000*60*60*24)}" integerOnly="true" var="todayNum"/>
					<!-- 개강일 classStartDtNum -->
					<fmt:parseDate value="${list.classStartDt}" var="classStartDtParseDate" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${classStartDtParseDate.time / (1000*60*60*24)}" integerOnly="true" var="classStartDtNum"/>
					<!--체크박스-->
					<div class="like-cheak" id="like_chk${i.count}" jjimId="${list.jjimId}" style="cursor: pointer;"/>
					<div class="like-img">
						<c:choose>
							<c:when test="${classStartDtNum < todayNum or list.classSt eq 4}">
								<img src="${uploadPath}/<c:out value="${list.imgSrc1 }"/>"/>
								<p class="end-p1">종료</p>
								<div class="img-list-black"></div>
							</c:when>
							<c:when test="${list.classSt eq 3}">
								<img src="${uploadPath}/<c:out value="${list.imgSrc1 }"/>"/>
								<p class="end-p2">신청마감</p>
								<div class="img-list-black"></div>
							</c:when>
							<c:otherwise>
								<img src="${uploadPath}/<c:out value="${list.imgSrc1 }"/>"/>
								<div class="img-list-txt">
									<span>${((todayNum - classStartDtNum)*-1) +1 }일 남았어요!</span>
								</div>
							</c:otherwise>
						</c:choose>
						
					</div> <!--텍스트-->
					<p class="l-txt1"><c:out value="${list.classCt }"/> | 
						<fmt:parseDate value="${list.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${classStartDt}" pattern="yy.MM.dd"/>
					</p>
					<p class="l-txt2"><c:out value="${list.classTitle }"/></p>
					<p class="l-txt3">
						<a href="${basePath}/offclass/a/t/selectOffClassDetail.do?classId=${list.classId }">클래스 신청<img src="${imgPath}/c-go.png"></a>
					</p>
				</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<li>데이터가 없습니다.</li>
		</c:otherwise>
	</c:choose>
</ul>
<!--//찜한 클래스-->
<!--페이징-->
<div class="paging">
	<ui:pagination paginationInfo="${rslt.paginationInfo}" type="image" jsFunction="fn_myClassSearchList" />
</div>

<script>
//전체체크
var fn_jjimAllCheck = function() {
	var gb = $("div[id^='like_chk']").attr("class");
	if(gb == "like-cheak") {
		$("div[id^='like_chk']").removeClass("like-cheak");
		$("div[id^='like_chk']").addClass("like-cheak1").append('<img class="imgChkBox" src="${imgPath}/check.png">');
	} else {
		$("div[id^='like_chk']").children().remove();
		$("div[id^='like_chk']").removeClass("like-cheak1");
		$("div[id^='like_chk']").addClass("like-cheak");
	}
};

//하나씩 체크
$(".like-cheak").click(function() {
	var gb = $(this).attr("class");
	if(gb == "like-cheak") {
		$(this).removeClass("like-cheak");
		$(this).addClass("like-cheak1").append('<img class="imgChkBox" src="${imgPath}/check.png">');
	} else {
		$(this).children().remove();
		$(this).removeClass("like-cheak1");
		$(this).addClass("like-cheak");
	}
});

//체크박스 선택삭제
var fn_jjimChkDel = function() {
	if($(".imgChkBox").length > 0) {
		var result = confirm("선택하신 찜을 삭제하시겠습니까?");
		if(result) {
			var jjimId = "";
			var comFlag = "";
			$(".imgChkBox").each(function(i) {
				if(i > 0) {
					comFlag = ",";
				}
				var attrId = ($(this).parent().attr("jjimId"));
				jjimId = jjimId + comFlag + String(attrId);
			});
			$.ajax({
				url: "${basePath}/mypage/w/n/deleteJjimProc.do",
				data: {"jjimId" : jjimId},
				type: 'POST',
				dataType: 'html',
				cache: false,
				success: function(r) {
					var params = {};
					params.pageIndex = 1;
					params.mypageTab = 2; //카테고리(다시 찜으로)
					fn_myClassCommonAjax(params);
				},
				error : function() {
				  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
				}
			});
		}
	} else {
		alert("삭제하실 찜을 선택해주세요.");
	}
};
</script>
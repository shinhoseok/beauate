<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<input type="hidden" id="beforePostId" value="${boardVO.postId}">
<div class="board-view">
	<div class="board-view-top">
		<div class="date"><fmt:formatDate value="${boardVO.postDt}" pattern="yy.MM.dd"/></div>
		<div class="title"><c:out value="${boardVO.postTitle}"/></div>
		<c:if test="${boardVO.postCategorySt ne '4'}"><div class="desc"><c:out value="${boardVO.postSubTitle}"/></div></c:if>
	</div>
	<div class="board-view-cot">
		<c:if test="${not empty boardVO.imgSrc }">
			<c:choose>
				<c:when test="${not empty boardVO.couponId }">
					<p style="cursor: pointer" onclick="javascript:fn_couponEvent('${boardVO.couponId}');"><img src="${uploadPath}/<c:out value="${boardVO.imgSrc }"/>" alt="" /></p>
				</c:when>
				<c:otherwise>
					<p><img src="${uploadPath}/<c:out value="${boardVO.imgSrc }"/>" alt="" /></p>
				</c:otherwise>
			</c:choose>
		</c:if>
		<p id="postCttDetail"><c:out value="${boardVO.postCtt}"/></p>
	</div>
	<div class="board-view-fot">
		<a href="javascript:void(0);" onclick="javascript:fn_searchNextOrPrev('N');" class="btn-prev">이전 목록</a>
		<a href="javascript:void(0);" onclick="javascript:fn_searchListDetail();" class="btn-list">목록</a>
		<a href="javascript:void(0);" onclick="javascript:fn_searchNextOrPrev('Y');" class="btn-next">다음 목록</a>
	</div>
</div>
<script>
//목록
var fn_searchListDetail = function() {
	var params = {};
	params.pageIndex = 1;
	params.postCategorySt = "${boardVO.postCategorySt}";
	fn_boardCommonAjax(params);
};

//nextYn : 다음글(Y), 이전글(N)
var fn_searchNextOrPrev = function(nextYn) {
	var params = {};
	params.postCategorySt = "${boardVO.postCategorySt}";
	params.postId = "${boardVO.postId}";
	params.nextYn = nextYn;
	params.postTitle = "${boardVO.postTitle}";
	params.postSubTitle = "${boardVO.postSubTitle}";
	params.imgSrc = "${boardVO.imgSrc}";
	params.postCtt = $("#postCttDetail").text();
	$.ajax({	
		url: "${basePath}/board/a/t/selectBoardNextPrev.do",
		data: params,
		type: 'POST',
		dataType: 'html',
		cache: false,
		success: function(r) {
			$('#div_tab1').children().remove();
			$('#div_tab1').html(r);
			if($('#beforePostId').val() == params.postId) {
				alert("마지막 글입니다.");
			}
		},
		error : function() {
			alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};

//쿠폰이벤트
var fn_couponEvent = function(couponId) {
	var usrId = "${sessionScope.loginVO.usrId}";
	if(usrId == null || usrId == "") {
		alert("로그인 후 사용이 가능합니다.");
		fn_loginPopUpLayer();
		return;
	}
	var params = {};
	params.usrId = usrId;
	params.couponId = couponId;
	//쿠폰내역 테이블에 쿠폰이 있으면 이미 받았다. 없으면 발급했다.
	$.ajax({	
		url: "${basePath}/board/w/t/insertCouponHistoryProc.do",
		data: params,
		type: 'POST',
		dataType: 'json',
		cache: false,
		success: function(r) {
			if(r.result) {
				alert("쿠폰 발급이 완료되었습니다.");
			} else {
				alert("이미 쿠폰을 발급 받으셨습니다.");
			}
		},
		error : function() {
			alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};
</script>
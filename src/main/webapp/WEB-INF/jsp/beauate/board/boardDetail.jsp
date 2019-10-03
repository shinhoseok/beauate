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
		<c:if test="${boardVO.postCategorySt ne '4'}">
			<p><img src="${uploadPath}/<c:out value="${boardVO.imgSrc }"/>" alt="" /></p>
		</c:if>
		<p><c:out value="${boardVO.postCtt}"/></p>
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
	params.postCtt = "${boardVO.postCtt}";
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
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="naver-site-verification" content="c03e63b14e10bb3c48bb213c40e148287b19ea7f"/>
<title>BASIC</title>
<!--공통css-->
<link rel="stylesheet" type="text/css" href="${cssPath}/common.css">
<!--현업 main page-->
<link rel="stylesheet" type="text/css" href="${cssPath}/worksite.css">
<!-- 스크립트 선언 -->
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
<script type="text/javascript" src="${scriptPath}/common.js"></script>
</head>
<body>
	<!-- header Start -->
	<div class="header">
		<jsp:include page="/WEB-INF/jsp/beauate/common/top.jsp" flush="false" />
	</div>
	<!-- header End -->
	<div class="wrap">
		<div class="container">
			<!-- left_menu Start -->
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp"%>
			<!-- left_menu End -->
			<div class="contents">
				<p class="contentTitle">후기 관리</p>
				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<!-- sub_path End -->
				<h4 class="contentTitle_h4">후기 정보</h4>
				<div class="tableLayer">
					<table class="table">
						<caption></caption>
						<colgroup>
							<col width="150px">
							<col width="340px">
							<col width="150px">
							<col width="340px">
						</colgroup>
						<tbody class="line">
							<tr>
								<th>사용자이름</th>
								<td><c:out value="${resultVO.usrNm}"/></td>
								<th>사용자이메일</th>
								<td><c:out value="${resultVO.emailAddr}"/></td>
							</tr>
							<tr>
								<th>클래스제목</th>
								<td colspan="4"><c:out value="${resultVO.classTitle}"/></td>
							</tr>
							<tr>
								<th>후기등록일</th>
								<td><c:out value="${resultVO.reviewDt}"/></td>
<%-- 									<fmt:parseDate value="${resultVO.reviewDt}" var="reviewDt" pattern="yyyy-MM-dd"/>  --%>
<%-- 									<fmt:formatDate value="${reviewDt}" pattern="yyyy-MM-dd"/> --%>
<!-- 								</td> -->
								<th>삭제여부</th>
								<td><c:out value="${resultVO.delYn}"/></td>
							</tr>
							<tr>
								<th>커리큘럼평점</th>
								<td><c:out value="${resultVO.curriculum}"/></td>
								<th>친절도평점</th>
								<td><c:out value="${resultVO.kindness}"/></td>
							</tr>
							<tr>
								<th>시간준수평점</th>
								<td><c:out value="${resultVO.timePro}"/></td>
								<th>전달력평점</th>
								<td><c:out value="${resultVO.community}"/></td>
							</tr>
							<tr>
								<th>후기내용</th>
								<td colspan="4"><c:out value="${resultVO.reviewCtt}"/></td>
							</tr>
							<tr>
								<th>댓글내역</th>
								<c:choose>
									<c:when test="${not empty resultVO.commentId}">
										<td colspan="4"><c:out value="${resultVO.commentCtt}"/></td>
									</c:when>
									<c:otherwise>
										<td colspan="4">-</td>
									</c:otherwise>
								</c:choose>
							</tr>
							<form name="commentVO" id="commentVO" method="post" action="" >
								<input type="hidden" name="reviewId" id="reviewId" value="${resultVO.reviewId}">
								<input type="hidden" name="commentId" id="commentId" value="${resultVO.commentId}">
								<tr id="targetTr" style="display: none;">
									<th>댓글</th>
									<td colspan="4" class="pdtb3">
										<textarea name="commentCtt" id="commentCtt" rows="5" onfocus="checker(this, 200 , 'nbytes_commentCtt');" onblur="stopchecker();"><c:out value="${resultVO.commentCtt}"/></textarea>
										<br/>&nbsp;[<span id="nbytes_commentCtt" class="color_red">0</span>/200]byte
									</td>
								</tr>
							</form>
						</tbody>
					</table>
				</div>
				<div class="T_btnLayer fr">
					<c:choose>
						<c:when test="${empty resultVO.commentId}">
							<a href="javascript:void(0);" id="insertBtn" onclick="fn_insertComment();"><button type="button" class="blueBtn L">댓글등록</button></a>
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0);" id="updateBtn" onclick="fn_updateComment();"><button type="button" class="blueBtn L">댓글수정</button></a>
						</c:otherwise>
					</c:choose>
					
					<a href="javascript:void(0);" id="insertProcBtn" onclick="fn_insertCommentProc();" style="display: none;"><button type="button" class="blueBtn L">등록</button></a>
					<a href="javascript:void(0);" id="updateProcBtn" onclick="fn_updateCommentProc();" style="display: none;"><button type="button" class="blueBtn L">수정</button></a>
					<c:if test="${not empty resultVO.commentId}">
						<a href="javascript:void(0);" onclick="fn_deleteCommentProc();"><button type="button" class="blueBtn L">댓글삭제</button></a>
					</c:if>
					<a href="javascript:void(0);" onclick="fn_deleteReviewProc();"><button type="button" class="blueBtn L">후기삭제</button></a>
					<a href="${basePath}/review/r/m/selectReviewList.do"><button type="button" class="blueBtn L">목록</button></a>
				</div>
			</div>
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<!-- footer // -->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- // footer -->
	
	<script type="text/javascript">
	//댓글등록
	var fn_insertComment = function() {
		$("#targetTr").show();
		$("#insertBtn").hide();
		$("#insertProcBtn").show();
	};
	
	//댓글등록 처리
	var fn_insertCommentProc = function() {
		$('#commentVO').attr("action","${basePath }/review/w/n/insertCommentMngProc.do");
		$('#commentVO').submit();
	};
	
	//댓글수정
	var fn_updateComment = function() {
		$("#targetTr").show();
		$("#updateBtn").hide();
		$("#updateProcBtn").show();
	};
	
	//댓글수정처리
	var fn_updateCommentProc = function() {
		$('#commentVO').attr("action","${basePath }/review/w/n/updateCommentProc.do");
		$('#commentVO').submit();
	};
	
	//댓글삭제
	var fn_deleteCommentProc = function() {
		$('#commentVO').attr("action","${basePath }/review/w/n/deleteCommentProc.do");
		$('#commentVO').submit();
	};
	
	//후기삭제
	var fn_deleteReviewProc = function() {
		if(!confirm("후기를 삭제 하시겠습니까?\n삭제시 후기, 댓글 모두 삭제됩니다.")){
			return;
		}
		$('#commentVO').attr("action","${basePath }/review/w/n/updateReviewCmmProc.do");
		$('#commentVO').submit();
	};
	</script>
</body>
</html>

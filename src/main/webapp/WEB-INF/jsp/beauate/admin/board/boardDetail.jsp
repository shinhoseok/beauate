<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<title>BASIC administrator</title>
	<!--공통css-->
	<link rel="stylesheet" type="text/css" href="${cssPath}/common.css"/>
	<!--현업 main page-->
	<link rel="stylesheet" type="text/css" href="${cssPath}/worksite.css"/>
	<!-- 스크립트 선언 -->
	<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js" ></script>
</head>
<body>
	<!-- header Start -->
	<div class="header">
		<jsp:include page="/WEB-INF/jsp/beauate/common/top.jsp" flush="false" />
	</div>
	<!-- header End// -->
	<div class="wrap">
		<div class="container">
			<!-- left_menu Start -->
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp" %>
			<!-- left_menu End -->
			<div class="contents">
				<p class="contentTitle">게시판 관리</p>
				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<!-- sub_path End -->
				<form:form commandName="boardVO" id="boardVO" name="boardVO" method="post" >
					<form:hidden path="postId" />
<%-- 					<form:hidden path="postDt" /> --%>
					<form:hidden path="postCategorySt" />
					<form:hidden path="delYn" />
					<form:hidden path="postTitle" id="postTitle"/>
					<form:hidden path="postSubTitle" />
					<form:hidden path="postCtt" />
					<form:hidden path="sortSubject"/>
					<form:hidden path="sortDescend"/>
					<form:hidden path="searchCondition"/>
					<form:hidden path="searchKeyword"/>
					<form:hidden path="pageIndex"/>
					<h4 class="contentTitle_h4">로그인 정보</h4>
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
									<th>게시물아이디</th>
									<td><c:out value="${boardVO.postId}"/></td>
									<th>게시물 등록일</th>
									<td><fmt:formatDate value="${boardVO.postDt}" pattern="yyyy-MM-dd"/></td>
								</tr>
								<tr>
									<th>게시판 분류</th>
									<td>
										<c:choose>
											<c:when test="${boardVO.postCategorySt eq '1'}">
												제품정보
											</c:when>
											<c:when test="${boardVO.postCategorySt eq '2'}">
												자격증
											</c:when>
											<c:when test="${boardVO.postCategorySt eq '3'}">
												박람회
											</c:when>
											<c:otherwise>
												공지사항
											</c:otherwise>
										</c:choose>
									</td>
									<th>삭제여부</th>
									<td><c:out value="${boardVO.delYn}"/></td>
								</tr>
								<tr>
									<th>타이틀</th>
									<td colspan="4"><c:out value="${boardVO.postTitle}"/></td>
								</tr>
								<tr>
									<th>서브타이틀</th>
									<td colspan="4"><c:out value="${boardVO.postSubTitle}"/></td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="4"><c:out value="${boardVO.postCtt}"/></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="T_btnLayer fr">
						<a href="javascript:void(0);" onclick="javascript:fn_updateBoardMng();"><button type="button" class="blueBtn L">수정</button></a>
						<a href="javascript:void(0);" onclick="javascript:fn_deleteBoardMng();"><button type="button" class="blueBtn L">삭제</button></a>
						<a href="javascript:void(0);" onclick="javascript:fn_selectBoardMngList();"><button type="button" class="blueBtn L">목록</button></a>
					</div>
				</form:form>
			</div>
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<!-- footer // -->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- // footer -->
</body>
<script>
//수정
fn_updateBoardMng = function() {
	if (confirm("수정 하시겠습니까?")) {
		$('#boardVO').attr("action","${basePath }/boardm/w/m/updateBoardMng.do");
		$('#boardVO').submit();
	}
};

//삭제
fn_deleteBoardMng = function() {
	if(confirm("삭제 하시겠습니까?")) {
		$('#boardVO').attr("action","${basePath }/boardm/w/n/deleteBoardMngProc.do");
		$('#boardVO').submit();
	}
};

//목록
fn_selectBoardMngList = function() {
	var frm = document.boardVO;
	frm.action = "<c:url value='${basePath}/boardm/r/m/selectBoardMngList.do'/>";
	frm.submit();
};
</script>
</html>

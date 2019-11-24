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
				<p class="contentTitle">회원 리스트</p>&nbsp;&nbsp;&nbsp;<span class="color_red">전체 : ${userListCnt}</span>
				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<!-- sub_path End -->
				<form:form commandName="userVO" id="userVO" name="listForm" method="post" action="${basePath}/usermgr/r/m/userList.do">
					<form:hidden path="pageIndex" id="pageIndex" />
					<form:hidden path="sortSubject" />
					<form:hidden path="sortDescend" />
					<div class="selectBox">
						<select name="select" class="w13p">
							<option>이름</option>
							<option>이메일</option>
							<option>휴대전화</option>
							<option>회원번호</option>
						</select>
						<input class="searchName" name="" type="text" />
						<button type="button" class="grayBtn ico">
							<img src="${imagePath }/ico_search.png"> 검색
						</button>
						<button type="button" class="grayBtn02 ico">초기화</button>
					</div>
				</form:form>
				<div class="tableLayer">
					<table class="tableList">
						<caption></caption>
						<colgroup>
							<col width="15%">
							<col width="10%">
							<col width="24%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
							<col width="8%">
							<col width="8%">
						</colgroup>
						<thead>
							<th class="noBg">회원번호 <span class="arrow_ascending"><a href="#"></a></span> <span class="arrow_descending"><a href="#"></a></span>
							</th>
							<th>가입일 <span class="arrow_ascending"><a href="#"></a></span> <span class="arrow_descending"><a href="#"></a></span>
							</th>
							<th>이메일</th>
							<th>이름</th>
							<th>휴대전화</th>
							<th>최근접속일</th>
							<th>계정상태</th>
							<th>회원등급</th>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(userList) != 0}">
									<c:forEach items="${userList}" var="list" varStatus="i">
										<tr class="row">
											<td><c:out value="${list.usrId}"/></td>
											<td><fmt:formatDate value="${list.joinDt}" pattern="yyyy-MM-dd"/></td>
											<td><a href="${basePath}/usermgr/r/m/userView.do?usrId=<c:out value='${list.usrId}'/>"><c:out value="${list.emailAddr}"/></a></td>
											<td><c:out value="${list.usrNm}"/></td>
											<td><c:out value="${list.mblPno}"/></td>
											<td><fmt:formatDate value="${list.loginDt}" pattern="yyyy-MM-dd"/></td>
											<td><c:out value="${list.userSt}"/></td>
											<td><c:out value="${list.rlName}"/></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<td colspan="8">데이터가 없습니다.</td>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<div class="T_btnLayer fr">
						<a href="${basePath}/usermgr/w/m/userInsert.do"><button type="button" class="blueBtn L">등록</button></a>
					</div>
				</div>
				<!-- 페이징// -->
				<div class="paging_place">
					<div class="paging_wrap">
						<comTag:paging totalCount="${userListCnt}" pageNo="${userVO.pageIndex}" pageSize="${userVO.pageSize}" clickPage="fn_searchList"/>
					</div>
				</div>
				<!-- 페이징// -->
			</div>
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<!-- footer // -->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- // footer -->
	<script type="text/javascript" src="${scriptPath}/common.js"></script>
	<script type="text/javascript">
	//검색, 페이지 이동
	fn_searchList = function(pageNo){
		var forms = document.listForm;
		forms.pageIndex.value = pageNo;
		forms.submit();
	};
	
	//정렬
	fn_sort = function(obj, target){
		var frm = document.listForm;
		var descend = ( $(obj.parentNode).hasClass("arrow_ascending") ) ?  "asc" : "desc";

		frm.sortDescend.value = descend;
		frm.sortSubject.value = target;
		frm.submit();
	};
	</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
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
			<div class="sub_leftMenu">
				<h3>회원</h3>
				<ul class="menuBox">
					<li class="bigMenu"><a href="#">클래스 관리</a>
						<div class="subMenu">
							<ul>
								<!--서브 메뉴 선택시 class="selectsubMenu"-->
								<!--li class="selectsubMenu"><a href="#">권한그룹 관리</a></li-->
								<li class="selectsubMenu"><a href="#">클래스 리스트</a></li>
								<li class="smallMenu"><a href="#">클래스별 정산 </a></li>
							</ul>
						</div></li>
					<li class="bigMenu"><a href="#">알람신청 관리</a>
						<div class="subMenu">
							<ul>
								<!--서브 메뉴 선택시 class="selectsubMenu"-->
								<!--li class="selectsubMenu"><a href="#">권한그룹 관리</a></li-->
								<li class="smallMenu"><a href="#">알람신청자 리스트</a></li>
							</ul>
						</div></li>
					<li class="bigMenu"><a href="#">후기 댓글 관리</a>
						<div class="subMenu">
							<ul>
								<!--서브 메뉴 선택시 class="selectsubMenu"-->
								<!--li class="selectsubMenu"><a href="#">권한그룹 관리</a></li-->
								<li class="smallMenu"><a href="#">후기 리스트</a></li>
								<li class="smallMenu"><a href="#">댓글 리스트</a></li>
							</ul>
						</div></li>
				</ul>
			</div>
			<div class="contents">
				<p class="contentTitle">클래스 리스트</p>
				<p class="sub_path">
					<img src="images/ico_home.png" width="10" height="9" />&nbsp;〉&nbsp;클래스 관리&nbsp;〉&nbsp;클래스 리스트
				</p>
				<div class="selectBox">
					<select name="select" class="w13p">
						<option>이름</option>
						<option>이메일</option>
						<option>회원번호</option>
					</select>
					<input class="searchName" name="" type="text" />
					<button type="button" class="grayBtn ico">
						<img src="images/ico_search.png"> 검색
					</button>
					<button type="button" class="grayBtn02 ico">초기화</button>
				</div>
				<div class="tableLayer">
					<table class="tableList">
						<caption></caption>
						<colgroup>
							<col width="15%">
							<col width="10%">
							<col width="10%">
							<col width="20%">
							<col width="15%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<th class="noBg">회원번호 <span class="arrow_ascending"><a href="#"></a></span> <span class="arrow_descending"><a href="#"></a></span>
							</th>
							<th>가입일 <span class="arrow_ascending"><a href="#"></a></span> <span class="arrow_descending"><a href="#"></a></span>
							</th>
							<th>이름</th>
							<th>휴대전화</th>
							<th>누적 결제금액 <span class="arrow_ascending"><a href="#"></a></span> <span class="arrow_descending"><a href="#"></a></span>
							</th>
							<th>누적 수강생 <span class="arrow_ascending"><a href="#"></a></span> <span class="arrow_descending"><a href="#"></a></span>
							</th>
							<th>후기평점 <span class="arrow_ascending"><a href="#"></a></span> <span class="arrow_descending"><a href="#"></a></span>
							</th>
						</thead>
						<tbody>
							<tr class="row">
								<td>U1005</td>
								<td>2019.09.17</td>
								<td>박소현</td>
								<td>010-1234-5678</td>
								<td>3,004,800</td>
								<td>45명</td>
								<td>4.5</td>
							</tr>
							<tr class="row">
								<td>U1005</td>
								<td>2019.09.17</td>
								<td>박소현</td>
								<td>010-1234-5678</td>
								<td>3,004,800</td>
								<td>45명</td>
								<td>4.5</td>
							</tr>
							<tr class="row">
								<td>U1005</td>
								<td>2019.09.17</td>
								<td>박소현</td>
								<td>010-1234-5678</td>
								<td>3,004,800</td>
								<td>45명</td>
								<td>4.5</td>
							</tr>
							<tr class="row">
								<td>U1005</td>
								<td>2019.09.17</td>
								<td>박소현</td>
								<td>010-1234-5678</td>
								<td>3,004,800</td>
								<td>45명</td>
								<td>4.5</td>
							</tr>
							<tr class="row">
								<td>U1005</td>
								<td>2019.09.17</td>
								<td>박소현</td>
								<td>010-1234-5678</td>
								<td>3,004,800</td>
								<td>45명</td>
								<td>4.5</td>
							</tr>
						</tbody>
					</table>
					<div class="T_btnLayer fr">
						<a href="${basePath}/classmng/w/m/insertOffClass.do"><button type="button" class="blueBtn L">등록</button></a>
					</div>
				</div>
				<!--페이징-->
<!-- 				<div class="paging_place"> -->
<!-- 					<div class="paging_wrap"> -->
<%-- 						<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_searchList" /> --%>
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<!-- footer // -->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- // footer -->
</body>
</html>

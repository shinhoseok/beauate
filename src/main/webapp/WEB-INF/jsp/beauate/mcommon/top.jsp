<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<div class="header_centerBox">
	<h1>
		<img src="${imagePath }/logo.png" width="143" height="19" style="cursor: pointer;" onclick="javascript:fn_userMainBack();"/>
	</h1>
	<div class="lnb">
		<dl>
			<dt class="hidden">로그인, 로그아웃, 사이트맵 , 설정이 들어가는 자리입니다.</dt>
			<dd>
				<strong>${sessionScope.loginVO.usrNm}</strong> 님 환영합니다.
			</dd>
			<dd>
				<a href="${basePath}/login/a/n/logOut.do" class="lbtn">로그아웃</a>
			</dd>
			<dd class="lbar">
				<img src="${imagePath }/lnb_bar.gif" width="1" height="10" />
			</dd>
			<dd>
				<a href="#">사이트맵</a>
			</dd>
			<dd class="lbar">
				<img src="${imagePath }/lnb_bar.gif" width="1" height="10" />
			</dd>
			<dd>
				<a href="#">설정</a>
			</dd>
		</dl>
	</div>
	<!--Local Navigation Bar End-->
	<div class="gnbWrap">
		<div id="menuArea">
			<ul id="navi">
				<c:choose>
					<c:when test="${alevel eq '1'}">
						<li id="menu" class="selectMenu"><a href="${basePath}/mento/r/n/selectOffClassList.do">멘토</a></li>
<!-- 					<li id="menu"><a href="#">포탈관리</a></li> -->
<!-- 					<li id="menu"><a href="#">게시판관리</a></li> -->
<!-- 					<li id="menu"><a href="#">설문관리</a></li> -->
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
</div>
<!--header_centerBox End-->
<script type="text/javascript">
	var fn_userMainBack = function() {
		location.href = "${basePath}/home/a/n/main.do";
	};
</script>
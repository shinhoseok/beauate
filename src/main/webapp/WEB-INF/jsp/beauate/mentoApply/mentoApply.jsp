<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1280" />
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="naver-site-verification" content="c03e63b14e10bb3c48bb213c40e148287b19ea7f"/>
<title>BEAUATE</title>
<link rel="stylesheet" type="text/css" href="${cssPath}/contents.css" />
<link rel="stylesheet" type="text/css" href="${cssPath}/contents-my1.css" />
<script type="text/javascript" src="${scriptPath}/jquery.min.js"></script>
<script type="text/javascript" src="${scriptPath}/jquery.modal.min.js"></script>
<script type="text/javascript" src="${scriptPath}/swiper.min.js"></script>
<script type="text/javascript" src="${scriptPath}/ui.front.js"></script>
<script type="text/javascript" src="${scriptPath}/library.js"></script>
</head>
<body>
	<div id="wrap">
		<!-- header -->
		<div id="header">
			<jsp:include page="/WEB-INF/jsp/beauate/ucommon/top.jsp" flush="false" />
		</div>
		<!-- //header -->
		<!-- container -->
		<div id="container">
			<!-- content -->
			<div class="content">
				<div class="apply_mentor_wrap">
					<div class="content-inner">
						<img src="${imagePath}/sub/apply_mentor_01.jpg">
					</div>
				</div>
				<div class="content-inner apply_mentor_btn">
					<img src="${imagePath}/sub/apply_mentor_02.jpg">
					<div class="btn-area">
						<a href="https://forms.gle/3Bi1mRtwbUTg8w3f9" class="btn" target="_blank"><span>멘토 지원하기</span></a>
					</div>
				</div>
			</div>
			<!-- //검색결과 -->
		</div>
		<!-- //content -->
	</div>
	<!-- //container -->
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
	<!-- //footer -->
	</div>
</body>
</html>
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
			<!-- left_menu Start -->
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp"%>
			<!-- left_menu End -->
			<div class="contents">
				<p class="contentTitle">쿠폰관리 상세</p>
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
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
								<th>쿠폰번호</th>
								<td><c:out value="${resultVO.couponId}"/></td>
								<th>생성일</th>
								<td>
									<fmt:parseDate value="${resultVO.couponStartDt}" var="couponStartDt" pattern="yyyy-MM-dd"/> 
									<fmt:formatDate value="${couponStartDt}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<th>쿠폰명</th>
								<td colspan="4">${resultVO.couponNm}</td>
							</tr>
							<tr>
								<th>할인율</th>
								<td><c:out value="${resultVO.couponRate}"/>%</td>
								<th>만료기간</th>
								<td>
									<fmt:parseDate value="${resultVO.couponEndDt}" var="couponEndDt" pattern="yyyy-MM-dd"/> 
									<fmt:formatDate value="${couponEndDt}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<th>쿠폰상태</th>
								<td><c:out value="${resultVO.couponSt}"/></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="T_btnLayer fr">
					<a href="${basePath}/cpnmng/w/m/updateCpnMng.do?couponId=<c:out value="${resultVO.couponId}"/>"><button type="button" class="blueBtn L">수정</button></a>
					<a href="javascript:void(0);" onclick="javascript:fn_deleteCpnMngProc('<c:out value="${resultVO.couponId}"/>');"><button type="button" class="blueBtn L">삭제</button></a>
					<a href="${basePath}/cpnmng/r/m/selectCouponMngList.do"><button type="button" class="blueBtn L">목록</button></a>
				</div>
			</div>
		</div>
		<!--container End-->
	</div>
	<!-- footer // -->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- // footer -->
<script type="text/javascript">
//사용자 삭제
var fn_deleteCpnMngProc = function(couponId){ 
	if (confirm("쿠폰을 삭제 하시겠습니까?")) {
			$.ajax({
				url : '${basePath}/cpnmng/z/n/deleteCpnMngProc.do',
				type : 'POST',
				data : { couponId : couponId },
				error : function() {
					alert("쿠폰 삭제시 오류가 발생 하였습니다.\n잠시후 다시 이용해 주십시요.");
				},
				success : function() {
					alert("쿠폰이 삭제되었습니다.");
					document.location.href = "${basePath}/cpnmng/r/m/selectCouponMngList.do";
				}
			});
		}
	};
</script>
</body>
</html>

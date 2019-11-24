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
				<p class="contentTitle">오프라인 클래스 상세</p>
				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<!-- sub_path End -->
				<form:form commandName="classVO" id="detailForm" name="detailForm" method="post" >
					<form:hidden path="classId" />
					<form:hidden path="atchFileId" />
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
									<th>회원번호</th>
									<td><c:out value="${resultVO.classUserId}"/></td>
									<th>클래스등록일</th>
									<td><fmt:formatDate value="${resultVO.classRegDt}" pattern="yyyy-MM-dd"/></td>
								</tr>
								<tr>
									<th>클래스상태</th>
									<td>
										<c:choose>
											<c:when test="${resultVO.classSt eq '1'}">
												오픈전
											</c:when>
											<c:when test="${resultVO.classSt eq '2'}">
												오픈후
											</c:when>
											<c:when test="${resultVO.classSt eq '3'}">
												신청마감
											</c:when>
											<c:otherwise>
												클래스종료
											</c:otherwise>
										</c:choose>
									</td>
									<th>클래스구분</th>
									<td>
										<c:choose>
											<c:when test="${resultVO.classGb eq '2'}">
												외부
											</c:when>
											<c:otherwise>
												내부
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<th>카테고리명</th>
									<td>
										<c:choose>
											<c:when test="${resultVO.classCtSt eq '1'}">
												헤어
											</c:when>
											<c:when test="${resultVO.classCtSt eq '2'}">
												메이크업
											</c:when>
											<c:when test="${resultVO.classCtSt eq '3'}">
												속눈썹/반영구
											</c:when>
											<c:when test="${resultVO.classCtSt eq '4'}">
												피부/왁싱
											</c:when>
											<c:when test="${resultVO.classCtSt eq '5'}">
												네일
											</c:when>
											<c:otherwise>
												기타
											</c:otherwise>
										</c:choose>
									</td>
									<th>지역</th>
									<td><c:out value="${resultVO.classAreaStNm}"/></td>
								</tr>
								<tr>
									<th>클래스제목</th>
									<td><c:out value="${resultVO.classTitle}"/></td>
									<th>클래스시작일</th>
									<td>
										<fmt:parseDate value="${resultVO.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
										<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
									</td>
								</tr>
								<tr>
									<th>클래스종료일</th>
									<td>
										<fmt:parseDate value="${resultVO.classEndDt}" var="classEndDt" pattern="yyyy-MM-dd"/> 
										<fmt:formatDate value="${classEndDt}" pattern="yyyy-MM-dd"/>
									</td>
									<th>클래스시간</th>
									<td><c:out value="${resultVO.classTime}"/></td>
								</tr>
								<tr>
									<th>최소인원</th>
									<td><c:out value="${resultVO.classSmallNo}"/></td>
									<th>최대인원</th>
									<td><c:out value="${resultVO.classBigNo}"/></td>
								</tr>
								<tr>
									<th>신청인원</th>
									<td><c:out value="${resultVO.classApplyNo}"/></td>
									<th>클래스비용</th>
									<td><c:out value="${resultVO.classCost}"/></td>
								</tr>
								<tr>
									<th>이미지파일아이디</th>
									<td><c:out value="${resultVO.atchFileId}"/></td>
									<th>외부링크</th>
									<td><c:out value="${resultVO.classWebAdr}"/></td>
								</tr>
								<tr>
									<th>주소</th>
									<td colspan="4"><c:out value="${resultVO.classAdr}"/></td>
								</tr>
							</tbody>
						</table>
					</div>
				</form:form>
				<div class="T_btnLayer fr">
					<a href="#" onclick="javascript:fn_updateClass();"><button type="button" class="blueBtn L">수정</button></a>
					<a href="#" onclick="javascript:fn_deleteClass();"><button type="button" class="blueBtn L">삭제</button></a>
					<a href="#" onclick="javascript:fn_selectClassList();"><button type="button" class="blueBtn L">목록</button></a>
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
	//수정
	fn_updateClass = function() {
		if (confirm("수정 하시겠습니까?")) {
			$('#detailForm').attr("action","${basePath }/classmng/w/m/updateClassMng.do");
			$('#detailForm').submit();
		}
	};
	
	//삭제
	fn_deleteClass = function() {
		if(confirm("삭제 하시겠습니까?")) {
			$('#detailForm').attr("action","${basePath }/classmng/w/n/deleteClassMngProc.do");
			$('#detailForm').submit();
		}
	};
	
	//목록
	fn_selectClassList = function() {
		var frm = document.detailForm;
		frm.action = "<c:url value='${basePath}/classmng/r/m/selectClassMngList.do'/>";
		frm.submit();
	};
	</script>
</body>
</html>
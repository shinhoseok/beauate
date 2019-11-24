<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<meta name="naver-site-verification" content="c03e63b14e10bb3c48bb213c40e148287b19ea7f"/>
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

	<!-- wrap Start -->
	<div class="wrap">
		<!-- container Start -->
		<div class="container">
			<!-- left_menu Start -->
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp" %>
			<!-- left_menu End -->

			<!-- contents Start -->
			<div class="contents">
				<p class="contentTitle">프로그램 관리</p>
				
				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<!-- sub_path End -->
				
				<form:form commandName="programVO" id="detailForm" name="detailForm" method="post" >
					<form:hidden path="pgmId" />
					<form:hidden path="sortSubject"/>
					<form:hidden path="sortDescend"/>
					<form:hidden path="searchCondition"/>
					<form:hidden path="searchKeyword"/>
					<form:hidden path="pageIndex"/>
					
					<!-- program_detail_content_table Start -->
					<h4 class="contentTitle_h4">프로그램 상세내용</h4>
					<div class="tableLayer">
						<table class="table">
							<caption>프로그램 상세내용</caption>
							<colgroup>
								<col width="150px"/>
								<col width="340px"/>
								<col width="150px"/>
								<col width="340px"/>
							</colgroup>
							<tbody class="line">
								<tr>
									<th>프로그램명</th>
									<td><c:out value="${resultVO.pgmName}"></c:out></td>
									<th>변수명</th>
									<td><c:out value="${resultVO.pgmParam}"></c:out></td>
								</tr>
								<tr>
									<th>프로그램 대표 URL</th>
									<td colspan="4"><c:out value="${resultVO.pgmUrl}"></c:out></td>
								</tr>
								<tr>
									<th>설명</th>
									<td colspan="4"><c:out value="${resultVO.pgmDes}"></c:out></td>
								</tr>
								<c:if test="${resultVO.atchFileId ne null}"> 
									<tr>
			                            <th scope="row">첨부파일</th>
			                            <td colspan="4">                                                               
			                                <c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
			                					<c:param name="param_atchFileId" value="${resultVO.atchFileId}" />
			                				</c:import>                                
			                            </td> 
			                        </tr>
								</c:if>
							</tbody>
						</table>
					</div>
					<!-- program_detail_content_table End -->

					<!-- buttons Start -->
					<div class="T_btnLayer fr">
						<c:if test="${sessionScope.loginVO.menuRlDiv eq 'z' || (sessionScope.loginVO.menuRlDiv eq 'w' && sessionScope.loginVO.usrId eq programVO.rgId) }">
							<a href="#" onclick="javascript:fn_updateProgram();"><button type="button" class="blueBtn L">수정</button></a>
							<a href="#" onclick="javascript:fn_deleteProgram();"><button type="button" class="blueBtn L">삭제</button></a>
						</c:if>
						<a href="#" onclick="javascript:fn_programList();"><button type="button" class="blueBtn L">목록</button></a>
					</div>
					<!-- buttons End -->
				</form:form>
			</div>
			<!-- contents End -->
		</div>
		<!-- container End -->
	</div>
	<!-- wrap End-->

	<!-- footer // -->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- // footer -->
	
	<script>
		//수정
		fn_updateProgram = function() {
			if (confirm("수정 하시겠습니까?")) {
				$('#detailForm').attr("action","${basePath }/program/w/m/updateProgram.do");
				$('#detailForm').submit();
			}
		};
		
		//삭제
		fn_deleteProgram = function() {
			if(confirm("삭제 하시겠습니까?")) {
				$('#detailForm').attr("action","${basePath }/program/w/n/deleteProgramProc.do");
				$('#detailForm').submit();
			}
		};
		
		//목록
		fn_programList = function() {
			var frm = document.detailForm;
			frm.action = "<c:url value='${basePath}/program/r/m/selectProgramList.do'/>";
			frm.submit();
		};
		
		//HTML 로딩후
		$(document).ready(function(){
		});
	</script>
</body>
</html>

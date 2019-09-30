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
	<script type="text/javascript" src="${scriptPath}/egovframework/EgovMultiFile.js" ></script>
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
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp" %>
			<!-- left_menu End -->
			<div class="contents">
				<p class="contentTitle">게시판 관리 수정</p>
				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<form:form commandName="boardVO" name="boardVO" id="boardVO" method="post" enctype="multipart/form-data" action="${basePath}/boardm/w/n/updateBoardMngProc.do" onsubmit="return false;">
					<form:hidden path="postId" />
					<form:hidden path="sortSubject" />
					<form:hidden path="sortDescend" />
					<form:hidden path="searchCondition" />
					<form:hidden path="searchKeyword" />
					<form:hidden path="pageIndex" />
					<form:hidden path="atchFileId" />
					<!-- sub_path End -->
					<h4 class="contentTitle_h4">게시판 정보</h4>
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
									<th>게시판 구분</th>
									<td colspan="4">
										<form:select path="postCategorySt" id="postCategorySt" onchange="javascript:fn_boardCategoryChg();" style="width: 90%">
											<form:options items="${boardCateGoryList }" itemLabel="mclsNm" itemValue="mclsCd"/>
										</form:select>
									</td>
								</tr>
								<tr>
									<th class="bullet_orange">제목</th>
									<td colspan="4">
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="postTitle" id="postTitle" style="width: 90%" onfocus="checker(this, 100 , 'nbytes_postTitle');" onblur="stopchecker();"/>
											&nbsp;[<span id="nbytes_postTitle" class="color_red">0</span>/100]byte
										</div>
									</td>
								</tr>
								<c:choose>
									<c:when test="${boardVO.postSubTitle eq 'Y' || boardVO.postSubTitle eq 'N'} ">
										<tr id="importYnTr">
											<th class="bullet_orange">중요여부</th>
											<td colspan="4">
												<form:select path="postSubTitle" id="postSubTitle" style="width: 90%">
													<option>N</option>
													<option>Y</option>
												</form:select>
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr id="subTitileTr">
											<th class="bullet_orange">서브타이틀</th>
											<td colspan="4">
												<div class="commonSearch_wrap">
													<label class="blind" for=" ">d</label>
													<form:input path="postSubTitle" id="postSubTitle" style="width: 90%" onfocus="checker(this, 100 , 'nbytes_postSubTitle');" onblur="stopchecker();"/>
													&nbsp;[<span id="nbytes_postSubTitle" class="color_red">0</span>/100]byte
												</div>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
								<th>내용</th>
								<td colspan="4" class="pdtb3">
									<form:textarea path="postCtt" rows="5" style="width: 90%" onfocus="checker(this, 500 , 'nbytes_postCtt');" onblur="stopchecker();"/>
									&nbsp;[<span id="nbytes_postCtt" class="color_red">0</span>/500]byte
								</td>
								<!-- 공지사항은 이미지 없음 -->
								<tr id="imgUploadTr">
									<th colspan="2"><span class="thstar"></span>
										이미지(목록1, 상세1 순으로 등록)
									</th>
									<td colspan="4">
										<input class="hideFile" name="file_1" id="egovComFileUploader" type="file" title="첨부파일입력" />
										<span id="atchFileNot" style="margin-left: 5px; display: none;">(* 첨부파일을 더 이상 등록 할 수 없습니다.)</span>
										<div class="download_list" id="egovComFileList"></div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form:form>
				<!-- buttons Start -->
					<div class="T_btnLayer fr">
						<a href="#" onclick="javascript:fn_updateBoardMngProc();"><button type="button" class="blueBtn L">수정</button></a>
						<a href="#" onclick="javascript:fn_selectBoardMngDetail();"><button type="button" class="blueBtn L">취소</button></a>
					</div>
					<!-- buttons End -->
			</div>
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<!-- footer Start-->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- footer End -->
	<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
	<script type="text/javascript" src="${scriptPath}/common.js"></script>
	<script type="text/javascript">
	makeFileAttachment = function() {
		var existFileNum = $("#fileListCnt").val();
		var maxFileNum = 2;
		var uploadableFileNum = maxFileNum - existFileNum;
		if (uploadableFileNum < 0) {
			uploadableFileNum = 0;
		}
		multi_selector = new MultiSelector(document.getElementById('egovComFileList'), maxFileNum, existFileNum);
		multi_selector.addElement(document.getElementById('egovComFileUploader'));
		if (uploadableFileNum != 0) {
			document.getElementById('egovComFileUploader').disabled = false;
		}
	};
	//HTML 로딩후
	$(document).ready(function() {
		makeFileAttachment();
	});
	
	//수정
	var fn_updateBoardMngProc = function() {
		if (!confirm("수정 하시겠습니까?")) {
			return;
		}
		document.boardVO.submit();
	};

	//취소 - 상세정보로 돌아감
	fn_selectBoardMngDetail = function() {
		var frm = document.boardVO;
		frm.action = "<c:url value='${basePath}/boardm/r/m/selectBoardMngDetail.do'/>";
		frm.submit();
	};
	</script>
</body>
</html>

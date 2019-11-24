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
	<link rel="stylesheet" type="text/css" href="${cssPath }/windowPop.css">
	<!-- 스크립트 선언 -->
	<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js" ></script>
	<script type="text/javascript" src="${scriptPath}/egovframework/EgovMultiFile.js" ></script>
	<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
	<script type="text/javascript" src="${scriptPath}/common.js"></script>
	<script type="text/javascript" src="${scriptPath}/jquery/jquery.blockUI.js"></script>
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
				<p class="contentTitle">게시판 관리</p>
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<h4 class="contentTitle_h4">로그인 정보</h4>
				<form:form commandName="boardVO" name="boardVO" id="boardVO" method="post" enctype="multipart/form-data" action="${basePath}/boardm/w/m/insertBoardMngProc.do" >
					<form:hidden path="couponId" id="couponId"/>
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
									<th class="bullet_orange">게시판 카테고리</th>
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
								<tr id="subTitileTr">
									<th class="bullet_orange">서브타이틀</th>
									<td colspan="4">
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="postSubTitle" id="postSubTitle_1" style="width: 90%" onfocus="checker(this, 100 , 'nbytes_postSubTitle');" onblur="stopchecker();"/>
											&nbsp;[<span id="nbytes_postSubTitle" class="color_red">0</span>/100]byte
										</div>
									</td>
								</tr>
								<tr style="display: none;" id="importYnTr">
									<th class="bullet_orange">공지종류(중요A, 일반B)</th>
									<td colspan="4">
										<form:select path="postSubTitle" id="postSubTitle_2" style="width: 90%" disabled="true">
											<option>A</option>
											<option>B</option>
										</form:select>
									</td>
								</tr>
								<th>내용</th>
								<td colspan="4" class="pdtb3">
									<form:textarea path="postCtt" rows="5" style="width: 90%" onfocus="checker(this, 500 , 'nbytes_postCtt');" onblur="stopchecker();"/>
									&nbsp;[<span id="nbytes_postCtt" class="color_red">0</span>/500]byte
								</td>
								<tr id="imgUploadTr">
									<th colspan="2"><span class="thstar"></span>
										이미지(목록1, 상세1 순으로 등록)<br/>
										공지사항(쿠폰)은 홈페이지1,모바일1 순으로 등록
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
				<div class="T_btnLayer fr">
					<a href="javascript:void(0);" id="couponBtn" onclick="javascript:fn_couponUsed();" style="display: none;"><button type="button" class="blueBtn L">쿠폰적용</button></a>
					<a href="javascript:void(0);" onclick="javascript:fn_insertBoardMngProc();"><button type="button" class="blueBtn L">등록</button></a>
					<a href="${basePath }/boardm/r/m/selectBoardMngList.do"><button type="button" class="blueBtn L">취소</button></a>
				</div>
			</div>
		</div>
		<!--container End-->
	</div>
	<div id="windowPopup" style="display: none;"></div>
	<!--wrap End-->
	<!-- footer Start-->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- footer End -->
<script type="text/javascript">
var maxFileNum = 2;
makeFileAttachment = function(){
	multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum, 0);
	multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
};

//HTML 로딩 후 첨부파일로딩 
$(document).ready(function(){
	makeFileAttachment();
});

//게시판 카테고리 선택시
var fn_boardCategoryChg = function() {
	var postCategorySt = $("#postCategorySt").val();
	//공지사항일 때 쿠폰사용, 중요여부 show, 서브타이틀 hide
	if(postCategorySt == '4') {
		$("#couponBtn").show();
		$("#importYnTr").show();
		$("#subTitileTr").hide();
		$("#postSubTitle_1").attr("disabled",true);
		$("#postSubTitle_2").attr("disabled",false);
	} else {
		$("#couponBtn").hide();
		$("#importYnTr").hide();
		$("#subTitileTr").show();
		$("#postSubTitle_1").attr("disabled",false);
		$("#postSubTitle_2").attr("disabled",true);
	}
};

//게시판 등록
var fn_insertBoardMngProc = function() {
	alert($("#boardVO #couponId").val());
	document.boardVO.submit();
};

//공지사항 쿠폰사용 팝업
var fn_couponUsed = function() {
	$.ajax({ 
		url: "${basePath}/boardm/r/n/selectCouponList.do",
		type: 'POST',
		dataType : 'html',
		error: function(){
			alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
		},
		success: function(r){
			$("#windowPopup").html(r);
		}
	}); 
	$.blockUI({message:$("#windowPopup"),css:{width:"0%",height:"0%",position:"absolute",left:"25%",top:"20%", textAlign:"left"}});
};

var fn_PopClose = function(couponId) {
	if(couponId !== undefined ){
		$("#boardVO #couponId").val(couponId);
		alert(couponId+" 쿠폰이 적용되었습니다.");
	} 
	$.unblockUI();
	$("#windowPopup").empty();
};
</script>
</body>
</html>

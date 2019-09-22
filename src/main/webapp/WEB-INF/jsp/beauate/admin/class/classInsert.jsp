<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>BASIC</title>
<!--공통css-->
<link rel="stylesheet" type="text/css" href="${cssPath}/common.css">
<link rel="stylesheet" href="${scriptPath}/jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css" />
<!--현업 main page-->
<link rel="stylesheet" type="text/css" href="${cssPath}/worksite.css">
<!-- 스크립트 선언 -->
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="${scriptPath}/jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
<script type="text/javascript" src="${scriptPath}/commonDate.js"></script>
<script type="text/javascript" src="${scriptPath}/egovframework/EgovMultiFile.js" ></script>
<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
<script type="text/javascript" src="${scriptPath}/common.js"></script>
</head>
<body>
	<!-- header Start -->
	<div class="header">
		<jsp:include page="/WEB-INF/jsp/beauate/common/top.jsp" flush="false" />
	</div>
	<!--header End-->
	<div class="wrap">
		<div class="container">
			<!-- left_menu Start -->
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp" %>
			<!-- left_menu End -->
			<div class="contents">
				<p class="contentTitle">오프라인클래스 등록</p>
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<h4 class="contentTitle_h4">클래스 정보</h4>
				<form:form commandName="classVO" name="classVO" id="classVO" method="post" enctype="multipart/form-data" action="${basePath}/classmng/w/m/insertOffClassProc.do" >
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
									<th>클래스신청자 이메일</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="usrId" id="usrId" style="width: 240px;" type="text" onfocus="checker(this, 50 , 'nbytes_usrId');" onblur="stopchecker();"/>
											&nbsp;[<span id="nbytes_usrId" class="color_red">0</span>/50]byte
										</div>
									</td>
									<th>클래스 제목</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="classTitle" id="classTitle" style="width: 240px;" type="text" onfocus="checker(this, 50 , 'nbytes_classTitle');" onblur="stopchecker();"/>
											&nbsp;[<span id="nbytes_classTitle" class="color_red">0</span>/50]byte
										</div>
									</td>
								</tr>
								<tr>
									<th>클래스 시작일</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="classStartDt" type="text" id="classStartDt"/>
										</div>
									</td>
									<th>클래스 종료일</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="classEndDt" type="text" id="classEndDt"/>
										</div>
									</td>
								</tr>
								<tr>
									<th>클래스 시간</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="classTime" id="classTime" style="width: 240px;" type="text" onfocus="checker(this, 50 , 'nbytes_classTime');" onblur="stopchecker();"/>
											&nbsp;[<span id="nbytes_classTime" class="color_red">0</span>/50]byte
										</div>
									</td>
									<th>최소인원</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="classSmallNo" id="classSmallNo" style="width: 240px;" type="text" onfocus="checker(this, 30 , 'nbytes_classSmallNo');" onblur="stopchecker();"/>
											&nbsp;[<span id="nbytes_classSmallNo" class="color_red">0</span>/30]byte
										</div>
									</td>
								</tr>
								<tr>
									<th>최대인원</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="classBigNo" id="classBigNo" style="width: 240px;" type="text" onfocus="checker(this, 30 , 'nbytes_classBigNo');" onblur="stopchecker();"/>
											&nbsp;[<span id="nbytes_classBigNo" class="color_red">0</span>/30]byte
										</div>
									</td>
									<th>신청인원</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="classApplyNo" id="classApplyNo" style="width: 240px;" type="text" onfocus="checker(this, 30 , 'nbytes_classApplyNo');" onblur="stopchecker();"/>
											&nbsp;[<span id="nbytes_classApplyNo" class="color_red">0</span>/30]byte
										</div>
									</td>
								</tr>
								<tr>
									<th>클래스비용</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="classCost" id="classCost" style="width: 240px;" type="text" onfocus="checker(this, 30 , 'nbytes_classCost');" onblur="stopchecker();"/>
											&nbsp;[<span id="nbytes_classCost" class="color_red">0</span>/30]byte
										</div>
									</td>
									<th>외부링크주소</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="classWebAdr" id="classWebAdr" style="width: 240px;" type="text" onfocus="checker(this, 50 , 'nbytes_classWebAdr');" onblur="stopchecker();"/>
											&nbsp;[<span id="nbytes_classWebAdr" class="color_red">0</span>/50]byte
										</div>
									</td>
								</tr>
								<tr>
									<th class="bullet_orange">클래스상태</th>
									<td>
									<form:select path="classSt" id="classSt">
										<form:options items="${rslt.classStList}" itemLabel="mclsNm"  itemValue="mclsCd"/>
									</form:select>
									<th class="bullet_orange">클래스구분</th>
									<td>
									<form:select path="classGb" id="classGb">
										<form:options items="${rslt.classGbList}" itemLabel="mclsNm"  itemValue="mclsCd"/>
									</form:select>
								</tr>
								<tr>
									<th class="bullet_orange">클래스 카테고리</th>
									<td>
									<form:select path="classCtSt" id="classCtSt">
										<form:options items="${rslt.classCategoryList}" itemLabel="mclsNm"  itemValue="mclsCd"/>
									</form:select>
									<th class="bullet_orange">지역</th>
									<td>
									<form:select path="classAreaSt" id="classAreaSt">
										<form:options items="${rslt.classAreaList}" itemLabel="mclsNm"  itemValue="mclsCd"/>
									</form:select>
								</tr>
								<tr>
									<th class="bullet_orange">주소</th>
									<td colspan="4">
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="classAdr" id="classAdr" style="width: 680px;" onfocus="this.blur();"/>
											<div class="T_btnLayer fr">
												<a href="javascript:void(0);" onclick="fn_jusoPopup();"><button type="button" class="blueBtn L">주소찾기</button></a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th colspan="2"><span class="thstar"></span>
										이미지 등록 (상세대표이미지1장, 상세슬라이드1~5장, 메인이미지 크기 큰 순서로 3장)
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
					<a href="#" onclick="javascript:fn_insertClassProc();"><button type="button" class="blueBtn L">등록</button></a>
					<a href="${basePath }/classmng/r/m/selectClassMngList.do" ><button type="button" class="blueBtn L">취소</button></a>
				</div>
			</div>
		</div>
		<!--container End-->
	</div>
	<!-- footer Start-->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- footer End -->
	
<script type="text/javascript">
var maxFileNum = 9;
makeFileAttachment = function(){
	multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum, 0);
	multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
};

//HTML 로딩 후 첨부파일로딩 
$(document).ready(function(){
	makeFileAttachment();
	DefaultDatePicker($("#classStartDt"), "yy-mm-dd", 10, "${imagePath}");
	DefaultDatePicker($("#classEndDt"), "yy-mm-dd", 10, "${imagePath}");
});

var fn_insertClassProc = function() {
	var usrId = $("#usrId").val();
	if (!TypeChecker.email($("#usrId").val())) {
		alert("이메일은 "+TypeChecker.emailText);
		$("#usrId").focus();
		return;
	}
	//등록된 아이디인지 여부체크
	$.ajax({ 	
		url: "${basePath}/classmng/r/n/selectUserIdChk.do",
		type: 'POST',
		dataType : "json",
		data : {"usrId" : usrId},
		error: function(){
			 alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) {
			if( r.result == usrId ) {
				alert("없는 아이디 입니다. 다른값으로 입력바랍니다.");
				$("#usrId").focus();
				return;
			} else{
				$("#usrId").val(r.result);
				alert("상태값 >>>> "+$("#classSt").val());
				document.classVO.submit();
			}
		}
	}); 
};

//주소찾기 팝업 도로명API
var fn_jusoPopup = function() {
	var pop = window.open("/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
}
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.
// 	document.userVO.classAdr.value = roadFullAddr;
// 	var fullAddr = roadAddrPart1 + " " + addrDetail
// 	alert(roadFullAddr);
	document.classVO.classAdr.value = roadFullAddr;
//		document.form.roadAddrPart2.value = roadAddrPart2;
	
// 	document.userVO.zip_no.value = zipNo;
}
</script>
</body>
</html>

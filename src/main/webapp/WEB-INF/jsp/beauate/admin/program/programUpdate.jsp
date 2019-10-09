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
<body onload="fn_focusingForChecker()">
	<!-- header Start -->
	<div class="header">
		<jsp:include page="/WEB-INF/jsp/beauate/common/top.jsp" flush="false" />
	</div>
	<!-- header End -->
	
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
				
				<form:form commandName="resultVO" name="resultVO" id="resultVO" method="post" enctype="multipart/form-data" action="${basePath}/program/w/n/updateProgramProc.do" onsubmit="return false;">
					<input type="hidden" name="pgmId" value="<c:out value='${programVO.pgmId}'/>"></input>
					<input type="hidden" name="sortSubject" value="<c:out value='${programVO.sortSubject}'/>"></input>
					<input type="hidden" name="sortDescend" value="<c:out value='${programVO.sortDescend}'/>"></input>
					<input type="hidden" name="searchCondition" value="<c:out value='${programVO.searchCondition}'/>"></input>
					<input type="hidden" name="searchKeyword" value="<c:out value='${programVO.searchKeyword}'/>"></input>
					<input type="hidden" name="pageIndex" value="<c:out value='${programVO.pageIndex}'/>"></input>

					<!-- program_modify_table Start -->
					<h4 class="contentTitle_h4">프로그램 수정</h4>
					<div class="tableLayer">
						<table class="table">
							<caption>프로그램 수정</caption>
							<colgroup>
								<col width="150px"/>
								<col width="340px"/>
								<col width="150px"/>
								<col width="340px"/>
							</colgroup>
							<tbody class="line">
								<tr>
									<th class="bullet_orange">프로그램명</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="pgmName" style="width: 240px;" type="text" onfocus="checker(this, 30 , 'nbytes_pgmName');" onblur="stopchecker();"/>
											&nbsp;[<span id="nbytes_pgmName" class="color_red">0</span>/30]byte
										</div>
									</td>
									<th class="bullet_orange">변수명</th>
									<td>
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="pgmParam" style="width: 240px;" type="text" onfocus="checker(this, 20 , 'nbytes_pgmParam');" onblur="stopchecker();"/>
											&nbsp;[<span id="nbytes_pgmParam" class="color_red">0</span>/20]byte
										</div>
									</td>
								</tr>
								<tr>
									<th class="bullet_orange">프로그램 대표 URL</th>
									<td colspan="4">
										<div class="commonSearch_wrap">
											<label class="blind" for=" ">d</label>
											<form:input path="pgmUrl" style="width: 730px;" type="text" onfocus="checker(this, 50 , 'nbytes_pgmUrl');" onblur="stopchecker();"/>
											&nbsp;[<span id="nbytes_pgmUrl" class="color_red">0</span>/50]byte
										</div>
									</td>
								</tr>
								<tr>
									<th>설명</th>
									<td colspan="4" class="pdtb3"> <!-- textarea 의 경우는 td에  class="pdtb3" 패딩 클래스 추가 -->
										<form:textarea path="pgmDes" rows="5" onfocus="checker(this, 200 , 'nbytes_pgmDes');" onblur="stopchecker();"/><br/>
										&nbsp;[<span id="nbytes_pgmDes" class="color_red">0</span>/200]byte
									</td>
								</tr>
								<tr>
		                            <th scope="row" rowspan="2"><span class="thstar"></span>첨부파일</th>
		                            <td colspan="4">
		                                <input class="hideFile" name="file_1" id="egovComFileUploader" type="file" title="첨부파일입력"/>
		                                <img src="${imagePath}/btn_plus.png" alt="" class="FileBtn" />
		                                <span id="atchFileNot" style="margin-left:5px;display:none;">(* 첨부파일을 더 이상 등록 할 수 없습니다.)</span>  
		                            	<c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
		                					<c:param name="param_atchFileId" value="${resultVO.atchFileId}" />
		                				</c:import>     
		                            </td> 
		                        </tr>
							</tbody>
						</table>
					</div>
					<!-- program_modify_table End -->

					<!-- buttons Start -->
					<div class="T_btnLayer fr">
						<a href="#" onclick="javascript:fn_updateProgramProc();"><button type="button" class="blueBtn L">수정</button></a>
						<a href="#" onclick="javascript:fn_programDetail();"><button type="button" class="blueBtn L">취소</button></a>
					</div>
					<!-- buttons End -->
				</form:form>
			</div>
			<!-- contents End -->
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	
	<!-- footer Start-->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- footer End -->
	
	<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
	<script type="text/javascript" src="${scriptPath}/common.js"></script>
	<script>
		//body가 load가 완료시 input(pgmName, pgmParam, pgmUrl, pgmDes)에 focus를 주어서 cheker()실행함으로서
		//input폼을 클릭(onfocus)를 해야만 checker()가 실행되고 글자수검사가 이루어지는 것을 해결.
		fn_focusingForChecker = function() {
			var target = $('input[id^="pgm"]');
			
			target.push($('textarea'));

			var length = target.length;
			for(i = 0; i < length; i++) {
				target[i].focus();
			}
			target.blur();
		}
	
		//수정
		fn_updateProgramProc = function(){
			if (!TypeChecker.required($("#pgmName").val())) {
				alert("'프로그램명'은  "+ TypeChecker.requiredText);
				$("#pgmName").focus();
				return;
			}
			
			if (!TypeChecker.required($("#pgmParam").val())) {
				alert("'프로그램 변수명'은  "+ TypeChecker.requiredText);
				$("#pgmParam").focus();
				return;
			}
			
	 		if (!TypeChecker.alphanum($("#pgmParam").val())) {
				alert("'프로그램 변수명'은 "+TypeChecker.alphanumText);
				$("#pgmParam").focus();
				return;
			}
	 		
	 		if (!TypeChecker.required($("#pgmUrl").val())) {
				alert("'프로그램 대표 URL'은  "+ TypeChecker.requiredText);
				$("#pgmUrl").focus();
				return;
			}

	 		if (!TypeChecker.programUrl($("#pgmUrl").val())) {
				alert("'프로그램 대표 URL'은  "+ TypeChecker.programUrlText);
				$("#pgmUrl").focus();
				return;
			}

			if ($("#pgmUrl").val().indexOf('/' + $("#pgmParam").val().trim() + '/') == '-1') {
				alert("'프로그램 URL'은 '프로그램변수명'를 맨앞에 포함된 형태가 되어야합니다.");
				$("#pgmUrl").focus();
				return;
			}
			
			if(!confirm("수정 하시겠습니까?")){
				return;
			}
			//중복체크
			$.ajax(
			{ 	url: "${basePath}/program/a/n/pgmParamChk.do",
				type: 'POST',
				dataType : "json",
				data : $("#resultVO").serialize(),
				error: function() {
					alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
					return;
				},
				success: function(r) {
					
					if(r.chkResult == 'N') {
						alert("프로그램 변수명이 중복되었습니다 다른값으로 입력바랍니다.");
						$("#pgmParam").focus();
						return;
						} else {
						document.resultVO.submit();
					}
				}
			});
		};
		
		//취소 - 상세정보로 돌아감
		fn_programDetail = function() {
			var frm = document.resultVO;
			frm.action = "<c:url value='${basePath}/program/r/m/selectProgram.do'/>";
			frm.submit();
		};
		
		makeFileAttachment = function(){
	    	
			 var existFileNum = $("#fileListCnt").val();

			 var maxFileNum = 3;
			 
		     var uploadableFileNum = maxFileNum - existFileNum;
			 if (uploadableFileNum<0) {
				 uploadableFileNum = 0;
			 }
			 
	   		 multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum, existFileNum );
	   		 multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
			 if (uploadableFileNum != 0) {
	    		 document.getElementById( 'egovComFileUploader' ).disabled = false;
			 }
		};
		
		//HTML 로딩후
		$(document).ready(function(){
			makeFileAttachment();
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<%

/**
  * @Class Name : EgovFileList.jsp
  * @Description : 파일 목록화면
  * @Modification Information
  * @
  * @  수정일   	수정자		수정내용
  * @ ----------	------		---------------------------
  * @ 2009.03.26	이삼섭		최초 생성
  * @ 2011.07.20	옥찬우		<Input> Tag id속성 추가( Line : 68 )
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.26
  *  @version 1.0
  *  @see
  *
  */
%>
<!-- link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css"-->

<script type="text/javascript">
	var multi_selector;
	$.ajaxSetup({cache:false});
	function fn_egov_downFile(atchFileId, fileSn){
		window.open("<c:url value='/cmm/fms/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"'/>");
	}

	function fn_egov_deleteFile(atchFileId, fileSn, obj) {
		forms = document.getElementsByTagName("form");

		for (var i = 0; i < forms.length; i++) {
			if (typeof(forms[i].atchFileId) != "undefined" &&
					typeof(forms[i].fileSn) != "undefined" &&
					typeof(forms[i].fileListCnt) != "undefined") {
				form = forms[i];
			}
		}

		//form = document.forms[0];
		form.atchFileId.value = atchFileId;
		form.fileSn.value = fileSn;
		
		if( confirm("삭제하시면 복구하 실 수 없습니다.\n정말 삭제하시겠습니까?") ) {
		    
	    	$.ajax({
				async: false,
				url: "<c:url value='/cmm/fms/deleteFileInfs.do'/>",
				dataType: "json",
				type: "post",
				data: {atchFileId : form.atchFileId.value,
				       fileSn     : form.fileSn.value,
				       returnUrl  : ""
					},
				error: function(request, status, error) { alert("code:"+request.status+"\nerror:"+error); },
				success: function(ret) {	
					multi_selector.count--;
			    	multi_selector.current_element.disabled = false;
			    	multi_selector.showMessage(false);
			    	$(obj).parent("div").remove();
			    	//제거를 해주면 카운트도 1빼준다.
			    	$("#fileListCnt").val(Number($("#fileListCnt").val())-1);
		    	}
			});
		}
	}

	function fn_egov_check_file(flag) {
		if (flag=="Y") {
			document.getElementById('file_upload_posbl').style.display = "block";
			document.getElementById('file_upload_imposbl').style.display = "none";
		} else {
			document.getElementById('file_upload_posbl').style.display = "none";
			document.getElementById('file_upload_imposbl').style.display = "block";
		}
	}
</script>

<!-- <form name="fileForm" action="" method="post" >  -->
<input type="hidden" name="atchFileId" value="${atchFileId}">
<input type="hidden" name="fileSn" >
<input type="hidden" name="fileListCnt" id="fileListCnt" value="${fileListCnt}">

<!-- </form>  -->

<!--<title>파일목록</title> -->
	<div class="download_list" id="egovComFileList">
		<c:forEach var="fileVO" items="${fileList}" varStatus="status">	
            <div>	
				<c:choose>
					<c:when test="${updateFlag=='Y'}">
						<c:out value="${fileVO.orignlFileNm}"/>&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]
						<img style="cursor: pointer;" src="<c:url value='${imagePath }/bu_icon_delete.gif' />"
							width="48" height="20" onClick="fn_egov_deleteFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>', this);" alt="파일삭제"/>
					</c:when>
					<c:otherwise>
						<a href="#none" onclick="javascript:fn_egov_downFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>')">
							<c:out value="${fileVO.orignlFileNm}"/>&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]
						</a>
					</c:otherwise>
				</c:choose>
			</div>
		</c:forEach>
		<c:if test="${fn:length(fileList) == 0}">
			<div style="display: inline;"></div>	
	    </c:if>
	</div>


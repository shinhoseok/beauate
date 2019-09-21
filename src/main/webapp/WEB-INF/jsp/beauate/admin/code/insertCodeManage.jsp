<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	
	<title>BASIC</title>
	<!--공통css-->
	<link rel="stylesheet" type="text/css" href="${cssPath}/common.css">
	<!--현업 main page-->
	<link rel="stylesheet" type="text/css" href="${cssPath}/worksite.css">
	<!-- 스크립트 선언 -->
	<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js" ></script>
</head>
<body>
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
            	<p class="contentTitle">공통코드관리</p>
            	
            	<!-- sub_path Start -->
                <p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<!-- sub_path End -->
				
				<form:form commandName="codeVO" name="codeVO" method="post" action="${basePath}/code/z/n/insertCode.do" >		            
		            <!-- 등록박스// -->
               		<h4 class="contentTitle_h4">코드관리 등록</h4>
               		<div class="tableLayer"> 
                   		<table class="table">
                       		<caption>권한관리생성</caption>
                      			<colgroup>
	                            <col width="15%" /> 
	                            <col width="33%" />
	                            <col width="15%" /> 
	                            <col width="33%" />
                      			</colgroup>
                      			<tbody class="line">
		                            <tr>
		                                <th class="bullet_orange">대분류코드</th>
			                                <td>
				                                <div class="commonSearch_wrap">
				                                	<form:input cssStyle="width:100%" cssClass="bdcolor" path="lclsCd" onfocus="checker(this, 3 , 'nbytes_lclsCd');" onblur="stopchecker();" />
				                                </div>
				                            </td>
				                        <th class="bullet_orange">대분류명</th>
				                            <td>
				                                <div class="commonSearch_wrap">
				                            	    <form:input cssStyle="width:100%" cssClass="bdcolor" path="lclsNm" onfocus="checker(this, 20 , 'nbytes_lclsNm');" onblur="stopchecker();" />
				                                </div>
			                                </td>
		                            </tr>
		                            <tr>
		                                <th class="bullet_orange">대분류코드설명</th>
		                                <td colspan="3" class="pdtb3"><form:textarea rows="5" path="lclsEpl" id="lclsEpl" onfocus="checker(this, 50 , 'nbytes_lclsEpl');" onblur="stopchecker();" /></td>
		                            </tr>
		                            <tr>
		                                <th class="bullet_orange">사용여부</th>
		                                <td colspan="3"><form:radiobutton path="useYn" value="Y" checked="checked"/> Y &nbsp;&nbsp;&nbsp;<form:radiobutton path="useYn" value="N" /> N</td> 
		                            </tr>
	                        </tbody>
                   		</table>
               		</div>
		            <!-- //등록박스 -->
		            <!-- 버튼// -->
					<div class="T_btnLayer fr">
						<a href="#" onclick="javascript:fn_insertCodeProc();"><button type="button" class="blueBtn L">완료</button></a>
						<a href="#" onclick="javascript:fn_cancel();"><button type="button" class="blueBtn L">취소</button></a>
					</div>
					<!-- //버튼 -->  
	            
               	 </form:form>                                       
            </div>
            
        </div><!--container End-->
        
    </div><!--wrap End-->	            


<script>

	//HTML 로딩후
	$(document).ready(function(){
		
	});
	
	fn_insertCodeProc = function(){
		
		var check = /[^0-9A-Za-z\s]/g;
		
		if($("#lclsCd").val()==''){
			alert("대분류코드를 입력하세요.");
			return;
		}
		
		if(check.test($("#lclsCd").val()) || $("#lclsCd").val().length > 3){
			alert("대분류코드는 영문, 숫자 3자리 이하로 제한됩니다.");
			return;
		}
		
		if($("#lclsNm").val()==''){
			alert("대분류명을 입력하세요.");
			return;
		}
		
		if($("#lclsEpl").val()==''){
			alert("대분류설명을 입력하세요.");
			return;
		}
		
		$.ajax({
			url:"${basePath}/code/z/n/lclsCdChk.do",
			type: 'POST',
			dataType: "json",
			data: $("#codeVO").serialize(),
			error: function(){
				alert("현재 조회 서비스가 원활하지 않습니다. \n잠시 후 다시 이용해 주십시요.");
				return;
			},
			success: function(r){
				if(r.chkResult == 'N'){
					alert("중복되는 대분류코드입니다. 다른 값으로 입력바랍니다.");
					$("#lclsCd").focus();
					return;
				}else{
					if(!confirm("등록 하시겠습니까?")){
				  		return;
					}
					document.codeVO.submit();
				}
			}
		});
	    
	};
	
	fn_cancel = function(){
		location.replace("<c:url value='${basePath}/code/r/m/selectCodeManageList.do'/>");
	};

</script>
</body>
</html>
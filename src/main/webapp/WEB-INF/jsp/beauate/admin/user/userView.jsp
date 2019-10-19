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
				<p class="contentTitle">사용자 목록</p>
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
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
								<th>이름</th>
								<td><c:out value="${userVO.usrNm}"/></td>
								<th>계정상태</th>
								<td><c:out value="${userVO.userSt}"/></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td colspan="4"><c:out value="${userVO.emailAddr}"/></td>
							</tr>
							<tr>
								<th>가입일</th>
								<td colspan="4"><fmt:formatDate value="${userVO.joinDt}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</tbody>
					</table>
				</div>
				<h4 class="contentTitle_h4">상세 정보</h4>
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
								<th>계정등급</th>
								<td><c:out value="${userVO.rlName}"/></td>
								<th>휴대폰번호</th>
								<td><c:out value="${userVO.mblPno}"/></td>
							</tr>
							<tr>
								<th>최근접속일</th>
								<td><fmt:formatDate value="${userVO.loginDt}" pattern="yyyy-MM-dd"/></td>
								<th>탈퇴일</th>
								<td>
									<c:if test="${empty userVO.userOutDt}">-</c:if>
									<fmt:formatDate value="${userVO.userOutDt}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="T_btnLayer fr">
					<a href="javascript:void(0);" onclick="javascript:fn_userResetPw('${userVO.usrId}');"><button type="button" class="blueBtn L">비번초기화</button></a>
					<a href="${basePath}/usermgr/w/m/userUpdate.do?usrId=${userVO.usrId}"><button type="button" class="blueBtn L">수정</button></a>
					<a href="javascript:void(0);" onclick="javascript:fn_userDeleteProc('${userVO.usrId}');"><button type="button" class="blueBtn L">삭제</button></a>
					<a href="${basePath}/usermgr/r/m/userList.do"><button type="button" class="blueBtn L">목록</button></a>
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
	//비밀번호 초기화
	fn_userResetPw = function(usrId, usrSeq){
		if(confirm("비밀번호를 초기화하시겠습니까?(beauate로 바뀝니다)")){
	    	$.ajax(
	    		{ async: false,
	    		  url: '${basePath}/usermgr/z/n/userPwReset.do',
	    		  type: 'POST',
	    		  data : { usrId : usrId },
	    		  error: function(){
	    			 alert("오류가 발생 하였습니다.\n잠시후 다시 이용해 주십시요.");
	    		  },
	    		  success: function(r){ 
	    			  if(r.updateCnt > 0 ){
	    			  	alert("비밀번호가 beauate 로 초기화 되었습니다");
	    			  }else{
	    				  alert("초기화가 실패하였습니다.\n문의 바랍니다");
	    			  }
	    		}
	    	}); 
		}
	};
	
	//사용자 삭제
	fn_userDeleteProc = function(usrId){ 
		if(confirm("사용자를 삭제 하시겠습니까?")){
	    	$.ajax(
	    		{ async: false,
	    		  url: '${basePath}/usermgr/z/n/userDeleteProc.do',
	    		  type: 'POST',
	    		  data : { usrId : usrId },
	    		  error: function(){
	    			 alert("사용자 삭제시 오류가 발생 하였습니다.\n잠시후 다시 이용해 주십시요.");
	    		  },
	    		  success: function(){ 	
	    			  alert("사용자가 삭제되었습니다.");
    				  document.location.href = "${basePath}/usermgr/r/m/userList.do";
// 	    			  if(r.result){
// 	    				  alert("사용자가 삭제되었습니다.");
// 	    				  document.location.href = "${basePath}/usermgr/r/m/userList.do";
// 	    			  }
	    		}
	    	}); 
		}
	};
	</script>
</body>
</html>

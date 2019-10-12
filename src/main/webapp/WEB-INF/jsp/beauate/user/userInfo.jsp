<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1280"/>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BEAUATE</title>
<link rel="stylesheet" type="text/css" href="${cssPath}/common.css"/>
<link rel="stylesheet" type="text/css" href="${cssPath}/contents.css"/>
<link rel="stylesheet" type="text/css" href="${cssPath}/contents-my1.css"/>
<script type="text/javascript" src="${scriptPath}/jquery.min.js"></script>
<script type="text/javascript" src="${scriptPath}/jquery.modal.min.js"></script>
<script type="text/javascript" src="${scriptPath}/jquery.blockUI.js"></script>
<script type="text/javascript" src="${scriptPath}/ui.front.js"></script>
</head>
<body>
<div id="wrap">
	<div id="skip">
		<a href="#container">본문 내용 바로가기</a>
	</div>
	<!-- header -->
<!-- 	<div id="header"> -->
		<jsp:include page="/WEB-INF/jsp/beauate/ucommon/top.jsp" flush="false" />
<!-- 	</div> -->
	<!-- //header -->
	<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
	<script type="text/javascript" src="${scriptPath}/common.js"></script>
	<script>
	$(document).ready(function($){

        $(".tab_content").hide(); //Hide all content
        //On Click Event
        $("ul.tabs li").click(function() {

            $("ul.tabs li a").removeClass("active"); //Remove any "active" class
            $("a", this).addClass("active"); //Add "active" class to selected tab
            $(".tab_content").hide(); //Hide all tab content

            var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
            $(activeTab).fadeIn(); //Fade in the active ID content
            return false;
        });
        $("ul.tabs li:first").click();

		$("#userVO span.emp").hide();
		$("#userVO input").on('keyup change', function(e) {
			fn_insertUserProc(e);
	    });
	});
	//저장
	var isValid;
	fn_insertUserProc = function(e){
		isValid = true;
		$("#userVO span.emp").hide();
		if((e.type=='keyup' || e.type=='change')==false){
			if($("#userVO #termsAgree").is(":checked")==false){
				alert("뷰아떼 약관에 동의해 주세요.");
				isValid = false;
			}
		}
		if(!$.trim($("#userVO #emailAddr").val())) {
			$("#userVO #emailAddr").parent().next().text("이메일을 입력해 주세요").show();
			//$("#userVO #emailAddr").focus();
			isValid = false;
		}
		if(!$.trim($("#userVO #usrNm").val())) {
			$("#userVO #usrNm").next().text("이름을 입력해 주세요").show();
			//$("#userVO #usrNm").focus();
			isValid = false;
		}
		
		if (!TypeChecker.korEng($("#userVO #usrNm").val())) {
			$("#userVO #usrNm").next().text("이름은 "+TypeChecker.korEngText).show();
			//$("#userVO #usrNm").focus();
			isValid = false;
		}
		if(!$.trim($("#userVO #usrPw").val())) {
			$("#userVO #usrPw").next().text("패스워드 입력해 주세요").show();
			//$("#userVO #usrPw").focus();
			isValid = false;
		}
		//패스워드조합3가지
		if((e.type=='keyup' || e.type=='change')==false){
			if(!fn_checkPass("usrPw")) {
				isValid = false;
			}
		}
		if($("#userVO #usrPw").val() != $("#userVO #user_pw_confirm").val()) {
//				alert($("#userVO #user_pw").val() +" >> "+$("#userVO #user_pw_confirm").val())
			$("#userVO #user_pw_confirm").next().text("패스워드를 확인해주세요").show();
			//$("#userVO #user_pw_confirm").focus();
			isValid = false;
		}
		if (!TypeChecker.email($("#userVO #emailAddr").val())) {
			$("#userVO #emailAddr").parent().next().text("이메일은 "+TypeChecker.emailText).show();
			//$("#userVO #emailAddr").focus();
			isValid = false;
		}
		
		if (!TypeChecker.number($("#userVO #mblPno").val())) {
			$("#userVO #mblPno").next().text("휴대폰 번호는 "+TypeChecker.numberText).show();
			//$("#userVO #mblPno").focus();
			isValid = false;
		}
		if(!isValid){
			return;
		}

		if((e.type=='keyup' || e.type=='change')==true){
			return;
		}
		if(!confirm("등록 하시겠습니까?")){
			return;
		}
		//중복체크
		$.ajax({ 	
			url: "${basePath}/usermgr/a/n/userIdChk.do",    
			type: 'POST',
			dataType : "json",
			data : $("#userVO").serialize(),
			error: function(r){
				$("#modal-joincomfirm p.txt").text(r.message);
				$("#modal-joincomfirm a.modal-close").click(function(){document.location.href='#'});
				$("#modal-joincomfirm").modal('show');
				return;
			},
			success: function(r) { 
				if(r.chkResult == 'N') {
					$("#userVO #emailAddr").parent().next().text("사용자 아이디가 중복되었습니다 다른값으로 입력바랍니다.").show();
					$("#emailAddr").focus();
					return;
				} else{
					//document.userVO.submit();
					//모달창으로 결과 알려줘야하기 때문에 아래 ajax 수행
					$.ajax({ 	
						url: "${basePath}/user/w/n/userInsertProc.do",    
						type: 'POST',
						dataType : "json",
						data : $("#userVO").serialize(),
						error: function(r){
							$("#modal-joincomfirm p.txt").text(r.message);
							$("#modal-joincomfirm a.modal-close").click(function(){document.location.href='#'});
							$("#modal-joincomfirm").modal('show');
						},
						success: function(r) {
							$("#modal-joincomfirm p.txt").text(r.message);
							$("#modal-joincomfirm a.modal-close").click(function(){document.location.href='${basePath}'+r.redirectUrl});
							$("#modal-joincomfirm").modal('show'); 
						}
					}); 
				}
			}
		}); 
	};
	</script>
	<div id="container">

		<!-- content -->
		<div class="content cont-mypage">
			<div class="page-title">
				<div class="content-inner">
					<h2 class="title"><img src="${imagePath}/txt/img-txt-mypage.png" alt="MY PAGE"></h2>
					<p class="title-desc">${sessionScope.loginVO.usrNm}님, 반갑습니다.</p>
				</div>
			</div>
			<div class="cont-nav">
				<ul class="tabs">
					<li><a href="#myClass">My 클래스</a></li>
					<li><a href="#myReview">수강후기</a></li>
					<li><a href="#myCoupon">할인쿠폰</a></li>
					<li><a href="#myPayment">결제내역</a></li>
					<li><a href="#myInfo">내 정보 수정</a></li>
				</ul>
			</div>
    		<div class="tab_container"> <!-- 내가 추가한 부분 -->
				<div id="myClass" class="content-inner tab_content">
					<!-- 1번째탭-->
					<jsp:include page="/WEB-INF/jsp/beauate/user/userInfo/myClass.jsp" flush="false" />
				</div>
				<div id="myReview" class="content-inner tab_content">
					<!-- 2번째탭 -->
					<jsp:include page="/WEB-INF/jsp/beauate/user/userInfo/myReview.jsp" flush="false" />
				</div>
				<div id="myCoupon" class="content-inner tab_content">
					<!-- 3번째탭 -->
					<jsp:include page="/WEB-INF/jsp/beauate/user/userInfo/myCoupon.jsp" flush="false" />
				</div>
				<div id="myPayment" class="content-inner tab_content">
					<!-- 4번째탭 -->
					<jsp:include page="/WEB-INF/jsp/beauate/user/userInfo/myPayment.jsp" flush="false" />
				</div>
				<div id="myInfo" class="content-inner tab_content">
					<!-- 5번째탭 -->
					<jsp:include page="/WEB-INF/jsp/beauate/user/userInfo/myInfo.jsp" flush="false" />
				</div>
			</div> <!-- 내가 추가한 부분 -->
		</div>
		<!-- //content -->


	</div>
	<!-- //container -->
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
	<!-- //footer -->
</div>
</body>
</html>

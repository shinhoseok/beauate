<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
	<script>
	$(document).ready(function($){

        $(".tab_content4", "#myPaymentTab").hide(); //Hide all content
        //On Click Event
        $("ul.tabs4 li", "#myPaymentTab").click(function() {

            $("ul.tabs4 li a", "#myPaymentTab").removeClass("active"); //Remove any "active" class
            $("a", this).addClass("active"); //Add "active" class to selected tab
            $(".tab_content4", "#myPaymentTab").hide(); //Hide all tab content

            var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
            $(activeTab).fadeIn(); //Fade in the active ID content
            return false;
        });
        $("ul.tabs4 li:first", "#myPaymentTab").click();
        
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

                <!-- 수강 가능한 쿠폰-->
                <div class="cpn" id="myPaymentTab">
                    <div class="myclass-left">
                        <ul class="tabs4">
                            <li><a href="#myPayment1" >결제내역</a></li>
                            <li><a href="#myPayment2" >취소/환불</a></li>
                        </ul>
                    </div>
                    <div id="myPayment1" class="myclass-right tab_content4">
                        <div class="h3-head"></div>
                        <ul>
							<!--긴박스 하나-->
                            <li class="pay-li">
								<div class="p-left">
                                    <p class="p-p1">주문번호</p>
                                    <p class="p-p2">1910161234</p>
                                    <p class="p-p3">결제완료</p>
                                </div>
                                <div class="p-center-img"><img src="${imagePath}/userInfo/pay-center-img.png"></div> 
                                <div class="p-center">
                                    <p class="p-p4">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
                                    <p>헤어 | 7월 23일 (화)</p>
                                </div>
                                <div class="p-right">
                                    <p class="p-p5">총 결제금액<p class="p-p6">12000</p></p>
                                    <p class="p-p7">결제일<p class="p-p8">2019.10.16</p></p>
                                    <p class="p-p9">결제수단<p class="p-p10">신용카드</p></p>
                                </div>
							</li>
							<!--//긴박스 하나-->
							<!--긴박스 하나-->
							<li class="pay-li">
								<div class="p-left">
									<p class="p-p1">주문번호</p>
									<p class="p-p2">1910161234</p>
									<p class="p-p3">결제완료</p>
								</div>
								<div class="p-center-img"><img src="${imagePath}/userInfo/pay-center-img.png"></div> 
								<div class="p-center">
									<p class="p-p4">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
									<p>헤어 | 7월 23일 (화)</p>
								</div>
								<div class="p-right">
									<p class="p-p5">총 결제금액<p class="p-p6">12000</p></p>
									<p class="p-p7">결제일<p class="p-p8">2019.10.16</p></p>
									<p class="p-p9">결제수단<p class="p-p10">신용카드</p></p>
								</div>
							</li>
							<!--//긴박스 하나-->
							<!--긴박스 하나-->
							<li class="pay-li">
								<div class="p-left">
									<p class="p-p1">주문번호</p>
									<p class="p-p2">1910161234</p>
									<p class="p-p3">결제완료</p>
								</div>
								<div class="p-center-img"><img src="${imagePath}/userInfo/pay-center-img.png"></div> 
								<div class="p-center">
									<p class="p-p4">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
									<p>헤어 | 7월 23일 (화)</p>
								</div>
								<div class="p-right">
									<p class="p-p5">총 결제금액<p class="p-p6">12000</p></p>
									<p class="p-p7">결제일<p class="p-p8">2019.10.16</p></p>
									<p class="p-p9">결제수단<p class="p-p10">신용카드</p></p>
								</div>
							</li>
							<!--//긴박스 하나-->
							<!--긴박스 하나-->
							<li class="pay-li">
								<div class="p-left">
									<p class="p-p1">주문번호</p>
									<p class="p-p2">1910161234</p>
									<p class="p-p3">결제완료</p>
								</div>
								<div class="p-center-img"><img src="${imagePath}/userInfo/pay-center-img.png"></div> 
								<div class="p-center">
									<p class="p-p4">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
									<p>헤어 | 7월 23일 (화)</p>
								</div>
								<div class="p-right">
									<p class="p-p5">총 결제금액<p class="p-p6">12000</p></p>
									<p class="p-p7">결제일<p class="p-p8">2019.10.16</p></p>
									<p class="p-p9">결제수단<p class="p-p10">신용카드</p></p>
								</div>
							</li>
							<!--//긴박스 하나-->
							<li class="pay-li">
								<div class="p-left">
									<p class="p-p1">주문번호</p>
									<p class="p-p2">1910161234</p>
									<p class="p-p3">결제완료</p>
								</div>
								<div class="p-center-img"><img src="${imagePath}/userInfo/pay-center-img.png"></div> 
								<div class="p-center">
									<p class="p-p4">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
									<p>헤어 | 7월 23일 (화)</p>
								</div>
								<div class="p-right">
									<p class="p-p5">총 결제금액<p class="p-p6">12000</p></p>
									<p class="p-p7">결제일<p class="p-p8">2019.10.16</p></p>
									<p class="p-p9">결제수단<p class="p-p10">신용카드</p></p>
								</div>
							</li>
							<!--//긴박스 하나-->

                        </ul>	
                    </div>
                	<div id="myPayment2" class="myclass-right tab_content4">
                        <div class="h3-head"></div>
                        <ul>
							<!--긴박스 하나-->
                            <li class="pay-li">
								<div class="p-left">
                                    <p class="p-p1">주문번호</p>
                                    <p class="p-p2">1910161234</p>
                                    <p class="p-p3-2">취소완료</p>
                                </div>
                                <div class="p-center-img"><img src="${imagePath}/userInfo/pay-center-img.png"></div> 
                                <div class="p-center">
                                    <p class="p-p4">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
                                    <p>헤어 | 7월 23일 (화)</p>
                                </div>
                                <div class="p-right">
                                    <p class="p-p5">총 결제금액<p class="p-p6">12000</p></p>
                                    <p class="p-p7">결제일<p class="p-p8">2019.10.16</p></p>
                                    <p class="p-p9">결제수단<p class="p-p10">신용카드</p></p>
                                </div>
							</li>
							<!--//긴박스 하나-->
							<!--긴박스 하나-->
							<li class="pay-li">
								<div class="p-left">
									<p class="p-p1">주문번호</p>
									<p class="p-p2">1910161234</p>
									<p class="p-p3-3">환불처리중</p>
								</div>
								<div class="p-center-img"><img src="${imagePath}/userInfo/pay-center-img.png"></div> 
								<div class="p-center">
									<p class="p-p4">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
									<p>헤어 | 7월 23일 (화)</p>
								</div>
								<div class="p-right">
									<p class="p-p5">총 결제금액<p class="p-p6">12000</p></p>
									<p class="p-p7">결제일<p class="p-p8">2019.10.16</p></p>
									<p class="p-p9">결제수단<p class="p-p10">신용카드</p></p>
								</div>
							</li>
							<!--//긴박스 하나-->
							<!--긴박스 하나-->
							<li class="pay-li">
								<div class="p-left">
									<p class="p-p1">주문번호</p>
									<p class="p-p2">1910161234</p>
									<p class="p-p3-2">환불완료</p>
								</div>
								<div class="p-center-img"><img src="${imagePath}/userInfo/pay-center-img.png"></div> 
								<div class="p-center">
									<p class="p-p4">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
									<p>헤어 | 7월 23일 (화)</p>
								</div>
								<div class="p-right">
									<p class="p-p5">총 결제금액<p class="p-p6">12000</p></p>
									<p class="p-p7">결제일<p class="p-p8">2019.10.16</p></p>
									<p class="p-p9">결제수단<p class="p-p10">신용카드</p></p>
								</div>
							</li>
							<!--//긴박스 하나-->
							<!--긴박스 하나-->
							<li class="pay-li">
								<div class="p-left">
									<p class="p-p1">주문번호</p>
									<p class="p-p2">1910161234</p>
									<p class="p-p3-2">취소완료</p>
								</div>
								<div class="p-center-img"><img src="${imagePath}/userInfo/pay-center-img.png"></div> 
								<div class="p-center">
									<p class="p-p4">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
									<p>헤어 | 7월 23일 (화)</p>
								</div>
								<div class="p-right">
									<p class="p-p5">총 결제금액<p class="p-p6">12000</p></p>
									<p class="p-p7">결제일<p class="p-p8">2019.10.16</p></p>
									<p class="p-p9">결제수단<p class="p-p10">신용카드</p></p>
								</div>
							</li>
							<!--//긴박스 하나-->
							<li class="pay-li">
								<div class="p-left">
									<p class="p-p1">주문번호</p>
									<p class="p-p2">1910161234</p>
									<p class="p-p3-2">환불완료</p>
								</div>
								<div class="p-center-img"><img src="${imagePath}/userInfo/pay-center-img.png"></div> 
								<div class="p-center">
									<p class="p-p4">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
									<p>헤어 | 7월 23일 (화)</p>
								</div>
								<div class="p-right">
									<p class="p-p5">총 결제금액<p class="p-p6">12000</p></p>
									<p class="p-p7">결제일<p class="p-p8">2019.10.16</p></p>
									<p class="p-p9">결제수단<p class="p-p10">신용카드</p></p>
								</div>
							</li>
							<!--//긴박스 하나-->

                        </ul>
                    </div>
                </div>   
				<!--//수강 가능한 쿠폰-->	
                <!--페이징-->		
				<div class="paging">
					<button type="button" class="btn-prev"><span>이전</span></button>
					<ul>
						<li class="active"><span>1</span></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
					</ul>
					<button type="button" class="btn-next"><span>다음</span></button>
				</div>	
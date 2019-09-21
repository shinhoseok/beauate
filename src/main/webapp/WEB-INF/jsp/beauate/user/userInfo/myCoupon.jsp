<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
	<script>
	$(document).ready(function($){
		
        $(".tab_content4", "#myCouponTab").hide(); //Hide all content
        //On Click Event
        $("ul.tabs4 li", "#myCouponTab").click(function() {

            $("ul.tabs4 li a", "#myCouponTab").removeClass("active"); //Remove any "active" class
            $("a", this).addClass("active"); //Add "active" class to selected tab
            $(".tab_content4", "#myCouponTab").hide(); //Hide all tab content

            var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
            $(activeTab).fadeIn(); //Fade in the active ID content
            return false;
        });
        $("ul.tabs4 li:first", "#myCouponTab").click();
        
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
                <div class="cpn" id="myCouponTab">
                    <div class="myclass-left">
                        <ul class="tabs4">
                            <li><a href="#myCoupon1">사용가능한 쿠폰</a></li>
                            <li><a href="#myCoupon2">사용/만료 쿠폰</a></li>
                        </ul>
                    </div>
                    <div id="myCoupon1" class="myclass-right tab_content4">
                        <h3></h3>
                        <ul>
                            <li>
								<div class="cpn-title">
									<a href="#" class="active" >뷰아떼 미션 수행완료 25% 쿠폰</a>
								</div>
								<div class="one"><span>25%</span></div>
								<p class="p1">사용조건</p>
								<p class="p2">30,000이상 결제시</p>
								<p class="p3">쿠폰만료일</p>
								<p class="p4">2019.10.16</p>
							</li>
                            <li>
									<div class="cpn-title">
										<a href="#" class="active" >뷰아떼 미션 수행완료 25% 쿠폰</a>
									</div>
									<div class="one"><span>25%</span></div>
									<p class="p1">사용조건</p>
									<p class="p2">30,000이상 결제시</p>
									<p class="p3">쿠폰만료일</p>
									<p class="p4">2019.10.16</p>
							</li>
							<li>
									<div class="cpn-title">
										<a href="#" class="active" >self-하루만에 배우는 감쪽같은 속눈썹! 같은 속눈썹!</a>
									</div>
									<div class="one"><span>25%</span></div>
									<p class="p1">사용조건</p>
									<p class="p2">30,000이상 결제시</p>
									<p class="p3">쿠폰만료일</p>
									<p class="p4">2019.10.16</p>
							</li>
							<li>
									<div class="cpn-title">
										<a href="#" class="active" >친구 추천 반값</a>
									</div>
									<div class="one"><span>25%</span></div>
									<p class="p1">사용조건</p>
									<p class="p2">30,000이상 결제시</p>
									<p class="p3">쿠폰만료일</p>
									<p class="p4">2019.10.16</p>
							</li>
							<li>
									<div class="cpn-title">
										<a href="#" class="active" >웰컴50%쿠폰</a>
									</div>
									<div class="one"><span>25%</span></div>
									<p class="p1">사용조건</p>
									<p class="p2">30,000이상 결제시</p>
									<p class="p3">쿠폰만료일</p>
									<p class="p4">2019.10.16</p>
							</li>
							<li>
									<div class="cpn-title">
										<a href="#" class="active" >self-하루만에 배우는 감쪽같은 속눈썹!</a>
									</div>
									<div class="one"><span>25%</span></div>
									<p class="p1">사용조건</p>
									<p class="p2">30,000이상 결제시</p>
									<p class="p3">쿠폰만료일</p>
									<p class="p4">2019.10.16</p>
							</li>
                        </ul>
                    </div>
                	<div id="myCoupon2" class="myclass-right tab_content4">
                        <h4></h4>
                        <ul>
                            <li>
								<div class="cpn-title cpn-title-2">
									<a href="#" class="active" >뷰아떼 미션 수행완료 25% 쿠폰</a>
								</div>
								<div class="one one-2" ><span>25%</span></div>
								<p class="p1 p11">사용조건</p>
								<p class="p2 p22">30,000이상 결제시</p>
								<p class="p3 p33">쿠폰만료일</p>
                                <p class="p4 p44">2019.10.16</p>
                                <p class="p55">사용만료</p>
							</li>
                            <li>
                                    <div class="cpn-title cpn-title-2">
                                        <a href="#" class="active" >뷰아떼 미션 수행완료 25% 쿠폰</a>
                                    </div>
                                    <div class="one one-2" ><span>25%</span></div>
                                    <p class="p1 p11">사용조건</p>
                                    <p class="p2 p22">30,000이상 결제시</p>
                                    <p class="p3 p33">쿠폰만료일</p>
                                    <p class="p4 p44">2019.10.16</p>
                                    <p class="p55">사용만료</p>
                            </li>
                            <li>
                                    <div class="cpn-title cpn-title-2">
                                        <a href="#" class="active" >뷰아떼 미션 수행완료 25% 쿠폰</a>
                                    </div>
                                    <div class="one one-2" ><span>25%</span></div>
                                    <p class="p1 p11">사용조건</p>
                                    <p class="p2 p22">30,000이상 결제시</p>
                                    <p class="p3 p33">쿠폰만료일</p>
                                    <p class="p4 p44">2019.10.16</p>
                                    <p class="p55">기간만료</p>
                            </li>
                            <li>
                                    <div class="cpn-title cpn-title-2">
                                        <a href="#" class="active" >뷰아떼 미션 수행완료 25% 쿠폰</a>
                                    </div>
                                    <div class="one one-2" ><span>25%</span></div>
                                    <p class="p1 p11">사용조건</p>
                                    <p class="p2 p22">30,000이상 결제시</p>
                                    <p class="p3 p33">쿠폰만료일</p>
                                    <p class="p4 p44">2019.10.16</p>
                                    <p class="p55">기간만료</p>
                            </li>
                            <li>
                                    <div class="cpn-title cpn-title-2">
                                        <a href="#" class="active" >뷰아떼 미션 수행완료 25% 쿠폰</a>
                                    </div>
                                    <div class="one one-2" ><span>25%</span></div>
                                    <p class="p1 p11">사용조건</p>
                                    <p class="p2 p22">30,000이상 결제시</p>
                                    <p class="p3 p33">쿠폰만료일</p>
                                    <p class="p4 p44">2019.10.16</p>
                                    <p class="p55">사용만료</p>
                            </li>
                            <li>
                                    <div class="cpn-title cpn-title-2">
                                        <a href="#" class="active" >뷰아떼 미션 수행완료 25% 쿠폰</a>
                                    </div>
                                    <div class="one one-2" ><span>25%</span></div>
                                    <p class="p1 p11">사용조건</p>
                                    <p class="p2 p22">30,000이상 결제시</p>
                                    <p class="p3 p33">쿠폰만료일</p>
                                    <p class="p4 p44">2019.10.16</p>
                                    <p class="p55">사용만료</p>
                            </li>
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
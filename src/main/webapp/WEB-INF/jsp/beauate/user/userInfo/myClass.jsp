<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
	<script>
	$(document).ready(function($){

        $(".tab_content2", "#myClassTab").hide(); //Hide all content
        //On Click Event
        $("ul.tabs2 li", "#myClassTab").click(function() {

            $("ul.tabs2 li a", "#myClassTab").removeClass("active"); //Remove any "active" class
            $("a", this).addClass("active"); //Add "active" class to selected tab
            $(".tab_content2", "#myClassTab").hide(); //Hide all tab content

            var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
            $(activeTab).fadeIn(); //Fade in the active ID content
            return false;
        });
        $("ul.tabs2 li:first", "#myClassTab").click();
        
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

				
                <!-- 신청한 클래스-->
                <div class="cpn" id="myClassTab">
                    <div class="myclass-left">
                        <ul class="tabs2">
                            <li><a href="#myClass1">신청한 클래스</a></li>
                            <li><a href="#myClass2">찜한 클래스</a></li>
                        </ul>
                    </div>
                    <div id="myClass1" class="myclass-right tab_content2">
						<h3>
							<div class="my-btn1"><a href="#"><span>전체선택</span></a></div>
							<div class="my-btn2"><a href="#"><span>삭제</span></a></div>
						</h3>
                        <ul>
							<!--신청한 클래스 긴박스 하나-->
                            <li>
								<ul class="my-c">
									<!--체크박스-->
									<a href="#">
										<li class="my-c1">
										</li>
									</a>
									<!--가운데 회색영역-->
									<li class="my-c2">
										<div class="c2-img"><img src="${imagePath}/userInfo/myclass-c2-img.png">
											<div class="c2-img-txt">결제완료</div>
										</div>
										<div class="c2-center-txt">
											<p class="center-txt1">헤어 | 7월 23일 (화)</p>
											<p class="center-txt2">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
											<p class="center-txt3">[NAVER D2 STARTUP FACTORY]서울특별시 강남구[NAVER D2 STARTUP FACTORY]서울특별시 강남구 </p>
											<p class="center-txt4"><a href="#">지도보기<img src="${imagePath}/userInfo/semo.png" class="semo"></a></p>
										</div>
									</li>
									<!--오른쪽 회색 테두리 영역-->
									<li class="my-c3">
										<!--20% 동그라미-->
										<div class="c2-one"><sapn class="one-per">20%</sapn></div>					
										<div class="c3-txt-all">
											<p class="c3-txt1">총 결제 금액</p>
											<p class="c3-txt2">132,000원</p>
											<p class="c3-txt3">124,000</p>
											<div class="c3-btn"><a href="#"><span>참여취소</span></a></div>
										</div>
									</li>
								</ul>
							</li>
							<!--//신청한 클래스 긴박스 하나-->
							<!--신청한 클래스 긴박스 하나-->
							<li>
								<ul class="my-c">
									<!--체크박스-->
									<a href="#">
										<li class="my-c11"><img src="${imagePath}/userInfo/check.png">
										</li>
									</a>	
									<!--가운데 회색영역-->
									<li class="my-c2">
										<div class="c2-img"><img src="${imagePath}/userInfo/myclass-c2-img.png">
											<div class="c2-img-txt">결제완료</div>
										</div>
										<div class="c2-center-txt">
											<p class="center-txt1">헤어 | 7월 23일 (화)</p>
											<p class="center-txt2">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
											<p class="center-txt3">[NAVER D2 STARTUP FACTORY]서울특별시 강남구 </p>
											<p class="center-txt4"><a href="#">지도보기<img src="${imagePath}/userInfo/semo.png" class="semo"></a></p>
										</div>
									</li>
									<!--오른쪽 회색 테두리 영역-->
									<li class="my-c3">
										<!--20% 동그라미-->
										<!--<div class="c2-one"><sapn class="one-per">20%</sapn></div>-->					
										<div class="c3-txt-all">
											<p class="c3-txt1">총 결제 금액</p>
											<p class="c3-txt2">132,000원</p>
											<p class="c3-txt3">124,000</p>
											<div class="c3-btn"><a href="#"><span>환불신청</span></a></div>
										</div>
									</li>
								</ul>
							</li>
							<!--//신청한 클래스 긴박스 하나-->
							<!--신청한 클래스 긴박스 하나-->
							<li>
								<ul class="my-c">
									<!--체크박스-->
									<a href="#">
										<li class="my-c1">
										</li>
									</a>
									<!--가운데 회색영역-->
									<li class="my-c2">
										<div class="c2-img"><img src="${imagePath}/userInfo/myclass-c2-img.png" class="img-black">
											<p class="c2-img-txt22">신청마감</p>
											<div class="c2-img-txt2">취소완료</div>
										</div>
										<div class="c2-center-txt">
											<p class="center-txt1">헤어 | 7월 23일 (화)</p>
											<p class="center-txt2">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
											<p class="center-txt3">[NAVER D2 STARTUP FACTORY]서울특별시 강남구 </p>
											<p class="center-txt4"><a href="#">지도보기<img src="${imagePath}/userInfo/semo.png" class="semo"></a></p>
										</div>
									</li>
									<!--오른쪽 회색 테두리 영역-->
									<li class="my-c3">
										<!--20% 동그라미-->
										<div class="c2-one2"><sapn class="one-per">20%</sapn></div>					
										<div class="c3-txt-all">
											<p class="c3-txt1">총 결제 금액</p>
											<p class="c3-txt2">132,000원</p>
											<p class="c3-txt3">124,000</p>
											<!--<div class="c3-btn"><a href="#"><span>참여취소</span></a></div>-->
										</div>
									</li>
								</ul>
							</li>
							<!--//신청한 클래스 긴박스 하나-->
							<!--신청한 클래스 긴박스 하나-->
							<li>
								<ul class="my-c">
									<!--체크박스-->
									<a href="#">
										<li class="my-c1">
										</li>
									</a>
									<!--가운데 회색영역-->
									<li class="my-c2">
										<div class="c2-img"><img src="${imagePath}/userInfo/myclass-c2-img.png" class="img-black">
											<p class="c2-img-txt33">종료</p>
											<div class="c2-img-txt3">환불신청중</div>
										</div>
										<div class="c2-center-txt">
											<p class="center-txt1">헤어 | 7월 23일 (화)</p>
											<p class="center-txt2">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
											<p class="center-txt3">[NAVER D2 STARTUP FACTORY]서울특별시 강남구 </p>
											<p class="center-txt4"><a href="#">지도보기<img src="${imagePath}/userInfo/semo.png" class="semo"></a></p>
										</div>
									</li>
									<!--오른쪽 회색 테두리 영역-->
									<li class="my-c3">
										<!--20% 동그라미-->
										<div class="c2-one2"><sapn class="one-per">20%</sapn></div>					
										<div class="c3-txt-all">
											<p class="c3-txt1">총 결제 금액</p>
											<p class="c3-txt2">132,000원</p>
											<p class="c3-txt3">124,000</p>
											<!--<div class="c3-btn"><a href="#"><span>참여취소</span></a></div>-->
										</div>
									</li>
								</ul>
							</li>
							<!--//신청한 클래스 긴박스 하나-->
							<!--신청한 클래스 긴박스 하나-->
							<li>
								<ul class="my-c">
									<!--체크박스-->
									<a href="#">
										<li class="my-c1">
										</li>
									</a>
									<!--가운데 회색영역-->
									<li class="my-c2">
										<div class="c2-img"><img src="${imagePath}/userInfo/myclass-c2-img.png" class="img-black">
											<p class="c2-img-txt33">종료</p>
											<div class="c2-img-txt2">환불완료</div>
										</div>
										<div class="c2-center-txt">
											<p class="center-txt1">헤어 | 7월 23일 (화)</p>
											<p class="center-txt2">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
											<p class="center-txt3">[NAVER D2 STARTUP FACTORY]서울특별시 강남구 </p>
											<p class="center-txt4"><a href="#">지도보기<img src="${imagePath}/userInfo/semo.png" class="semo"></a></p>
										</div>
									</li>
									<!--오른쪽 회색 테두리 영역-->
									<li class="my-c3">
										<!--20% 동그라미-->
										<div class="c2-one2"><sapn class="one-per">20%</sapn></div>					
										<div class="c3-txt-all">
											<p class="c3-txt1">총 결제 금액</p>
											<p class="c3-txt2">132,000원</p>
											<p class="c3-txt3">124,000</p>
											<!--<div class="c3-btn"><a href="#"><span>참여취소</span></a></div>-->
										</div>
									</li>
								</ul>
							</li>
							<!--//신청한 클래스 긴박스 하나-->

                        </ul>

                    </div> <!-- myclass-right -->
                    <div id="myClass2" class="myclass-right tab_content2">
						<h4>
							<div class="my-btn1"><a href="#"><span>전체선택</span></a></div>
							<div class="my-btn2"><a href="#"><span>삭제</span></a></div>
						</h4>
                        <ul class="l-list">
							<!--찜한클래스-->
                            <li class="l-list-li">
                                <!--체크박스-->
                                <div class="like-cheak"><a href="#"></a></div>
                                <!--이미지-->
                                <div class="like-img"><img src="${imagePath}/userInfo/like-class-img.png"></div>
                                <!--텍스트-->
                                <p class="l-txt1">헤어 | 7월 23일 (화)</p>
                                <p class="l-txt2">self-하루만에 배우는 감쪽같은 속눈썹! 내눈에 맞는 속눈썹 붙이기!!</p>
                                <p class="l-txt3"><a href="#">클래스 신청<img src="${imagePath}/userInfo/c-go.png"></a> </p>
                            </li>
                            
                        </ul>
                    </div>
                </div>   
				<!--//신청한 클래스-->	
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
			</div>
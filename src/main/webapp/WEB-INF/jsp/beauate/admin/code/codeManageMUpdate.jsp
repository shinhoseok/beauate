<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="naver-site-verification" content="c03e63b14e10bb3c48bb213c40e148287b19ea7f"/>
<title>BASIC</title>
<!--공통css-->
<link rel="stylesheet" type="text/css" href="${cssPath}/common.css">
<!--현업 main page-->
<link rel="stylesheet" type="text/css" href="${cssPath}/worksite.css">
<!-- 스크립트 선언 -->
<script type="text/javascript"src="${scriptPath}/jquery/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="${scriptPath}/common.js"></script>
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
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp"%>
			<!-- left_menu End -->

			<!-- contents Start -->
			<div class="contents">
				<p class="contentTitle">공통코드관리</p>

				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list">
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<!-- sub_path End -->

				<form:form commandName="rsltMap" id="listForm" name="listForm" method="post" action="${basePath}/code/z/n/updateLCodeList.do">
					<form:hidden path="pageIndex" />
					<form:hidden path="searchCondition" />
					<form:hidden path="searchKeyword" />
					<form:hidden path="lclsId" />
					<form:hidden path="mclsId" />
					<input type="hidden" id="codeCnt" name="codeCnt" value="${codeCnt }"/>
					<input type="hidden" name="codeIds" value="${rsltMap.mclsCd }"/>
					<!-- 등록박스// -->
					<h4 class="contentTitle_h4">코드관리 수정</h4>
					<div class="tableLayer">
						<table class="table">
							<caption>코드관리 수정</caption>
							<colgroup>
								<col width="15%" />
								<col width="35%" />
								<col width="15%" />
								<col width="35%" />
							</colgroup>
							<tbody class="line">
								<tr>
									<th class="bullet_orange">대분류코드</th>
									<td>
										<div class="commonSearch_wrap">
											<form:input cssStyle="width:100%" cssClass="bdcolor" path='lclsCd' onfocus="checker(this, 3 , 'nbytes_lclsCd');" onblur="stopchecker();" />
										</div>
									</td>
									<th class="bullet_orange">대분류명</th>
									<td>
										<div class="commonSearch_wrap">
											<form:input cssStyle="width:100%" cssClass="bdcolor" path='lclsNm' onfocus="checker(this, 20 , 'nbytes_lclsNm');" onblur="stopchecker();" />
										</div>
									</td>
								</tr>
								<tr>
									<th class="bullet_orange">대분류코드설명</th>
									<td colspan="3" class="pdtb3"><form:textarea rows="5" cssStyle="width:100%" cssClass="bdcolor" path='lclsEpl' onfocus="checker(this, 50 , 'nbytes_lclsEpl');" onblur="stopchecker();" /></td>
								</tr>
								<tr>
									<th class="bullet_orange">사용여부</th>
									<td colspan="3">
										<form:radiobutton path="useYn" value="Y" />Y 
										<form:radiobutton path="useYn" value="N" /> N
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //등록박스 -->
					<!-- 버튼// -->
					<div class="rowAdd" id="mb15" align="right">
						<button type="button" class="blueBtn L" onclick="fn_addTemplete();">추가</button>
					</div>
					<!-- //버튼 -->
					<!-- 게시판리스트// -->
					<div class="tableLayer">
						<input type="hidden" path="totCnt" value="1" />
						<table class="tableList" id="mCodeList">
							<caption>프로그램관리 검색</caption>
							<colgroup>
								<col width="20%" />
								<col width="20%" />
								<col width="28%" />
								<col width="14%" />
								<col width="10%" />
								<col width="8%" />
							</colgroup>
							<thead>
								<tr>
									<th>소분류코드</th>
									<th>소분류명</th>
									<th>설 명</th>
									<th>순 서</th>
									<th>사용유무</th>
									<th>행삭제</th>
								</tr>
							</thead>
							<tbody id="codeMTbody">
								<c:choose>
									<c:when test="${fn:length(rsltMap.codeList) != 0}">
										<c:forEach items="${rsltMap.codeList }" var="list" varStatus="status">
											<spring:nestedPath path="codeList[${status.index }]">
												<tr class="row">
													<td>
														<form:hidden path="mclsId" /> 
														<form:hidden path="lclsId" /> 
														<form:hidden path="lclsCd" /> 
														<input type="hidden" name="codeList[${status.index }].mclsGubun" id="codeList${status.index }.mclsGubun" value="Y" /> 
														<input type="hidden" name="codeList[${status.index }].codeIdsChk" value="N" />
														<div class="commonSearch_wrap">
															<form:input cssStyle="width:100%" path="mclsCd" class="mclsCd" onfocus="checker(this, 3 , 'nbytes_mclsCd');" onblur="stopchecker();" oldMclsCd="${list.mclsCd}" newFlag="N" />
														</div>
													</td>
													<td>
														<div class="commonSearch_wrap">
															<form:input cssStyle="width:100%" path="mclsNm" class="mclsNm" onfocus="checker(this, 20 , 'nbytes_mclsNm');" onblur="stopchecker();" />
														</div>
													</td>
													<td>
														<div class="commonSearch_wrap">
															<form:input cssStyle="width:100%" path="mclsEpl" class="mclsEpl" onfocus="checker(this, 50 , 'nbytes_mclsEpl');" onblur="stopchecker();" />
														</div>
													</td>
													<td>
														<div class="commonSearch_wrap">
															<form:input cssStyle="width:100%" path="ord" class="ord" onfocus="checker(this, 3, 'nbytes_ord');" onblur="stopchecker();" maxlength="3" />
														</div>
													</td>
													<td>
														<form:select path="useYn2" id="use${status.index }">
															<form:option value="Y">Y</form:option>
															<form:option value="N">N</form:option>
														</form:select>
													</td>
													<td>
														<img src="${imagePath}/btn_minus.png" alt="삭제" class="rowDel" name="rowDel" id="rowDel${status.index }" style="cursor: pointer;" /> 
														<img src="${imagePath}/btn_plus.png" alt="취소" class="rowCan" name="rowCan" id="rowCan${status.index }" style="cursor: pointer; display: none;" />
													</td>
												</tr>
											</spring:nestedPath>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<td colspan="6" id="nullRow">데이터가 없습니다.</td>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<!-- //게시판리스트 -->

				</form:form>
				<!-- 버튼// -->
				<div class="T_btnLayer fr">
					<a href="#" onclick="javascript:fn_updateCodeDetail();">
						<button type="button" class="blueBtn L">완료</button>
					</a> 
					<a href="#" onclick="javascript:history.back(-1)">
						<button type="button" class="blueBtn L">취소</button>
					</a>
				</div>
				<!-- //버튼 -->
			</div>
			<!-- contents End -->
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->

<table id="mCodeListTemplate" style="display: none">
	<tbody>
		<tr class="row">
			<td>
				<input type="hidden" class="mclsGubun" value="N"></input>
				<input type="hidden" class="mclsId" ></input>
				<input type="hidden" class="lclsId" ></input>
				<input type="hidden" class="lclsCd" ></input>
				<input type="hidden" class="codeIdsChk" value="N"></input>
				<div class="commonSearch_wrap">
					<input style="width:100%" type="text" class="mclsCd" onfocus="checker(this, 3 , 'nbytes_mclsCd');" onblur="stopchecker();" newFlag="Y" />
				</div>
			</td>
			<td>
				<div class="commonSearch_wrap">
					<input style="width:100%" type="text" class="mclsNm" onfocus="checker(this, 20 , 'nbytes_mclsNm');" onblur="stopchecker();"/>
				</div>
			</td>
			<td>
				<div class="commonSearch_wrap">
					<input style="width:100%" type="text" class="mclsEpl" onfocus="checker(this, 50 , 'bytes_mclsEpl');" onblur="stopchecker();"/>
				</div>
			</td>
			<td>
				<div class="commonSearch_wrap">
					<input style="width:100%" type="text" class="ord" onfocus="checker(this, 3 , 'bytes_ord');" onblur="stopchecker();" maxlength="3"/>
				</div>
			</td>
			<td><select class="useYn2"><option value="Y">Y</option><option value="N">N</option></select></td>
			<td>
				<img src="${imagePath}/btn_minus.png" alt="삭제" class="rowDel2" style="cursor:pointer;"/>
			</td>
		</tr>
	</tbody>
</table>

	<!-- footer // -->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- // footer -->

	<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>

	<script type="text/javascript">
	var idx = 0;
	$(document).ready(function(){
		var count = $("#codeCnt").val();
		if(count > 0){
			idx = count;
		}
	});
	
	fn_addTemplete = function(gubun){
		var selectV = "#mCodeListTemplate > tbody > tr";
		var iName = "codeList["+ idx +"].";
		
		$(selectV).find(".mclsGubun").attr({name : iName + 'mclsGubun' });
		$(selectV).find(".mclsId").attr({name : iName + 'mclsId' });
		$(selectV).find(".lclsId").attr({name : iName + 'lclsId' });
		$(selectV).find(".lclsCd").attr({name : iName + 'lclsCd' });
		$(selectV).find(".codeIdsChk").attr({name : iName + 'codeIdsChk' });
		
		$(selectV).find(".mclsCd").attr({name : iName + 'mclsCd' });
		$(selectV).find(".mclsNm").attr({name : iName + 'mclsNm' });
		$(selectV).find(".mclsEpl").attr({name : iName + 'mclsEpl' });
		$(selectV).find(".ord").attr({name : iName + 'ord' });
		$(selectV).find(".useYn2").attr({name : iName + 'useYn2' });
		
		// 행추가
		addRow('mCodeList','mCodeListTemplate','last');
		
		idx++; //idx 추가
		
		$("#nullRow").parent().remove();
	};
	
	//수정완료
	fn_updateCodeDetail = function(){
		
		// validation 체크
		if(!$.trim($("#lclsCd").val())){
			alert("대분류코드를 입력하세요.");
			$("#lclsCd").focus();
			return;
		};
		
		if(!$.trim($("#lclsNm").val())){
			alert("대분류명을 입력하세요.");
			$("#lclsNm").focus();
			return;
		};
		
		if(!$.trim($("#lclsEpl").val())){
			alert("대분류설명을 입력하세요.");
			$("#lclsEpl").focus();
			return;
		};
		
		// return 구분
		var flag = true;
		// 코드 중복 체크
		var codeDupFlag = true;
		// 순서 중복 체크
		var ordDupFlag = true;
		
		$("#codeMTbody tr").each(function(index){
			var mclsCd = $(this).find("input[name$='mclsCd']").val();
			var mclsNm = $(this).find("input[name$='mclsNm']").val();
			var mclsEpl = $(this).find("input[name$='mclsEpl']").val();
			var ord = $(this).find("input[name$='ord']").val();
			
			if(mclsCd != undefined){
				if(!TypeChecker.alphanum(mclsCd)){
					alert(!TypeChecker.alphanum(mclsCd));
					alert("소분류 코드는" + TypeChecker.alphanumText);
					flag = false;
					return false; 
				};
				
				if(!$.trim(mclsCd)){
					alert("소분류코드를 입력하세요.");
					$(this).find(".mclsCd").focus();
					flag = false;
					return false; 
				};
				
				if(!$.trim(mclsNm)){
					alert("소분류코드명을 입력하세요.");
					$(this).find(".mclsNm").focus();
					flag = false;
					return false; 
				};
				
				if(!$.trim(mclsEpl)){
					alert("소분류설명을 입력하세요.");
					$(this).find(".mclsEpl").focus();
					flag = false;
					return false; 
				};
				
				if(!TypeChecker.number(ord)){
					alert("순서는" + TypeChecker.numberText);
					flag = false;
					return false; 
				};
				
				if(!$.trim(ord)){
					alert("순서를 입력하세요.");
					$(this).find(".ord").focus();
					flag = false;
					return false; 
				};
				
				$("#codeMTbody tr").each(function(idx){
					var mclsCd1 = $(this).find("input[name$='mclsCd']").val();
					var ord2 = $(this).find("input[name$='ord']").val();
					
					if(index != idx){
				    	if (mclsCd == mclsCd1){
				    		codeDupFlag = false;
				    		return false; 
				    	}
				    }
					
					if(index != idx){
				    	if (ord == ord2){
				    		ordDupFlag = false;
				    		return false; 
				    	}
				    }
				});
				
				var newflag = $(this).find("input[name$='mclsCd']").attr("newFlag");
				var oldcd = $(this).find("input[name$='mclsCd']").attr("oldMclsCd");
				
				if(newflag == "N"){
					if(mclsCd != oldcd){
						$(this).find("input[name$='.codeIdsChk']").val("Y");
					}
				}
			}
		});
		
		if(!codeDupFlag){
			alert("중복되는 코드값이 있습니다.");
			return;
		}
		
		if(!ordDupFlag){
			alert("중복되는 순서값이 있습니다.");
			return;
		}
		
		if(!flag){
			return;
		}
		
		$.ajax({
			url:"${basePath}/code/z/n/mclsCdChk.do",
			type: 'POST',
			dataType: "json",
			data: $("#listForm").serialize(),
			error: function(){
				alert("현재 조회 서비스가 원활하지 않습니다. \n잠시 후 다시 이용해 주십시요.");
				return;
			},
			success: function(r){
				if(r.chkResult == 'N'){
					alert("중복되는 소분류코드입니다. 다른 값으로 입력바랍니다.");
					$("#mclsCd").focus();
					return;
				}else if(r.Result == 'N'){
					alert("하위코드가 존재합니다. 먼저 하위코드를 확인해주십시오.");
					$("#mclsCd").focus();
					return;
				}else{
					if(!confirm("수정 하시겠습니까?")){
				  		return;
					}
					$("#listForm").submit();
				}
			}
		});
	};
	
	//소분류 목록 행 삭제
	$("#codeMTbody tr").each(function(index){
		$('#rowDel'+index).click(function(){
			$("input[name$='codeList["+index+"].mclsGubun']").val("D");
			$("input[name$='codeList["+index+"].mclsNm']").attr('readOnly',true);
			$("input[name$='codeList["+index+"].mclsCd']").attr('readOnly',true);
			$("input[name$='codeList["+index+"].mclsEpl']").attr('readOnly',true);
			$("input[name$='codeList["+index+"].ord']").attr('readOnly',true);
			$("select[name$='codeList["+index+"].useYn2']").attr('readOnly',true);
			$('#rowDel'+index).hide();
			$('#rowCan'+index).show();
		});
	});
	
	//소분류 목록 행 복구
	$("#codeMTbody tr").each(function(index){
		$('#rowCan'+index).click(function(){
			$("input[name$='codeList["+index+"].mclsGubun']").val("Y");
			$("input[name$='codeList["+index+"].mclsNm']").attr('readOnly',false);
			$("input[name$='codeList["+index+"].mclsCd']").attr('readOnly',false);
			$("input[name$='codeList["+index+"].mclsEpl']").attr('readOnly',false);
			$("input[name$='codeList["+index+"].ord']").attr('readOnly',false);
			$("select[name$='codeList["+index+"].useYn2']").attr('readOnly',false);
			$('#rowDel'+index).show();
			$('#rowCan'+index).hide();
		});
	});
	
	//새로 추가된 소분류 목록 행 삭제
	$( document ).on("click",".rowDel2",function(event){
		$(this).parents("tr").remove();
	});
	</script>
</body>
</html>
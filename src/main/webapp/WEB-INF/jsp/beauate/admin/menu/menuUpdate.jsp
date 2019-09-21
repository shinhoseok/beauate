<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<form:form commandName="menuVO" id="detailForm" name="detailForm" method="post" action="${basePath}/menu/z/n/updateMenuProc.do">
	<form:hidden path="menuId"/>
	<form:hidden path="uprMenuId"/>
	<form:hidden path="menuLvl" />
	<!-- 정렬값 비교 때문에 이전값을 세팅해둠 -->
	<input type="hidden" name ="preMenuLup" value="${menuVO.menuLup }" />
	
	<h4 class="contentTitle_h4">메뉴상세정보</h4>
	<!--메뉴체계도-->
	<div class="menuBigTable">
		<p class="detailTitle">메뉴정보</p>
		<table class="menu_table">
			<caption></caption>
			<colgroup>
				<col width="148px">
				<col width="212px">
				<col width="148px">
				<col width="212px">
			</colgroup>
			<tbody class="line">
				<tr>
					<th class="bullet_orange">메뉴명</th>
					<td>
						<div class="commonSearch_wrap">
							<label class="blind" for=" ">d</label>
							<form:input path="menuName" id="menuName" name="menuName" cssStyle="width: 193px" cssClass="bdcolor" onfocus="checker(this, 30 , 'nbytes_menuName');" onblur="stopchecker();"/>
						</div>       
					</td>
					<th>메뉴구분</th>
					<td>
	              		<c:if test="${menuVO.menuDiv eq '1' }">일반</c:if>
                    	<c:if test="${menuVO.menuDiv eq '2' }">관리자</c:if>
	              	</td>
	              	<form:hidden path="menuDiv"/>
				</tr>
				<tr>
					<th>사용유무</th>
					<td>
						<form:select path="useYn" class="w50p">
                    		<form:option value="Y" label="사용"></form:option>
                    		<form:option value="N" label="미사용"></form:option>
                    	</form:select>
					</td>
					<th>정렬순서</th>
					<td>
						<form:select path="menuLup" class="w30p">
							<c:forEach begin="1" end="${uprMenuCnt}" step="1" varStatus="status">
								<form:option value="${status.index }">${status.index }</form:option>
							</c:forEach>
						</form:select>
					</td>
				</tr>
				<tr>
					<th>메뉴설명</th>
					<td colspan="4">
						<div class="commonSearch_wrap">
							<label class="blind" for=""></label>
							<form:input path="menuDes" cssStyle="width: 553px" cssClass="bdcolor" onfocus="checker(this, 200 , 'nbytes_menuDes');" onblur="stopchecker();"/>
						</div>
					</td>
				</tr>
				<tr>
                		<th rowspan="2">대상연결</th>
                    	<td colspan="4"><input type="radio" name="ojDiv" id="url" value="url"/><label for="radio02">URL 입력</label>
                    		<div class="commonSearch_wrap align40_Left">
                    			<label class="blind" for=" ">d</label> 
							<form:input path="otUrl" id="otUrl" name="otUrl" style="width: 250px" disabled="true" onfocus="checker(this, 200 , 'nbytes_otUrl');" onblur="stopchecker();"/>                                            
						</div>      
                    	</td>
                	</tr>
                	<tr> 
                    	<td colspan="4">
                    		<input type="radio" name="ojDiv" id="pgm"  value="pgm" /><label for="radio01" class="mr15">프로그램 연결</label>
							<div class="commonSearch_wrap align3_Left">
								<form:hidden path="pgmId" id="pgmId"/>
								<label class="blind" for=" "></label> 
	                     		<form:input path="pgmName" id="pgmName" cssClass="bdcolor" cssStyle="width: 250px;" readonly="true" />
							</div>
							<button type="button" class="grayBtn M" onclick="javascript:fn_PgmRoleListPop('P');">검색</button>       
                    	</td>
                	</tr>
			</tbody>
		</table>
	</div>
	<div class="T_btnLayer fr">
		<a href="javascript:void(0);" onclick="javascript:fn_updateMenuProc();"><button type="button" class="blueBtn L">저장</button></a>
		<a href="javascript:void(0);" onclick="javascript:fn_loadContents('${menuVO.menuId}','${menuVO.menuLvl}');"><button type="button" class="blueBtn L">취소</button></a>
	</div>      
</form:form>
<script>
//수정
//url ,프로그램 연결 radio 버튼 체크 
fn_checkDiv = function(){
	
	var pgmId =  "${menuVO.pgmId}"; 
	var otUrl = "${menuVO.otUrl}"; 
	
	if(pgmId != ""){
		$("#pgm").attr("checked", true);
		$("#otUrl").val("http://");
	}else if(otUrl != ""){
		$("#url").attr("checked", true);
		$("#otUrl").attr('disabled',false);
	}else{
		$("#otUrl").val("http://");
	}
};

//메뉴 수정 저장
fn_updateMenuProc = function(){
	
	if(!$.trim($("#detailForm #menuName").val())) {
		alert("메뉴 명을 등록해주세요");
		$("#detailForm #menuName").focus();
		return;
	};
	
	if(!confirm("저장 하시겠습니까?")){
		return;
	};
	
	$('#detailForm').submit();
};

//HTML 로딩후
$(document).ready(function(){
	
	//대상연결 초기 세팅
	fn_checkDiv();
	
	//대상연결 radio 버튼 설정시
	$(document).on('click', 'input[name="ojDiv"]' , function(){
		if($(this).is(':checked')){
			if($(this).val() == 'url'){
				$("#detailForm #otUrl").attr('disabled',false);
				$("#detailForm #pgmName").attr('disabled',true);
				$("#detailForm #pgmId").val(null);
				$("#detailForm #pgmName").val(null);
			}else{
				$("#detailForm #otUrl").attr('disabled',true);
				$("#detailForm #otUrl").val("http://");
				$("#detailForm #pgmName").attr('disabled',false);
			}
		};
	});
});

</script>
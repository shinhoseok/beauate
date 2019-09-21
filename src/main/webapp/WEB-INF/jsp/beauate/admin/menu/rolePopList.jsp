<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<p class="windowTitle">권한설정</p>
<span class="btn_close"><a href="javascript:void(0);" onclick="javascript:fn_PopClose();"><img src="${imagePath }/btn_close.gif" width="27" height="27" /></a></span>            
<div class="w_potalMenu">
	<div class="w_menuWrapLeft">
		<h4 class="w_contentTitle_h4">권한목록</h4>
		<div class="w_menuBigTable" id="p0">
			<div class="info_table">
				<table class="tableList2">
					<caption></caption>
					<colgroup>
						<col width="52px">
						<col width="178px">
						<col width="218px">
					</colgroup>
					<thead>
						<th class="noBg">
							<label class="blind" for=""></label> 
							<input type="checkbox" id="lChkAll" onclick="fn_allChk(this,'L');">
						</th>
						<th>사용자 ID</th>
						<th>사용자명</th>
					</thead>
					<tbody id="outRole">
						<c:forEach items="${rolePopList}" var="list" varStatus="status">
							<tr class="row">
								<td>
									<label class="blind" for=""></label>
									<input type="checkbox" id="${list.rlId }" name="tableChk" value="${list.rlCd }"  roleName="${list.rlName }" indexNum="${status.index}"/>
								</td>
			                    <td><c:out value="${list.rlCd }"></c:out></td>
			                    <td><c:out value="${list.rlName }"></c:out></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="add_minus">
		<ul>
			<li><a href="#" onclick="javascript:fn_checkRole('in');"></a></li>
			<li><a href="#" onclick="javascript:fn_checkRole('out');"></a></li>
		</ul>
	</div>
	<div class="w_menuWrapRight">
		<div class="user_info">
			<h4 class="h4_other">메뉴 맵핑 목록</h4>
			<!--메뉴체계도-->
			<form:form commandName="menuVO" name="roleMappForm" id="roleMappForm" onsubmit="return false;">
				<form:hidden path="menuId"/>
				<div class="w_menuBigTable" id="p0">
					<div class="info_table">
						<table class="tableList2">
							<caption></caption>
							<colgroup>
								<col width="50px">
								<col width="190px">
								<col width="69px">
								<col width="69px">
								<col width="69px">
							</colgroup>
							<thead>
								<th class="noBg">
									<label class="blind" for=""></label> 
									<input type="checkbox" id="rChkAll" onclick="fn_allChk(this,'R');">
								</th>
								<th>권한그룹</th>
								<th>조회</th>
								<th>등록</th>
								<th>관리</th>
							</thead>
							<tbody id="inRole">
								<c:forEach items="${menuVO.roleMappList}" var="list" varStatus="status">
									<spring:nestedPath path="roleMappList[${status.index}]">
										<tr class="row">
											<td>
												<label class="blind" for=""></label>
												<input type="checkbox" id="${list.rlId }" name="tableChk" value="${list.rlCd }"  roleName="${list.rlName }" indexNum ="${status.index}"/></td>
											</td>
											<td><c:out value="${list.rlName }"></c:out></td>
					                    	<form:hidden path="rlId" />
						                    <td><form:radiobutton path="rlDiv" value="r"/></td>
						                    <td><form:radiobutton path="rlDiv" value="w"/></td>
						                    <td><form:radiobutton path="rlDiv" value="z"/></td>
										</tr>								
									</spring:nestedPath>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>
<div class="T_btnLayer fr">
	<a href="javascript:void(0);" onclick="javascript:fn_saveRoleMapp();"><button type="button" class="blueBtn L">저장</button></a>
	<a href="javascript:void(0);" onclick="javascript:fn_PopClose();"><button type="button" class="blueBtn L">닫기</button></a>
</div>
<script type="text/javascript">
// 체크박스 전체체크
fn_allChk = function(obj, gubun){
	var _flag = false;
	if (obj.checked) {
		_flag = true;
	}
	if(gubun == 'L'){
		$("#outRole input[name=tableChk]:checkbox").each(function(idx){
			this.checked = _flag; //checked 처리
		});
	}else{
		$("#inRole input[name=tableChk]:checkbox").each(function(idx){
			this.checked = _flag; //checked 처리
		});
	}
};

fn_checkRole = function(gubun){
	
	var varHtml;
	
	if(gubun == "in"){
		
		varHtml = new String("");
		//우측에 박스에 있는 권한 길이보다 큰 []번째 name 생성을 해야함
		//var inNum = $("#inRole input[type=checkbox]").length;
		if($("#outRole input[type=checkbox]:checked").length == 0){
			alert("추가 할 사용자를 선택해 주십시오");
			return;
		}
		
		$("#outRole input[type=checkbox]:checked").each(function(index){
			//index = index +inNum;
			varHtml += '<tr>';
			varHtml += '<td>' + $(this).parent().clone().html() + '</td>';
			varHtml += '<td>' + $(this).attr("roleName") + '</td>';
			varHtml +=     '<input type="hidden" name="roleMappList'+$(this).attr("id")+'['+ index +'].rlId"  value=\"'+ $(this).attr("id") +'\"/>';
			varHtml += '<td><input type="radio"  name="roleMappList'+$(this).attr("id")+'['+ index +'].rlDiv" value="r" checked="checked" ></input></td>';
			varHtml += '<td><input type="radio"  name="roleMappList'+$(this).attr("id")+'['+ index +'].rlDiv" value="w"></input></td>';
			varHtml += '<td><input type="radio"  name="roleMappList'+$(this).attr("id")+'['+ index +'].rlDiv" value="z"></input></td>';
			varHtml += '</tr>';
			$(this).parent().parent().remove();
		});	
		$(varHtml).appendTo("#inRole");
		
		// 전체 체크 후 행삭제 시 체크박스 해제
		if($("#lChkAll").is(':checked')){
			$("#lChkAll").attr('checked', false);
		}
	}else{
		if($("#inRole input[type=checkbox]:checked").length == 0){
			alert("삭제 할 사용자를 선택해 주십시오");
			return;
		}
		varHtml = new String("");
		
		$("#inRole input[type=checkbox]:checked").each(function(index){
			varHtml += '<tr>';
			varHtml += '<td>' + $(this).parent().clone().html(); + '</td>';
			varHtml += '<td>' + $(this).val() + '</td>';
			varHtml += '<td span="3">' + $(this).attr("roleName") + '</td>';
			varHtml += '</tr>';
			
			$(this).parent().parent().remove();
		});
		$(varHtml).appendTo("#outRole");
		
		// 전체 체크 후 행삭제 시 체크박스 해제
		if($("#rChkAll").is(':checked')){
			$("#rChkAll").attr('checked', false);
		}
	}
};

//맵핑된 권한 저장
fn_saveRoleMapp = function(){
	
	if(!confirm("저장 하시겠습니까?")){
		return;
	}
	
	//정보  index 재정렬
	$("#inRole tr").each(function(index){
		var saveName = "roleMappList["+ index +"].rlDiv"; //라디오버튼 값
		var saveId = "roleMappList["+ index +"].rlId";   //권한아이디(hidden값)
		
		$(this).find("input[type=radio]").each(function(index){
			$(this).attr('name',saveName);
		});
		
		$(this).find("input[type=hidden]").attr('name',saveId);
	});
	
	var url = "${basePath}/menu/z/n/saveRoleMapp.do";
	
	$.ajax(
		{ 	url: url,    
			type: 'POST',    
			dataType : "json",
		  	data : $("#roleMappForm").serialize(),
		  	error: function(){
			  	alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
		},
		success: function(r){ 
			fn_loadContentsVal("Y");
			fn_PopClose();
		}
	});
};
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>

<style type="text/css">
	select.popUpMultiSelectBox {width: 447px; height: 400px; overflow-y : auto;}
</style>

<p class="windowTitle">권한별 사용자등록</p>
<span class="btn_close"><a href="javascript:void(0);" onclick="fn_PopClose();"><img src="${imagePath}/btn_close.gif" width="27" height="27" /></a></span>
<div class="w_potalMenu">

	<!-- 왼쪽 리스트 -->
	<div class="w_menuWrapLeft">
		<h4 class="w_contentTitle_h4">사용자 정보</h4>
		<div class="selectBox">
			<select id="searchCondition" class="w25p">
				<option value="usrId">사용자 아이디</option>
				<option value="usrNm">사용자 명</option>
			</select>
			<input class="searchName" id="searchKeyword"  type="text" style="width: 222px;"/>
			<button type="button" class="grayBtn ico" onclick="fn_search();">
				<img src="${imagePath}/ico_search.png"> 조회
			</button>
		</div>
		<h4 class="w_contentTitle_h4">사용자 리스트</h4>
		<div class="info_table" id="tableArea">
			<table class="tableList2">
				<caption></caption>
				<colgroup>
					<col width="40px">
					<col width="118px">
					<col width="160px">
					<col width="133px">
				</colgroup>
				<thead>
					<th class="noBg">
						<label class="blind" for=""></label>
						<input type="checkbox" id="allCheck" onclick="fn_allCheckToggle(this, 'forCheck');"/>
					</th>
					<th>사용자 ID</th>
					<th>사용자 명</th>
					<th>권한 코드</th>
				</thead>
				<tbody>
					<!-- 해당 권한이 없는 사용자 목록 -->
					<c:choose>
						<c:when test="${not empty roleUserListForUpdate}">
							<c:forEach items="${roleUserListForUpdate}" var="list" varStatus="st">
								<tr class="row popUpList">
									<td>
										<label class="blind" for=""></label>
										<input type="checkbox" id="target0${st.index}" name="forCheck"/>
									</td>
									<td><c:out value="${list.usrId}"/></td>
									<td><c:out value="${list.usrNm}"/></td>
									<td><c:out value="${list.rlCd}"/></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="row">
								<td colspan="4">데이터가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>

	<!-- 팝업의 중간에서 양쪽으로 옮기는 화살표 -->
	<div class="add_minus">
		<ul>
			<li><a href="javascript:void(0);" onclick="fn_addUser();"></a></li>
			<li><a href="javascript:void(0);" onclick="fn_subtractUser();"></a></li>
		</ul>
	</div>
	
	<!-- 팝업의 오른쪽 리스트 -->
	<div class="w_menuWrapRight">
		<div class="user_info">
			<c:choose>
				<c:when test="${roleCode == 'admin'}">
					<h4 class="h4_other" style="width: 450px;"> <strong>관리자 권한</strong> 그룹에 추가될 사용자 목록</h4>
				</c:when>
				<c:when test="${roleCode == 'authenticated'}">
					<h4 class="h4_other" style="width: 450px;"> <strong>일반 사용자  권한</strong> 그룹에 추가될 사용자 목록</h4>
				</c:when>
				<c:otherwise>
					<h4 class="h4_other" style="width: 450px;"> 그룹에 추가될 사용자 목록</h4>
				</c:otherwise>
			</c:choose>
			<div class="menuBigTable">
				<select multiple="multiple" class="popUpMultiSelectBox" id="addRoleUserList"></select>
			</div>
		</div>
	</div>
	<a href="javascript:void(0);" style="float: right;">
		<button type="button" class="blueBtn L" onclick="fn_updateProc();">저장</button>
	</a>
</div>

<form id="updateForm" method="post">
	<input type="hidden" name="rlCd" value="${roleCode}"/>
	<input type="hidden" name="usrId" id="usrId"/>
</form>

<script type="text/javascript">
/* 선택 된 사용자 추가 */
fn_addUser = function () {
	// 체크 박스에 체크 되어 있으면 추가.
	var _createOption = "";

	$(".popUpList").each(function (idx) {
		var _userId = $(".popUpList:eq(" + idx + ")").children("td:eq(1)").text();
		if ($("#target0" + idx).prop("checked")) {
			_createOption += "<option label='" + _userId + "' value='" + _userId + "'/>";
			$(this).hide();
		}
	});

	$("#addRoleUserList").append(_createOption);
	$("input[type=checkbox]").prop({checked:false});
};

/* 선택 된 사용자 제거 */
fn_subtractUser = function () {
	$("#addRoleUserList option:selected").each(function () {
		var _userId = $(this).val();

		var _compareId = "";
		var _popUpListArr = $(".popUpList");

		for (var i = 0; i < _popUpListArr.length; i++) {
			_compareId = $(_popUpListArr[i]).children("td:eq(1)").text();
			if (_userId == _compareId) {
				$(_popUpListArr[i]).show();
			}
		}
	});

	$("#addRoleUserList option:selected").remove();
};

/* 체크박스 전체 선택/해제 */
fn_allCheckToggle = function (_obj, _name) {
	if ($(_obj).is(":checked")) {
		$("input:checkbox[name=" + _name + "]").prop({checked:true});
	} else {
		$("input:checkbox[name=" + _name + "]").prop({checked:false});
	}
};

/* 검색 기능 */
fn_search = function () {
	$.ajax({
		url : "${basePath}/roleuser/w/n/selectSearchRoleUserList.do"
		, method : "post"
		, data : {
			searchCondition : $("#searchCondition").val()
			, searchKeyword : $("#searchKeyword").val()
			, rlCd : "${roleCode}"
		}
	}).done(function (res) {
		$("#tableArea").html(res);
	});
};

/* 선택 된 사용자들의 권한 변경 처리 */
fn_updateProc = function () {

	if ($("#addRoleUserList option").length == 0) {
		alert("선택 된 사용자가 없습니다.");
		return false;
	}
	$("#addRoleUserList option").each(function () {
		// 셀렉트 박스에 있는 option 값들을 모두 선택으로 변경, 그래야 데이터가 전송이 됨.
		$(this).prop("selected", true);
	});

	var _userListArr = $("#addRoleUserList").val(); // 전송 될 데이터
	$("#usrId").val(_userListArr);
	if (confirm("선택 하신 사용자의 권한을 변경 하시겠습니까?")) {
		$("#updateForm").attr("action", "${basePath}/roleuser/z/n/saveRoleUserProc.do").submit();
	}
}
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="naver-site-verification" content="c03e63b14e10bb3c48bb213c40e148287b19ea7f"/>
	<title>Basic</title>

	<link rel="stylesheet" type="text/css" href="${cssPath}/common.css">
	<link rel="stylesheet" type="text/css" href="${cssPath}/worksite.css">
	<link rel="stylesheet" type="text/css" href="${cssPath}/buttonStyle.css">
	
	<!-- layerPop -->
	<link rel="stylesheet" type="text/css" href="${cssPath}/windowPop.css">
	
	<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js" ></script>
	<script type="text/javascript" src="${scriptPath}/jquery/jquery.blockUI.js" ></script>
</head>
<body onload="fn_roleUserList(null, 0);">
<!-- Top -->
<div class="header">
	<jsp:include page="/WEB-INF/jsp/beauate/common/top.jsp" flush="false" />
</div>

<div class="wrap">
	<div class="container">
		<!-- 좌측메뉴리스트 left_menu -->
		<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp" %>

		<div class="contents">
		
			<p class="contentTitle">권한별 회원 관리</p>
			<p class="sub_path">
				<img src="${imagePath}/ico_home.png" width="10" height="9" />&nbsp;〉&nbsp;포탈관리〉&nbsp;권한관리&nbsp;〉&nbsp;권한별 사용자 관리
			</p>
			<div class="selectBox">
				<select name="select" class="w13p">
					<option>권한코드</option>
				</select>
				<input class="searchName" name="" type="text" style="width: 737px;" />
				<button type="button" class="grayBtn ico">
					<img src="${imagePath}/ico_search.png"> 검색
				</button>
			</div>
			<div class="potalMenu">

				<!-- 권한 목록 -->
				<div class="menuWrapLeft">
					<h4 class="contentTitle_h4">권한정보</h4>
					<!--메뉴체계도-->
					<div class="authority_info">
						<div class="info_table">
							<table class="tableList2">
								<caption></caption>
								<colgroup>
									<col width="210px">
									<col width="260px">
								</colgroup>
								<thead>
									<th class="noBg">권한코드</th>
									<th>권한그룹이름</th>
								</thead>
								<tbody>
									<c:forEach items="${roleInfoList}" var="list" varStatus="st">
										<tr class="row">
											<td><c:out value="${list.rlCd}"/></td>
											<td><a href="javascript:void(0);" onclick="fn_roleUserList('${list.rlCd}','${st.index}');"><c:out value="${list.rlName}"/></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<!-- 권한별 사용자 목록 -->
				<div class="user_info" id="ajaxTarget"></div>
				<div class="T_btnLayer fr" id="toggleTarget" style="display: none;">
					<a href="javascript:void(0);"><button onclick="fn_roleUserInsertLayer();" type="button" class="blueBtn L">추가</button></a>
					<a href="javascript:void(0);"><button onclick="fn_roleUserDeleteProc();" type="button" class="blueBtn L">삭제</button></a>
				</div>
				
			</div>
			
		</div>

	</div>
</div>

<!-- 팝업 Layer -->
<div id="windowPopup" style="display: none;"></div>

<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>

<script type="text/javascript">
/* 권한별 사용자 목록 Ajax */
fn_roleUserList = function (_rlCd, _index) {
	if (_rlCd == null) {
		_rlCd = "unauthenticated";
	}
	$.ajax({
		url : "${basePath}/roleuser/r/n/ajaxUserInfoList.do"
		, data : {
			rlCd : _rlCd
		}
	}).done(function (res) {
		$(".row").css("background", "#fff");
		$(".row:eq(" + _index + ")").css("background", "#f6f6f6");
		$("#ajaxTarget").html(res);
		if (_rlCd != "unauthenticated") {
			$("#toggleTarget").show();
		} else {
			$("#toggleTarget").hide();
		}
	});
};

/* 권한별 사용자 등록 팝업 Layer */
fn_roleUserInsertLayer = function () {
	var _rlCd = $("#roleGroup").val();
	var _url = "${basePath}/roleuser/w/n/insertRoleUserPopup.do";
	$.ajax({
		url : _url
		, data : {rlCd : _rlCd}
	}).done(function (res) {
		$("#windowPopup").html(res);
	});
	$.blockUI({message:$("#windowPopup"),css:{width:"0px",height:"0px",position:"absolute",left:"25%",top:"20%", textAlign:"left"}});
};

fn_PopClose = function () {
	$.unblockUI();
	$("#windowPopup").empty();
};

fn_roleUserDeleteProc = function () {
	
	if ($("select[name=usrId] option:selected").length == 0) {
		alert("선택 된 사용자가 없습니다.");
		return false;
	}
	
	if (confirm("선택 하신 사용자의 권한을 삭제 하시겠습니까?\n해당 사용자는 인증 되지 않은 사용자의 권한을 갖게 됩니다.")) {
		$("#deleteForm").attr("action", "${basePath}/roleuser/z/n/deleteRoleUserProc.do").submit();
	}
};
</script>
</body>
</html>
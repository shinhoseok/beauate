<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>

<div class="header_centerBox">
	<h1>
		<img src="${imagePath }/logo.png" width="143" height="19" style="cursor: pointer;" onclick="javascript:fn_userMainBack();"/>
	</h1>
	<div class="lnb">
		<dl>
			<dt class="hidden">로그인, 로그아웃, 사이트맵 , 설정이 들어가는 자리입니다.</dt>
			<dd>
				<strong>${sessionScope.loginVO.usrNm}</strong> 님 환영합니다.
			</dd>
			<dd>
				<a href="${basePath}/login/a/n/logOut.do" class="lbtn">로그아웃</a>
			</dd>
			<dd class="lbar">
				<img src="${imagePath }/lnb_bar.gif" width="1" height="10" />
			</dd>
			<dd>
				<a href="#">사이트맵</a>
			</dd>
			<dd class="lbar">
				<img src="${imagePath }/lnb_bar.gif" width="1" height="10" />
			</dd>
			<dd>
				<a href="#">설정</a>
			</dd>
		</dl>
	</div>
	<!--Local Navigation Bar End-->

	<div class="gnbWrap">
		<div id="menuArea">
			<ul id="navi">
				<c:forEach items="${setTopMenuList}" var="result" varStatus="status">
					<c:choose>
						<c:when test="${status.index eq 0 && result.menuId eq menuSetVO.menuId1Lvl}">
							<li id="menu" class="selectMenu">
								<a href="#" onclick='javascript:fn_moveMenuClick("${result.menuId}", "${result.menuName}", "${result.pgmUrl}", "${result.otUrl}","${result.level}","${result.menuUrlGubun}");'>
									<c:out value="${result.menuName}"></c:out>
								</a>
							</li>
						</c:when>
						<c:when test="${status.index eq 0 && result.menuId != menuSetVO.menuId1Lvl}">
							<li id="menu">
								<a href="#" onclick='javascript:fn_moveMenuClick("${result.menuId}", "${result.menuName}", "${result.pgmUrl}", "${result.otUrl}","${result.level}","${result.menuUrlGubun}");'>
									<c:out value="${result.menuName}"></c:out>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li id="menu" <c:if test="${result.menuId eq menuSetVO.menuId1Lvl}">class="selectMenu"</c:if>>
								<a href='#' onclick='javascript:fn_moveMenuClick("${result.menuId}", "${result.menuName}", "${result.pgmUrl}", "${result.otUrl}","${result.level}","${result.menuUrlGubun}");'>
									<c:out value="${result.menuName}"></c:out>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
<!--header_centerBox End-->

<form id="menuMoveForm" name="menuMoveForm" method="post">
	<input type="hidden" name="menuId"> <input type="hidden" name="menuUrlGubun">
</form>
<!--header End-->

<script type="text/javascript">
fn_moveMenuClick = function(menuId, menuName, pgmUrl, otUrl, level, menuUrlGubun) {

	var form = document.menuMoveForm;
	//메뉴 클릭시 menuUrlGubun =  B (탑메뉴 브릿지), M(2레벨 메뉴 열고 닫기만), I ( 내부콘텐츠), PI( 팝업 + 내부콘텐츠), PO(팝업 + 외부 컨텐츠)
	if (menuUrlGubun == "B") {
		//alert("탑메뉴 클릭했구나 브릿지로 이동");
		form.menuId.value = menuId;
		form.menuUrlGubun.value = menuUrlGubun;
		$('#menuMoveForm').attr("action",
				"${basePath }/common/a/n/topMenuBridge.do");
		$('#menuMoveForm').submit();

	} else if (menuUrlGubun == "PI") {
		//alert("${basePath}"+pgmUrl+"로 내부팝업");
		var winOpt = "width=" + pupWidth + ", height=" + pupHeight
				+ ",top=50,left=50, status=1, scrollbars=yes";
		window.open("${basePath }" + pgmUrl, menuName, winOpt);

	} else if (menuUrlGubun == "PO") {
		//alert(otUrl+"로 외부팝업");
		var winOpt = "width=" + pupWidth + ", height=" + pupHeight
				+ ", top=50, left=50, status=1, scrollbars=yes";
		window.open(otUrl, menuName, winOpt);

	} else if (menuUrlGubun == "M") {
		//alert("현재 하위메뉴가 있는  2레벨의 메뉴 열고 닫기");
		if ($("#left_menu #" + menuId + "Ul").is(":visible")) {
			$("#left_menu #" + menuId + "Ul").hide(200);
		} else {
			$("#left_menu #" + menuId + "Ul").show(200);
		}
	} else {
		//프로그램 URL 로 이동
		//alert(pgmUrl+"로 이동");
		form.menuId.value = menuId;
		form.menuUrlGubun.value = menuUrlGubun;
		$('#menuMoveForm').attr("action", "${basePath }" + pgmUrl);
		$('#menuMoveForm').submit();
	}
};

var fn_userMainBack = function() {
	location.href="${basePath}/home/a/n/main.do";
}
</script>
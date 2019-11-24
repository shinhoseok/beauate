<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="naver-site-verification" content="c03e63b14e10bb3c48bb213c40e148287b19ea7f"/>
<title>BASIC</title>
<!--공통css-->
<link rel="stylesheet" type="text/css" href="${cssPath }/common.css">
<!--현업 main page-->
<link rel="stylesheet" type="text/css" href="${cssPath }/worksite.css">
<!--현업 popup-->
<link rel="stylesheet" type="text/css" href="${cssPath }/windowPop.css">

<link rel="stylesheet" type="text/css" href="${scriptPath}/jquery/jstree/themes/default/style.min.css" />
<!-- 스크립트 선언 -->
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js" ></script>
<script type="text/javascript" src="${scriptPath}/jquery/jstree/jstree.min.js" ></script>
<script type="text/javascript" src="${scriptPath}/jquery/jquery.blockUI.js" ></script>

<script type="text/javascript" src="${scriptPath}/common.js" ></script>
<script type="text/javascript" src="${scriptPath}/validation/validation.js" ></script>
</head>
<body>
	<!-- top -->
	<div class="header">
		<jsp:include page="/WEB-INF/jsp/beauate/common/top.jsp" flush="false" />
	</div>
	
	<div class="wrap">
		<div class="container">
			<!-- 좌측메뉴리스트 left_menu// -->
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp" %>
			 <!-- //좌측메뉴리스트  left_menu -->
			
			<div class="contents">
				<p class="contentTitle">프로그램 관리</p>
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
                    	&nbsp;〉&nbsp;<c:out value="${list.menuName }"></c:out>
                    </c:forEach>
				</p>
				<div class="potalMenu">
					<div class="menuWrapLeft">
                        <h4 class="contentTitle_h4">메뉴체계도</h4>
                        <!--메뉴체계도-->
                        <div class="menumap" id="menuTree" style="display:none; overflow:auto; border:1px solid silver; min-height:100px;">
                        	<ul>				
							<c:set var="prelevel" value="0"/>
		 					<c:forEach var="result" items="${rslt.menuList}" varStatus="status">
			 					<c:if test="${prelevel > result.level}">		
			 					 	<c:forEach begin="1" end="${prelevel - result.level}">					
					 					</ul>
					 					</li>
				 					</c:forEach>
			 					</c:if>
			 					<c:choose>
			 						<c:when test="${result.isleaf == 1}">
			 							<li id="${result.menuId}" level="${result.level}" menuLvl="${result.menuLvl}" pgmId="${result.pgmId }" menuDiv="${result.menuDiv }" uprMenuId ="${result.uprMenuId }" menuLup ="${result.menuLup }">
			 								<a href="#"><c:out value="${result.menuName}"></c:out></a>
			 							</li> 
			 						</c:when>
			 						<c:otherwise>
			 							<li id="${result.menuId}" level="${result.level}" menuLvl="${result.menuLvl}" pgmId="${result.pgmId }" menuDiv="${result.menuDiv }" uprMenuId ="${result.uprMenuId }" menuLup ="${result.menuLup }">
			 								<a href="#"><c:out value="${result.menuName}"></c:out></a>
			 							<ul>
			 						</c:otherwise>
			 					</c:choose>	 		
			 					<c:set var="prelevel" value="${result.level}"/>	
			 					<c:if test="${status.last}">		
			 					 	<c:forEach begin="1" end="${result.level-1}">					
					 					</ul>
					 					</li>
				 					</c:forEach>
			 					</c:if>	
		 						</c:forEach>
							</ul>
                        	<!-- <p>이 박스의 높이는 내용이 추가될수록 늘어납니다. 작업 전에 css의 height를 삭제 하시고 작업하세요.</p> -->
                        </div>
                        <form:form commandName="menuVO" id="treeForm" name="treeForm" method="post">
	                    	<form:hidden path="menuId" />
	                    	<form:hidden path="menuDiv" />
	                    	<form:hidden path="level" />
	                    	<form:hidden path="menuLvl" />
	                    	<form:hidden path="uprMenuId" />
	                    	<form:hidden path="pgmId" />
	                    	<form:hidden path="menuLup" />
                		</form:form>	
                
                        <div class="T_btnLayer_b wp">
                            <button type="button" class="grayBtn M" onclick="javascript:fn_insertMenu();">하위메뉴추가</button>
                            <button type="button" class="grayBtn M fr" onclick="javascript:fn_deleteMenu();">삭제</button>
                        </div>                	
                    </div>
                    <!-- 상세 및 수정 -->
                    <div id="menuContents" class="menuWrapright"></div>     
				</div>
			</div>
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<!-- 권한설정 팝업 -->
	<div id="windowPopup" style="display: none;"></div>
	
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!--//footer-->
	
<script type="text/javascript">
//우측의 메뉴에 대한 상세 컨텐츠 호출
fn_loadContents = function(menuIdVar, leveVar){
	var url = "${basePath}/menu/r/n/selectMenu.do";
	$.ajax({ 
		url: url,    
		type: 'POST',    
		dataType: 'html', 
		data : { menuId : menuIdVar , level : leveVar },
		error: function(){
		 	alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
		},
		success: function(r){ 
			$("#menuContents").html(r);
		}
	}); 
};

//하위메뉴 추가
fn_insertMenu = function(){
	
	if(!confirm("현재 메뉴의 하위 메뉴를 추가하시겠습니까?")){
		return;
	};
	
	var uprlevel = $("#treeForm #level").val();
	
	//3dept 까지만 메뉴가 가능함 (level 값으로는 ROOT를 포함 하니 레벨 4까지만 가능 )
	if(uprlevel > 3){
		alert("현재 레벨에서는 하위메뉴를 생성할수 없습니다");
		return;
	};
	
	//alert(Number(uprlevel)+Number(1));
	
	$("#treeForm #menuLvl").val(Number(uprlevel)+Number(1));
	var url = "${basePath}/menu/z/n/insertMenu.do";
	
	$.ajax(
		{ url: url,    
		  type: 'POST',    
		  data : $("#treeForm").serialize(),
		  error: function(){
			  	alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
		  },
		  success: function(r){ 
		  		$("#menuContents").html(r);
		}
	}); 
};

//삭제
fn_deleteMenu = function(){
	
	if(!confirm("현재 메뉴를 삭제하시겠습니까?")){
		return;
	};
	
	var menuLevel = $("#treeForm #level").val();
	
	//1레벨의 ROOT 일반과 관리자는 지워지지 않는다 
	if(menuLevel == 1){
		alert("ROOT 메뉴는 지울수 없습니다");
		return;
	};
	
	var menuId = $('#treeForm #menuId').val();
	var uprMenuId = $("#detailForm #uprMenuId").val();
	
	if($("#menuTree #"+menuId).attr("aria-expanded") != undefined){
		alert("하위 메뉴가 있는 경우 삭제가 불가능합니다.");
		return;
	}
	
	//로드 후에 uprMenuId 값은 하위 메뉴 추가 땜에 현재 레벨 값이 있어서 상세값에서 가져와서 다시 세팅해야함
	$('#treeForm').attr("uprMenuId",uprMenuId);	
	
	var url = "${basePath}/menu/z/n/deleteMenuProc.do";		
	
	$('#treeForm').attr("action",url);				
	$('#treeForm').submit();
};

// 권한설정 수정 후 상세 로딩
fn_loadContentsVal = function(val){
	var menuId = $("#detailForm #menuId").val();
	var onLevel = $("#detailForm #menuId").val();
	if(val == "Y" ){
		fn_loadContents(menuId, onLevel);
	};
};

//권한설정 팝업 데이터
fn_RoleListPopOpen = function(){
	var menuDiv = $("#detailForm #menuDiv").val();
	var menuId = $("#detailForm #menuId").val();
	var onLevel = $("#detailForm #menuId").val();
	
	var url = "${basePath}/menu/z/n/selectRolePopList.do";
	
	$.ajax({ 
		url: url,    
		type: 'POST',
		dataType : 'html',
		data : {menuDiv : menuDiv, menuId : menuId},
		error: function(){
			alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
		},
		success: function(r){ 
			$("#windowPopup").html(r);
		}
	}); 
};

// 권한설정 팝업 열기
fn_PgmRoleListPop = function(gubun){
	if("R" == gubun){
		if(!confirm("현재 메뉴의 권한을 설정하시겠습니까?")){
			return;
		};
		fn_RoleListPopOpen();
	}else{
		if(!$('input[id="pgm"]').is(':checked')){
			alert("프로그램 연결을 체크하십시오.");
			return;
		}
		fn_programListPopOpen(1);
	}
	$.blockUI({message:$("#windowPopup"),css:{width:"0px",height:"0px",position:"absolute",left:"25%",top:"20%", textAlign:"left"}});
};

//권한설정 팝업 닫기
fn_PopClose = function(returnVal){
	if(returnVal !== undefined ){
		$('#detailForm #pgmId').val(returnVal[0]);
		$('#detailForm #pgmName').val(returnVal[1]);
	};
	$.unblockUI();
	$("#windowPopup").empty();
	return false;
};

//프로그램 연결 팝업
var returnVal;
fn_programListPopOpen = function(pageNo){
	$("#pageIndex").val(pageNo);
	
	var url = "${basePath}/menu/r/n/selectProgramPopList.do";		

	$.ajax({ 
		url: url,    
		type: 'POST',
		data: $("#listForm").serialize(),
		dataType : 'html',
		error: function(){
			alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
		},
		success: function(r){
			//타입까지 비교
			$("#windowPopup").html(r);
		}
	}); 
};

//HTML 로딩후
$(document).ready(function(){
	var onMenuId = "${menuVO.menuId}"; 
	var onLevel = "${menuVO.level}";
	// 상세 화면 로딩
	fn_loadContents(onMenuId, onLevel);
});

//좌측 메뉴 트리 (document ready 보다 무조건 뒤에 트리의 click 이벤트가 먹지 않음)
$(function () {
	var onMenuId = "${menuVO.menuId}";
	$("#menuTree").jstree({
		"core" : {"dblclick_toggle" :  false}	// 더블클릭 이벤트 제거
	}).on('ready.jstree', function (e, data) {
		data.instance.open_node([ onMenuId ]);	// 메뉴 수정 시 열려 있던 메뉴 노드 열기
		data.instance.select_node([ onMenuId ]); // 메뉴 수정 시 열려 있던 메뉴 노드 선택
	}).on("select_node.jstree", function (e, data) {
		$("#treeForm #menuId").val(data.node.li_attr.id);
		$("#treeForm #uprMenuId").val(data.node.li_attr.uprmenuid); //(하위 메뉴 추가시 현재 메뉴를 상위 메뉴로 체크하기 위한 값세팅)
		$("#treeForm #level").val(data.node.li_attr.level);
		$("#treeForm #menuLup").val(data.node.li_attr.menulup);
		$("#treeForm #menuDiv").val(data.node.li_attr.menudiv);
		
		var menuId = data.node.li_attr.id;
		var level = data.node.li_attr.level;
		
		// 상세 화면 로딩
		fn_loadContents(menuId, level);
	}).init("loaded.jstree", function (e, data) {
		$("#menuTree").show();
	});
});
</script>
</body>
</html>
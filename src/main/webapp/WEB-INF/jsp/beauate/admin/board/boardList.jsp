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
	<link rel="stylesheet" type="text/css" href="${cssPath}/common.css">
	<!--현업 main page-->
	<link rel="stylesheet" type="text/css" href="${cssPath}/worksite.css">
	<!-- 스크립트 선언 -->
	<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js" ></script>
</head>
<body>
	<!-- header Start -->
	<div class="header">
		<jsp:include page="/WEB-INF/jsp/beauate/common/top.jsp" flush="false" />
	</div>
	<!-- header End -->
	<div class="wrap">
		<div class="container">
			<!-- left_menu Start -->
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp" %>
			<!-- left_menu End -->
			<div class="contents">
				<p class="contentTitle">게시판 관리</p>
				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<!-- sub_path End -->
				<form:form commandName="boardVO" id="listForm" name="listForm" method="post">
					<form:hidden path="postId" id="postId"/>
					<form:hidden path="sortSubject"/>
					<form:hidden path="sortDescend"/>
					<form:hidden path="pageIndex"/>
					<div class="selectBox" id="selectBox">
						<select name="searchCondition" class="w13p" onchange="javascript:fn_titleOrCategory();" id="searchCondition">
							<option value="post_title">제목</option>
							<option value="postCategorySt">카테고리</option>
						</select>
						<input name="searchKeyword" id="searchKeyword" onkeydown="if(event.keyCode==13){javascript:fn_searchList(1);}" class="searchName" style="width: 737px;" type="text">
						<button type="button" id="seachBtn" class="grayBtn ico" onclick="javascript:fn_searchList(1);"><img src="${imagePath }/ico_search.png"> 검색</button>
					</div>
					<div class="tableLayer">
						<table class="tableList">
							<caption></caption>
							<colgroup>
								<col width="10%">
								<col width="20%">
								<col width="*">
								<col width="20%">
							</colgroup>
							<thead>
								<th sortId="postId" class="noBg">게시글ID
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>									
								</th>
								<th sortId="postCategorySt">카테고리
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>				
								</th>
								<th sortId="postTitle">제목
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>		
								</th>
								<th sortId="postDt">등록일자
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
							</thead>
							<tbody id="boardListTbody">
								<c:choose>
									<c:when test="${rslt.selectListCnt != 0}">
										<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
											<tr class="row" onclick="javascript:fn_boardDetail('${list.postId}')" style="cursor: pointer;">
												<td><c:out value="${list.postId}"/></td>
												<td>
												<c:choose>
													<c:when test="${list.postCategorySt eq '1'}">
														제품정보
													</c:when>
													<c:when test="${list.postCategorySt eq '2'}">
														자격증
													</c:when>
													<c:when test="${list.postCategorySt eq '3'}">
														박람회
													</c:when>
													<c:otherwise>
														공지사항
													</c:otherwise>
												</c:choose>
												</td>
												<td><c:out value="${list.postTitle}"/></td>
												<td><fmt:formatDate value="${list.postDt}" pattern="yyyy-MM-dd"/></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<td  colspan="4">데이터가 없습니다.</td>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="T_btnLayer fr">
							<a href="${basePath }/boardm/r/m/insertBoardMng.do"><button type="button" class="blueBtn L">등록</button></a>
						</div>
					</div>
				</form:form>
				<!--paging Start -->
				<div class="paging_place">
					<div class="paging_wrap">
						<comTag:paging totalCount="${rslt.selectListCnt}" pageNo="${boardVO.pageIndex}" pageSize="${boardVO.pageSize}" clickPage="fn_searchList"/>
					</div>
				</div>
				<!--paging End -->
			</div>
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<!-- footer Start-->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- footer End -->
</body>

<script type="text/javascript">
//정렬
fn_sort = function(obj) {
	var frm = document.listForm;
	frm.sortDescend.value = obj.className == "arrow_ascending" ? "asc" : "desc";
	frm.sortSubject.value = obj.parentNode.getAttributeNode("sortId").value;
	frm.submit();
};

//상세정보
fn_boardDetail = function(postId) {
	var frm = document.listForm;
	frm.postId.value = postId;
	frm.action = "<c:url value='${basePath}/boardm/r/m/selectBoardMngDetail.do'/>";
	frm.submit();
};

//검색, 페이지 이동
//현재페이지 전역변수
var cuurPage = 1;
fn_searchList = function(pageNo){
	var frm = document.listForm;
	frm.pageIndex.value = pageNo;
	frm.submit();
};

//검색 셀렉트박스 onchange
var fn_titleOrCategory = function() {
	var searchCondition = $("#searchCondition option:selected").val();
	var option = '<select name="searchKeyword" id="searchKeyword" class="w13p">';
	if(searchCondition == "postCategorySt") { //카테고리일 경우
		//등록된 아이디인지 여부체크
		$.ajax({ 	
			url: "${basePath}/boardm/r/n/selectCommonCodeList.do",
			type: 'POST',
			dataType : "json",
			error: function(){
				 alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
				 return;
			},
			success: function(r) {
				$("#selectBox").children("input").remove();
				for(var i=0; i < r.codeList.length; i++) {
					option += "<option value='"+r.codeList[i].mclsCd+"'>"+
					r.codeList[i].mclsNm +"</option>";
				}
				option += "</select>";
				$("#seachBtn").before(option);
			}
		});
	} else { //제목일 경우
		$("#selectBox").children("#searchKeyword").remove();
		$("#selectBox").children("#seachBtn").remove();
		var seachText = '<input name="searchKeyword" id="searchKeyword" onkeydown="if(event.keyCode==13){javascript:fn_searchList(1);}" class="searchName" style="width: 737px;" type="text">';
		seachText += '<button type="button" id="seachBtn" class="grayBtn ico" onclick="javascript:fn_searchList(1);"><img src="${imagePath }/ico_search.png"> 검색</button>';
		$("#selectBox").append(seachText);
	}
};
</script>
</html>

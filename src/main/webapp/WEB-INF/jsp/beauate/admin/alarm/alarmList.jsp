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
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js"></script>
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
			<%@ include file="/WEB-INF/jsp/beauate/common/leftMenu.jsp"%>
			<!-- left_menu End -->
			<div class="contents">
				<p class="contentTitle">알람신청 관리</p>
				<!-- sub_path Start -->
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<!-- sub_path End -->
				<form:form commandName="alarmVO" id="alarmVO" name="listForm" method="post" action="${basePath}/alarm/r/m/selectAlarmList.do">
					<form:hidden path="pageIndex" id="pageIndex" />
					<form:hidden path="sortSubject" />
					<form:hidden path="sortDescend" />
					<div class="selectBox">
						<form:select path="searchCondition" class="w13p">
							<form:option value="usrNm" label="이름"></form:option>
							<form:option value="mblPno" label="전화번호"></form:option>
						</form:select> 
						<form:input path="searchKeyword" onkeydown="if(event.keyCode==13){javascript:fn_searchList(1);}" class="searchName" style="width: 737px;"></form:input>
						<button type="button" class="grayBtn ico" onclick="javascript:fn_searchList(1);"><img src="${imagePath }/ico_search.png"> 검색</button>
					</div>
					<div class="tableLayer">
						<table class="tableList">
							<caption></caption>
							<colgroup>
								<col width="5%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="15%">
							</colgroup>
							<thead>
								<th class="noBg"><input type="checkbox" onclick="fn_AllCheck(this, 'alarmCheckBox');"/></th>
								<th sortId="usrNm">이름
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th>전화번호</th>
								<th sortId="alarmDt">신청일
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th sortId="alarmSendDt">발송일
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th sortId="alarmFl">발송여부
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${rslt.selectListCnt != 0}">
										<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
											<tr class="row" style="cursor: pointer;">
												<td><input type="checkbox" name="alarmCheckBox" value="${list.alarmId}"/></td>
												<td><c:out value="${list.usrNm}"/></td>
												<td><c:out value="${list.mblPno}"/></td>
												<td>
													<fmt:parseDate value="${list.alarmDt}" var="alarmDt" pattern="yyyy-MM-dd"/> 
													<fmt:formatDate value="${alarmDt}" pattern="yyyy-MM-dd"/>
												</td>
												<td>
													<fmt:parseDate value="${list.alarmSendDt}" var="alarmSendDt" pattern="yyyy-MM-dd"/> 
													<fmt:formatDate value="${alarmSendDt}" pattern="yyyy-MM-dd"/>
												</td>
												<td><c:out value="${list.alarmFl}"/></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<td colspan="6">데이터가 없습니다.</td>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="T_btnLayer fr">
							<a href="javascript:void(0);" onclick="fn_updateAlarmSendProc('Y');"><button type="button" class="blueBtn L">발송완료</button></a>
							<a href="javascript:void(0);" onclick="fn_updateAlarmSendProc('N');"><button type="button" class="blueBtn L">발송취소</button></a>
						</div>
					</div>
				</form:form>
				<!-- 페이징// -->
				<div class="paging_place">
					<div class="paging_wrap">
						<comTag:paging totalCount="${rslt.selectListCnt}" pageNo="${alarmVO.pageIndex}" pageSize="${alarmVO.pageSize}" clickPage="fn_searchList"/>
					</div>
				</div>
				<!-- 페이징// -->
			</div>
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<form name="updateForm" id="updateForm" method="post" action="${basePath}/alarm/w/n/updateAlarmSendProc.do">
		<input type="hidden" id="alarmId" name="alarmId">
		<input type="hidden" id="pageIndex" name="pageIndex">
		<input type="hidden" id="alarmFl" name="alarmFl">
	</form>
	<!-- footer // -->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- // footer -->
	<script type="text/javascript" src="${scriptPath}/common.js"></script>
	<script type="text/javascript">
	//검색, 페이지 이동
	var fn_searchList = function(pageNo){
		var forms = document.listForm;
		forms.pageIndex.value = pageNo;
		forms.submit();
	};
	
	//정렬
	var fn_sort = function(obj) {
		var frm = document.listForm;
		frm.sortDescend.value = obj.className == "arrow_ascending" ? "asc" : "desc";
		frm.sortSubject.value = obj.parentNode.getAttributeNode("sortId").value;
		frm.submit();
	};
	
	//테이블 선택시 체크박스 선택
	$("td").click(function(e) {
		var chk = $(this).closest("tr").find("input:checkbox").get(0);
		if(e.target != chk) {
			chk.checked = !chk.checked;
		}
	});
	
	//발송완료,취소
	var fn_updateAlarmSendProc = function(alarmFl) {
		if($("input[name='alarmCheckBox']:checked").length > 0) {
			if(alarmFl == "Y") {
				var result = confirm("선택하신 알람을 완료처리 하시겠습니까?");
			} else {
				var result = confirm("선택하신 알람을 취소처리 하시겠습니까?");
			}
			
			if(result) {
				var alarmId = "";
				var comFlag = "";
				$("input[name='alarmCheckBox']:checked").each(function(i) {
					if(i > 0) {
						comFlag = ",";
					}
					alarmId = alarmId + comFlag + $(this).val();
				});
				var frm = document.updateForm;
				frm.pageIndex.value = 1;
				frm.alarmId.value = alarmId;
				frm.alarmFl.value = alarmFl;
				frm.submit();
			}
		} else {
			alert("발송 처리하실 알람을 선택해주세요.");
		}
	};
	</script>
</body>
</html>

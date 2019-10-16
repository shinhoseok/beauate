<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>BASIC</title>
<!--공통css-->
<link rel="stylesheet" type="text/css" href="${cssPath}/common.css">
<!--현업 main page-->
<link rel="stylesheet" type="text/css" href="${cssPath}/worksite.css">
<!-- 스크립트 선언 -->
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="${scriptPath}/common.js"></script>
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
				<p class="contentTitle">결재 관리</p>
				<p class="sub_path">
					<img src="${imagePath }/ico_home.png" width="10" height="9" />
					<c:forEach items="${setSubTitleList}" var="list" >
						>&nbsp;<c:out value="${list.menuName }"></c:out>
					</c:forEach>
				</p>
				<form:form commandName="payVO" id="listForm" name="listForm" method="post" action="${basePath}/paymgr/r/m/selectPayMngList.do">
					<form:hidden path="payId"/>
					<form:hidden path="sortSubject"/>
					<form:hidden path="sortDescend"/>
					<form:hidden path="pageIndex"/>
					<!-- selectBox Start -->
					<div class="selectBox">
						<form:select path="searchCondition" class="w13p">
							<form:option value="usrNm" label="이름"></form:option>
							<form:option value="emailAddr" label="이메일"></form:option>
						</form:select> 
						<form:input path="searchKeyword" onkeydown="if(event.keyCode==13){javascript:fn_searchList(1);}" class="searchName" style="width: 737px;"></form:input>
						<button type="button" class="grayBtn ico" onclick="javascript:fn_searchList(1);"><img src="${imagePath }/ico_search.png"> 검색</button>
					</div>
					<!-- selectBox End -->
					<div class="tableLayer">
						<table class="tableList">
							<caption></caption>
							<colgroup>
								<col width="5%">
								<col width="10%">
								<col width="*">
								<col width="10%">
								<col width="10%">
								<col width="15%">
								<col width="10%">
							</colgroup>
							<thead>
								<th class="noBg"><input type="checkbox" onclick="fn_AllCheck(this, 'payCheckBox');"/></th>
								<th sortId="usrNm">이름
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th sortId="emailAddr">이메일
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th sortId="payCostNo">결제금액
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th sortId="payStNm">결제방법
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th sortId="payMethodNm">결제상태
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
								<th sortId="payDt">결제일
									<span class="arrow_descending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
									<span class="arrow_ascending"><a href="#" onclick="javascript:fn_sort(this.parentNode);"></a></span>
								</th>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${rslt.selectListCnt != 0}">
										<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
											<tr>
												<td><input type="checkbox" name="payCheckBox" id="payChk_${i.count}" value="${list.payId}"/></td>
												<td><c:out value="${list.usrNm}"/></td>
												<td style="text-align: left;"><c:out value="${list.emailAddr}"/></td>
												<td><c:out value="${list.payCostNo}"/></td>
												<td><c:out value="${list.payMethodNm}"/></td>
												<td>
													<select onchange="javascript:fn_selectPaySt('${i.count}')">
														<c:forEach items="${rslt.payStCodeList}" var="codeList" varStatus="index">
															<c:choose>
																<c:when test="${codeList.mclsCd eq list.paySt}">
																	<option selected="selected" value="${codeList.mclsCd }"><c:out value="${codeList.mclsNm}"/></option>
																</c:when>
																<c:otherwise>
																	<option value="${codeList.mclsCd }"><c:out value="${codeList.mclsNm}"/></option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												</td>
												<td>
													<fmt:formatDate value="${list.payDt}" pattern="yyyy-MM-dd"/>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<td colspan="7">데이터가 없습니다.</td>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="T_btnLayer fr">
							<a href="${basePath}/paymgr/r/m/selectPayMngList.do"><button type="button" class="blueBtn L">취소</button></a>
							<a href="javascript:void(0);" onclick="fn_updatePayStProc();"><button type="button" class="blueBtn L">수정</button></a>
						</div>
					</div>
				</form:form>
				<!-- 페이징// -->
				<div class="paging_place">
					<div class="paging_wrap">
						<comTag:paging totalCount="${rslt.selectListCnt}" pageNo="${payVO.pageIndex}" pageSize="${payVO.pageSize}" clickPage="fn_searchList"/>
					</div>
				</div>
				<!-- 페이징// -->
			</div>
		</div>
		<!--container End-->
	</div>
	<!--wrap End-->
	<form name="updateForm" id="updateForm" method="post" action="${basePath}/paymgr/w/n/updatePayStProc.do">
		<input type="hidden" id="payId" name="payId">
		<input type="hidden" id="paySt" name="paySt">
	</form>
	<!-- footer // -->
	<%@ include file="/WEB-INF/jsp/beauate/common/footer.jsp"%>
	<!-- // footer -->
<script type="text/javascript">
//정렬
var fn_sort = function(obj) {
	var frm = document.listForm;
	frm.sortDescend.value = obj.className == "arrow_ascending" ? "asc" : "desc";
	frm.sortSubject.value = obj.parentNode.getAttributeNode("sortId").value;
	frm.submit();
};

//셀렉트박스 변경
var fn_selectPaySt = function(i) {
	var ischecked = $("#payChk_"+i).is(':checked');
	if(ischecked) {
		$("#payChk_"+i).attr('checked', false);
	} else {
		$("#payChk_"+i).attr('checked', true);
	}
};

//검색, 페이지 이동
var fn_searchList = function(pageNo){
	var frm = document.listForm;
	frm.pageIndex.value = pageNo;
	frm.submit();
};

//결재상태수정
var fn_updatePayStProc = function() {
	if($("input[name='payCheckBox']:checked").length > 0) {
		var result = confirm("선택하신 결재상태를 수정 하시겠습니까?");
		if(result) {
			var payId = "";
			var paySt = "";
			var comFlag = "";
			$("input[name='payCheckBox']:checked").each(function(i) {
				if(i > 0) {
					comFlag = ",";
				}
				payId = payId + comFlag + $(this).val();
				paySt = paySt + comFlag + $(this).parent().parent().find("option:selected").val();
			});
			var frm = document.updateForm;
			frm.payId.value = payId;
			frm.paySt.value = paySt;
			frm.submit();
		}
	} else {
		alert("발송 처리하실 알람을 선택해주세요.");
	}
};
</script>
</body>
</html>

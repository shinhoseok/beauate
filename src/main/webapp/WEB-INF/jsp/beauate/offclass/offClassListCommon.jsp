<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<li>
	<a href="javascript:void(0);" onclick="javascript:fn_selectOffClassDetail('${list.classId }');">
		<div class="thumb">
			<img src="${uploadPath}/<c:out value="${list.imgSrc }"/>" alt="" />
			<!-- 오늘날짜 todayNum -->
			<fmt:parseDate value="${rslt.today}" var="todayParseDate" pattern="yyyy-MM-dd"/> 
			<fmt:parseNumber value="${todayParseDate.time / (1000*60*60*24)}" integerOnly="true" var="todayNum"/>
			<!-- 개강일 classStartDtNum -->
			<fmt:parseDate value="${list.classStartDt}" var="classStartDtParseDate" pattern="yyyy-MM-dd"/>
			<fmt:parseNumber value="${classStartDtParseDate.time / (1000*60*60*24)}" integerOnly="true" var="classStartDtNum"/>
			<!-- 종료일 classEndDtNum -->
			<fmt:parseDate value="${list.classEndDt}" var="classEndDtParseDate" pattern="yyyy-MM-dd"/>
			<fmt:parseNumber value="${classEndDtParseDate.time / (1000*60*60*24)}" integerOnly="true" var="classEndDtNum"/>
			<!-- 수강최대인원 classBigNo / 수강신청인원 classApplyNo -->
			<fmt:parseNumber var="classBigNoNum" type="number" value="${list.classBigNo}" />
			<fmt:parseNumber var="classApplyNoNum" type="number" value="${list.classApplyNo}" />
			<c:if test="${(classStartDtNum - todayNum) < 0 or classBigNoNum <= classApplyNoNum}">
				<c:choose>
					<c:when test="${classEndDtNum - todayNum < 0}">
						<div class="soldout"></div>
						<div class="soldout-txt">종료</div>
					</c:when>
					<c:otherwise>
						<div class="soldout"></div>
						<div class="soldout-txt">신청마감</div>
					</c:otherwise>
				</c:choose>
			</c:if>
			<c:if test="${(todayNum - classStartDtNum) <= 0 and classEndDtNum - todayNum >= 0 and classStartDtNum - todayNum >= 0}">
				<div class="count"><span>${((todayNum - classStartDtNum)*-1) +1 }일 남았어요!</span></div>
			</c:if>
		</div>
		<div class="title">${list.classAreaStNm}</div>
		<div class="desc">${list.classTitle}</div>
		<div class="etc">
			<span>개강일</span>
			<span>
				<fmt:parseDate value="${list.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
				<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
			</span>
		</div>
	</a>
</li>
<form:form commandName="classVO" method="post" id="detailForm" action="">
	<form:hidden path="classId" id="classId"/>
</form:form>
<script>
//상세화면 클릭시
var fn_selectOffClassDetail = function(classId) {
	$("#detailForm #classId").val(classId);
	$("#detailForm").attr("action", "${basePath}/offclass/a/t/selectOffClassDetail.do");
	$("#detailForm").submit();
};
</script>
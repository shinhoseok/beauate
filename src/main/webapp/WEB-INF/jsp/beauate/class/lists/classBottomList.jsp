<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
button.off {
    pointer-events: none !important;
    cursor: default !important;
}
</style>
<jsp:useBean id="now" class="java.util.Date" scope="request"/>
<fmt:parseNumber
    value="${ now.time }"
    integerOnly="true" var="nowDays" scope="request"/>
<ul class="product-list-01" data-column="4">
<c:forEach var="cls" items="${classListBottom}" begin="0" end="${fn:length(classListBottom)-1}">
<fmt:parseDate var="parsedClsSDt" value="${cls.classStartDt}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
<fmt:formatDate var="etcDtStr" value="${parsedClsSDt}" pattern="yyyy-MM-dd(E)" />
   <fmt:parseNumber
   value="${ parsedClsSDt.time }"
   integerOnly="true" var="classDays" scope="request"/>
   <c:set var="img" value=""/>
   <c:if test="${fn:length(cls.classFileList)>0}">
	<c:forEach var="clsImg" items="${cls.classFileList}" begin="0" end="${fn:length(cls.classFileList)-1}">
		<c:if test="${clsImg.fileCn=='M1' }">
			<c:set var="path" value="${fn:split(clsImg.fileStreCours, '/')}" />
			<c:set var="path" value="${path[fn:length(path)-1]}" />
			<c:set var="path" value="${fn:replace(path,'\\\\','/')}" />
			<c:set var="img" value="${uploadPath}${path}/${clsImg.streFileNm}"/>
		</c:if>
	</c:forEach>
</c:if>
<c:set var="remainDays" value="${classDays-nowDays}"/>
<c:set var="remainDays" value="${(remainDays)/ (1000*60*60*24)}"/>
<fmt:formatNumber var="remainDays" value="${remainDays+(1-(remainDays%1))%1}" type="number"/>
	<li>
		<a href="${basePath}/class/a/t/classDetail.do?classId=${cls.classId}">
			<div class="thumb">
				<img src="${img}" alt="" />
				<c:choose>
					<c:when test="${cls.classStNm != null && cls.classStNm !='' }">
						<c:choose>
							<c:when test="${cls.classStNm  == '신청마감' || cls.classStNm  == '오픈전' || cls.classStNm  == '오픈중'}">
								<c:choose>
								<c:when test="${remainDays<=7 and remainDays>=0}">
									<div class="count"><span>${remainDays==-0?0:remainDays}일 남았어요!</span></div>
								</c:when>
								<c:otherwise>
								</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${cls.classStNm  == '종료'}">
								<div class="soldout">${cls.classStNm}</div>
								<div class="soldout-txt">${cls.classStNm}</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
						<c:when test="${remainDays<=7 and remainDays>=0}">
							<div class="count"><span>${remainDays==-0?0:remainDays}일 남았어요!</span></div>
						</c:when>
						<c:when test="${remainDays<0}">
							<div class="soldout"></div>
							<div class="soldout-txt">신청마감</div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="title">${cls.classAreaStNm}</div>
			<div class="desc">${cls.classTitle}</div>
			<div class="etc">
				<span>개강일</span>
				<span>${etcDtStr}</span>
			</div>
		</a>
	</li>
   </c:forEach>
</ul>

<!-- 페이징// -->
<div class="paging">
	<ui:pagination paginationInfo="${paginationInfo}" type="front" jsFunction="fn_ajaxList" />
</div>
<!-- 페이징// -->
<!-- 
<div class="paging">
	<button type="button" class="btn-prev"><span>이전</span></button>
	<ul>
		<li class="active"><span>1</span></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
	</ul>
	<button type="button" class="btn-next"><span>다음</span></button>
</div>
 -->
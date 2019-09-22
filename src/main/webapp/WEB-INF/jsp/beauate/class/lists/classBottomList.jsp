<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" scope="request"/>
<fmt:parseNumber
    value="${ now.time / (1000*60*60*24) }"
    integerOnly="true" var="nowDays" scope="request"/>
<ul class="product-list-01" data-column="4">
<c:if test="${fn:length(classListBottom)>0}">
<c:forEach var="cls" items="${classListBottom}" begin="0" end="${fn:length(classListBottom)-1}">
<fmt:parseDate var="parsedClsSDt" value="${cls.classStartDt}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
<fmt:formatDate var="etcDtStr" value="${parsedClsSDt}" pattern="yyyy-MM-dd(E)" />
   <fmt:parseNumber
   value="${ parsedClsSDt.time / (1000*60*60*24) }"
   integerOnly="true" var="classDays" scope="request"/>
   <c:set var="img" value=""/>
   <c:if test="${fn:length(cls.classFileList)>0}">
	<c:forEach var="clsImg" items="${cls.classFileList}" begin="0" end="${fn:length(cls.classFileList)-1}">
		<c:if test="${clsImg.fileCn=='M1' }">
		<c:set var="path" value="${fn:split(fileStreCours, '/')}" />
		<c:set var="img" value="${uploadPath}/${path[fn:length(path)-1]}${clsImg.streFileNm}.${clsImg.fileExtsn}"/>
		</c:if>
	</c:forEach>
</c:if>
	<li>
		<a href="#">
			<div class="thumb">
				<img src="${img}" alt="" />
				<c:choose>
					<c:when test="${classStNm != null && classStNm !='' }">
						<c:choose>
							<c:when test="${classStNm  == '오픈전' || classStNm  == '오픈중'}">
								<c:choose>
								<c:when test="${classDays-nowDays==1}">
									<div class="count"><span>1일 남았어요!</span></div>
								</c:when>
								<c:otherwise>
								</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${classStNm  == '신청마감' || classStNm  == '종료'}">
								<div class="soldout">${classStNm}</div>
								<div class="soldout-txt">${classStNm}</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
						<c:when test="${classDays-nowDays>0}">
							<div class="count"><span>${classDays-nowDays}일 남았어요!</span></div>
						</c:when>
						<c:when test="${classDays-nowDays>0}">
							<div class="count"><span>${classDays-nowDays}일 남았어요!</span></div>
						</c:when>
						<c:when test="${classDays-nowDays<0}">
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
   </c:if>
</ul>

<!-- 페이징// -->
<div class="paging">
	<ui:pagination paginationInfo="${paginationInfo}" type="front" jsFunction="fn_ajaxList" />
</div>
<!-- 페이징// -->
<div class="sr">페이징은 프레임워크를 써야하는데 프레임웤이 제공하는 UI에 퍼블리싱이 맞춰줘야 함.</div>
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
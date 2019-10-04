<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<ul class="product-list-01" data-column="4">
	<c:choose>
		<c:when test="${rslt.selectListCnt != 0}">
			<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
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
							<c:if test="${(todayNum - classStartDtNum) <= 0 and classEndDtNum - todayNum > 0 and classStartDtNum - todayNum >= 0}">
								<div class="count"><span>${((todayNum - classStartDtNum)*-1) +1 }일 남았어요!</span></div>
							</c:if>
						</div>
						<div class="title"><c:out value="${list.classAreaStNm}"/></div>
						<div class="desc"><c:out value="${list.classTitle}"/></div>
						<div class="etc">
							<span>개강일</span>
							<span>
								<fmt:parseDate value="${list.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
								<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
							</span>
						</div>
					</a>
				</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<li>데이터가 없습니다.</li>
		</c:otherwise>
	</c:choose>
</ul>
<div class="paging">
<%-- 	<ui:pagination paginationInfo="${rslt.paginationInfo}" type="front" jsFunction="fn_searchList" /> --%>
	<ui:pagination paginationInfo="${rslt.paginationInfo}" type="image" jsFunction="fn_searchList" />
</div>
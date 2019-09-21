<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<div class="sub_leftMenu">
	<h3><c:out value="${setSubTitleList[0].menuName }"></c:out></h3>
	<ul id="left_menu" class="menuBox">
		<c:set var="lmPrelevel" value="0"/>
		<c:forEach var="lmResult" items="${setLeftMenuList}" varStatus="status">
			<c:if test="${lmPrelevel > lmResult.level}">		
			 	<c:forEach begin="1" end="${lmPrelevel - lmResult.level}">
			 		</ul>					
					</li>
				</c:forEach>
			</c:if>
			<c:choose>
				<c:when test="${lmResult.isleaf eq '1' && lmResult.level eq '1'}">
					<li <c:if test="${lmResult.menuId eq menuSetVO.menuId2Lvl}">class="selectbigMenu"</c:if> <c:if test="${lmResult.menuId ne menuSetVO.menuId2Lvl}">class="bigMenu"</c:if> id="${lmResult.menuId}" levelw="${lmResult.level}" uprMenuId ="${lmResult.uprMenuId }">
						<a href="#" onclick='javascript:fn_moveMenuClick("${lmResult.menuId}", "${lmResult.menuName}", "${lmResult.pgmUrl}", "${lmResult.otUrl}","${lmResult.level}","${lmResult.menuUrlGubun}");'>
							<c:out value="${lmResult.menuName}"></c:out>
						</a>
					</li>
				</c:when>
				<c:when test="${lmResult.isleaf eq '1' && lmResult.level eq '2'}">
					<li <c:if test="${lmResult.menuId eq menuSetVO.menuId3Lvl}">class="smallMenu"</c:if> class="smallMenu" id="${lmResult.menuId}" levelw="${lmResult.level}" uprMenuId ="${lmResult.uprMenuId }">
						<a href='#' onclick='javascript:fn_moveMenuClick("${lmResult.menuId}", "${lmResult.menuName}", "${lmResult.pgmUrl}", "${lmResult.otUrl}","${lmResult.level}","${lmResult.menuUrlGubun}");'>
							<c:out value="${lmResult.menuName}"></c:out>
						</a>
					</li> 
				</c:when>
				<c:otherwise>
					<li class="bigMenu" id="${lmResult.menuId}" levelw="${lmResult.level}" uprMenuId ="${lmResult.uprMenuId }">
						<a href='#' onclick='javascript:fn_moveMenuClick("${lmResult.menuId}", "${lmResult.menuName}", "${lmResult.pgmUrl}", "${lmResult.otUrl}","${lmResult.level}","${lmResult.menuUrlGubun}");'>
							<c:out value="${lmResult.menuName}"></c:out></a>
					<div class="subMenu">
						<ul style="display:block" insideMenu="Y" liId="${lmResult.menuId}" id="${lmResult.menuId}Ul">
				</c:otherwise>
			</c:choose>
			<c:set var="lmPrelevel" value="${lmResult.level}"/>	
			<c:if test="${status.last}">		
			 	<c:forEach begin="1" end="${lmResult.level-1}">
			 				</ul>
			 			</div>			
				</c:forEach>
			</c:if>	
		</c:forEach>
	</ul>
</div>

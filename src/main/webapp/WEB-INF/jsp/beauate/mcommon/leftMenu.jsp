<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<div class="sub_leftMenu">
<!-- 	<h3>오프라인 클래스관리</h3> -->
	<ul class="menuBox">
		<c:choose>
			<c:when test="${alevel eq '1'}">
				<c:if test="${blevel eq '1'}">
					<li class="bigMenu"><a href="${basePath}/offclassm/r/n/selectOffClassChart.do">통계</a>
						<div class="subMenu">
							<c:if test="${clevel eq '1'}">
								<ul>
									<li class="selectsubMenu"><a href="${basePath}/offclassm/r/n/selectOffClassChart.do">클래스별 사용자통계</a></li>
								</ul>
							</c:if>
						</div>
					</li>
					<li class="bigMenu"><a href="${basePath}/offclassm/r/m/selectOffClassList.do">클래스 관리</a>
						<div class="subMenu">
							<c:if test="${clevel eq '1'}">
								<ul>
									<li class="smallMenu"><a href="${basePath}/offclassm/r/m/selectOffClassList.do">오프라인 클래스관리</a></li>
								</ul>
							</c:if>
						</div>
					</li>
				</c:if>
				<c:if test="${blevel eq '2'}">
					<li class="bigMenu"><a href="${basePath}/offclassm/r/n/selectOffClassChart.do">통계</a>
						<div class="subMenu">
							<c:if test="${clevel eq '1'}">
								<ul>
									<li class="smallMenu"><a href="${basePath}/offclassm/r/n/selectOffClassChart.do">클래스별 사용자통계</a></li>
								</ul>
							</c:if>
						</div>
					</li>
					<li class="bigMenu"><a href="${basePath}/offclassm/r/m/selectOffClassList.do">클래스 관리</a>
						<div class="subMenu">
							<c:if test="${clevel eq '1'}">
								<ul>
									<li class="selectsubMenu"><a href="${basePath}/offclassm/r/m/selectOffClassList.do">오프라인 클래스관리</a></li>
								</ul>
							</c:if>
						</div>
					</li>
				</c:if>
			</c:when>
		</c:choose>
	</ul>
</div>

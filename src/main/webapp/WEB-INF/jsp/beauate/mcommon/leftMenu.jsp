<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<div class="sub_leftMenu">
	<ul class="menuBox">
		<c:choose>
			<c:when test="${alevel eq '1'}">
				<c:if test="${blevel eq '1'}">
					<li class="bigMenu"><a href="${basePath}/mento/r/n/selectOffClassList.do">클래스 관리</a>
						<div class="subMenu">
							<c:if test="${clevel eq '1'}">
								<ul>
									<li class="selectsubMenu"><a href="${basePath}/mento/r/n/selectOffClassList.do">오프라인 클래스 관리</a></li>
								</ul>
							</c:if>
						</div>
					</li>
					<li class="bigMenu"><a href="${basePath}/mento/r/n/selectMentoPayUserList1.do">클래스 신청자 관리</a>
						<div class="subMenu">
							<ul>
								<li class="smallMenu"><a href="${basePath}/mento/r/n/selectOffClassChart.do">찜&결제 리스트</a></li>
								<li class="smallMenu"><a href="${basePath}/mento/r/n/selectMentoPayUserList2.do">알람 신청 리스트</a></li>
							</ul>
						</div>
					</li>
					<li class="bigMenu"><a href="${basePath}/mento/r/n/selectMentohoogiList.do">후기 관리</a>
						<div class="subMenu">
							<ul>
								<li class="smallMenu"><a href="${basePath}/mento/r/n/selectMentohoogiList.do">후기관리 리스트</a></li>
							</ul>
						</div>
					</li>
				</c:if>
				<c:if test="${blevel eq '2'}">
					<li class="bigMenu"><a href="${basePath}/mento/r/n/selectOffClassList.do">클래스 관리</a>
						<div class="subMenu">
							<ul>
								<li class="smallMenu"><a href="${basePath}/mento/r/n/selectOffClassList.do">오프라인 클래스 관리</a></li>
							</ul>
						</div>
					</li>
					<li class="bigMenu"><a href="${basePath}/mento/r/n/selectMentoPayUserList1.do">클래스 신청자 관리</a>
						<div class="subMenu">
							<c:if test="${clevel eq '1'}">
								<ul>
									<li class="selectsubMenu"><a href="${basePath}/mento/r/n/selectOffClassChart.do">찜&결제 리스트</a></li>
									<li class="smallMenu"><a href="${basePath}/mento/r/n/selectMentoPayUserList2.do">알람 신청 리스트</a></li>
								</ul>
							</c:if>
							<c:if test="${clevel eq '2'}">
								<ul>
									<li class="smallMenu"><a href="${basePath}/mento/r/n/selectOffClassChart.do">찜&결제 리스트</a></li>
									<li class="selectsubMenu"><a href="${basePath}/mento/r/n/selectMentoPayUserList2.do">알람 신청 리스트</a></li>
								</ul>
							</c:if>
						</div>
					</li>
					<li class="bigMenu"><a href="${basePath}/mento/r/n/selectMentohoogiList.do">후기 관리</a>
						<div class="subMenu">
							<ul>
								<li class="smallMenu"><a href="${basePath}/mento/r/n/selectMentohoogiList.do">후기관리 리스트</a></li>
							</ul>
						</div>
					</li>
				</c:if>
				<c:if test="${blevel eq '3'}">
					<li class="bigMenu"><a href="${basePath}/mento/r/n/selectOffClassList.do">클래스 관리</a>
						<div class="subMenu">
							<ul>
								<li class="smallMenu"><a href="${basePath}/mento/r/n/selectOffClassList.do">오프라인 클래스 관리</a></li>
							</ul>
						</div>
					</li>
					<li class="bigMenu"><a href="${basePath}/mento/r/n/selectMentoPayUserList1.do">클래스 신청자 관리</a>
						<div class="subMenu">
							<ul>
								<li class="smallMenu"><a href="${basePath}/mento/r/n/selectOffClassChart.do">찜&결제 리스트</a></li>
								<li class="smallMenu"><a href="${basePath}/mento/r/n/selectMentoPayUserList2.do">알람 신청 리스트</a></li>
							</ul>
						</div>
					</li>
					<li class="bigMenu"><a href="${basePath}/mento/r/n/selectMentohoogiList.do">후기 관리</a>
						<div class="subMenu">
							<c:if test="${clevel eq '1'}">
								<ul>
									<li class="selectsubMenu"><a href="${basePath}/mento/r/n/selectMentohoogiList.do">후기관리 리스트</a></li>
								</ul>
							</c:if>
						</div>
					</li>
				</c:if>
			</c:when>
			<c:when test="${blevel eq '2'}">
			
			</c:when>
		</c:choose>
	</ul>
</div>

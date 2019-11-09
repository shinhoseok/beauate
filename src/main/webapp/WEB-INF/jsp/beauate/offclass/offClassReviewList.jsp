<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<h3>Review class 수강후기</h3>
<div class="grade">
	<p class="grade-num"><c:out value="${rslt.scoreSum}"/></p>
	<ul class="grade-list">
		<li><span class="tit">커리큘럼</span> <span class="star"><span style="width: <c:out value='${rslt.curriculumStarSum}'/>%;"></span></span></li>
		<li><span class="tit">시간준수</span> <span class="star"><span style="width: <c:out value='${rslt.timeProStarSum}'/>%;"></span></span></li>
		<li><span class="tit">전달력</span> <span class="star"><span style="width: <c:out value='${rslt.communityStarSum}'/>%;"></span></span></li>
		<li><span class="tit">친절도</span> <span class="star"><span style="width: <c:out value='${rslt.kindnessStarSum}'/>%;"></span></span></li>
	</ul>
</div>
<ul class="review-list">
	<c:choose>
		<c:when test="${rslt.selectListCnt != 0}">
			<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
				<li>
					<div class="review-info">
						<span class="name"><c:out value="${list.usrNm}"/></span>
						<span class="date">
							<fmt:parseDate value="${list.reviewDt}" var="reviewDt" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${reviewDt}" pattern="yy.MM.dd"/>
						</span>
					</div>
					<p class="txt"><c:out value="${list.reviewCtt}"/></p>
					<c:if test="${fn:length(list.commentList) != 0}">
						<c:forEach items="${list.commentList}" var="commList" varStatus="status">
							<div class="my-r4">
								<div class="my-r4-i">
									<a href="javascript:void(0);" onclick="javascript:fn_commentShowOrHide('${i.count}');">댓글보기<span class="my-r4-no">${fn:length(list.commentList)}</span></a>
								</div>
							</div>
							<div class="my-r4-m" id="my_r4_m${i.count}" style="display: none;">
								<p class="r4-m-nm">
									<c:choose>
										<c:when test="${commList.usrId eq 'USR-000000'}">
											<img src="${imgPath}/my-r4-admin.png" alt="" /><c:out value="${commList.usrNm }"/>
										</c:when>
										<c:otherwise>
											<img src="${imgPath}/my-r4-m.png" alt="" /><c:out value="${commList.usrNm }"/>
										</c:otherwise>
									</c:choose>
									<span>
										<fmt:parseDate value="${commList.commentDt}" var="commentDt" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${commentDt}" pattern="yyyy.MM.dd"/>
									</span>
								</p>
								<p class="cmt-m">
									<c:out value="${commList.commentCtt }"/>
								</p>
							</div> <!--마지막 선-->
							<div class="my-last-line"></div>
						</c:forEach>
					</c:if>
				</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<li>데이터가 없습니다.</li>
		</c:otherwise>
	</c:choose>
</ul>
<!--페이징-->
<div class="paging">
	<ui:pagination paginationInfo="${rslt.paginationInfo}" type="image" jsFunction="fn_searchReviewList" />
</div>

<script type="text/javascript">
//댓글보기 show&hide
var fn_commentShowOrHide = function(idx) {
	if($("#my_r4_m"+idx).css("display") == "none") {
		$("#my_r4_m"+idx).show();
	} else {
		$("#my_r4_m"+idx).hide();
	}
};
</script>
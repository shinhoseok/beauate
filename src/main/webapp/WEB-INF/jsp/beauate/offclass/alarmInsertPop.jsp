<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<h2>sign in</h2>
<p class="title-desc">알람신청</p>
<div class="item">
	<div class="thumb">
		<img src="${uploadPath}/<c:out value="${classPopVO.imgSrc3 }"/>" alt="" />
	</div>
	<div class="rcont">
		<div class="desc"><c:out value="${classPopVO.classTitle}"/></div>
		<div class="etc">
			<span>개강일</span>
			<span>
				<fmt:parseDate value="${classPopVO.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
				<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
			</span>
		</div>
	</div>
</div>
<dl class="alarm-phone" id="alarm-phone">
	<dt>휴대폰</dt>
	<dd><c:out value="${mblPno}"/></dd>
</dl>
<div class="my-modify">
	<span>번호변경을 원하실 경우 마이페이지에 변경하실 수 있습니다.</span>
	<a href="${basePath}/mypage/r/t/selectMyClassList.do?mypageTab=5">내 정보수정</a>
</div>
<div class="btn-area">
	<button class="btn" type="button" onclick="javascript:fn_selectAlarmProc('<c:out value="${classPopVO.classId}"/>');">
		<span>알람신청</span>
	</button>
</div>
<a href="javascript:void(0);" rel="modal:close" class="modal-close" onclick="javascript:fn_offClassAlarmPopClose();">닫기</a>
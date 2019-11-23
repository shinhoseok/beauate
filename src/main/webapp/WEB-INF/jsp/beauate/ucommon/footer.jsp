<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<div id="footer">
	<div class="foot-inner">
		<div class="flogo">
			<h2>BEAUATE</h2>
			<p class="flogo-desc">미용교육전문 매거진, 뷰아뗴</p>
		</div>
		<div class="foot-info">
			<ul class="foot-nav">
				<li><a href="https://docs.google.com/document/d/1m_I1l9hSjZQIxQt1Yk61F5PXLw57SLy9aAUpmJ4TfL8/edit?usp=sharing" target="_blank">개인정보취급방침</a></li>
				<li><a href="https://docs.google.com/document/d/1bnaICcR8reoAvfMxg2wP8jGKy0V3_SC0X6Yv4cwkctc/edit" target="_blank">이용약관</a></li>
				<li><a href="${basePath}/mento/a/n/mentoApply.do">멘토지원</a></li>
				<li><a href="${basePath}/mento/r/n/selectOffClassList.do">멘토</a></li>
<%-- 				<c:if test="${ sessionScope.loginVO.menuRlDiv == 'z'}"> --%>
					<li><a href="${basePath}/common/a/n/portalAdminBridge.do">관리자</a></li>
<%-- 				</c:if> --%>
			</ul>
			<ul class="foot-sns">
				<li class="sns-inst"><a href="https://www.instagram.com/beauate" target="_blank">Instagram</a></li>
				<li class="sns-face"><a href="javascript:alert('준비중 입니다.');">facebook</a></li>
				<li class="sns-blog"><a href="https://blog.naver.com/beauate" target="_blank">blog</a></li>
			</ul>
			<div class="foot-deinfo">
				<span>대표자 :  박소현</span>
				<span>주소 : 경기도 안산시 단원구 원곡1동 931</span>
				<span>이메일 : beauate@beauate.com  </span>
				<span class="kakao">플러스친구 : 뷰아떼</span>
			</div>
			<div class="copyright">COPYRIGHTSⓒ 2019 BEAUATE. ALL RIGHTS RESERVED.</div>
		</div>
	</div>
</div>

<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "58472c3c-9a08-4d7c-a671-96de913e4d6e"
  });
</script>
<!-- End Channel Plugin -->
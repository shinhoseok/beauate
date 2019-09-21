<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/common/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge; charset=utf-8" />
<title>enki_admin</title>
</head>
<%
	String message = (String) request.getAttribute("message");
	String redirectUrl = (String) request.getAttribute("redirectUrl");
%>
<body>
<script type="text/javascript">
	alert("<%=message%>");
	window.location.href = "${basePath}<%=redirectUrl%>";
</script>
</body>
</html>
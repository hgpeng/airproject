<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>修改模板</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
#showdiv img{width:100%;}
</style>
<%
int port = request.getServerPort();
String scheme = request.getScheme();
String path = request.getScheme()+"://"+request.getServerName() + ((("http".equals(scheme) && port == 80) ||("https".equals(scheme)  && port == 443)) ? "" : ":" + port) + request.getContextPath();
request.setAttribute("base", path);
request.setAttribute("imagepath", path +"/images");
%>
<script type='text/javascript'>
	var base='${base}';
</script>
</head>
<body>
<div id="showdiv" style="width:100%;">
${presentation.html }
</div>
</body>
</html>
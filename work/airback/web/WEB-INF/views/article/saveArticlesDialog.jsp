<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>修改文章</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
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
	<div>
	标题:<input type="text" id="title" style="width:80%"/>
	<div style="clear:both;margin:5px;"></div>
	</div>
	<div>
	类型:<select name="type" id="type">
	<c:forEach items="${bdlist}" var="item">
	<option value="${item.id }">${item.name }(${item.baseType })</option>
	</c:forEach>
	</select>
	</div>
	<div>
	<script type="text/plain" id="content" name="content">${data.content}</script>
	</div>
<script type="text/javascript" src="/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/js/ueditor/ueditor.all.min.js"></script>

<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/js/custom/articles/saveArticlesDialog.js"></script>
</body>
</html>
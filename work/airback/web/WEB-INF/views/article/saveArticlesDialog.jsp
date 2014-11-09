<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>修改文章</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
</style>
<jsp:include  page="../common.jsp"></jsp:include>
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
	<input type="hidden" id="imgpath" name="imgpath"/>
	图片:<input type="button" value="添加" id="upload"/>
	<div id="imgdiv">
	</div>
	</div>
	<div>
	<script type="text/plain" id="content" name="content">${data.content}</script>
	</div>
<script type="text/javascript" src="${base }/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${base }/js/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="${base }/js/artDialog/artDialog.js?skin=blue"></script>
<script type="text/javascript" src="${base }/js/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="${base }/js/ajaxupload.js"></script>
<script type="text/javascript" src="${base }/js/common.js"></script>
<script type="text/javascript" src="${base }/js/custom/articles/saveArticlesDialog.js"></script>
</body>
</html>
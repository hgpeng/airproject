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
	<input type="hidden" id="articleId" value="${article.id }"/>
	<div>
	标题:<input type="text" id="title" style="width:80%" value="${article.title }"/>
	<div style="clear:both;margin:5px;"></div>
	</div>
	<div>
	类型:<select name="type" id="type">
	<c:forEach items="${bdlist}" var="item">
	<option value="${item.id }"
	<c:if test="${article.type==item.id }"></c:if> 
	>${item.name }(${item.baseType })</option>
	</c:forEach>
	</select>
	</div>
	<input type="hidden" id="imgpath" name="imgpath" value="${article.img }"/>
	图片:<input type="button" value="添加" id="upload"/>
	<div id="imgdiv">
	<c:forEach items="${imgList }" var="item">
	<img style='width:100px;' path='"+json.PATH+"' src="${base}/uploadimages/${item}"/>
	</c:forEach>
	</div>
	</div>
	<div style="width:90%">
	<script type="text/plain" id="content" name="content">${article.content}</script>
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
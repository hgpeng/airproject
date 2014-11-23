<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>修改视频</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<input type="hidden" id="videoId" value="${video.id }"/>
标题:<input type="text" id="title" value="${video.name }"/>
<div style="clear:both"></div>
<input id="upload" type="button" value="添加图片"/>
<span id="picPath">${video.icon}</span>
<div id="imgdiv">
	<c:if test="${! empty video.icon }">
		<img style='width:200px;' src='${base}/uploadimages/${video.icon}'/>
	</c:if>
</div>
<br/>
<div style="margin-top:5px;"></div>
<input id="uploadVideo" type="button" value="添加视频"/>
<span id="videoPath">${video.url}</span>

<jsp:include page="../common.jsp"></jsp:include>
<script type="text/javascript" src="${base }/js/artDialog/artDialog.js?skin=blue"></script>
<script type="text/javascript" src="${base }/js/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="${base }/js/custom/video/saveVideoDialog.js"></script>
<script type="text/javascript" src="${base }/js/ajaxupload.js"></script>
<script type="text/javascript" src="${base }/js/common.js"></script>

</body>
</html>
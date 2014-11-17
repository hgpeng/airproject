<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>文章页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<input type="hidden" id="baseTypeId" value="${baseType.id }"/>
<input type="hidden" id="baseTypeName" />
<div id="main">
		<div position="left">
			<div id="leftToolBar"></div>
			<ul id="leftTree" class="ztree"></ul>
		</div>
		<div position="center">
		
			<div id="tableGrid">
			</div>
	    </div>
</div>
<jsp:include page="../common.jsp"></jsp:include>
<script type="text/javascript" src="/js/artDialog/artDialog.js?skin=blue"></script>
<script type="text/javascript" src="/js/artDialog/plugins/iframeTools.js"></script>
<script src="/js/custom/articles/articleIndex.js"></script>
</body>
</html>
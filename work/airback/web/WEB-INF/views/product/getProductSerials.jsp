<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>产品详情系列</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<input type="hidden" id="productType" value="${productType }"/>
<div id="tableGrid"></div>
<jsp:include page="../common.jsp"></jsp:include>
<script type="text/javascript" src="${base}/js/artDialog/artDialog.js?skin=blue"></script>
<script type="text/javascript" src="${base}/js/artDialog/plugins/iframeTools.js"></script>
<script src="${base}/js/custom/product/getProductSerials.js"></script>
</body>
</html>
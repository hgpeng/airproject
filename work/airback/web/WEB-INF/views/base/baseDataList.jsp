<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>${basetype.name }</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<input type="hidden" id="basetypeinp" value="${basetype.id }"/>
<input type="hidden" id="basetypename" value="${basetype.name }"/>
<div id="main">

		
			<div id="tableGrid">
			</div>
	    </div>
 
<jsp:include page="../common.jsp"></jsp:include>
<script type="text/javascript" src="/js/artDialog/artDialog.js?skin=blue"></script>
<script type="text/javascript" src="/js/artDialog/plugins/iframeTools.js"></script>
<script src="/js/custom/base/baseDataList.js"></script>
</body>
</html>
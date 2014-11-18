<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>修改基础类型</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<input type="hidden" id="baseTypeName" value="${baseType.name }"/>
<form id="saveBaseTypeForm">
<input type="hidden" id="typeId" value="${baseType.id }"/>
</form>
<select id="baseTypes" style="display:none;">
<c:forEach items="${baseTypes}" var="item">
<option value="${item.id }">${item.name }</option>
</c:forEach>
</select>
 <link href="/js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css"> 
 <link href="/js/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css"> 
<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/ligerUI/js/core/base.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/ligerUI/js/plugins/ligerForm.js"></script>
<script src="/js/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
<script src="/js/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
<script src="/js/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/custom/base/saveBaseTypeDialog.js"></script>
</body>
</html>
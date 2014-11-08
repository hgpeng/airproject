<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include  page="../common.jsp"></jsp:include>
<title>应用案例</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<input type="button" value="添加" id="upload"/>
<div id="imgdiv">
	
</div>
<script type="text/javascript" src="${base }/js/ajaxupload.js"></script>
<script type="text/javascript" src="${base }/js/common.js"></script>
<script type="text/javascript">
	initajaxupload("upload","/imgupload/upload.html?direct=case",afterupload,null,null);
	
	function afterupload(json,data){
		if(json.STATE=='SUCCESS'){
			var html = "<img src='${base}/images/"+json.PATH+"'/>";
			$(imgdiv).append(html);
			art.dialog.tips("上传成功");
		}else{
			art.dialog.tips("上传失败");
		}
	}
</script>
</body>
</html>
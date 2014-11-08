<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>修改基础类型</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<form id="saveBaseTypeForm">
</form>
<input id="upload" type="button" value="添加图标"/>
<jsp:include page="../common.jsp"></jsp:include>
<script src="${base }/js/ligerUI/js/core/base.js" type="text/javascript"></script>
<script type="text/javascript" src="${base }/js/ligerUI/js/plugins/ligerForm.js"></script>
<script src="${base }/js/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
<script src="${base }/js/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
<script src="${base }/js/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
<script type="text/javascript" src="${base }/js/custom/base/saveBaseDataDialog.js"></script>
<script type="text/javascript" src="${base }/js/ajaxupload.js"></script>
<script type="text/javascript" src="${base }/js/common.js"></script>
<script type="text/javascript">
	initajaxupload("upload","/imgupload/upload.jsps?direct=case",afterupload,null,null);
	
	function afterupload(json,data){
		if(json.STATE=='SUCCESS'){
			
			$("#icon").val(json.PATH);
			
		}else{
			art.dialog.alert("上传失败");
		}
	}
</script>
</body>
</html>
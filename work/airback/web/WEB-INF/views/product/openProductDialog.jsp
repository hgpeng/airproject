<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>修改产品</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<input type="hidden" id="productId" value="${product.id }"/>
	<input type="hidden" id="productName" value="${product.name }"/>
	<input type="hidden" id="productDesc" value="${product.desc }"/>
	<form id="saveProductForm">
		
	</form>
	<div style="clear:both"></div>
	<div style="padding-left:20px;">
	<label>
	<input type="radio" name="baseType" value="1"/>
	首页
	</label>
	<label>
	<input type="radio" name="baseType" value="2"/>
	产品
	</label>
	<label>
	<input type="radio" name="baseType" value="3"/>
	产品详情
	</label>
	</div>
	<div style="clear:both;">
	</div> 
	<input type="hidden" id="mainPhoto" name="mainPhoto" value="${product.mainPhoto }"/>
	<input id="upload" type="button" value="添加图片"/>
	<jsp:include page="../common.jsp"></jsp:include>
	<script src="${base }/js/ligerUI/js/core/base.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="${base }/js/ligerUI/js/plugins/ligerForm.js"></script>
	<script src="${base }/js/ligerUI/js/plugins/ligerTextBox.js"
		type="text/javascript"></script>
	<script src="${base }/js/ligerUI/js/plugins/ligerComboBox.js"
		type="text/javascript"></script>
	<script src="${base }/js/ligerUI/js/plugins/ligerDateEditor.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="${base }/js/custom/product/saveProductDialog.js"></script>
		<script type="text/javascript" src="${base }/js/ajaxupload.js"></script>
<script type="text/javascript" src="${base }/js/common.js"></script>
<script type="text/javascript">
	initajaxupload("upload","/imgupload/upload.jsps?direct=product",afterupload,null,null);
	
	function afterupload(json,data){
		if(json.STATE=='SUCCESS'){
			
			$("#mainPhoto").val(json.PATH);
			
		}else{
			art.dialog.alert("上传失败");
		}
	}
</script>
</body>
</html>
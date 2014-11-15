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
	<input type="radio" name="baseType" value="1" <c:if test="${product.typeId==1 }">checked</c:if> />
	首页
	</label>
	<label>
	<input type="radio" name="baseType" value="2" <c:if test="${product.typeId==2 }">checked</c:if> />
	产品
	</label>
	<label>
	<input type="radio" name="baseType" value="3" <c:if test="${product.typeId==3 }">checked</c:if> />
	产品详情
	</label>
	</div>
	<div style="margin-top:5px;margin-left:20px;">
	产品类别:
	<select id="serials" style="width:150px;">
		<c:forEach items="${serials }" var="item">
			<option value="${item.id }" <c:if test="${product.basedataId==item.id }">selected</c:if>>${item.name }</option>
		</c:forEach>
	</select>
	</div>
	<div style="clear:both;">
	</div> 
	<input type="hidden" id="mainPhoto" name="mainPhoto" value="${product.mainPhoto }"/>
	<input id="upload" type="button" value="添加图片"/>
	<div id="imgdiv">
	<c:if test="${! empty product.mainPhoto }">
		<img style='width:200px;' src='${base}/uploadimages/${product.mainPhoto}'/>
		</c:if>
	</div>
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
		<script type="text/javascript" src="/js/artDialog/artDialog.js?skin=blue"></script>
<script type="text/javascript" src="/js/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="${base }/js/common.js"></script>
<script type="text/javascript">
	initajaxupload("upload","/imgupload/upload.jsps?direct=product",afterupload,null,null);
	
	function afterupload(json,data){
		if(json.STATE=='SUCCESS'){
			art.dialog.tips("上传成功");
			var html = "<img style='width:200px;' src='${base}/uploadimages/"+json.PATH+"'/>";
			$("#imgdiv").html(html);
			
			$("#mainPhoto").val(json.PATH);
			
		}else{
			art.dialog.alert("上传失败");
		}
	}
</script>
</body>
</html>
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
<input type="hidden" id="baseTypeId" value="${typeId }"/>
<input type="hidden" name="id" id="dataId" value="${baseData.id }"/>
	<table>
	<tr>
		<td style="width:30%;">名称:</td><td><input type="text" id="name" name="name" value="${baseData.name }"/></td></tr><tr>
		<td style="width:30%;">编号:</td><td><input type="text" id="number" name="number" value="${baseData.number }"/></td></tr><tr>	
		<td style="width:30%;">封面图:</td><td><input type="text" id="icon" name="icon" readonly="readonly" value="${baseData.icon }"/><input id="upload" type="button" value="添加封面图"/></td></tr><tr>
		<td style="width:30%;">链接:</td><td><input type="text" id="url" name="url" value="${baseData.url }"/><input id="apkupload" type="button" value="添加安装包"/></td></tr><tr>
		<td style="width:30%;">备注:</td><td><textarea style="width:600px;" rows="10" cols="8" id="desc" name="desc">${baseData.desc }</textarea></td>
		</tr>
	</table>

</form>
<div style="clear:both"></div>
<jsp:include page="../common.jsp"></jsp:include>
<script type="text/javascript" src="${base }/js/ligerUI/js/plugins/ligerForm.js"></script>
<script src="${base }/js/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
<script src="${base }/js/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
<script src="${base }/js/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
<script type="text/javascript" src="${base }/js/artDialog/artDialog.js?skin=blue"></script>
<script type="text/javascript" src="${base }/js/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="${base }/js/ajaxupload.js"></script>
<script type="text/javascript" src="${base }/js/common.js"></script>
<script type="text/javascript">
	initajaxupload("upload","/imgupload/upload.jsps?direct=down",afterupload,null,null);
	initajaxupload("apkupload","/imgupload/upload.jsps?direct=down",afterapkupload,null,null);
	function afterupload(json,data){
		if(json.STATE=='SUCCESS'){
			
			art.dialog.alert("上传成功",function(){
				$("#icon").val(json.PATH);
			});
			
		}else{
			art.dialog.alert("上传失败");
		}
	}
	
	function afterapkupload(json,data){
		if(json.STATE=='SUCCESS'){
			
			art.dialog.alert("上传成功",function(){
				$("#url").val(json.PATH);
			});
			
		}else{
			art.dialog.alert("上传失败");
		}
	}
</script>
</body>
</html>
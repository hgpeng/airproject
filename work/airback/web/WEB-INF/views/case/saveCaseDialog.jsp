<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>应用案例</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common.jsp"></jsp:include>
</head>
<body>
<form id="saveBaseTypeForm">
	<input type="hidden" name="id" id="dataId" value="${data.id }"/>
	<table>
	<tr>
		<td style="width:30%;">名称:</td><td><input type="text" id="name" name="name" value="${data.name }"/></td></tr><tr>
		<td style="width:30%;">编号:</td><td><input type="text" id="number" name="number" value="${data.number }"/></td></tr><tr>	
		<td style="width:30%;">英文名称:</td><td><input type="text" id="name_en" name="name_en" value="${data.name_en }"/></td></tr><tr>
		<td style="width:30%;">封面图:</td><td><input type="text" id="photo" name="photo" readonly="readonly" value="${data.photo }"/><input id="upload" type="button" value="添加封面图"/></td></tr><tr>
		<td style="width:30%;">面积:</td><td><input type="text" id="area" name="area" value="${data.area }"/></td></tr><tr>
		<td style="width:30%;">地址:</td><td><input type="text" id="addr" name="addr" value="${data.addr }"/></td></tr><tr>
		<td style="width:30%;">时间:</td><td><input type="text" id="buildtime"  name="buildtime" value="${data.buildtime }"/></td></tr><tr>
		<td style="width:30%;">基本类型:</td><td>
		<select name="basedataId" id="basedataId">
			<c:forEach items="${bdlist }" var="item">
				<option value="${item.id}" <c:if test="${data.basedataId == item.id }">selected</c:if> >${item.name }(${item.baseType })</option>
			</c:forEach>
			
		</select>
		</td></tr><tr>
		<td style="width:30%;">备注:</td><td><textarea style="width:600px;" rows="10" cols="8" name="content">${data.content }</textarea></td>
	</tr>
	</table>
</form>

<script src="${base }/js/ligerUI/js/core/base.js" type="text/javascript"></script>
<script type="text/javascript" src="${base }/js/ligerUI/js/plugins/ligerForm.js"></script>
<script src="${base }/js/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
<script src="${base }/js/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
<script src="${base }/js/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
<script type="text/javascript" src="${base }/js/custom/case/saveCaseDataIndex.js"></script>
<script type="text/javascript" src="${base }/js/ajaxupload.js"></script>
<script type="text/javascript" src="${base }/js/common.js"></script>
<script type="text/javascript">
	initajaxupload("upload","/imgupload/upload.jsps?direct=case",afterupload,null,null);
	
	function afterupload(json,data){
		if(json.STATE=='SUCCESS'){
			
			$("#photo").val(json.PATH);
			
		}else{
			art.dialog.alert("上传失败");
		}
	}
</script>
</body>
</html>
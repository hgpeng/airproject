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
<input type="hidden" id="dataid" value="${caseid}"/>
<div id="imgdiv">
	<c:forEach items="${cplist }" var="item">
	<p>
		<img style='width:200px;' src='${base}/uploadimages/${item.path}'/>
		<input type="button" cpid="${item.id }" onclick="deleteimg(this)" value="删除"/></p>
	</c:forEach>
</div>
<script type="text/javascript" src="${base }/js/artDialog/artDialog.js?skin=blue"></script>
<script type="text/javascript" src="${base }/js/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="${base }/js/ajaxupload.js"></script>
<script type="text/javascript" src="${base }/js/common.js"></script>
<script type="text/javascript">
	initajaxupload("upload","/imgupload/upload.jsps?direct=case",afterupload,null,null);
	
	function afterupload(json,data){
		if(json.STATE=='SUCCESS'){
			var html = "<img style='width:200px;' src='${base}/uploadimages/"+json.PATH+"'/>";
			$(imgdiv).append(html);
			
			$.ajax({
				url:'${base }/case/savesPhoto.jsps',
				type:'post',
				data:{caseid:$("#dataid").val(),path:json.PATH},
				success:function(ret){
					if(ret.ret==-1){
						art.dialog.alert("修改失败");
						return false;
					}
					art.dialog.alert("修改成功");
				}
			})
			
		}else{
			art.dialog.alert("上传失败");
		}
	}
	
	function deleteimg(obj){
		
		$.post(base+"/case/delete.jsps",{id:$(obj).attr("cpid")},function(data){
			
		})
		
	}
</script>
</body>
</html>
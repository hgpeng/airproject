<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>修改模板</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
</style>
<%
int port = request.getServerPort();
String scheme = request.getScheme();
String path = request.getScheme()+"://"+request.getServerName() + ((("http".equals(scheme) && port == 80) ||("https".equals(scheme)  && port == 443)) ? "" : ":" + port) + request.getContextPath();
request.setAttribute("base", path);
request.setAttribute("imagepath", path +"/images");
%>
<script type='text/javascript'>
	var base='${base}';
</script>
</head>
<body>
	<div>
	<input type="hidden" id="presentationId" value="${presentation.id}"/>
	标题:${product.name}　　 第<input type="text" id="num" value="${presentation.num }" style="width:30px;"/>屏
	链接产品:<a href='javascript:void(0);' onclick='presentationIndex.selectProduct();'>选择产品</a>
	<span id="productName">${detailProduct.name }</span>
	<input type="hidden" id="detail" value="${presentationIndex.detail }"/>
	<input id="productId" type="hidden" value="${product.id }" name="productId"/>
	<div style="clear:both;margin:5px;"></div>
	<label>
	<input type="radio" name="script" value="1"/>
	flash脚本
	</label>
	<label>
	<input type="radio" name="script" value="2"/>
	图片脚本
	</label>
	<label>
	<input type="radio" name="script" value="3" checked/>
	不使用脚本
	</label>
	<div style="clear:both;margin:5px;"></div>
	</div>
	
	<div>
	<div style="width:650px;">
	<script type="text/plain" id="content" name="content">${presentation.html}</script>
	</div>
	</div>
	<div id="imagePanel" style="display:none;">
		<input type="hidden" id="imgpath" name="imgpath"/>
		<span id="uploadTxt">图片</span>:<input type="button" value="添加" id="upload"/>
	</div>
<script type="text/javascript" src="/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/js/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="${base }/js/artDialog/artDialog.js?skin=blue"></script>
<script type="text/javascript" src="${base }/js/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${base }/js/ajaxupload.js"></script>
<script type="text/javascript" src="${base }/js/common.js"></script>
<script type="text/javascript">
	initajaxupload("upload","/imgupload/upload.jsps?direct=product",afterupload,null,null);
	
	function afterupload(json,data){
		if(json.STATE=='SUCCESS'){
			art.dialog.alert("上传成功",function(){
				$("#imgpath").val(json.PATH);
			});
			
		}else{
			art.dialog.alert("上传失败");
		}
	}
</script>
<script type="text/javascript" src="/js/custom/presentation/presentationIndex.js"></script>
</body>
</html>
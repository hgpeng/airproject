var saveArticleDialog=function(){
	var contentEditor;

	return {
		init:function(){
			contentEditor = UE.getEditor('content',{initialFrameHeight:350,initialFrameWidth:'90%'});
		},
		getContent:function(){
			var title=$("#title").val();
			var content=contentEditor.getContent();
			return content;
		}
	}
}();
$(function(){
	saveArticleDialog.init();
	
initajaxupload("upload","/imgupload/upload.jsps?direct=article",afterupload,null,null);
	
	function afterupload(json,data){
		if(json.STATE=='SUCCESS'){
			var html = "<p><img style='width:100px;' path='"+json.PATH+"' src='"+base+"/uploadimages/"+json.PATH+"'/><input type='button' onclick='deleteimg(this)' value='删除'/></p>";
			$("#imgdiv").append(html);		
			art.dialog.alert("上传成功");
		}else{
			art.dialog.alert("上传失败");
		}
	}
	
});
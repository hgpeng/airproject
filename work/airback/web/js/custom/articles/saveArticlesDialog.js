var saveArticleDialog=function(){
	var contentEditor;

	return {
		init:function(){
			contentEditor = UE.getEditor('content',{initialFrameHeight:500,initialFrameWidth:'90%'});
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
			var html = "<img style='width:100px;' path='"+json.PATH+"' src='"+base+"/uploadimages/"+json.PATH+"'/>";
			$("#imgdiv").append(html);		
			art.dialog.alert("上传成功");
		}else{
			art.dialog.alert("上传失败");
		}
	}
	
});
var saveVideoDialog=function(){
	var _this;
	return {
		init:function(){
			_this=this;
			initajaxupload("upload","/imgupload/upload.jsps?direct=videoImg",_this.afterupload,null,null);
			initajaxupload("uploadVideo","/imgupload/upload.jsps?direct=video",_this.afteruploadVideo,null,null);
		},
		afterupload:function(json,data){
			if(json.STATE=='SUCCESS'){
				art.dialog.alert("上传成功",function(){
					var html = "<img style='width:200px;' src='"+base+"/uploadimages/"+json.PATH+"'/>";
					$("#imgdiv").html(html);
					$("#picPath").text(json.PATH);
				});
			}else{
				art.dialog.alert("上传失败");
			}
		},
		afteruploadVideo:function(json,data){
			if(json.STATE=='SUCCESS'){
				art.dialog.alert("上传成功",function(){
					$("#videoPath").text(json.PATH);
				});
			}else{
				art.dialog.alert("上传失败");
			}
		}
	}
}();

$(function(){
	saveVideoDialog.init();
});
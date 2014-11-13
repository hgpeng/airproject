var presentationIndex=function(){
	var contentEditor;
	var flash;
	var script;
	var _this;
	return {
		init:function(){
			_this=this;
			contentEditor = UE.getEditor('content',{initialFrameHeight:400,initialFrameWidth:'98%'});
			$("input[name=script]").change(function(){
				var val=+this.value;
				switch(val){
					case 1:
						_this.showScriptPanel();
						if(!flash){
							$.ajax({
								url:base+'/presentation/getTemplateScript.jsps',
								type:'post',
								data:{scriptType:val},
								dataType:'text',
								success:function(res){
									if(res){
										flash=res;
									}
								}
							});
						}
					break;
					case 2:
						_this.showScriptPanel();
						if(!script){
							$.ajax({
								url:base+'/presentation/getTemplateScript.jsps',
								type:'post',
								dataType:'text',
								data:{scriptType:val},
								success:function(res){
									if(res){
										script=res;
									}
								}
							});
						}
					break;
					default:
						_this.showContentPanel();
					break;
				}
				
			});
			
		},
		getScript:function(){
			var val=$("input[name=script]:checked").val();
			var result="";
			if(val==1){
				result=flash;
			}else if(val==2){
				result=script;
			}
			var imgpath=$("#imgpath").val();
			if(!imgpath){
				return {};
			}
			return {result:result,imgpath:imgpath};
		},
		showScriptPanel:function(){
			$("#content").hide();
			$("#imagePanel").show();
		},
		showContentPanel:function(){
			$("#content").show();
			$("#imagePanel").hide();
		},
		getContent:function(){
			var content=contentEditor.getContentTxt();
			return content;
		}
	}
}();
$(function(){
	presentationIndex.init();
});
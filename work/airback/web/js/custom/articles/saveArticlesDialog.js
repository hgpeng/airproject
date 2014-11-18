var saveArticleDialog=function(){
	var contentEditor;

	return {
		init:function(){
			contentEditor = UE.getEditor('content',{initialFrameHeight:320,initialFrameWidth:'98%'});
		},
		getContent:function(dialog){
			var title=$("#title").val();
			var content=contentEditor.getContentTxt();
			return content;
		}
	}
}();
$(function(){
	saveArticleDialog.init();
});
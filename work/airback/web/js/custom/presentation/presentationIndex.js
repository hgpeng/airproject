var presentationIndex=function(){
	var contentEditor;
	return {
		init:function(){
			contentEditor = UE.getEditor('content',{initialFrameHeight:400,initialFrameWidth:'98%'});
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
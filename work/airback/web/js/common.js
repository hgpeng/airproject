function getPath(){
	if(typeof(window.top.getBaseUrl)=='function'){
		return window.top.getBaseUrl();
	}
	var u = window.location;/*      http://localhost:8888/web/meal/restaurant/list    */
	var p = window.location.pathname;/*    /web/meal/restaurant/list                 */
	var ps = p.split("/");
	var pth = "";
	for(var i = 0; i < ps.length; i++){
		if(ps[i]!=null && ps[i]!=''){
			pth = ps[i];
			break;
		}
	}
	return window.location.protocol /* http:  */
		+ "//" 
		+ window.location.host /*  localhost:8888   */
		+ "/"
		+ pth;  /*  web  */
}

/**
 * ajaxupload控件的公用上传
 * @param id	上传按钮ID
 * @param url	上传连接
 * @param afterupload  上传完成后调用
 * @param submitupload	
 * @param data
 */
function initajaxupload(id,url,afterupload,submitupload,data){
	new AjaxUpload($("#"+id), {
    	action: base+'/'+url,
        autoSubmit: true,
        name: "image",
        responseType: "json",
        onSubmit: function(file, extension){
        	    	
        	//图片上传时做类型判断   	
        	if(typeof(submitupload) == "function"){
        		submitupload();
        	}
        	
        	
        },
        onComplete: function(file, json){  
        	if(typeof(afterupload) == "function"){
    			afterupload(json,data);	 
        	}
        }
    });
}
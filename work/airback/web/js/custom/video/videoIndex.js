var videoIndex=function(){
	var _this;
	var grid;

	function reload(){
		var param=_this.getParam();
		grid.options.parms=param;
		grid.loadData();
	}

	return {
		init:function(){
			_this=this;
			grid=$("#tableGrid").ligerGrid({
				columns: [
				{display:'标题',name:'name',align:'center',width:'20%'},
	            {display: '图片', name: 'icon', align: 'center', width: '30%' },
	            {display:'路径',name:'url',align:'center',render:function(rowdata, index, value){
	            	return value;
	            }} 
	            ], 
	            url:'/video/getVideoList.jsps', 
	            parms:_this.getParam(),
                pageSize: 20,
                width: '99%',
                height: 0.95*$(document).height(),
	            fixedCellHeight:false,
	            toolbar: {
                    items: [
                    { text: '增加', click: _this.add, icon: 'add' }
                    ]
                }
			});
		},
		getParam:function(){

		},
		add:function(id){
			var width=500;
			var height=300;
			art.dialog.open(base+'/video/saveVideoDialog.jsps',{
				id:"saveVideoDialog",
				title:'保存视频',
				width: width,
				height: height,
				resizable: false,
				lock:true,
				okVal:'保存',
				ok:function(contentWindow,target){
					var page=contentWindow.window;
					var pagejq=$(contentWindow.document);
					var imgPath=pagejq.find("#picPath").text().trim();
					var videoPath=pagejq.find("#videoPath").text().trim();
					if(imgPath.length==0){
						art.dialog.alert("请上传图片");
						return false;
					}
					if(videoPath.length==0){
						art.dialog.alert("请上传视频");
						return false;
					}
					$.ajax({
						url:base+'/video/saveVideo.jsps',
						type:'post',
						data:{imgPath:imgPath,videoPath:videoPath},
						success:function(res){
							if(res.ret==1){
								art.dialog.alert("新增成功",reload);
							}else{
								return false;
							}

						}
					});
				},
				cancel:true
			});
		}
	}
}();
$(function(){
	videoIndex.init();
});
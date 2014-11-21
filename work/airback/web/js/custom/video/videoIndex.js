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
	            {display: '图片', name: 'icon', align: 'center', width: '30%' ,render:function(rowdata,index,value){
	            	return "<img src='"+base+"/uploadimages/"+value+"' width='128' height='100'/>"
	            }},
	            {display:'路径',name:'url',align:'center',render:function(rowdata, index, value){
	            	return value;
	            }},
	            {display:'操作',align:'center',render:function(rowdata,index,value){
	            	var str="<a href='javascript:void(0);' onclick='edit("+rowdata.id+")'>修改</a>   ";
	            	str+="<a href='javascript:void(0);' onclick='deleteVideo("+rowdata.id+")'>删除</a>";
	            	return str;
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
		deleteVideo:function(id){
			art.dialog.confirm("确定要删除该视频吗?",function(){
				$.ajax({
					url:base+'/baseData/deleteBaseData.jsps',
					type:'post',
					data:{id:id},
					success:function(res){
						if(res.ret==-1){
							art.dialog.alert("删除失败");
							return false;
						}else{
							art.dialog.alert("删除成功",reload);
						}
					}
				});
			});
		},
		add:function(id){
			var width=500;
			var height=300;
			var url=base+'/video/saveVideoDialog.jsps';
			if(id){
				url+="?videoId="+id;
			}
			art.dialog.open(url,{
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
					var title=pagejq.find("#title").val();
					if(title.length==0){
						art.dialog.alert("请填写视频标题");
						return false;
					}
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
					var videoId=pagejq.find("#videoId").val();
					var params={imgPath:imgPath,videoPath:videoPath};
					params.name=title;
					if(videoId){
						params.id=videoId;
					}
					$.ajax({
						url:base+'/video/saveVideo.jsps',
						type:'post',
						data:params,
						success:function(res){
							if(res.ret==1){
								art.dialog.alert("保存成功",reload);
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
function edit(id){
	videoIndex.add(id);
}
function deleteVideo(id){
	videoIndex.deleteVideo(id);
}
$(function(){
	videoIndex.init();
});
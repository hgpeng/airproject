var baseDataIndex=function(){
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
	            {display:'时间',name:'buildtime',align:'center',width:'20%'},
	            {display:'面积',name:'area',align:'center',width:'20%'},
	            {display:'地址',name:'addr',align:'center',width:'20%'},
	            {display:'操作',name:'operate',align:'center',width:'20%',render:_this.oprender}
	            ], 
	            url:'/case/getCaseData.html', 
	            parms:_this.getParam(),
                pageSize: 20,width: '99%',
                height: 0.95*$(document).height(),
	            fixedCellHeight:false,
	            toolbar: {
                    items: [
                    { text: '增加', click: _this.add, icon: 'add' },
                    { line: true },
                    { text: '修改', click: null, icon: 'modify' }
                    ]
                }
			});
		},
		getParam:function(){

		},
		oprender:function(data,filterData){
			return '<a href="javascript:void(0)" onclick=uploadphoto("'+data.id+'")>上传图片</a>';
		},
		add:function(){
			art.dialog.open('/case/saveCaseDialog.html',{
				id:"saveBaseType",
				title:'保存应用案例',
				width: 500,
				height: 250,
				resizable: false,
				lock:true,
				okVal:'保存',
				ok:function(contentWindow){
					var page=$(contentWindow.document);
					var name=page.find("#name").val();
					var id=page.find("#id").val();
					var basedataId=page.find("#basedataId").val();
					if(!name || name.length==0){
						art.dialog.alert("请输入类型名");
						return false;
					}
					$.ajax({
						url:'/case/saves.html',
						type:'post',
						data:$(page.find("form")[0]).serialize(),
						success:function(ret){
							if(ret.ret==-1){
								art.dialog.alert("修改失败");
								return false;
							}
							art.dialog.alert("修改成功");
							reload();
						}
					})
				}
			});
		}
	}
}();
$(function(){
	baseDataIndex.init();
})

uploadphoto=function(id){
	art.dialog.open('/case/uploadphoto.html?id='+id,{
		id:"saveBaseType",
		title:'上传图片',
		width: 500,
		height: 250,
		resizable: false,
		lock:true,
		okVal:'保存',
		ok:function(contentWindow){
			var page=$(contentWindow.document);
			
			$.ajax({
				url:'/case/savesPhoto.html',
				type:'post',
				data:$(page.find("form")[0]).serialize(),
				success:function(ret){
					if(ret.ret==-1){
						art.dialog.alert("修改失败");
						return false;
					}
					art.dialog.alert("修改成功");
					reload();
				}
			})
		}
	});
}
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
	            url:'/case/getCaseData.jsps', 
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
			return '<a href="javascript:void(0)" onclick=uploadphoto("'+data.id+'")>图片管理</a>'
			+'<a href="javascript:void(0)" onclick=baseDataIndex.deleteCase("'+data.id+'")>|删除</a>';
		},
		add:function(){
			art.dialog.open('/case/saveCaseDialog.jsps',{
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
						url:'/case/saves.jsps',
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
		},
		deleteCase:function(id){
			$.post(base+"/case/delete.jsps",{id:id},function(ret){
				if(ret.ret==-1){
								art.dialog.alert("删除失败");
								return false;
							}
							art.dialog.alert("删除成功");
							reload();
			},'json');
		}
	}
}();
$(function(){
	baseDataIndex.init();
})

uploadphoto=function(id){
	art.dialog.open('/case/uploadphoto.jsps?id='+id,{
		id:"saveBaseType",
		title:'图片管理',
		width: 500,
		height: 250,
		resizable: false,
		lock:true,
		okVal:'保存',
		ok:function(contentWindow){
			var page=$(contentWindow.document);
			
			
		}
	});
}

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
	            {display: '主键', name: 'id', align: 'center', width: '20%' },
	            {display:'基本数据',name:'name',align:'center',width:'80%'} 
	            ], 
	            url:'/baseData/getBaseData.jsps', 
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
		add:function(){
			art.dialog.open('/baseData/saveBaseDataDialog.jsps',{
				id:"saveBaseType",
				title:'保存基础类型',
				width: 500,
				height: 250,
				resizable: false,
				lock:true,
				okVal:'保存',
				ok:function(contentWindow){
					var page=$(contentWindow.document);
					var name=page.find("#name").val();
					var id=page.find("#id").val();
					var url=page.find("#url").val();
					var basetypeId=page.find("#baseTypeId").val();
					if(!name || name.length==0){
						art.dialog.alert("请输入类型名");
						return false;
					}
					$.ajax({
						url:'/baseData/saveBaseData.jsps',
						type:'post',
						data:{name:name,url:url,id:id,typeId:basetypeId},
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
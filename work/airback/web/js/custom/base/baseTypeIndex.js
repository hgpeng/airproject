var baseTypeIndex=function(){
	var grid;
	var _this;
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
	            {display:'类型名称',name:'name',align:'center',width:'60%'},
	            {display:'操作',align:'center',width:'20%',render:function(rowdata, index, value){
	            	return "<a href='javascript:void(0);' onclick='baseTypeIndex.deleteBaseType("+rowdata.id+")'>删除</a>";
	            }}
	            ], 
	            url:'/baseData/getBaseTypeData.html', 
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
		deleteBaseType:function(id){
			art.dialog.confirm("确定要删除该基本类型吗？",function(){
				$.ajax({
					url:'/baseData/deleteBaseType.html',
					type:'post',
					data:{id:id},
					success:function(ret){
						if(ret.ret==-1){
							art.dialog.alert("删除失败，请稍后再试");
							return ;
						}
						art.dialog.alert("删除成功！",reload);
					}
				});
			})
			
		},
		getParam:function(){

		},
		add:function(){
			art.dialog.open('/baseData/saveBaseTypeDialog.html',{
				id:"saveBaseType",
				title:'保存基础类型',
				width: 300,
				height: 120,
				resizable: false,
				lock:true,
				okVal:'保存',
				ok:function(contentWindow){
					var page=$(contentWindow.document);
					var name=page.find("#name").val();
					var id=page.find("#id").val();
					if(!name || name.length==0){
						art.dialog.alert("请输入类型名");
						return false;
					}
					$.ajax({
						url:'/baseData/saveBaseType.html',
						type:'post',
						data:{name:name},
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
	baseTypeIndex.init();
	window.baseTypeIndex=baseTypeIndex;
});
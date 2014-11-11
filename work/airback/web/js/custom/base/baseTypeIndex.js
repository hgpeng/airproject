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
	            	var str="<a href='javascript:void(0);' onclick='baseTypeIndex.add("+rowdata.id+")'>修改</a>   ";
	            	str+="<a href='javascript:void(0);' onclick='baseTypeIndex.deleteBaseType("+rowdata.id+")'>删除</a>";
	            	return str;
	            }}
	            ], 
	            url:'/baseData/getBaseTypeData.jsps', 
	            parms:_this.getParam(),
                pageSize: 20,width: '99%',
                height: 0.95*$(document).height(),
	            fixedCellHeight:false,
	            toolbar: {
                    items: [
                    { text: '增加', click: _this.add, icon: 'add' }
                    ]
                }
			});
		},
		deleteBaseType:function(id){
			art.dialog.confirm("确定要删除该基本类型吗？",function(){
				$.ajax({
					url:'/baseData/deleteBaseType.jsps',
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
		add:function(id){
			var str='/baseData/saveBaseTypeDialog.jsps';
			if(id){
				str+="?id="+id;
			}
			art.dialog.open(str,{
				id:"saveBaseType",
				title:'保存基础类型',
				width: 300,
				height: 120,
				resizable: false,
				lock:true,
				cancel:true,
				okVal:'保存',
				ok:function(contentWindow){
					var page=$(contentWindow.document);
					var name=page.find("#name").val();
					var id=page.find("#id").val();
					if(!name || name.length==0){
						art.dialog.alert("请输入类型名");
						return false;
					}
					var params={name:name};
					if(id){
						params.id=id;
					}
					$.ajax({
						url:'/baseData/saveBaseType.jsps',
						type:'post',
						data:params,
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
var productIndex=function(){
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
	            {display: '主键', name: 'id', align: 'center', width: '5%' },
	            {display:'产品名称',name:'name',align:'center',width:'15%'},
	            {display:'备注',name:'desc',align:'left',width:'60%'},
	            {display:'操作',render:_this.renderOperation}
	            ], 
	            url:'/product/getProductList.jsps', 
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
			return {};
		},
		renderOperation:function(rowdata, index, value){
			var str="<a href=''>上架</a>  ";
			str+="<a href=''>添加模板</a>  ";
			str+="<a href=''>调整模板</a>  ";
			return str;
		},
		add:function(){
			art.dialog.open(base+'/product/saveProductDialog.jsps',{
				id:"saveProductDialog",
				title:'保存产品',
				width: 500,
				height: 350,
				resizable: false,
				lock:true,
				okVal:'保存',
				ok:function(contentWindow,target){
					var page=$(contentWindow.document);
					var name=page.find("#name").val();
					if(!name || name.length==0){
						art.dialog.alert("产品名称不能为空");
						return false;
					}
					var desc=page.find("#desc").val();
					var mainPhoto=page.find("#mainPhoto").val();
					$.ajax({
						url:base+'/product/saveProduct.jsps',
						type:'post',
						data:{name:name,desc:desc,mainPhoto:mainPhoto},
						success:function(res){
							if(res.ret==-1){
								art.dialog.alert("更新失败");
								return false;
							}
							art.dialog.alert("新增成功",reload);
						}
					});
				},
				cancel:true
			});
		}
	}
}();

$(function(){
	productIndex.init();
});
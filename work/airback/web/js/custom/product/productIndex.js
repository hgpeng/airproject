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
	            {display:'产品名称',name:'name',align:'center',width:'20%'},
	            {display:'备注',name:'desc',align:'left',width:'70%'},
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

		},
		add:function(){
			art.dialog.open(base+'/product/saveProductDialog.jsps',{
				id:"saveProductDialog",
				title:'保存产品',
				width: 600,
				height: 450,
				resizable: false,
				lock:true,
				okVal:'保存',
				ok:function(contentWindow,target){
					
				},
				cancel:true
			});
		}
	}
}();

$(function(){
	productIndex.init();
});
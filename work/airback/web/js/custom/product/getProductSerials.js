var getProductSerials=function(){
	var grid;
	var _this;
	return {
		init:function(){
			_this=this;
			grid=$("#tableGrid").ligerGrid({
				columns: [ 
	            {display: '主键', name: 'id', align: 'center', width: '20%' },
	            {display:'产品名称',name:'name',align:'center',width:'80%'}
	            ], 
	            url:'/product/getProductList.jsps', 
	            parms:_this.getParam(),
                pageSize: 20,width: '95%',
                height: 300,
	            fixedCellHeight:false,
	            onDblClickRow:function(data,rowid,rowdata){
	            	var id=data.id;
	            	var name=data.name;
	            	var params={id:id,name:name};
	            	art.dialog.data("data",params);
	            	art.dialog.close();
	            }
			});
		},
		getParam:function(){
			var typeId=$("#productType").val();
			var params={typeId:typeId};
			return params;
		}
	}
}();
$(function(){
	getProductSerials.init();
});
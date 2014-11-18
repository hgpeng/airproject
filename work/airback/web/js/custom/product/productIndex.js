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
	            {display: '主键', name: 'id', align: 'center', width: '20%' },
	            {display:'类型名称',name:'name',align:'center',width:'60%'},
	            {display:'操作',align:'center',width:'20%',render:function(rowdata, index, value){
	            	return "<a href='javascript:void(0);' onclick='baseTypeIndex.deleteBaseType("+rowdata.id+")'>删除</a>";
	            }}
	            ], 
	            url:'/baseData/getBaseTypeData.jsps', 
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
		}
	}
}();

$(function(){
	productIndex.init();
});
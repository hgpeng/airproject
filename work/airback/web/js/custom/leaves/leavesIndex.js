var leavesIndex=function(){
	var _this;
	var grid;

	return {
		init:function(){
			grid=$("#tableGrid").ligerGrid({
				columns: [ 
	            {display: '留言', name: 'content', align: 'center', width: '60%' },
	            {display:'回复状态',name:'replyStatus',align:'center',render:function(rowdata, index, value){
	            	
	            }} 
	            ], 
	            url:'/leaves/getLeavesData.jsps', 
	            parms:_this.getParam(),
                pageSize: 20,
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
	leavesIndex.init();
});
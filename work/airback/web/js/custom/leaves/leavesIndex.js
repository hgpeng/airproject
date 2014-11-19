var leavesIndex=function(){
	var _this;
	var grid;

	return {
		init:function(){
			_this=this;
			grid=$("#tableGrid").ligerGrid({
				columns: [ 
				{display: '联系人', name: 'contact', align: 'center', width: '20%' },
				{display: '电话', name: 'phone', align: 'center', width: '20%' },
				{display: '邮箱', name: 'mail', align: 'center', width: '20%' },
	            {display: '留言', name: 'content', align: 'center', width: '20%' },
	            {display:'回复状态',name:'replyStatus',align:'center',render:function(rowdata, index, value){
	            	
	            }} 
	            ], 
	            url:'/leaves/getLeavesData.jsps', 
	            parms:_this.getParam(),
                pageSize: 20,
	            fixedCellHeight:false
			});
		},
		getParam:function(){

		}
	}
}();
$(function(){
	leavesIndex.init();
});
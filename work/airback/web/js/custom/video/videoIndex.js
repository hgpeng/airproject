var videoIndex=function(){
	var _this;
	var grid;

	return {
		init:function(){
			_this=this;
			grid=$("#tableGrid").ligerGrid({
				columns: [ 
	            {display: '留言', name: 'content', align: 'center', width: '60%' },
	            {display:'回复状态',name:'replyStatus',align:'center',render:function(rowdata, index, value){
	            	
	            }} 
	            ], 
	            url:'/video/getVideoList.jsps', 
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
	videoIndex.init();
});
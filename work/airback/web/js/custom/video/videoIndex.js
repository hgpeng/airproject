var videoIndex=function(){
	var _this;
	var grid;

	return {
		init:function(){
			_this=this;
			grid=$("#tableGrid").ligerGrid({
				columns: [
				{display:'标题',name:'name',align:'center',width:'20%'},
	            {display: '图片', name: 'icon', align: 'center', width: '30%' },
	            {display:'路径',name:'url',align:'center',render:function(rowdata, index, value){
	            	return value;
	            }} 
	            ], 
	            url:'/video/getVideoList.jsps', 
	            parms:_this.getParam(),
                pageSize: 20,
                width: '99%',
                height: 0.95*$(document).height(),
	            fixedCellHeight:false,
	            toolbar: {
                    items: [
                    { text: '增加', click: _this.add, icon: 'add' }
                    ]
                }
			});
		},
		getParam:function(){

		},
		add:function(id){
			var width=$(document).width()-50;
			var height=$(document).height()*0.8;
			art.dialog.open(base+'/video/saveVideoDialog.jsps',{
				id:"saveVideoDialog",
				title:'保存视频',
				width: width,
				height: height,
				resizable: false,
				lock:true,
				okVal:'保存',
				ok:function(contentWindow,target){
				}
			});
		}
	}
}();
$(function(){
	videoIndex.init();
});
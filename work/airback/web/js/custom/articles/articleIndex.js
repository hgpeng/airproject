var article=function(){
	var grid;
	var _this;
	return {
		init:function(){
			_this=this;
			grid=$("#tableGrid").ligerGrid({
				columns: [ 
	            {display: '主键', name: 'id', align: 'center', width: '5%' },
	            {display:'内容',name:'preview',align:'left',width:'80%'}
	            ], 
	            url:'/articles/list.jsps', 
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

		},
		add:function(item){
			art.dialog.open('/articles/saveArticlesDialog.jsps',{
				id:"saveBaseType",
				title:'保存文章',
				width: 600,
				height: 450,
				resizable: false,
				lock:true,
				okVal:'保存',
				ok:function(contentWindow,target){
					var page=contentWindow.window;
					var content=page.saveArticleDialog.getContent();

					$.ajax({
						url:base+'/articles/saves.html',
						type:'post',
						data:{content:content},
						success:function(ret){
							
						}
					});
				},
				cancel:true
			});
		}
	}
}();

$(function(){
	article.init();
});
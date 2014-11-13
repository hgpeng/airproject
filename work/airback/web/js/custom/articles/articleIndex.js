var article=function(){
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
	            {display: '主键', name: 'id', align: 'center', width: '5%' },
	            {display:'内容',name:'preview',align:'left',width:'60%'},
	            {display:'操作',name:'operation',align:'center',render:function(rowdata, index, value){
	            	var str="<a href='javascript:void(0);' onclick='edit("+rowdata.id+")'>修改</a>   ";
	            	str+="<a href='javascript:void(0);' onclick='deleteArticle("+rowdata.id+")'>删除</a>";
	            	return str;
	            }}
	            ], 
	            url:'/articles/list.jsps', 
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
		getParam:function(){

		},
		add:function(id){
			art.dialog.open('/articles/saveArticlesDialog.jsps?articleId='+id,{
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
					var pagejq=$(contentWindow.document);
					var articleId=pagejq.find("#articleId").val();
					var type = pagejq.find("#type").val();
					var tilte = pagejq.find("#title").val();
					var imgpath = '';
					$.each(pagejq.find("#imgdiv img"),function(i,item){
						imgpath += $(item).attr("path")+",";
					})
					if(imgpath) imgpath = imgpath.substring(0,imgpath.length-1);
					var params={content:content,type:type,title:tilte,img:imgpath};
					if(articleId){
						params.id=articleId;
					}
					$.ajax({
						url:base+'/articles/saves.jsps',
						type:'post',
						data:params,
						success:function(ret){
							reload();
						}
					});
				},
				cancel:true
			});
		},
		delete:function(id){
			art.dialog.confirm("确定要删除该产品吗?",function(){
				$.ajax({
					url:base+'/articles/deleteArticles.jsps',
					type:'post',
					data:{articleId:id},
					success:function(res){
						if(res.ret==1){
							art.dialog.alert("删除成功",reload);
						}else{
							art.dialog.alert("删除失败，请稍后再试");
						}
					}
				});
			})
		}
	}
}();
function edit(id){
	article.add(id);
}
function deleteArticle(id){
	article.delete(id);
}
$(function(){
	article.init();
});
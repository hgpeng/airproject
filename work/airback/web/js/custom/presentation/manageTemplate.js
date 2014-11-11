var manageTemplate=function(){
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
	            {display: '主键', name: 'id', align: 'center', width: '10%' },
	            {display:'内容',name:'html',align:'left',width:'60%'},
	            {display:'屏数',name:'num',align:'center',width:'5%'},
	            {display:'操作',render:_this.renderOperation}
	            ], 
	            url:'/presentation/productTemplateList.jsps', 
	            parms:_this.getParam(),
                pageSize: 20,width: '680px',
                height: '450px',
	            fixedCellHeight:false
			});
		},
		getParam:function(){
			var obj={};
			obj.productId=$("#productId").val();
			return obj;
		},
		renderHtml:function(rowdata,index,value){
			if(value && value.length>=50){
				return value.substring(0,50)+"...";
			}else{
				return value;
			}
		},
		renderOperation:function(rowdata, index, value){
			var str="<a href='javascript:void(0);' onclick='manageTemplate.edit("+rowdata.id+")'>编辑</a>   ";
			str+="<a href='javascript:void(0);' onclick='manageTemplate.delete("+rowdata.id+")'>删除</a>";
			return str;
		},
		edit:function(id){
			art.dialog.open(base+'/presentation/presentationIndex.jsps?id='+id,{
				id:"savePresentation",
				title:'修改模板',
				width: 700,
				height: 500,
				resizable: false,
				lock:true,
				okVal:'保存',
				ok:function(contentWindow,target){
					var page=contentWindow.window;
					var content=page.presentationIndex.getContent();
					if(!content || content.length==0){
						alert("模板内容不能为空");
						return false;
					}
					var pagejq=$(contentWindow.document);
					var presentationId=pagejq.find("#presentationId").val();
					var num=pagejq.find("#num").val();
					if(!num || num.length==0){
						alert("屏数不能为空");
						return false;
					}
					
					var params={};
					if(presentationId&& presentationId.length>0){
						params.presentationId=presentationId;
					}
					params.productId=pagejq.find("#productId").val();
					params.html=content;
					params.num=pagejq.find("#num").val();
					$.ajax({
						url:base+'/presentation/savePresentation.jsps',
						type:'post',
						data:params,
						success:function(res){
							if(res.ret<=0){
								art.dialog.alert("修改模板失败，请稍后再试");
								return false;
							}else{
								art.dialog.alert("修改模板成功",reload);
							}
						}
					});
				},
				cancel:true
			});
		},
		delete:function(id){
			if(confirm("确定删除该模板吗?")){
				$.ajax({
					url:base+'/presentation/deleteTemplate.jsps',
					type:'post',
					data:{templateId:id},
					success:function(res){
						if(res.ret<=0){
							alert("删除失败，请稍后再试");
							return false;
						}else{
							reload();
						}
					}
				});
			}
		}
	}
}();
$(function(){
	manageTemplate.init();
	window.manageTemplate=manageTemplate;
});
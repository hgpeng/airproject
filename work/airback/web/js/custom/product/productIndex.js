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
	            {display:'产品名称',name:'name',align:'center',width:'15%'},
	            {display:'备注',name:'desc',align:'left',width:'60%'},
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
			var status=rowdata.status;
			var changeStatus=3-status;
			var statusTxt=(status==1?"下架":"上架");
			var str="<a href='javascript:void(0);' onclick='productIndex.putOnShelves("+rowdata.id+","+changeStatus+")'>"+statusTxt+"</a>  ";
			str+="<a href='javascript:void(0);' onclick='productIndex.addTemplate("+rowdata.id+")'>添加模板</a>  ";
			str+="<a href='javascript:void(0);' onclick='productIndex.manageTemplate("+rowdata.id+")'>管理模板</a>  ";
			return str;
		},
		manageTemplate:function(id){
			art.dialog.open(base+'/presentation/manageTemplate.jsps?productId='+id,{
				id:"manageTemplate",
				title:'管理模板',
				width: 700,
				height: 500,
				resizable: false,
				lock:true,
				cancel:true
			});
		},
		putOnShelves:function(id,status){
			var statusTxt=(status==1?"上架":"下架");
			art.dialog.confirm("确定要将该商品"+statusTxt+"吗?",function(){
				$.ajax({
				url:base+'/product/putOnShelves.jsps',
				type:'post',
				data:{productId:id,status:status},
				success:function(ret){
					if(ret.ret!=1){
						art.dialog.alert("服务器发生错误，请稍后再试");
					}else{
						art.dialog.alert(statusTxt+"成功",reload);
					}
				}
				});
			});
			
		},
		addTemplate:function(productId){
			art.dialog.open(base+'/presentation/presentationIndex.jsps?productId='+productId,{
				id:"savePresentation",
				title:'新增模板',
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
					var num=pagejq.find("#num").val();
					if(!num || num.length==0){
						alert("屏数不能为空");
						return false;
					}
					
					var params={};
					params.productId=pagejq.find("#productId").val();
					params.html=content;
					params.num=pagejq.find("#num").val();
					$.ajax({
						url:base+'/presentation/savePresentation.jsps',
						type:'post',
						data:params,
						success:function(res){
							if(res.ret<=0){
								art.dialog.alert("新增模板失败，请稍后再试");
								return false;
							}else{
								art.dialog.alert("新增模板成功",reload);
							}
						}
					});
				},
				cancel:true
			});
		},
		add:function(){
			art.dialog.open(base+'/product/saveProductDialog.jsps',{
				id:"saveProductDialog",
				title:'保存产品',
				width: 500,
				height: 350,
				resizable: false,
				lock:true,
				okVal:'保存',
				ok:function(contentWindow,target){
					var page=$(contentWindow.document);
					var name=page.find("#name").val();
					if(!name || name.length==0){
						art.dialog.alert("产品名称不能为空");
						return false;
					}
					var desc=page.find("#desc").val();
					var mainPhoto=page.find("#mainPhoto").val();
					$.ajax({
						url:base+'/product/saveProduct.jsps',
						type:'post',
						data:{name:name,desc:desc,mainPhoto:mainPhoto},
						success:function(res){
							if(res.ret==-1){
								art.dialog.alert("更新失败");
								return false;
							}
							art.dialog.alert("新增成功",reload);
						}
					});
				},
				cancel:true
			});
		}
	}
}();

$(function(){
	productIndex.init();
	window.productIndex=productIndex;
});
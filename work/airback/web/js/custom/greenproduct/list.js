var greenDataIndex=function(){
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
			
			$("#main").ligerLayout({leftWidth:200,minLeftWidth:200,allowLeftCollapse:true,allowLeftResize:true});
			
			var setting = {
		            data: {
		                simpleData: {
		                	idKey:"id",
		                    enable: true
		                },
		                key:{
		            		url:"",
		            		name:"name"
		            	}
		            },
		            check: {
		                enable: true
		            },
		            async: {//异步加载节点数据
		                enable: true,
		                url: base+"/greenproduct/getAllProductSerial.jsps"
		            },
		            callback: {//绑定回调函数
		            	onAsyncSuccess:function(event,treeId,treeNode,msg){

		            	},
		                onClick: function(event, treeId, treeNode, msg){
		                	var param={};
		                	param.parent = treeNode.id;
		                	grid.options.parms=param;
		            		grid.loadData();
		                }//点击绑定事件
		            }

		        };  
		        $.fn.zTree.init($("#leftTree"), setting, []); 
		      
			grid=$("#tableGrid").ligerGrid({
				columns: [ 
	            {display:'名称',name:'name',align:'center',width:'30%'},
	            {display:'编号',name:'number',align:'center',width:'30%'},		           
	            {display:'操作',name:'name',align:'center',width:'30%',render:_this.oprender}
	            ], 
	            url:'/greenproduct/getGreenProduct.jsps', 
                pageSize: 20,
                delayLoad:true,
                rownumbers:true,
	            fixedCellHeight:false,
	            toolbar: {
                    items: [
                    { text: '增加', click: _this.add, icon: 'add' },
                    { line: true },
                    { text: '修改', click: null, icon: 'modify' }
                    ]
                }
			});
			
			reload();
			
		},
		getParam:function(){
			var param = {};
			var tree = $.fn.zTree.getZTreeObj("leftTree");
			var node = tree.getSelectedNodes();
			param.parent = node[0].id;
			return param;
		},
		oprender:function(data,filterData){
			var str="<a href='javascript:void(0);' onclick='modify("+data.id+")'>修改</a>  ";
			str +="<a href='javascript:void(0);' onclick='addarticle("+data.id+")'>添加文章</a>  ";
			str+='<a href="javascript:void(0)" onclick=deletebase("'+data.id+'")>删除</a>';
			return str;
		},
		reloadData:function(){
			reload();
		},
		add:function(){
			art.dialog.open(base+'/greenproduct/add.jsps',{
				id:"saveBaseType",
				title:'保存产品',
				width: 700,
				height: 500,
				resizable: false,
				lock:true,
				okVal:'保存',
				ok:function(contentWindow){
					var page=$(contentWindow.document);
					var name=page.find("#name").val();
					var number=page.find("#number").val();
					var id=page.find("#id").val();
					var url=page.find("#url").val();
					var icon=page.find("#icon").val();
					var name_en = page.find("#name_en").val();
					var basetypeId=page.find("#baseTypeId").val();
					var parentId = page.find("#parentId").val();
					if(!name || name.length==0){
						art.dialog.alert("请输入类型名");
						return false;
					}
					$.ajax({
						url:base+'/baseData/saveBaseData.jsps',
						type:'post',
						data:{parentId:parentId,number:number,name:name,url:url,id:id,typeId:basetypeId,icon:icon,name_en:name_en},
						success:function(ret){
							if(ret.ret==-1){
								art.dialog.alert("修改失败");
								return false;
							}
							art.dialog.alert("修改成功");
							reload();
						}
					})
				}
			});
		}
	}
}();
$(function(){
	greenDataIndex.init();
})

function modify(id){
	art.dialog.open(base+'/greenproduct/add.jsps?id='+id,{
		id:"saveBaseType",
		title:'修改产品',
		width: 700,
		height: 500,
		resizable: false,
		lock:true,
		okVal:'保存',
		ok:function(contentWindow){
			var page=$(contentWindow.document);
			var name=page.find("#name").val();
			var id=page.find("#id").val();
			var url=page.find("#url").val();
			var icon=page.find("#icon").val();
			var name_en = page.find("#name_en").val();
			var basetypeId=page.find("#baseTypeId").val();
			var parentId = page.find("#parentId").val();
			if(!name || name.length==0){
				art.dialog.alert("请输入类型名");
				return false;
			}
			$.ajax({
				url:base+'/baseData/saveBaseData.jsps',
				type:'post',
				data:{parentId:parentId,name:name,url:url,id:id,typeId:basetypeId,icon:icon,name_en:name_en},
				success:function(ret){
					if(ret.ret==-1){
						art.dialog.alert("修改失败");
						return false;
					}
					art.dialog.alert("修改成功",function(){
						greenDataIndex.reloadData();
					});
				}
			})
		}
	});
}

function addarticle(id){
	var url=base+'/articles/saveArticlesDialog.jsps?basedataId='+id;
	art.dialog.open(url,{
		id:"saveBaseType",
		title:'保存'+name,
		width: 1000,
		height: 900,
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
					greenDataIndex.reload();
				}
			});
		},
		cancel:true
	});

}

function deletebase(id){
	$.post(base+"/baseData/deleteBaseData.jsps",{id:id},function(ret){
		if(ret.ret==-1){
						art.dialog.alert("删除失败");
						return false;
					}
					art.dialog.alert("删除成功");
					greenDataIndex.reload();
	},'json')
}
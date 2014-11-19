var baseDataIndex=function(){
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
			var h = $(top).height();
			
			//$("#main").ligerLayout({height:h*0.9+'',leftWidth:200,minLeftWidth:200,allowLeftCollapse:true,allowLeftResize:true});
						
			grid=$("#tableGrid").ligerGrid({
				columns: [ 
	            {display:'名称',name:'name',align:'center',width:'30%'},
	            {display:'编号',name:'number',align:'center',width:'30%'},
	            {display:'操作',name:'name',align:'center',width:'30%',render:_this.oprender}
	            ], 
	            url:'/baseData/getBaseData.jsps', 
                pageSize: 20,
                height:600,
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
			param.type = $("#basetypeinp").val();
			return param;
		},
		oprender:function(data,filterData){
			var str="<a href='javascript:void(0);' onclick='modify("+data.id+")'>修改</a>  ";
			str+='<a href="javascript:void(0)" onclick=deletebase("'+data.id+'")>删除</a>';
			return str;
		},
		reloadData:function(){
			reload();
		},
		add:function(){
			art.dialog.open(base+'/baseData/saveBaseDataDialog.jsps?basetype='+$("#basetypeinp").val(),{
				id:"saveBaseType",
				title:'保存'+$("#basetypename").val(),
				width: 500,
				height: 250,
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
					if(!name || name.length==0){
						art.dialog.alert("请输入类型名");
						return false;
					}
					$.ajax({
						url:base+'/baseData/saveBaseData.jsps',
						type:'post',
						data:{name:name,number:number,url:url,id:id,typeId:basetypeId,icon:icon,name_en:name_en},
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
	baseDataIndex.init();
})

function modify(id){
	art.dialog.open(base+'/baseData/saveBaseDataDialog.jsps?id='+id,{
		id:"saveBaseType",
		title:'修改'+$("#basetypename").val(),
		width: 500,
		height: 250,
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
			if(!name || name.length==0){
				art.dialog.alert("请输入类型名");
				return false;
			}
			$.ajax({
				url:base+'/baseData/saveBaseData.jsps',
				type:'post',
				data:{name:name,number:number,url:url,id:id,typeId:basetypeId,icon:icon,name_en:name_en},
				success:function(ret){
					if(ret.ret==-1){
						art.dialog.alert("修改失败");
						return false;
					}
					art.dialog.alert("修改成功",function(){
						baseDataIndex.reloadData();
					});
				}
			})
		}
	});
}

function deletebase(id){
	$.post(base+"/baseData/deleteBaseData.jsps",{id:id},function(ret){
		if(ret.ret==-1){
						art.dialog.alert("删除失败");
						return false;
					}
					art.dialog.alert("删除成功");
					baseDataIndex.reload();
	},'json')
}
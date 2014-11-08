var main=function(){
	var _this;
    var tab;

	return {
		init:function(){
			_this=this;
			$("#layout1").ligerLayout({ leftWidth: 200});
			
			var setting = {
	            data: {
	                simpleData: {
	                	idKey:"id",
	                	pIdKey:"parentId",
	                    enable: true
	                },
	                key:{
	            		url:"",
	            		realUrl:"url"
	            	}
	            },
	            check: {
	                enable: true
	            },
	            async: {//异步加载节点数据
	                enable: true,
	                url: "/menus/getMenus.jsps"
	            },
	            callback: {//绑定回调函数
	            	onAsyncSuccess:function(event,treeId,treeNode,msg){

	            	},
	                onClick: function(event, treeId, treeNode, msg){
	                	if(!treeNode.parentId){
	                		return;
	                	}
	                	var url=treeNode.url;
	                	var id=treeNode.id;
	                	_this.addTab(id,url,treeNode.name);
	                }//点击绑定事件
	            }

	        };  
	        $.fn.zTree.init($("#menus"), setting, []); 
	        tab=$("#framecenter").ligerTab({
                width: "100%", height: "100%",
                showSwitchInTab: true,
                showSwitch: true,
                dblClickToClose: true,
                dragToMove: true,
                contextmenu: true 
            });
		},
		addTab:function(tabid,url,name){
                tab.addTabItem({
                  tabid: tabid,
                  text: name,
                  url: url,
                  callback: function () {
                      //addFrameSkinLink(tabid);
                  }
         });
            
		}
	}
}();

$(function(){
	main.init();
});
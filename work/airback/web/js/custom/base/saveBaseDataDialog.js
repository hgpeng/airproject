var saveBaseDataDialog=function(){
	var groupicon = "/js/ligerUI/skins/icons/communication.gif";
	return {
		init:function(){
			var mainform = $("form");
            mainform.ligerForm({
                inputWidth: 170, labelWidth: 90, space: 40,
                fields: [
                { name: "id", type: "hidden" },
                { display: "名称", name: "name", newline: true, type: "text", validate: { required: true,minlength:3 }, group: "基础信息", groupicon: groupicon},
                { display: "图标", name: "icon",  readonly:true,newline: true, type: "text"},
                { display: "链接", name: "url", newline: true, type: "text", width:300},
                { display:'基本类型',name:"baseType",type: "select", comboboxName: "baseTypeSelect", options: { url:'/baseData/getAllBaseTypes.jsps',valueFieldID: "baseTypeId",textField:'name' }}
                ]
            });
		}
	}
}();

$(function(){
	saveBaseDataDialog.init();
})
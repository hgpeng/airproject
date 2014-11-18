var saveBaseDataDialog=function(){
	var groupicon = "/js/ligerUI/skins/icons/communication.gif";
	return {
		init:function(){
			var mainform = $("form");
            mainform.ligerForm({
                inputWidth: 170, labelWidth: 90, space: 40,
                fields: [
                { name: "id", type: "hidden" },
                { display: "名称", name: "name", newline: true, type: "text", validate: { required: true,minlength:3 }},
                { display: "英文名称", name: "name_en", newline: true, type: "text", validate: { required: true,minlength:3 }},           
                { display: "封面图", name: "photo",  readonly:true,newline: true, type: "text"},
                { display: "面积", name: "area", newline: true, type: "text", width:300},
                { display: "地址", name: "addr", newline: true, type: "text", width:300},
                { display: "时间", name: "buildtime", newline: true, type: "text", width:300},
                { display:'基本类型',name:"basedata",type: "select", comboboxName: "baseTypeSelect", options: { url:'/baseData/getAllBaseData.jsps?type=7',valueFieldID: "basedataId",textField:'name' }},
                { display: "内容", name: "content", newline: true, type: "textarea", width:300}
                ]
            });
		}
	}
}();

$(function(){
	//saveBaseDataDialog.init();
})
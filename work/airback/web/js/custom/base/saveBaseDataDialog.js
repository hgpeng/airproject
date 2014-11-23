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
                { display: "英文", name: "name_en", newline: true, type: "text", validate: { required: true,minlength:3 }},       
                { display: "编码", name: "number", newline: true, type: "text", validate: { required: true,minlength:3 }},             
                { display: "图标", name: "icon",  readonly:true,newline: true, type: "text"},
                { display: "链接", name: "url", newline: true, type: "text", width:300},
                { display:'基本类型',name:"baseType",type: "select", comboboxName: "baseTypeSelect", options: { url:'/baseData/getAllBaseTypes.jsps',valueFieldID: "baseTypeId",textField:'name' }},
                { display: "备注", name: "desc", newline: true, type: "textarea",options:{cols:100,rows:4,width:600}}
                ]
            });
            $("#number").val($("#numberId").val());
            $("#name").val($("#nameId").val());
            $("#name_en").val($("#name_enId").val());
            $("#icon").val($("#iconId").val());
            $("#url").val($("#urlId").val());
            $("#id").val($("#dataId").val());
            $("#baseTypeId").val($("#typeId").val());
            $("#desc").val($("#descId").val());
		}
	}
}();

$(function(){
	saveBaseDataDialog.init();
})
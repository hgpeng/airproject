var saveProduct=function(){
	var groupicon = "/js/ligerUI/skins/icons/communication.gif";
	return {
		init:function(){
			var mainform = $("form");
            mainform.ligerForm({
                inputWidth: 300, labelWidth: 90, space: 40,
                fields: [
                { name: "id", type: "hidden" },
                { display: "名称", name: "name", newline: true, type: "text", validate: { required: true,minlength:3 }, group: "基础信息", groupicon: groupicon},
                { display: "备注", name: "desc", newline: true, type: "textarea"}
                ]
            });
		}
	}
}();
$(function(){
	saveProduct.init();
});
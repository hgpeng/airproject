var saveBaseTypeDialog=function(){
	var groupicon = "/js/ligerUI/skins/icons/communication.gif";
	return {
		init:function(){
			//$.metadata.setType("attr", "validate");
            //创建表单结构
            var mainform = $("form");
            mainform.ligerForm({
                inputWidth: 170, labelWidth: 90, space: 40,
                fields: [
                { name: "id", type: "hidden" },
                { display: "基本类型", name: "name", newline: true, type: "text", validate: { required: true,minlength:3 }, group: "基础信息", groupicon: groupicon},
                { display: "链接", name: "url", newline: true, type: "text", validate: { required: true,minlength:3 }, group: "基础信息", groupicon: groupicon}
                ]
            });
		}
	}
}();
$(function(){
	saveBaseTypeDialog.init();
});
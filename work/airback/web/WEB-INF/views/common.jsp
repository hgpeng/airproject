<%
int port = request.getServerPort();
String scheme = request.getScheme();
String path = request.getScheme()+"://"+request.getServerName() + ((("http".equals(scheme) && port == 80) ||("https".equals(scheme)  && port == 443)) ? "" : ":" + port) + request.getContextPath();
request.setAttribute("base", path);
request.setAttribute("imagepath", path +"/images");
%>
<script type='text/javascript'>
	var base='${base}';
</script>
<link href="${base }/js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css"/>
<link href="${base }/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" media="screen"/>
<link href="${base }/js/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${base}/js/ligerUI/js/ligerui.all.js"></script>
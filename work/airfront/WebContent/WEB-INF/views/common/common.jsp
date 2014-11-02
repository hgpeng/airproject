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
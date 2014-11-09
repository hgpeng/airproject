<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>管理后台登录页</title>
<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
<link type="text/css" rel="stylesheet" href="${basePath }/css/login.css" />
</head>
<body onload='document.f.username.focus();' class="login">
	
	<div class="login_top">
	<div class="login_width">
		<div class="login_top_l">
			<div class="login_logo"></div>
			<div class="login_name">管理后台</div>
		</div>
		<div class="login_top_c"></div>
		<div class="login_top_r">
			<p id="xianshi"></p>
		</div>
	</div>
</div>
<form id="loginForm" name='f'
			action="/index/login.jsps"
			method='POST'>
<div class="login_main">
	<div class="login_border">
		<div class="login_border_h"></div>
		<div class="login_border_c">
			<div><input id="username" class="username" name='userName'  type="text" size="15" /></div>
			<div><input id="password" class="password" name='password'  type="password" size="15" /></div>
		</div>
		<div class="login_border_b">
			<p id="errorInfo" class="errorInfo"></p>
        	<a id="login" class="button1" href="javascript:void(0)" title="登录"></a>
		</div>
	</div>
</div>
</form>
<div class="login_bottom">
	<P>Copyright &copy; 版权信息</P>
</div>
<script type="text/javascript" src="${basePath}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
window.onload = function(){
	(function(){
		document.getElementById("xianshi").innerHTML="现在的时间是"+new Date().toLocaleString();
		setTimeout(arguments.callee,1000);
	})();
}
$(function(){
	$("#login").bind("click",function(){
		var username=$("#username").val();
		var password=$("#password").val();
		if(username.length==0){
			alert("登录名不能为空");
			return false;
		}
		if(password.length==0){
			alert("密码不能为空");
			return false;
		}
		$("#loginForm").submit();
	});
});
</script>

</body>
</html>
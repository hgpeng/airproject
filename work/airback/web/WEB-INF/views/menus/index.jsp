<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>登录成功页</title>
<link href="/js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />

<style type="text/css"> 
    body,html{height:100%;}
    body{ padding:0px; margin:0;   overflow:hidden;}  
    .l-link{ display:block; height:26px; line-height:26px; padding-left:10px; text-decoration:underline; color:#333;}
    .l-link2{text-decoration:underline; color:white; margin-left:2px;margin-right:2px;}
    .l-layout-top{background:#102A49; color:White;}
    .l-layout-bottom{ background:#E5EDEF; text-align:center;}
    #pageloading{position:absolute; left:0px; top:0px; background:white url('/images/loading.gif') no-repeat center; width:100%; height:100%;z-index:99999;}
    .l-link{ display:block; line-height:22px; height:22px; padding-left:16px;border:1px solid white; margin:4px;}
    .l-link-over{ background:#FFEEAC; border:1px solid #DB9F00;} 
    .l-winbar{ background:#2B5A76; height:30px; position:absolute; left:0px; bottom:0px; width:100%; z-index:99999;}
    .space{ color:#E7E7E7;}
    /* 顶部 */ 
    .l-topmenu{ margin:0; padding:0; height:31px; line-height:31px; background:url('/images/top.jpg') repeat-x bottom;  position:relative; border-top:1px solid #1D438B;  }
    .l-topmenu-logo{ color:#E7E7E7; padding-left:35px; line-height:26px;background:url('/images/topicon.gif') no-repeat 10px 5px;}
    .l-topmenu-welcome{  position:absolute; height:24px; line-height:24px;  right:30px; top:2px;color:#070A0C;}
    .l-topmenu-welcome a{ color:#E7E7E7; text-decoration:underline} d
     .body-gray2014 #framecenter{
        margin-top:3px;
    }
      .viewsourcelink {
         background:#B3D9F7;  display:block; position:absolute; right:10px; top:3px; padding:6px 4px; color:#333; text-decoration:underline;
    }
    .viewsourcelink-over {
        background:#81C0F2;
    }
    .l-topmenu-welcome label {color:white;
    }
    #skinSelect {
        margin-right: 6px;
    }
 </style>
</head>
<body style="padding:0px;background:#EAEEF5;">  
<body style="padding:0px;background:#EAEEF5;">
<div id="pageloading" style="display: none;"></div>
<div id="topmenu" class="l-topmenu">
<div class="l-topmenu-logo">后台管理系统</div>
<div class="l-topmenu-welcome">
</div>
 <div id="layout1" style="width:99.2%; margin:0 auto; margin-top:4px; "> 
        <div position="left">
            <ul id="menus" class="ztree"></ul>
        </div>
        <div id="framecenter" position="center">            
        </div>  
</div>
<link href="/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" /> 
<script src="/js/jquery-1.8.3.min.js" type="text/javascript"></script>  
<script src="/js/ztree/jquery.ztree.core-3.4.js" type="text/javascript"></script>  
<script src="/js/ligerUI/js/ligerui.all.js" type="text/javascript"></script> 
<script src="/js/ligerUI/js/plugins/ligerLayout.js"></script>
<script src="/js/custom/menus/main.js"></script>
</body>
</html>
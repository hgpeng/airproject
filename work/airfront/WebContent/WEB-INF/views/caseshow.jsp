<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit">
<jsp:include page="common/commonHead.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${base }/default/style/case-show.css"/>
<script type="text/javascript" src="${base}/default/js/control/superslider.js"></script>
<title>工程案例</title>
</head>
<body>
<div id="boxwarp" >
       <jsp:include page="common/top.jsp"></jsp:include>
    
    <div class="case-show">
    	<div class="fullSlide">
		
			<div class="bd">
				<ul>
				<c:if test="{!empty cplist}">
				<c:forEach items="${cplist }" var="item"  varStatus="status">
					<li _src="url(${base}/images/${item.path}" style="background:#e6e6e6 center center no-repeat;background-size:1440px auto"></li>				
				</c:forEach>
				</c:if>
					<li _src="url(${base}/default/style/images/case/case01.jpg)" style="background:#e6e6e6 center center no-repeat;background-size:1440px auto"></li>
					<li _src="url(${base}/default/style/images/case/case03.jpg)" style="background:#e6e6e6 center center no-repeat;background-size:1440px auto"></li>
				
				</ul>
			</div>
		
			<span class="prev"><i></i></span><span class="next"><i></i></span>
            
		</div>
		
		<div class="case-right">
        	<div class="case-close">
            	<a href="${base }/caselist">关闭</a>
            </div>
			<h2>${data.name }</h2>
            <p>时间：${data.buildtime }<br/>地址：${data.addr }<br/>面积：${data.area }平米</p>
            <p>${data.content }</p>
            <div class="fenxiang">
            	<a href="#"><img src="${base}/default/style/images/case/case_05.png" /></a>
            </div>
		</div>
		
    </div>
    
    
    
	 
</div>

<script type="text/javascript"  src="${base}/default/js/module/banner.js"></script>
</body>
</html>
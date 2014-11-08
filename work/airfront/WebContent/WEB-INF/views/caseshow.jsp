<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
					<li _src="url(${base}/default/style/images/case/case01.jpg)" style="background:#e6e6e6 center center no-repeat;background-size:1440px auto"></li>
					<li _src="url(${base}/default/style/images/case/case03.jpg)" style="background:#e6e6e6 center center no-repeat;background-size:1440px auto"></li>
					<li _src="url(${base}/default/style/images/case/case04.jpg)" style="background:#e6e6e6 center center no-repeat;background-size:1440px auto"></li>
				</ul>
			</div>
		
			<span class="prev"><i></i></span><span class="next"><i></i></span>
            
		</div>
		
		<div class="case-right">
        	<div class="case-close">
            	<a href="case.html">关闭</a>
            </div>
			<h2>振业城别墅</h2>
            <p>时间：2014年7月<br/>地址：深圳<br/>面积：400平米</p>
            <p>2014年7月16日, 绿色时代与振业城别墅区签定服务协议，同时对十五套精装修别墅进行全面空气净化处理，绿色时代以五大技术，十项流程，强效的产品与优质服务赢得了别墅区业主的高度认可。在治理过程中同时又承接了宝安曦城别墅及润恒御园别墅的治理工程。</p>
            <div class="fenxiang">
            	<a href="#"><img src="${base}/default/style/images/case/case_05.png" /></a>
            </div>
		</div>
		
    </div>
    
    
    
	 
</div>

<script type="text/javascript"  src="${base}/default/js/module/banner.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit">
<jsp:include page="common/commonHead.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${base }/default/style/case.css"/>
<link rel="stylesheet" type="text/css" href="${base }/default/style/product-show.css"/>
<script type="text/javascript"  src="${base}/default/js/module/tags.js"></script>
<script type="text/javascript" src="${base}/default/js/control/superslider.js"></script>
<title>产品展示</title>
</head>
<body>
<div id="boxwarp" class="scrollbox">
   <jsp:include page="common/top.jsp"></jsp:include>
   
     <div class="case-warp" style="padding-right:0px;">
    	
        <style>
           .w1200{width:1200px; margin:0 auto;}
		   .tool:after
			{clear:both;
			content:".";
			display:block;
			font-size:0;
			height:0;
			line-height:0;
			visibility:hidden;}
			
		   .tool{word-wrap:break-word; overflow:hidden;}
		   .tool{margin-left:-28px; padding-top:30px;}
		   .tool ul li{width:279px; height:270px; float:left; margin:40px 0px 0px 28px; font-size:16px; text-align:center; line-height:30px; color:#333;}
		   .tool ul li img{width:279px; height:220px;}
		   
		   .news-more{background:#00a0e9; line-height:43px; height:43px; border-radius:3px; display:inline-block; padding:0px 30px;}
           .news-more:hover{background:#0385c1;}
        </style>
        
        <!--------------------新加结构开始---------------------------->
        
        
        <div class="w1200">
             
             <div class="tool">
                  <ul>
                      <li><img src="http://news.xinhuanet.com/mil/2014-11/06/127185260_14152424326251n.jpg">检测仪</li>
                      <li><img src="http://news.xinhuanet.com/mil/2014-11/06/127185260_14152424326251n.jpg">检测仪</li>
                      <li><img src="http://news.xinhuanet.com/mil/2014-11/06/127185260_14152424326251n.jpg">检测仪</li>
                      <li><img src="http://news.xinhuanet.com/mil/2014-11/06/127185260_14152424326251n.jpg">检测仪</li>
                      <li><img src="http://news.xinhuanet.com/mil/2014-11/06/127185260_14152424326251n.jpg">检测仪</li>
                      <li><img src="http://news.xinhuanet.com/mil/2014-11/06/127185260_14152424326251n.jpg">检测仪</li>
                      <li><img src="http://news.xinhuanet.com/mil/2014-11/06/127185260_14152424326251n.jpg">检测仪</li>
                      <li><img src="http://news.xinhuanet.com/mil/2014-11/06/127185260_14152424326251n.jpg">检测仪</li>
                  </ul>
             </div>
             
             
             <div style="overflow:hidden; margin-top:20px;">
                  <a style="color:#fff; float:right;" class="news-more" href="#">+ 更多</a>
             </div>
             
             
        </div>
        
        
        
        <!--------------------新加结构结束---------------------------->
        
        
        
    	<div class="case-r">
    		<div class="case-rlogo"><img src="${base}/default/style/images/case/case_06.png"/></div>
    		<ul class="case-rul">
    			<li class="rlist_01"><a href="#">治理服务</a></li>
                
                <style>
                .case-rul li{width:100%; float:left;}
                .case-rul li.onenav{}
                .case-rul li.onenav a{background:#2a94dd;}
                .case-rul li.onenav a:hover{}
                .case-rul li.onenav ul{display:block; padding-bottom:15px; float:left; font-size:14px;}
                .case-rul li.onenav ul li{width:280px; line-height:22px; background:#none; margin-top:10px; float:left; display:inline-block; background:none; padding-top:none;}  
                .case-rul li.onenav ul li a{width:215px; background:url(../other/${base}/default/style/images/case/jb.png) left top no-repeat; color:#cce8f8;} 
                .case-rul li.onenav ul li a:hover{background:url(../other/${base}/default/style/images/case/jb.png) left top no-repeat; text-decoration:underline;} 
                </style>
                
               <!-- <li>
                     <a href="#">产品展示</a>
                </li>-->
                
                
                <!----------这里是竖向下拉展开菜单，js你写，结构就是这样，要是不要，你对比上面注释的划过的结构，记得onenav这个class--------------->
    			<li class="onenav">
                     <a href="#">产品展示</a>
                     <ul>
                        <li><a href="#">室内空气专业治理系列</a></li>
                        <li><a href="#">家居护理商超环保系列</a></li>
                        <li><a href="#">汽车空气治理护理系列</a></li>
                        <li><a href="#">空气净化机系列</a></li>
                        <li><a href="#">专业技术与设备</a></li>
                        <li><a href="#">组合礼包系列</a></li>
                      </ul>
                </li>
                
                
                
    			<li>
    				<a href="#">工程案例</a>
    				<div class="case-r-nav">
    					<ul>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_08.png"/>
    								办公环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_09.png"/>
    								学校环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_10.png"/>
    								商场环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_11.png"/>
    								酒店环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_12.png"/>
    								医疗环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_13.png"/>
    								家庭环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_14.png"/>
    								工业环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_15.png"/>
    								娱乐环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_16.png"/>
    								超市环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_17.png"/>
    								公共环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_18.png"/>
    								车内环境
    							</a>
    						</li>
    					</ul>
    				</div>
    			</li>
    		</ul>
    		<div class="fenxiang">
    			<a href="#"><img src="${base}/default/style/images/case/case_05.png"/></a>
    		</div>
    	</div>
    </div>
   
</div>
</body>
</html>
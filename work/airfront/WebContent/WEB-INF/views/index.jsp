<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="common/commonHead.jsp"></jsp:include>
<title>首页</title>
<link rel="stylesheet" href="${base }/default/style/default.css">
<link rel="stylesheet" type="text/css" href="${base}/default/js/control/video/video-js.css" />
<link rel="stylesheet" href="${base }/default/style/donghua.css">
<meta name="description" content="空气果是墨迹天气打造一年的首款硬件产品，它可以检测室内外温湿度、CO2浓度、气压、PM2.5等空气数据。操作简便，一键检测，是家中必备的最聪明的空气检测设备。">
<meta name="keywords" content="墨迹天气,空气果,空气检测,空气果·室外版,智能硬件、PM2.5">
<script type="text/javascript" src="${base }/default/js/common/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${base }/default/js/control/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="${base }/default/js/control/superslider.js"></script>
<script type="text/javascript" src="${base }/default/js/module/pageload.js"></script>
<!---[if Ite IE 9]-->
<script type="text/javascript" src="${base }/default/js/control/html5shiv.js"></script>
<!--[endif]--->
<script type="text/javascript" src="${base}/default/js/control/video/video.js" ></script>
<script type="text/javascript">
	var canvas, ctx;
	var stars = new Array(15);
	var background = new Image();
    background.src = "${base}/default/style/images/part01-canvas.jpg";
	$(document).ready(function(){
		canvas = document.getElementById("tutorial");
        if( canvas && canvas.getContext ) {
            ctx = canvas.getContext("2d");
            ctx.drawImage(background, 0, 0);
            initStars();
            setInterval(loop,30);
        }
	})
	
	  function randomRange(minVal,maxVal) {
        return Math.floor(Math.random() * (maxVal - minVal - 1)) + minVal;
    }

    function initStars() {
        for( var i = 0; i < stars.length; i++ ) {
            stars[i] = {
                x: randomRange(-30,30),
                y: randomRange(-30,25),
                z: randomRange(1,30)
            }
        }
    }

    function mainloop(){
        clearCanvas();
        loop();
    }
    function clearCanvas(){
        if(typeof ctx != "undefined"){
            ctx.clearRect(0, 0, 800, 500);
        }
    }

    function loop() {
        var halfWidth  = canvas.width / 2;
        var halfHeight = canvas.height / 2;
//    ctx.fillStyle = "rgb(134,196,219)";
//    ctx.fillRect(0,0,canvas.width,canvas.height);
        ctx.drawImage(background, 0, 0);

        for( var i = 0; i < stars.length; i++ ) {
            stars[i].z -= 0.15;

            if( stars[i].z <= 0 ) {
                stars[i].x = randomRange(-30,30);
                stars[i].y = randomRange(-30,30);
                stars[i].z = MAX_DEPTH;
            }

            var k  = 150.0 / stars[i].z;
            var px = stars[i].x * k + halfWidth;
            var py = stars[i].y * k + halfHeight;

            if( px >= 0 && px <= 800 && py >= 0 && py <= 500 ) {
                var size = (1 - stars[i].z / 32.0) * 5;
//            var shade = parseInt((1 - stars[i].z / 32.0) * 255);
                ctx.fillStyle = "rgba(255,255,255,0.5)";
                ctx.beginPath();
                ctx.arc(px,py,size,0,Math.PI*2,true);
                ctx.closePath();
                ctx.fill();

//            ctx.fillRect(px,py,size,size);
            }
        }
    }
    
</script>
<style>
.demo02{
	text-align:center;
	border:5px solid #62F3FD;
	width:80px;
	top:210px;
	left:390px;
	height:250px;
	border-radius:50%;
	-moz-border-radius:50%;
	transform: rotate(-20deg);
	-ms-transform: rotate(-20deg);		/* IE 9 */
	-webkit-transform: rotate(-20deg);	/* Safari and Chrome */
	-o-transform: rotate(-20deg);		/* Opera */
	-moz-transform: rotate(-20deg);
	position:absolute;
	z-index:999;
    }
</style>

</head>
<body style="overflow: hidden;">
	<div style="display: none;" class="pop-bg"></div>
	<div class="pop-wrap" style="display: none;">
  <div class="close"></div>
  <div>
    <video id="example_video_1" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="none"
		      data-setup="{}" width="838" height="350">
			    <source src="http://www.51zhiye.com/images/zhiyewang/51wzsy.flv" type='video/flv' />	  
			  </video>
  </div>
</div>
	<nav>
		 <div style="height:60px;width:800px;margin:0 auto;">
			<a href="http://www.mojichina.com" class="logo" style="float: left;">
            <img src="${base }/default/style/images/logo.png" alt="德士特 " style="height:50px;"/>
        	</a>
			<div class="navlist">
				<a href="/indoor">概览</a>
	            <a href="/outdoor">产品中心</a>
	            <a href="/airwall">解决方案</a>
	            <a href="/standard">下载中心</a>
	            <a href="/standard">在线商店</a>
	             <a href="/standard">关于德士特</a>
			</div>
			<div style="float:right;">
			
				<a>治理服务</a>
				<a><img src=""></img></a>
				<a><img src=""></img></a>
			</div>
		 </div>
	</nav>
	<div class="progress-nav">
	<ul><li class="active"><a><span class="dot"></span>
	<span class="dot-stroke"></span><span class="progress-nav-text">简约，源自隐藏的精密</span></a>
	</li>
	<li class=""><a><span class="dot"></span><span class="dot-stroke"></span>
	<span class="progress-nav-text">让你的左右，不被产品左右</span></a>
	</li>
	<li><a><span class="dot"></span><span class="dot-stroke"></span>
	<span class="progress-nav-text">以柔韧，构建硬朗</span></a></li>
	<li><a><span class="dot"></span><span class="dot-stroke"></span>
	<span class="progress-nav-text">平坦的本质，是极致的曲面</span></a></li>
	</ul>
	</div>
	
	<div class="indoor_page_wrap">
	
	<section class="indoor-page">
    <div class="indoor-wrap">
    <div id="tutorial">
</div>
        <img src="${base }/default/style/images/ind1.png" class="swing animated" alt="" width="100%;" >    
    </div>
</section>
	
	<section class="indoor-page">
    <div class="indoor-wrap" style="background-color:#00ADEF;width:100%;">
          
    </div>
</section>

<section class="indoor-page">
    <div class="indoor-wrap" style="background-color:#89c70a;width:100%;">
          
    </div>
</section>

</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit">
<jsp:include page="common/commonHead.jsp"></jsp:include>
<link rel="stylesheet" href="${base }/default/style/main.css">
<link rel="stylesheet" href="${base }/default/style/donghua.css">
<link rel="stylesheet" type="text/css" href="${base}/default/js/control/video/video-js.css" />
<link rel="stylesheet" type="text/css" href="${base}/default/js/control/fullPage/jquery.fullPage.css" />
<script type="text/javascript"  src="${base }/default/js/module/hover.js"></script>
<script type="text/javascript" src="${base}/default/js/control/video/video.js" ></script>
<script type="text/javascript" src="${base}/default/js/control/jquery.easings.min.js" ></script>
<script type="text/javascript" src="${base}/default/js/control/jquery.lazyload.js" ></script>
<script type="text/javascript" src="${base}/default/js/control/fullPage/jquery.fullPage.min.js" ></script>

<script type="text/javascript" >
	videojs.options.flash.swf = "${base}/default/js/control/video/video-js.swf";
	
	$(document).ready(function(){
		 $('div.section img').lazyload({
	         threshold: 200,
	         data_attribute: 'src'
	     });
		 
		//setTimeout(showitem,1000);
		$(".animation-mark").hide();
		$("#section1 .animation-mark").show().addClass("animated");
		 $('#boxwarp').fullpage({
				anchors: ['page1', 'page2', 'page3', 'page4', 'page5'],
				navigation: true,
				navigationPosition: 'left',
				onLeave:function(index,nextIndex,direction ){
					if(index==5){
						$("#boxwarp").css("margin-top","0");
					}
				},
				afterLoad: function(anchorLink, index){
					$.each($("div.progress-nav").find("li"),function(i,item){
						if(i==index){
							$(item).addClass("active");
						}else{
							$(item).removeClass("active");
						}
					});
					 $(".animation-mark").removeClass("animatedelay").hide();
			         $("#section" + index + " .animation-mark").show().addClass("animatedelay");
			         if(index==5){
			        	 $("#boxwarp").trans({"margin-top":"-89px","transition-duration":"1s"});
			         }
			         clearInterval(autoPlay);
			         if(index==1){
			            	$("#contro").fadeOut();
			            }else{
			            	$("#contro").fadeIn();
			            }
				}
			});
		 var _autoPlayIndex = 1;
		 var maxPlay = $("#section1 .slide").length;
		 
		 var autoPlay = setInterval(function(){			
					playSlider(_autoPlayIndex + 1);
					
					_autoPlayIndex = (_autoPlayIndex+1)>=maxPlay?0:(_autoPlayIndex+1);
				}, 3000);
		 
		 $("#contro a.up").click(function(){
			 $.fn.fullpage.moveSectionUp();
			});
			
		$("#contro a.down").click(function(){
			$.fn.fullpage.moveSectionDown();
		});
	})
	var cnum = 0;
	function showitem(){
		$("#tags li").each(function(i,item){
			if(i==cnum)
				$(item).show();
		});
		cnum++;
		if(cnum<$("#tags li").length)
		setTimeout(showitem,1000);
		
	}
	
	function showvideo(){
		$("div.pop-bg").show();
		$("div.pop-wrap").show();
	}
	
	function hidevideo(){
		$("div.pop-bg").hide();
		$("div.pop-wrap").hide();
	}
	
	function playSlider(_index){
    	$(".slide .animation-mark").removeClass("animated").hide();
		$("#slider" + _index + " .animation-mark").show().addClass("animated");
		$("#section1 .slide").hide();
		_index == 1 ? $("#slider1").slideDown() : $("#slider" + _index).fadeIn();
		$(".bannerico a").removeClass("now");
		$($(".bannerico a")[_index - 1]).addClass("now");
    }
	
</script>
<title>首页</title>
</head>
<body>
<div id="boxwarp">
  <div id="contro" style="display:none;">
    <div class="logobox "><a href="#"><img src="${base }/default/style/images/rightlogo.jpg" alt=""/></a></div>
    <div class="conbox ">
      <div class="arrow"><a class="up"></a></div>
      <div class="portfolio">
        <ul>
          <li><a href="#" class="now">概览</a></li>
          <li><a href="#">产品中心</a></li>
          <li><a href="#">解决方案</a></li>
          <li><a href="#">治理服务</a></li>
          <li><a href="#">下载中心</a></li>
          <li><a href="#">在线商店</a></li>
          <li><a href="#">关于我们</a></li>
        </ul>
      </div>
      <div class="arrowbottom"><a class="down"></a></div>
    </div>
  </div>

  
  <div style="display: none;" class="pop-bg"></div>
	<div class="pop-wrap" style="display: none;">
  <div class="close" onclick="hidevideo();"></div>
  <div>
    <video id="example_video_1" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="none"
		      data-setup="{}" width="838" height="350">
			    <source src="http://www.51zhiye.com/images/zhiyewang/51wzsy.flv" type='video/flv' />	  
			  </video>
  </div>
</div>
  
    <div class="header">
      <div class="headerbody">
        <div class="headerright">
          <ul>
            <li><a href="#" class="an">治理服务</a></li>
            <li><a href="#"><img src="${base }/default/style/images/ico2.png" alt=""/></a></li>
            <li><a href="#"><img src="${base }/default/style/images/ico1.png" alt=""/></a></li>
          </ul>
        </div>
        <div class="logo"><img src="${base }/default/style/images/logo.png" alt=""/></div>
        <ul class="nav">
          <li><a href="#" class="now">概览</a></li>
          <li><a href="#">产品中心</a></li>
          <li><a href="#">解决方案</a></li>
          <li><a href="#">治理服务</a></li>
          <li><a href="#">下载中心</a></li>
          <li><a href="#">在线商店</a></li>
          <li><a href="#">关于德士特</a></li>
        </ul>
      </div>
  </div>
  <div id="section1" class="section">
  <div class="slide" id="slider1" style="cursor: pointer;">
	    <div class="banner">
	    <img  style="display:none;" class="bgimg animation-mark bounceInLeft" src="${base }/default/style/images/banner.jpg" alt="">
	    <div style="display:none;" class="bannertxt animation-mark bounceInRight">
	    <dl><dd><img src="${base }/default/style/images/banntxt.png" alt=""/><h3>智能空气监测仪</h3><h4>看的见 才安全</h4></dd>
	    <dd><a href="#">了解更多 ></a><a href="javascript:void(0)" onclick="showvideo()"　class="Video">观看影片</a></dd></dl>
	    </div>
	    </div>
    </div>
    <div class="slide" id="slider2" style="cursor: pointer;">
   
     <div class="banner">
	    <img  style="display:none;" class="bgimg animation-mark bounceInUp" src="${base }/default/style/images/banner.jpg" alt="">
	    <div style="display:none;" class="bannertxt animation-mark slideInDown">
	    <dl><dd><img src="${base }/default/style/images/banntxt.png" alt=""/><h3>智能空气监测仪</h3><h4>看的见 才安全</h4></dd>
	    <dd><a href="#">了解更多 ></a><a href="javascript:void(0)" onclick="showvideo()"　class="Video">观看影片</a></dd></dl>
	    </div>
	    </div>
    </div>
    <div class="slide" id="slider3" style="cursor: pointer;">
   
     <div class="banner">
	    <img  style="display:none;" class="bgimg animation-mark bounceInUp" src="${base }/default/style/images/banner.jpg" alt="">
	    <div style="display:none;" class="bannertxt animation-mark bounceInRight">
	    <dl><dd><img src="${base }/default/style/images/banntxt.png" alt=""/><h3>智能空气监测仪</h3><h4>看的见 才安全</h4></dd>
	    <dd><a href="#">了解更多 ></a><a href="javascript:void(0)" onclick="showvideo()"　class="Video">观看影片</a></dd></dl>
	    </div>
	    </div>
    </div>
     <div>
    	    <ul class="bannerico">
    	    <li><a class="now" href="#"><span>1</span></a></li><li>
    	    <a href="#" ><span>2</span></a></li><li><a href="#"><span>3</span></a></li></ul>
    
    </div>
    
  </div>
  <div id="section2" style="border-bottom:1px solid #FFF;" class="section">
  <img  class="bgimg" src="${base }/default/style/images/bg2.jpg" alt="">
    <div class="pagebody">
    <div class="pageleft"><img src="${base }/default/style/images/pageimg.png" alt=""/></div>
    <div class="pageright">
    <h3 class="pagetitle">六大核心技术</h3>
    <div class="Tab">
<ul id=tags>
<li class="selectTag">
<a onmouseover="selectTag('tagContent0',this)"  href="javascript:void(0)" title="微生物技术">
<img class="animation-mark rollIn"  style="animation-delay:0.5s;-webkit-animation-delay:0.5s;" src="${base }/default/style/images/title1.png" alt="微生物技术"/></a></li>
<li ><a onmouseover="selectTag('tagContent1',this)"   href="javascript:void(0)" title="低温等离子">
<img  class="animation-mark rollIn" style="animation-delay:0.7s;-webkit-animation-delay:0.7s;" src="${base }/default/style/images/title2.png" alt="低温等离子"/>
</a></li>
<li ><a onmouseover="selectTag('tagContent2',this)"  href="javascript:void(0)" title="负离子技术">
<img  class="animation-mark rollIn" style="animation-delay:0.9s;-webkit-animation-delay:0.9s;" src="${base }/default/style/images/title3.png" alt="负离子技术"/> </a></li>
<li ><a onmouseover="selectTag('tagContent3',this)"  href="javascript:void(0)" title="光触媒技术">
<img  class="animation-mark rollIn" style="animation-delay:1.1s;-webkit-animation-delay:1.1s;" src="${base }/default/style/images/title4.png" alt="光触媒技术"/></a></li>
<li ><a onmouseover="selectTag('tagContent4',this)"  href="javascript:void(0)" title="智能新风系统">
<img  class="animation-mark rollIn" style="animation-delay:1.3s;-webkit-animation-delay:1.3s;" src="${base }/default/style/images/title5.png" alt="智能新风系统"/></a></li>
<li ><a onmouseover="selectTag('tagContent5',this)"  href="javascript:void(0)" title="分布式加湿">
<img  class="animation-mark rollIn" style="animation-delay:1.5s;-webkit-animation-delay:1.5s;" src="${base }/default/style/images/title6.png" alt="分布式加湿"/></a></li>
</ul>
</div>
<div id="tagContent"> 
<div class="tagContent" id="tagContent0">
<img class="pageico" src="${base }/default/style/images/pageico.png" alt="三角形"/>
<h3 class="title1">微生物（生物酶）技术</h3>
DST生物酶技术是从自然微生物中分离提纯出对人体有益的微生物制成产品，具有更安全更高效的
除污、治污、防污能力，在治理室内装修污染领域，通过吞噬、分解来消除空气中的有毒有害物质。
微生物能够精准锁定异味产生源，快速持久的捕捉、隔绝和消除空气中的异味分子。有别于传统空
气清新剂、环境香水等嗅觉麻痹式化学掩盖类产品，生物酶技术可快速分解空气中的异味，减少细
菌滋生，解决因室内异味带来的健康危害和烦恼。</div>
<div class="tagContent" id="tagContent1" style="display:none;">
<img class="pageico" src="${base }/default/style/images/pageico.png" alt="三角形"/>
<h3 class="title1">低温等离子</h3></div>
<div class="tagContent" id="tagContent2" style="display:none;">
<img class="pageico" src="${base }/default/style/images/pageico.png" alt="三角形"/>
<h3 class="title1">负离子技术</h3></div>
<div class="tagContent" id="tagContent3" style="display:none;">
<img class="pageico" src="${base }/default/style/images/pageico.png" alt="三角形"/>
<h3 class="title1">光触媒技术</h3></div>
<div class="tagContent" id="tagContent4" style="display:none;">
<img class="pageico" src="${base }/default/style/images/pageico.png" alt="三角形"/>
<h3 class="title1">智能新风系统</h3></div>
<div class="tagContent" id="tagContent5" style="display:none;">
<img class="pageico" src="${base }/default/style/images/pageico.png" alt="三角形"/>
<h3 class="title1">分布式加湿</h3></div>
</div>
    </div>
     </div>
  </div>
  <div id="section3" style=" border-bottom:1px solid #FFF;" class="section">
  <img  class="bgimg" src="${base }/default/style/images/bg3.jpg" alt="">
    <div class="imgbody"><img style="display:none;"  class="round animation-mark" src="${base }/default/style/images/img1.png" alt=""/></div>
  </div>
  <div id="section4" class="section">
  <img  class="bgimg"src="${base }/default/style/images/bg4.jpg" alt="">
    <div style="display:none;" class="info zoomInLeft animation-mark">
      <h4>DST 蓝·呼吸 战略</h4>
      <h3>蓝动中国 美好生活</h3>
      <p>"蓝·呼吸"是DST的中国家庭环境健康安全"蓝色成长战略"<br/>
        旨在为千万家庭，开发出更节能、更高效、更健康的整体解<br/>
        决方案，创造更纯净的空气环境。DST通过实施"蓝·呼吸"<br/>
        战略，全力支持中国绿色经济发展。</p>
    </div>
  </div>
  <div id="section5" style=" height:inherit; background:#FFF;" class="section">
    <div class="homemenu">
      <ul>
        <li><a href="#">了解德士特</a></li>
        <li><a href="#">解决方案</a></li>
        <li><a href="#">治理服务</a></li>
      </ul>
    </div>
    <div class="homebody bounceInUp animation-mark" style="display:none;">
      <div class="centerbody">
        <div class="leftnews"><img class="newslogo" src="${base }/default/style/images/newslogo.png" alt=""/>
          <dl>
            <dt>2014/09<span>28</span></dt>
            <dd><a href="#">
              <h3>健康生活 从家开始</h3>
              </a>呼吸是我们感受生活的重要方式。我们
              会对不同的空气作出相应的反应，...</dd>
          </dl>
          <dl>
            <dt>2014/09<span>28</span></dt>
            <dd><a href="#">
              <h3>健康生活 从家开始</h3>
              </a>呼吸是我们感受生活的重要方式。我们
              会对不同的空气作出相应的反应，...</dd>
          </dl>
        </div>
        <div class="centercontact">
          <div class="title"><img src="${base }/default/style/images/contacttitle.png" alt=""/></div>
          <dl>
            <dt><img src="${base }/default/style/images/tel.png" alt=""/></dt>
            <dd>电话：+86 755 -  8899 9996<br/>
              邮箱：dst@dstgroup.com.cn<br/>
              地址：深圳市南山高新区粤兴大道9号</dd>
          </dl>
          <ul class="icolist">
            <li style="padding:0 31px 0 0;"><a href="#"><span class="listico1"></span>新浪</a></li>
            <li><a href="#"><span class="listico2"></span>腾讯</a></li>
            <li style="width:107px;"><a href="#"><span class="listico3"></span>QQ联系</a></li>
            <li><a href="#"><span class="listico4"></span> 微信</a></li>
          </ul>
        </div>
        <div class="rightMessage">
          <div class="title"><img src="${base }/default/style/images/Messagetitle.png" alt=""/></div>
          <form name="form1" method="post" action="">
            <ul>
              <li>
                <textarea name="textarea" id="textarea" cols="45" rows="5">内容</textarea>
              </li>
              <li>
                <input name="textfield" type="text" class="in" id="textfield" style="width:153px; margin:0 10px 0 0;" value="称呼">
                <input class="in" style="width:153px;" type="text" name="textfield" id="textfield" value="电话">
              </li>
               <li>
                <input class="in" type="text" name="textfield" id="textfield" value="邮箱">
              </li>
              <li><input class="Submit" type="submit" name="button" id="button" value="提　交"></li>
            </ul>
          </form>
        </div>
      </div>
      
      <div class="footer">
      <div class="footerbody"> <a href="#" class="footerShare"><img src="${base }/default/style/images/Share.png" alt=""></a>
        <div class="footermenu"><a href="#">关于德士特</a><a href="#">新闻动态</a><a href="#">联系我们</a><a href="#">产权声明</a></div>
        <img class="footerlogo" src="${base }/default/style/images/footerlogo.png" alt=""/>DST 粤ICP备14058502号</div>
    </div>
      
    </div>
    </div>
    
    <div>
    
</div>
</body>
</html>
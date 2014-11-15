<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit">
<jsp:include page="common/commonHead.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${base}/default/js/control/video/video-js.css" />
<link rel="stylesheet" type="text/css" href="${base}/default/js/control/fullPage/jquery.fullPage.css" />
<script type="text/javascript"  src="${base }/default/js/module/hover.js"></script>
<script type="text/javascript" src="${base}/default/js/control/video/video.js" ></script>
<script type="text/javascript" src="${base}/default/js/control/jquery.easings.min.js" ></script>
<script type="text/javascript" src="${base}/default/js/control/jquery.lazyload.js" ></script>
<script type="text/javascript" src="${base}/default/js/control/fullPage/jquery.fullPage.min.js" ></script>
<style>
	#section1 .fp-controlArrow{display:none;}
</style>
<script type="text/javascript" >
	videojs.options.flash.swf = "${base}/default/js/control/video/video-js.swf";
	var mgheight = 0;
	$(document).ready(function(){
		 $('div.section img').lazyload({
	         threshold: 200,
	         data_attribute: 'src'
	     });
		 //setTimeout(animatesection,2000);
		//setTimeout(showitem,1000);
		$(".animation-mark").hide();
		$("#section1 .animation-mark").show().addClass("animated");
		 $('#boxwarp').fullpage({
				anchors: ['page1', 'page2', 'page3', 'page4', 'page5'],
				navigation: true,
				navigationPosition: 'left',
				easing :'easeInOutQuart',
				onLeave:function(index,nextIndex,direction ){
					if(index==5){
						$("#boxwarp").css("margin-top","0");
						$("#boxwarp").css("transition-duration","0");
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
			        	 if(mgheight>0)
			        	 	$("#boxwarp").trans({"margin-top":"-"+mgheight+"px","transition-duration":"0.5s"});
			         }
			         if(index==4){
			        	 //$("#section4").find("img.pgymove").trans({"margin-left":"500px","transition-duration":"2s"});
			         }
			         if(index==1){
			        	 $("#boxwarp").css("top","0");
			         }
			        // clearInterval(autoPlay);
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
			 //return;
					playSlider(_autoPlayIndex + 1);
					
					_autoPlayIndex = (_autoPlayIndex+1)>=maxPlay?0:(_autoPlayIndex+1);
				}, 8000);
		 
		 $("#contro a.up").click(function(){
			 $.fn.fullpage.moveSectionUp();
			});
			
		$("#contro a.down").click(function(){
			$.fn.fullpage.moveSectionDown();
		});
		
		
		imgSize(winWidth,winHeight);
		$("#flashdiv").height(winHeight);
		$("#boxwarp .header").css("position","relative");
		if(winHeight>(575+40)){
			$("div .homemenu").css("padding-top",(winHeight-615)/2).css("padding-bottom",(winHeight-615)/2);
		}else{
			mgheight = 615+60-winHeight;
			$("div .homemenu").css("padding","30px 0");
		}
		
		$(".bannerico a").click(function(){	
			var key = $(this).attr("key")
			playSlider(key);
			
		});
		
		$("#section1").find("div[name='bannertxtdiv']").css("right",((winWidth-1024)/2+30)+"px");
		if(winHeight>900){
			$("#section1").find("div[name='bannertxtdiv']").css("top","100px");
		}
		$("div.info").css("padding-left",((winWidth-1280)/2+200)+"px");
		
		$("#section1").find("div[name='flashdiv']").height(winHeight).width(winWidth);
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
	
	var curcolor = 0;
	function animatesection(){
		if(curcolor==0){
			$("#bgimg").attr("src","${base}/default/style/images/banner1.jpg");
			curcolor = 1;
		}else{
			$("#bgimg").attr("src","${base}/default/style/images/banner.jpg");
			curcolor = 0;
		}
		
		
		setTimeout(animatesection,2000);
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
	
	 var winHeight = $(window).height(),winWidth = $(window).width();

    var imgSize = function(winWidth,winHeight){
        var percent = winWidth/2000,winPercent = winWidth/winHeight;
       
           // $("#section3 img.Circleimg").each(function(i,item){
           // 	$(item).width(percent*$(item).width());
          //  });
       

    }
	
</script>
<title>首页</title>
</head>
<body>
<div id="boxwarp">
 
<jsp:include page="common/top.jsp"></jsp:include>
  
  <div style="display: none;" class="pop-bg"></div>
	<div class="pop-wrap" style="display: none;">
  <div class="close" onclick="hidevideo();"></div>
  <div>
   <!--  <video id="example_video_1" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="none"
		      data-setup="{}" width="838" height="350">
			    <source src="http://www.51zhiye.com/images/zhiyewang/51wzsy.flv" type='video/flv' />	  
			  </video> -->
	 <embed type="application/x-shockwave-flash" 
	 width="858" height="350" src="http://player.youku.com/player.php/sid/XMzI5MzEwODQ4/v.swf" 
	 allowfullscreen="true" quality="high" allowscriptaccess="always" align="middle"></embed>
			  
  </div>
</div>
  
    
  <div id="section1" class="section">
  <div class="slide" id="slider1" style="cursor: pointer;">
	    <div class="banner" style="height: 100%;margin: 0;padding: 0;background-color: #F1F1F1F1;">
	    <div name="bannertxtdiv" class="bannertxt animation-mark bounceInRight" style="position:absolute;padding:0;top:30px;right:150px;">
	    <dl><dd><img src="${base }/default/style/images/banntxt.png" alt=""/><h3>智能空气监测仪</h3><h4>看的见 才安全</h4></dd>
	    <dd><a href="#">了解更多 ></a><a href="javascript:void(0)" onclick="showvideo()"　class="Video">观看影片</a></dd></dl>
	    </div>
	   <div name="flashdiv" style="z-index:-1;">
	    <object type="application/x-shockwave-flash" id="flashcontent" name="flashcontent" 
	    data="${base }/default/style/01.swf" width="100%" height="100%" 
	    style="z-index:-1;visibility: visible; width: 100%; left: auto; margin-top:-99px;margin-left: 0px; top: auto; padding-bottom: 0px;">
	    <param name="movie" value="${base }/default/style/01.swf">
	    <param name="quality" value="high">
	    <param name="scale" value="noscale">
	    <param name="wmode" value="transparent" />
	    <param name="allowscriptaccess" value="always">
	    <param name="bgcolor" value="#F1F1F1F1">
	    <param name="flashvars" value="siteXML=xml/site.xml"></object>
	  </div>
	    
	    </div>
    </div>
     <div class="slide" id="slider2" style="cursor: pointer;">
   
     <div class="banner">
	   
	    <div name="bannertxtdiv" class="bannertxt animation-mark bounceInRight" style="position:absolute;padding:0;top:30px;right:150px;">
	    <dl><dd><img src="${base }/default/style/images/banntxt.png" alt=""/><h3>智能空气监测仪</h3><h4>看的见 才安全</h4></dd>
	    <dd><a href="#">了解更多 ></a><a href="javascript:void(0)" onclick="showvideo()"　class="Video">观看影片</a></dd></dl>
	    </div>
	   <div name="flashdiv" style="z-index:-1;">
	    <object type="application/x-shockwave-flash" id="flashcontent" name="flashcontent" 
	    data="${base }/default/style/01.swf" width="100%" height="100%" 
	    style="z-index:-1;visibility: visible; width: 100%; left: auto; margin-top:-99px;margin-left: 0px; top: auto; padding-bottom: 0px;">
	    <param name="movie" value="${base }/default/style/01.swf">
	    <param name="quality" value="high">
	    <param name="scale" value="noscale">
	    <param name="wmode" value="transparent" />
	    <param name="allowscriptaccess" value="always">
	    <param name="bgcolor" value="#F1F1F1F1">
	    <param name="flashvars" value="siteXML=xml/site.xml"></object>
	  </div>
	     
	    </div>
    </div>
    <div class="slide" id="slider3" style="cursor: pointer;">
   
    <div class="banner">
	    <div name="bannertxtdiv" class="bannertxt animation-mark bounceInRight" style="position:absolute;padding:0;top:30px;right:150px;">
	    <dl><dd><img src="${base }/default/style/images/banntxt.png" alt=""/><h3>智能空气监测仪</h3><h4>看的见 才安全</h4></dd>
	    <dd><a href="#">了解更多 ></a><a href="javascript:void(0)" onclick="showvideo()"　class="Video">观看影片</a></dd></dl>
	    </div>
	   <div name="flashdiv" style="z-index:-1;">
	    <object type="application/x-shockwave-flash" id="flashcontent" name="flashcontent" 
	    data="${base }/default/style/01.swf" width="100%" height="100%" 
	    style="z-index:-1;visibility: visible; width: 100%; left: auto; margin-top:-99px;margin-left: 0px; top: auto; padding-bottom: 0px;">
	    <param name="movie" value="${base }/default/style/01.swf">
	    <param name="quality" value="high">
	    <param name="scale" value="noscale">
	    <param name="wmode" value="transparent" />
	    <param name="allowscriptaccess" value="always">
	    <param name="bgcolor" value="#F1F1F1F1">
	    <param name="flashvars" value="siteXML=xml/site.xml"></object>
	  </div>
	    
	    </div>
    </div> 
     <div>
    	    <ul class="bannerico" style="bottom:125px;">
    	    <li><a key="1" class="now" href="#"><span>1</span></a></li><li>
    	    <a key="2" href="#" ><span>2</span></a></li><li><a key="3" href="#"><span>3</span></a></li></ul>
    
    </div> 
    
  </div>
  <div id="section2" style="border-bottom:1px solid #FFF;" class="section">
  <img  class="bgimg" src="${base }/default/style/images/bg2.jpg" alt="">
    <div class="pagebody">
    <div class="pageleft"><img src="${base }/default/style/images/newhome/title7.png" alt=""/></div>
    <div class="pageright">
    <h3 class="pagetitle">六大核心技术</h3>
    <div class="Tab">
<ul id=tags>
<li class="selectTag">
<a onmouseover="selectTag('tagContent0',this)"  href="javascript:void(0)" title="微生物技术">
<img class="animation-mark rollIn"  style="margin-left:-15px;margin-top:-25px;animation-delay:0.5s;-webkit-animation-delay:0.5s;" src="${base }/default/style/images/newhome/title1.png" alt="微生物技术"/></a></li>
<li ><a onmouseover="selectTag('tagContent1',this)"   href="javascript:void(0)" title="低温等离子">
<img  class="animation-mark rollIn" style="margin-left:-10px;margin-top:-25px;animation-delay:0.7s;-webkit-animation-delay:0.7s;" src="${base }/default/style/images/newhome/title2.png" alt="低温等离子"/>
</a></li>
<li ><a onmouseover="selectTag('tagContent2',this)"  href="javascript:void(0)" title="负离子技术">
<img  class="animation-mark rollIn" style="margin-left:-15px;margin-top:-25px;animation-delay:0.9s;-webkit-animation-delay:0.9s;" src="${base }/default/style/images/newhome/title3.png" alt="负离子技术"/> </a></li>
<li ><a onmouseover="selectTag('tagContent3',this)"  href="javascript:void(0)" title="光触媒技术">
<img  class="animation-mark rollIn" style="margin-left:-15px;margin-top:-25px;animation-delay:1.1s;-webkit-animation-delay:1.1s;" src="${base }/default/style/images/newhome/title4.png" alt="光触媒技术"/></a></li>
<li ><a onmouseover="selectTag('tagContent4',this)"  href="javascript:void(0)" title="智能新风系统">
<img  class="animation-mark rollIn" style="margin-left:-15px;margin-top:-25px;animation-delay:1.3s;-webkit-animation-delay:1.3s;" src="${base }/default/style/images/newhome/title5.png" alt="智能新风系统"/></a></li>
<li ><a onmouseover="selectTag('tagContent5',this)"  href="javascript:void(0)" title="分布式加湿">
<img  class="animation-mark rollIn" style="margin-left:-15px;margin-top:-25px;animation-delay:1.5s;-webkit-animation-delay:1.5s;" src="${base }/default/style/images/newhome/title6.png" alt="分布式加湿"/></a></li>
</ul>
</div>
<div id="tagContent"> 
<div class="tagContent" id="tagContent0">
<img class="pageico" src="${base }/default/style/images/pageico.png" alt="三角形"/>
<h3 class="title1">微生物（生物酶）技术</h3>
生物酶净化技术的基础学科依据是通过酶的作用使污染气体如甲醛、笨、TVOC及其他异味气体得到充分分解</div>
<div class="tagContent" id="tagContent1" style="display:none;">
<img class="pageico" src="${base }/default/style/images/pageico.png" alt="三角形"/>
<h3 class="title1">低温等离子</h3>稳定的等离子体整体显电中性，其内部主要成分为电子、正离子、负离子、激活态原子或分子、自由基，其中自由基具有极强活性，能够迅速分解甲醛、笨、TVOC及其他异味气体。_清华大学环境科学与工程研究院院长 工程院院士 郝吉明
</div>
<div class="tagContent" id="tagContent2" style="display:none;">
<img class="pageico" src="${base }/default/style/images/pageico.png" alt="三角形"/>
<h3 class="title1">净离子技术</h3>DST净离子技术，通过放电产生纯净负离子，能够消除正电荷，增加空气新鲜度；沉降空气中的PM2.5
</div>
<div class="tagContent" id="tagContent3" style="display:none;">
<img class="pageico" src="${base }/default/style/images/pageico.png" alt="三角形"/>
<h3 class="title1">光触媒技术</h3>光触媒通过紫外光激发，能够把水分子H2O分解为活性氧原子和OH基，活性氧和OH基能够把甲醛、笨、TVOC及其他异味气体分解为水和二氧化碳——华中科技大学教授、博士生导师，华中科技大学环境科学研究所所长。
</div>
<div class="tagContent" id="tagContent4" style="display:none;">
<img class="pageico" src="${base }/default/style/images/pageico.png" alt="三角形"/>
<h3 class="title1">智能新风系统</h3>领先的IFD技术(除pm0.1)+光触媒(除异味)+加湿/除湿+负离子
</div>
<div class="tagContent" id="tagContent5" style="display:none;">
<img class="pageico" src="${base }/default/style/images/pageico.png" alt="三角形"/>
<h3 class="title1">分布式加湿</h3>多点分布式均匀加湿，整个房间都湿润舒适
</div>
</div>
    </div>
     </div>
  </div>
  <div id="section3" style=" border-bottom:1px solid #FFF;" class="section">
  <img  class="bgimg" src="${base }/default/style/images/bg3.jpg" alt="">
        
     <div class="Circlebody">
    <img src="${base }/default/style/images/proimg1.png" class="Circleimg proimg1" alt=""/>
    <img src="${base }/default/style/images/proimg2.png" class="Circleimg proimg2" alt=""/>
    <img src="${base }/default/style/images/proimg3.png" class="Circleimg proimg3" alt=""/>
    <img src="${base }/default/style/images/proimg4.png" class="Circleimg proimg4" alt=""/>
    <img src="${base }/default/style/images/proimg5.png" class="Circleimg proimg5" alt=""/>
    <img src="${base }/default/style/images/proimg6.png" class="Circleimg proimg6" alt=""/>
    <img src="${base }/default/style/images/proimg7.png" class="Circleimg proimg7" alt=""/>
    <img src="${base }/default/style/images/proimg8.png" class="Circleimg proimg8" alt=""/>
    <div style="padding:100px;">
    <div class="Circlebinfo">
    <ul>
    <li class="txt1"><span>消毒机</span></li>
    <li class="txt2"><span>加湿机</span></li>
    <li class="txt3"><span>空调</span></li>
    <li class="txt4"><span>负离子</span></li>
    <li class="txt5"><span>智能加湿</span></li>
    <li class="txt6"><span>智能新风</span></li>
    <li class="txt7"><span>治理服务</span></li>
    <li class="txt8"><span>空气侠</span></li>
    </ul>
    <dl><dt><img class="centerimg" src="${base }/default/style/images/pro.jpg" alt=""/></dt><dd>空气眼</dd></dl>
    </div>
    </div>
    </div>
    
    
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
    <div class="homebody">
      <div style="height:486px;">
      <div class="centerbody bounceInUp animation-mark" style="display:none;">
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
              地址：深圳市南山高新区粤兴大道9号华中科技大学深圳产学研基地B座9楼</dd>
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
</div>
</body>
</html>
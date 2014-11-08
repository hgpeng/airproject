<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit">
<jsp:include page="common/commonHead.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${base }/default/style/product.css"/>
<link rel="stylesheet" type="text/css" href="${base}/default/js/control/video/video-js.css" />
<link rel="stylesheet" type="text/css" href="${base}/default/js/control/fullPage/jquery.fullPage.css" />
<script type="text/javascript" src="${base}/default/js/control/video/video.js" ></script>
<script type="text/javascript" src="${base}/default/js/control/jquery.easings.min.js" ></script>
<script type="text/javascript" src="${base}/default/js/control/jquery.lazyload.js" ></script>
<script type="text/javascript" src="${base}/default/js/control/fullPage/jquery.fullPage.min.js" ></script>
<title>产品详情</title>
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
			 anchors: ['page1', 'page2', 'page3', 'page4', 'page5', 'page6', 'page7'],
				navigation: true,
				navigationPosition: 'left',
				slidesNavigation:true,
				easing :'easeInOutQuart',
				onLeave:function(index,nextIndex,direction ){
					if(index==7){
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
			         if(index==7){
			        	 if(mgheight>0)
			        	 	$("#boxwarp").trans({"margin-top":"-"+mgheight+"px","transition-duration":"0.5s"});
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
		//$("#boxwarp .header").css("position","relative");
		if(winHeight>(575+40)){
			$("div .homemenu").css("padding-top",(winHeight-615)/2).css("padding-bottom",(winHeight-615)/2);
		}else{
			mgheight = 615+60-winHeight;
			$("div .homemenu").css("padding","30px 0");
		}
	})
	
	function showvideo(){
		$("div.pop-bg").show();
		$("div.pop-wrap").show();
	}
	
	function hidevideo(){
		$("div.pop-bg").hide();
		$("div.pop-wrap").hide();
	}
	
	 var winHeight = $(window).height(),winWidth = $(window).width();

    var imgSize = function(winWidth,winHeight){
        var percent = winWidth/2000,winPercent = winWidth/winHeight;
       
           // $("#section3 img.Circleimg").each(function(i,item){
           // 	$(item).width(percent*$(item).width());
          //  });
       

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
</head>
<body>
<div id="boxwarp">
 
  <jsp:include page="common/top.jsp"></jsp:include>
  
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
  
    
  <div id="section1" class="section">
	    <div class="banner">
	    	<img class="bgimg" src="${base}/default/style/images/product/product_01.jpg" alt="" style="top:89px">
            <div class="product-img">
            	<img src="${base}/default/style/images/product/products_03.png" class="animation-mark flipInY"/>
            </div>
	    	<div style="display:none;" class="products-one animation-mark bounceInRight">
	    		<dl>
                	<dd>
                    	<img src="${base}/default/style/images/product/products_01.png" alt=""/>
                    	<h3>健康抑菌 全智能空气净化器</h3>
                        <h4>未呼吸 已净化</h4>
                    </dd>
	    			<dd><a href="javascript:void(0)" class="product-video">观看影片</a></dd>
                </dl>
	    	</div>
	    </div>
  </div>
  <div id="section2" style="border-bottom:1px solid #FFF;" class="section">
  	<div class="products-two">	
  		 <div class="slide" id="slider1" style="cursor: pointer;">
  		 	<img src="${base}/default/style/images/product/product_02.jpg"/>
                        	<div class="two-wenzi">
                        		<p><img src="${base}/default/style/images/product/products_04.png" class="animation-mark stretchLeft"/></p>
                        		<p>简约即是美</p>
                        		<p>完美融合现代家居</p>
                        	</div>
  		</div>
  		 <div class="slide" id="slider2" style="cursor: pointer;">
  		 	<img src="${base}/default/style/images/product/product_02.jpg"/>
                        	<div class="two-wenzi">
                        		<p><img src="${base}/default/style/images/product/products_04.png" class="animation-mark stretchLeft"/></p>
                        		<p>简约即是美</p>
                        		<p>完美融合现代家居</p>
                        	</div>
  		</div>
  		 <div class="slide" id="slider3" style="cursor: pointer;">
  		 <img src="${base}/default/style/images/product/product_02.jpg"/>
                        	<div class="two-wenzi">
                        		<p><img src="${base}/default/style/images/product/products_04.png" class="animation-mark stretchLeft"/></p>
                        		<p>简约即是美</p>
                        		<p>完美融合现代家居</p>
                        	</div>
  		</div>   
  	</div>
  </div>
  <div id="section3" style=" border-bottom:1px solid #FFF;" class="section">
  	<div class="products-two">
    	<div class="mainbody section3-warp">
        	<div class="section3-wenzi">
                <p class="section3-wenzi01"><img src="${base}/default/style/images/product/products_07.png"/><span class="animation-mark stretchRight">APP智能操控</span></p>
                <p>APP远程操控、云平台智能服务，实时记录PM2.5、</p>
                <p>二氧化碳、温度与湿度。</p>
            </div>
            <div class="section3-box">
            	<ul class="section3-ul">
                	<li class="list_01 demo-test animation-mark fadeIn">云平台<br/>智能服务</li>
                    <li class="list_02 demo-test animation-mark fadeIn">简单易用</li>
                    <li class="list_03 demo-test animation-mark fadeIn">PM2.5</li>
                    <li class="list_04 demo-test animation-mark fadeIn">手机远程<br/>操控</li>
                    <li class="list_05 demo-test animation-mark fadeIn">温度/湿度<br/>二氧化碳</li>
                </ul>
            </div>
        </div>
    </div>
  </div>
  <div id="section4" class="section">
  	<div class="products-two">
    	<div class="mainbody section3-warp">
        	<div class="section3-wenzi">
                <p class="section4-wenzi01"><img src="${base}/default/style/images/product/products_08.png"/><span class="animation-mark stretchRight">强劲多核风机 高效复合滤网</span></p>
                <p>滤网采用的是家用空气净化器中最常用的HEPA和活性炭技术</p>
                <p>其能有效过滤小于0.1微米的颗粒污染物</p>
            </div>
            <div class="section4-box">
            	
            </div>
        </div>
    </div>
  </div>
  <div id="section5" class="section">
  	<div class="products-five">
    	<div class="mainbody section5-warp">
        	<div class="section5-wenzi">
                <p class="section5-wenzi01"><img src="${base}/default/style/images/product/products_09.png"/><span class="animation-mark stretchRight">避免二次污染</span></p>
                <p>基于独有的智能空气感测核心技术，PM2.5精准显示功能，实时了解</p>
                <p>空气质量和净化效果，当PM2.5数值未能明显持续下降时，则意味着</p>
                <p>滤网需要更换，能更精准的掌握滤网更换的时间点。</p>
                
            </div>
            <div class="section5-box">
            	<img src="${base}/default/style/images/product/products_10.png" class="animation-mark stretchLeft"/>
            </div>
            
        </div>
    </div>
  </div>
  <div id="section6" class="section">
  	<div class="products-two">
    	<div class="mainbody section6-warp">
        	<ul class="section6-ul ul-01">
        		<li>产品名称</li>
        		<li>产品型号</li>
        		<li>颜色</li>
        		<li>尺寸和重量</li>
        	</ul>
        	<ul class="section6-ul ul-02">
        		<li>智能空气净化器</li>
        		<li>AC450S/AC320S/AC180S</li>
        		<li>白色</li>
        		<li>高度：00 cm<br />宽度：00 cm<br />厚度：00 cm<br />重量：约 000g</li>
        	</ul>
        	<div class="section6-img">
        		<img src="${base}/default/style/images/product/products_11.png"/>
        		<p><span style="width: 148px; padding-right: 40px; text-align: center;">00cm</span ><span style="width:48px; text-align: center;">00cm</span></p>
        	</div>
        </div>
    </div>
  </div>
  <div id="section7" style=" height:inherit; background:#FFF;" class="section">
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
</body>
</html>
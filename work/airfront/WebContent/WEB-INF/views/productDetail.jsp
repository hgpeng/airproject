<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		var ancary = [];
		for(var m=1;m<=$("div.section").length;m++){
			ancary.push('page'+m);
		}
		
		 $('#boxwarp').fullpage({
				anchors: ancary,
				navigation: true,
				navigationPosition: 'left',
				easing :'easeInOutQuart',
				onLeave:function(index,nextIndex,direction ){
					if(index==ancary.length){
						$("#boxwarp").css("margin-top","0");
						$("#boxwarp").css("transition-duration","0");
					}
				},
				afterLoad: function(anchorLink, index){
					if(index==ancary.length){
			        	 if(mgheight>0)
			        	 	$("#boxwarp").trans({"margin-top":"-"+mgheight+"px","transition-duration":"0.5s"});
			         }	
			         if(index==1){
			        	 $("#boxwarp").css("top","0");
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
		
		$("div[name='flashdiv']").height(winHeight).width(winWidth);
	})

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
    
    function showDetail(id){
    	if(id=='0')return;
    	window.location.href = base+"/productDetail?id="+id;
    }
	
</script>
<title>首页</title>
</head>
<body>
<div id="boxwarp">
 
<jsp:include page="common/top.jsp"></jsp:include>
  
   <c:forEach items="${prelist }" var="item"  varStatus="status">
   		<div id="section${status.index+1}" class="section">
   		   <div style="width:100%;height:100%;" <c:if test="${! empty item.detail }">onclick="showDetail('${item.detail}')"</c:if> >
   		
   			${item.html}
   			</div>
   		</div>
   		
   </c:forEach>

  <div id="section${prelength+1 }" style=" height:inherit; background:#FFF;" class="section">
    <div class="homemenu">
      <ul>
        <li><a href="#">了解德士特</a></li>
        <li><a href="#">解决方案</a></li>
        <li><a href="#">治理服务</a></li>
      </ul>
    </div>
    <div class="homebody">
      <div style="height:486px;">
      <div class="centerbody bounceInUp animation-mark" style="display:block;">
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
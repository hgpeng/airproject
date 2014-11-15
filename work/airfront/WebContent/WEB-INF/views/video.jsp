<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit">
<jsp:include page="common/commonHead.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${base }/default/style/other.css"/>
<link rel="stylesheet" type="text/css" href="${base }/default/style/product-show.css"/>
<title>视频专区</title>
<style>
	.activebar{margin-top:-3px;background:none repeat scroll 0 0 #47a1de;height:8px;width:75px;position:absolute;}
</style>
<script>
	var type = "${type}";
	var winHeight = $(window).height(),winWidth = $(window).width();
	$(document).ready(function(){
		//$("#menu_active_bar").css("left",((winWidth-1200)/2+10)+"px"); 
		$("div.header").hide();
		$("#contro").show();
		
		var kint = parseInt(type);
		$("#menu_active_bar").trans({"left":(kint*125+15)+"px","transition-duration":"0.5s"})
		
	});
	
	function navmouseover(obj){
		var key = $(obj).attr("key");
		var kint = parseInt(key);
		$("#menu_active_bar").trans({"left":(kint*125+15)+"px","transition-duration":"0.5s"})
	}
	
</script>
</head>
<body>
<div id="boxwarp" class="scrollbox">
	    <jsp:include page="common/top.jsp"></jsp:include>
	<!------内容------->
<!------内容------->

<div class="contact-line font18">
     <div id="newsnav" class="w1200" style="position:relative;">
     <a onclick="openurl('${base}/news?type=0')" onmouseover="navmouseover(this)" key="0" href="javascript:void(0)">企业新闻</a> 
     <a onclick="openurl('${base}/news?type=1')" onmouseover="navmouseover(this)" key="1" href="javascript:void(0)">媒体报道</a>
     <a onmouseover="navmouseover(this)" key="2" href="#">视频专区</a>
      <div id="menu_active_bar" class="activebar" style="left: 15px;">
                    </div>
     </div>
    
</div>



<div class="w1200 pt20 pb40">
     
     <div class="combox">
         
          <div class="video">
               <ul>
                   <li>
                       <a href="#">
                          <div class="videoin">
                               <div class="video-hover"></div>
                               <img src="${base}/default/style/images/other/news-pic01.jpg" width="320" height="180">
                          </div>
                          <p><span class="pl20">APP演示视频</span>   下载</p>
                       </a>
                   </li>
                   
                   <li>
                       <a href="#">
                          <div class="videoin">
                               <div class="video-hover"></div>
                               <img src="${base}/default/style/images/other/news-pic01.jpg" width="320" height="180">
                          </div>
                          <p><span class="pl20">APP演示视频</span>   下载</p>
                       </a>
                   </li>
                   
                   
                    <li>
                       <a href="#">
                          <div class="videoin">
                               <div class="video-hover"></div>
                               <img src="${base}/default/style/images/other/news-pic01.jpg" width="320" height="180">
                          </div>
                          <p><span class="pl20">APP演示视频</span>   下载</p>
                       </a>
                   </li>
                   
                   
                    <li>
                       <a href="#">
                          <div class="videoin">
                               <div class="video-hover"></div>
                               <img src="${base}/default/style/images/other/news-pic01.jpg" width="320" height="180">
                          </div>
                          <p><span class="pl20">APP演示视频</span>   下载</p>
                       </a>
                   </li>
                   
                   
                   
                    <li>
                       <a href="#">
                          <div class="videoin">
                               <div class="video-hover"></div>
                               <img src="${base}/default/style/images/other/news-pic01.jpg" width="320" height="180">
                          </div>
                          <p><span class="pl20">APP演示视频</span>   下载</p>
                       </a>
                   </li>
                   
                   
                    <li>
                       <a href="#">
                          <div class="videoin">
                               <div class="video-hover"></div>
                               <img src="${base}/default/style/images/other/news-pic01.jpg" width="320" height="180">
                          </div>
                          <p><span class="pl20">APP演示视频</span>   下载</p>
                       </a>
                   </li>
                   
                   
               </ul>
          </div>
     
    </div>
     
     <div class="combox mb30"><a style="color:#fff;" class="news-more fr" href="#">+ 更多</a></div>

</div>

<!------版权------->      
	    <jsp:include page="common/footer.jsp"></jsp:include>
  

</div>
</body>
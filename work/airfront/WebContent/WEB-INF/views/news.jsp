<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit">
<jsp:include page="common/commonHead.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${base }/default/style/other.css"/>
<link rel="stylesheet" type="text/css" href="${base }/default/style/product-show.css"/>
<title>公司新闻</title>
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
     <a onmouseover="navmouseover(this)" key="0" href="#">企业新闻</a> 
     <a onmouseover="navmouseover(this)" key="1" href="#">媒体报道</a>
     <a onmouseover="navmouseover(this)" key="2" href="#">视频专区</a>
      <div id="menu_active_bar" class="activebar" style="left: 15px;">
                    </div>
     </div>
    
</div>



<div class="w1200 pt20 pb40">
     
     <div class="news-list">
          <ul>
              <li>
                 <a href="#">
                  <div class="newsin">
                       <img src="${base}/default/style/images/other/news-pic01.jpg">
                       <div class="newinbg">
                            <div class="combox">绿色时代与振业城别墅区签定服务协议，同时对十
五套精装修别墅进行全面空气净化处理，绿色时代
以五大技术，十项流程，强效的产品与优质服务赢
得了别墅区业主的高度认可..</div>
                       <div class="newsinadd"></div>
                       </div>
                  </div>
                  
                  <div class="combox ml10 mt10">
                       <h1 class="nobold font20" style="color:#333;">健康生活 从家开始</h1>
                       <p class="blue">2014-09-28 10:30 25</p>
                  </div>
                  </a>
              </li>
              
              
              <li>
                 <a href="#">
                  <div class="newsin">
                       <img src="${base}/default/style/images/other/news-pic01.jpg">
                       <div class="newinbg">
                            <div class="combox">绿色时代与振业城别墅区签定服务协议，同时对十
五套精装修别墅进行全面空气净化处理，绿色时代
以五大技术，十项流程，强效的产品与优质服务赢
得了别墅区业主的高度认可..</div>
                       <div class="newsinadd"></div>
                       </div>
                  </div>
                  
                  <div class="combox ml10 mt10">
                       <h1 class="nobold font20" style="color:#333;">健康生活 从家开始</h1>
                       <p class="blue">2014-09-28 10:30 25</p>
                  </div>
                  </a>
              </li>
              
              <li>
                 <a href="#">
                  <div class="newsin">
                       <img src="${base}/default/style/images/other/news-pic01.jpg">
                       <div class="newinbg">
                            <div class="combox">绿色时代与振业城别墅区签定服务协议，同时对十
五套精装修别墅进行全面空气净化处理，绿色时代
以五大技术，十项流程，强效的产品与优质服务赢
得了别墅区业主的高度认可..</div>
                       <div class="newsinadd"></div>
                       </div>
                  </div>
                  
                  <div class="combox ml10 mt10">
                       <h1 class="nobold font20" style="color:#333;">健康生活 从家开始</h1>
                       <p class="blue">2014-09-28 10:30 25</p>
                  </div>
                  </a>
              </li>
              
              <li>
                 <a href="#">
                  <div class="newsin">
                       <img src="${base}/default/style/images/other/news-pic01.jpg">
                       <div class="newinbg">
                            <div class="combox">绿色时代与振业城别墅区签定服务协议，同时对十
五套精装修别墅进行全面空气净化处理，绿色时代
以五大技术，十项流程，强效的产品与优质服务赢
得了别墅区业主的高度认可..</div>
                       <div class="newsinadd"></div>
                       </div>
                  </div>
                  
                  <div class="combox ml10 mt10">
                       <h1 class="nobold font20" style="color:#333;">健康生活 从家开始</h1>
                       <p class="blue">2014-09-28 10:30 25</p>
                  </div>
                  </a>
              </li>
              
              <li>
                 <a href="#">
                  <div class="newsin">
                       <img src="${base}/default/style/images/other/news-pic01.jpg">
                       <div class="newinbg">
                            <div class="combox">绿色时代与振业城别墅区签定服务协议，同时对十
五套精装修别墅进行全面空气净化处理，绿色时代
以五大技术，十项流程，强效的产品与优质服务赢
得了别墅区业主的高度认可..</div>
                       <div class="newsinadd"></div>
                       </div>
                  </div>
                  
                  <div class="combox ml10 mt10">
                       <h1 class="nobold font20" style="color:#333;">DST室内空气环境治理 走进社区</h1>
                       <p class="blue">2014-09-28 10:30 25</p>
                  </div>
                  </a>
              </li>
              
              
              <li>
                 <a href="#">
                  <div class="newsin">
                       <img src="${base}/default/style/images/other/news-pic01.jpg">
                       <div class="newinbg">
                            <div class="combox">绿色时代与振业城别墅区签定服务协议，同时对十
五套精装修别墅进行全面空气净化处理，绿色时代
以五大技术，十项流程，强效的产品与优质服务赢
得了别墅区业主的高度认可..</div>
                       <div class="newsinadd"></div>
                       </div>
                  </div>
                  
                  <div class="combox ml10 mt10">
                       <h1 class="nobold font20" style="color:#333;">健康生活 从家开始</h1>
                       <p class="blue">2014-09-28 10:30 25</p>
                  </div>
                  </a>
              </li>
              
              
          </ul>
     </div>
     
     <div class="combox mb30"><a style="color:#fff;" class="news-more fr" href="#">+ 更多</a></div>

</div>

<!------版权------->      
	    <jsp:include page="common/footer.jsp"></jsp:include>
  

</div>
</body>
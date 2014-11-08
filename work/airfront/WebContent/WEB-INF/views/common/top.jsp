<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script type="text/javascript" >
    function showsearch(event){
    	$("#zhilico").hide();
    	$("#searchinp").show().addClass("animated");
    	event.stopPropagation();
    }
    
	function dosearch(event){
		event.stopPropagation();
	}
	
    $(document).click(function(){
    	$("#searchinp").removeClass("inpshow").addClass("inphide"); 
    	setTimeout(function(){
    		$("#searchinp").hide();
    		$("#searchinp").removeClass("animated").removeClass("inphide").addClass("inpshow");
    		$("#zhilico").show();
    	},1000);
    	
    });
</script>
  <div id="contro" style="display:none;">
    <div class="logobox "><a href="#"><img src="${base }/default/style/images/rightlogo.jpg" alt=""/></a></div>
    <div class="conbox ">
      <div class="arrow"><a class="up"></a></div>
      <div class="portfolio">
        <ul>
          <li><a href="${base }/index" class="now">概览</a></li>
          <li id="productli"><a href="${base }/productcenter">产品中心</a></li>
          <li><a href="${base }/solution">解决方案</a></li>
          <li><a href="${base }/greenService">治理服务</a></li>
          <li><a href="#">下载中心</a></li>
          <li><a href="#">在线商城</a></li>
          <li><a href="#">关于我们</a></li>
        </ul>
      </div>
      <div class="arrowbottom"><a class="down"></a></div>
    </div>
  </div>
    <div class="header">
      <div class="headerbody">
        <div class="headerright">
          <ul>
           <li ><input type="text" id="searchinp" onclick="dosearch(event)"　class="inpshow" style="width:90px;height:25px;display:none;"/></li>
            <li id="zlfwli"><a id="zhilico" href="${base }/greenService" style="" class="an">治理服务</a></li>
            <li><a href="javascript:void(0)" onclick="showsearch(event)"><img src="${base }/default/style/images/ico2.png" alt=""/></a></li>
            <li><a href="#"><img src="${base }/default/style/images/ico1.png" alt=""/></a></li>
          </ul>
          
        </div>
        <div class="logo"><img src="${base }/default/style/images/logo.png" alt=""/></div>
        <ul class="nav">
          <li><a href="${base }/index" class="now">概览</a></li>
          <li><a href="${base }/productcenter">产品中心</a></li>
          <li><a href="#">解决方案</a></li>
          <li><a href="#">下载中心</a></li>
          <li><a href="#">在线商城</a></li>
          <li><a href="#">关于德士特</a></li>
        </ul>
      </div>
  </div>
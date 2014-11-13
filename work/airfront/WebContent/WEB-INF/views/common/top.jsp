<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
        <c:choose>
        <c:when test="${page=='other'}">
        <li><a href="${base }/about" <c:if test="${pagename=='about' }">class="now"</c:if>>企业介绍</a></li>
          <li <c:if test="${pagename=='news' }">class="now"</c:if> ><a href="${base }/news">新闻报道</a></li>
          <li <c:if test="${pagename=='video' }">class="now"</c:if> ><a href="${base }/video">视频专区</a></li>
          <li><a href="${base }/download">下载中心</a></li>
          <li><a href="${base }/contact">联系我们</a></li>
        </c:when>
        <c:otherwise>
          <li><a href="${base }/index" class="now">概览</a></li>
          <li id="productli"><a href="${base }/productcenter">产品中心</a></li>
          <li><a href="${base }/solution">解决方案</a></li>
          <li><a href="${base }/greenService">治理服务</a></li>
          <li><a href="${base }/download">下载中心</a></li>
          <li><a href="${base }/online">在线商城</a></li>
          <li><a href="${base }/about">关于我们</a></li>
          <li><a href="${base }/about">加入我们</a></li>
        </c:otherwise>
         </c:choose>
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
          <li>
          	<a href="${base }/productcenter" class="two-nav">产品中心</a>
            <div class="two-menu">
            	<ul>
                	<li>
                    	<a href="#">
                    	<img src="${base}/default/style/images/product/products_14.png" />
                        <p>空气眼</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                    	<img src="${base}/default/style/images/product/products_15.png" />
                        <p>空气侠</p>
                        </a>
                    </li>
                </ul>
            </div>
          </li>
          
          <li><a href="${base }/solution">解决方案</a></li>
          <li><a href="${base }/download">下载中心</a></li>
          <li><a href="${base }/online">在线商城</a></li>
          <li><a href="${base }/about">关于德士特</a></li>
        </ul>
      </div>
  </div>
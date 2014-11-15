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
    <div class="logobox "></div>
      <c:if test="${page=='other'}">
     <a href="${base }/index" style="text-align:center; width:110px; display:block; margin-bottom: 1px;height:90px;line-height:90px;  background:#3c3c3c; font-size:20px;  color:#fff;">HOME	</a>
    </c:if>
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
          <li><a href="${base }/index" >概览</a></li>
          <li>
          	<a href="${base }/productcenter" class="<c:if test="${pagename=='productcenter' }">now</c:if>">产品中心</a>
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
          
          <li><a href="${base }/solution" <c:if test="${pagename=='solution' }">class="now"</c:if> >解决方案</a></li>
          <li><a href="${base }/download" <c:if test="${pagename=='download' }">class="now"</c:if> >下载中心</a></li>
          <li>
          <a href="${base }/online" <c:if test="${pagename=='online' }">class="now"</c:if> >在线商城</a>
          	<div class="two-menu">
            	<ul style="padding-left:500px">
                	<li>
                    	<a href="#" class="shop_01">
                    	<i></i>
                        <p>天猫旗舰店</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#" class="shop_02">
                    	<i></i>
                        <p>京东商城</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#" class="shop_03">
                    	<i></i>
                        <p>其他商城</p>
                        </a>
                    </li>
                </ul>
            </div>
          </li>
          <li><a href="${base }/about" <c:if test="${pagename=='about' }">class="now"</c:if> >关于德士特</a></li>
        </ul>
      </div>
  </div>
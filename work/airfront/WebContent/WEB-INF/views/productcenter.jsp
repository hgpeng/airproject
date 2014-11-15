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
<link rel="stylesheet" type="text/css" href="${base }/default/style/product-show.css"/>
<script type="text/javascript"  src="${base}/default/js/module/tags.js"></script>
<script type="text/javascript" src="${base}/default/js/control/superslider.js"></script>
<title>产品</title>
<script>
	$(document).ready(function(){
		/* setTimeout(function(){
			$("#productnav").trans({"margin-top":"0px","transition-duration":"0.7s"});
			$("#productnav").find("img").fadeIn();
		},500);
		$("#productli").find("a").attr("href","javascript:void(0)");
		$("#productli").click(function(){
			$("#productnav").trans({"margin-top":"0px","transition-duration":"0.7s"});
			$("#productnav").find("img").fadeOut();
			event.stopPropagation();
		}); */
		
		$("div.example4").slide({mainCell:".bd ul",autoPage:true,effect:"left",autoPlay:true,vis:8});
		$("div.btn-group").find("a.prevPage").css("left","0");
		$("div.btn-group").find("a.nextPage").css("right","0");
	});
	
	
	
</script>
</head>
<body>
<div id="boxwarp" class="scrollbox">
   <jsp:include page="common/top.jsp"></jsp:include>

    <div class="productshow-banner">
    	<div class="fullSlide">
		
			<div class="bd">
				<ul>
					<li _src="url(${base}/default/style/images/product/productshow_01.jpg)" style="background:#eeeeee center 0 no-repeat;"></li>
					<li _src="url(${base}/default/style/images/product/productshow_01.jpg)" style="background:#eeeeee center 0 no-repeat;"></li>
					<li _src="url(${base}/default/style/images/product/productshow_01.jpg)" style="background:#eeeeee center 0 no-repeat;"></li>
				</ul>
			</div>
		
			<div class="hd"><ul></ul></div>
            
		</div>
    </div>
    
    <div class="mainwarp">
    
    <div>
	  <div class="example4">
			
			<div class="bd sly">

            <ul class="product-nav big cfix" id="myTab2">
            	<c:forEach items="${bdlist }" var="item" varStatus="status">
            		 <li onmouseover="nTabs(this,${status.index});">
                    <a href="javascript:void(0)"><span class="demo-test">
                    <img src="${base}/images/${item.icon}" /></span>
                    <p>${item.name}</p></a>
                	</li>
            	</c:forEach>
            </ul>
            </div>
          
          	 <div class="controls btn-toolbar">
				<div class="btn-group">
					<a href="javascript:void(0)" class="prev btn prevPage"><i></i>上一页</a>
					<a href="javascript:void(0)" class="next btn nextPage">下一页<i></i></a>
				</div>
				
			</div>
          
        </div>
        <div class="pro-box">
        	<div class="pro-boxlist">
        	
        		<c:forEach items="${bdlist }" var="seriitem" varStatus="status">
        			<ul class="c" id="myTab2_Content${status.index}"  <c:if test="${status.index>0 }">style="display:none"</c:if> >
        				<c:forEach items="${prolist }" var="item" varStatus="status">
        				<c:if test="${item.templateId==seriitem.id }">
            			<li >
                    	<a class="newsin" href="${base }/productDetail?id=${item.id}">
                        	<img src="${base}/images/${item.mainPhoto}" />
                            <p>${item.name }</p>
                             <div class="newinbg">
                           
		                       <div class="newsinadd"></div>
		                       </div>
                        </a>
                    </li>
                    </c:if>
            		</c:forEach>
        			</ul>
        		</c:forEach>
        	
            	
              
            </div>
            <div class="pro-more">
            	<a href="#"><img src="${base}/default/style/images/product/product_10.jpg" /> 更多>></a>
            </div>
        </div>
    </div>
    
	
</div>

<div class="section">
    <div class="homemenu">
      <ul>
        <li><a href="#">了解德士特</a></li>
        <li><a href="#">解决方案</a></li>
        <li><a href="#">治理服务</a></li>
      </ul>
    </div>
    <div class="homebody">
      <div style="height:486px;">
      <div class="centerbody bounceInUp animation-mark">
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

</div>
<script type="text/javascript"  src="${base}/default/js/module/banner.js"></script>
<script type="text/javascript">
$(function($){

	// 占位符项目来填充列表的功能
	function populate(container, count, offset){
		var output = '';
		offset = isNaN(offset) ? 0 : offset;
		for(var i = 0; i<count; i++ ){
			output += '<li>'+(offset+i)+'</li>';
		}
		return $(output).appendTo(container);
	}

	// 填充列表项
	$('ul[data-items]').each(function(i,e){
		var items = parseInt($(e).data('items'), 10);
		populate(e, items);
	});
	
});
</script>
</body>
</html>
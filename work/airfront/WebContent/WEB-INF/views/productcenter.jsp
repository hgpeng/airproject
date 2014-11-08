<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
		setTimeout(function(){
			$("#productnav").trans({"margin-top":"0px","transition-duration":"0.7s"});
			$("#productnav").find("img").fadeIn();
		},500);
		$("#productli").find("a").attr("href","javascript:void(0)");
		$("#productli").click(function(){
			$("#productnav").trans({"margin-top":"0px","transition-duration":"0.7s"});
			$("#productnav").find("img").fadeOut();
			event.stopPropagation();
		});
		
		$("div.example4").slide({mainCell:".bd ul",autoPage:true,effect:"left",autoPlay:true,vis:7});
		
	});
	
	 $(document).click(function(){
		 $("#productnav").trans({"margin-top":"-200px","transition-duration":"0.7s"});
		 $("#productnav").find("img").fadeIn();
	 });
	
</script>
</head>
<body>
<div id="boxwarp" class="scrollbox">
   <jsp:include page="common/top.jsp"></jsp:include>
    <div id="productnav" style="margin-top:-200px;height:200px;width:100%;background:#FFFFFF;">
   		<div style="width:1024px;margin:0 auto;">
   		 <img style="padding:30px;" src="${base}/default/style/images/product/products_14.png"/>
   		 <img style="padding:30px;" src="${base}/default/style/images/product/products_15.png"/>
   		 </div>
    </div>
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
			
			<div class="bd" style="padding-left:80px;">

            <ul class="product-nav big cfix" id="myTab2">
                <li onmouseover="nTabs(this,0);" class="active">
                    <a href="javascript:void(0)"><span class="demo-test"><img src="${base}/default/style/images/product/products_16.png" /></span><p>空气监测仪</p></a>
                </li>
                <li onmouseover="nTabs(this,1);">
                    <a href="javascript:void(0)"><span class="demo-test"><img src="${base}/default/style/images/product/products_17.png" /></span><p>空气净化器</p></a>
                </li>
                <li onmouseover="nTabs(this,2);">
                    <a href="javascript:void(0)"><span class="demo-test"><img src="${base}/default/style/images/product/products_21.png" /></span><p>红外模块</p></a>
                </li>
                <li onmouseover="nTabs(this,3);">
                    <a href="javascript:void(0)"><span class="demo-test"><img src="${base}/default/style/images/product/products_18.png" /></span><p>智能开关</p></a>
                </li>
                <li onmouseover="nTabs(this,4);">
                    <a href="javascript:void(0)"><span class="demo-test"><img src="${base}/default/style/images/product/products_19.png" /></span><p>净化产品</p></a>
                </li>
                <li onmouseover="nTabs(this,5);">
                    <a href="javascript:void(0)"><span class="demo-test"><img src="${base}/default/style/images/product/products_20.png" /></span><p>APP</p></a>
                </li>
                <li onmouseover="nTabs(this,6);">
                    <a href="javascript:void(0)"><span class="demo-test"><img src="${base}/default/style/images/product/products_26.png" /></span><p>加湿器</p></a>
                </li>
                <li>
                    <a href="javascript:void(0)"><span class="demo-test"><img src="${base}/default/style/images/product/products_27.png" /></span><p>新风系统</p></a>
                </li>
                <li>
                    <a href="javascript:void(0)"><span class="demo-test"><img src="${base}/default/style/images/product/products_28.png" /></span><p>消毒机</p></a>
                </li>
                <li>
                    <a href="javascript:void(0)"><span class="demo-test"><img src="${base}/default/style/images/product/products_28.png" /></span><p>消毒机</p></a>
                </li>
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
            	<ul class="c" id="myTab2_Content0">
                	<li>
                    	<a href="${base }/product">
                        	<img src="${base}/default/style/images/product/product_06.jpg" />
                            <p>空气眼</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_07.jpg" />
                            <p>空气侠</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_08.jpg" />
                            <p>除味剂</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#" class="demo-test"><img src="${base}/default/style/images/product/product_09.jpg" /></a>
                    </li>
                    <li></li>
                    <li></li>
                </ul>
                
                <ul class="c" id="myTab2_Content1" style="display:none">
                	<li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_08.jpg" />
                            <p>空气净化器</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_06.jpg" />
                            <p>空气净化器</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_07.jpg" />
                            <p>空气净化器</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#" class="demo-test"><img src="${base}/default/style/images/product/product_09.jpg" /></a>
                    </li>
                    <li></li>
                    <li></li>
                </ul>
                
                <ul class="c" id="myTab2_Content2" style="display:none">
                	<li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_06.jpg" />
                            <p>红外模块</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_07.jpg" />
                            <p>红外模块</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_08.jpg" />
                            <p>红外模块</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#" class="demo-test"><img src="${base}/default/style/images/product/product_09.jpg" /></a>
                    </li>
                    <li></li>
                    <li></li>
                </ul>
                
                <ul class="c" id="myTab2_Content3" style="display:none">
                	<li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_08.jpg" />
                            <p>智能开关</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_06.jpg" />
                            <p>智能开关</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_07.jpg" />
                            <p>智能开关</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#" class="demo-test"><img src="${base}/default/style/images/product/product_09.jpg" /></a>
                    </li>
                    <li></li>
                    <li></li>
                </ul>
                
                <ul class="c" id="myTab2_Content4" style="display:none">
                	<li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_06.jpg" />
                            <p>净化产品</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_07.jpg" />
                            <p>净化产品</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_08.jpg" />
                            <p>净化产品</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#" class="demo-test"><img src="${base}/default/style/images/product/product_09.jpg" /></a>
                    </li>
                    <li></li>
                    <li></li>
                </ul>
                
                <ul class="c" id="myTab2_Content5" style="display:none">
                	<li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_06.jpg" />
                            <p>APP</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_07.jpg" />
                            <p>APP</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_08.jpg" />
                            <p>APP</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#" class="demo-test"><img src="${base}/default/style/images/product/product_09.jpg" /></a>
                    </li>
                    <li></li>
                    <li></li>
                </ul>
                
                <ul class="c" id="myTab2_Content6" style="display:none">
                	<li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_06.jpg" />
                            <p>APP</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_07.jpg" />
                            <p>APP</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="${base}/default/style/images/product/product_08.jpg" />
                            <p>APP</p>
                        </a>
                    </li>
                    <li>
                    	<a href="#" class="demo-test"><img src="${base}/default/style/images/product/product_09.jpg" /></a>
                    </li>
                    <li></li>
                    <li></li>
                </ul>
                
            </div>
            <div class="pro-more">
            	<a href="#"><img src="${base}/default/style/images/product/product_10.jpg" /> 更多>></a>
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
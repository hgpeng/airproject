<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit">
<jsp:include page="common/commonHead.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${base }/default/style/case.css"/>
<script type="text/javascript"  src="${base}/default/js/module/tags.js"></script>
<script type="text/javascript" src="${base}/default/js/control/superslider.js"></script>
<script type="text/javascript" src="${base}/default/js/control/jquery.sly.js"></script>
<title>绿色工程</title>
</head>
<body>
<div id="boxwarp" class="scrollbox">
    <jsp:include page="common/top.jsp"></jsp:include>
     
    <div class="case-warp green">
    	<div class="case-list">
    		<div class="slyWrap example">		
                <div class="sly" data-options='{ "horizontal": 1, "itemNav": "centered", "cycleBy": "items","scrollBy": 1, "cycleInterval": 2000 }'>
                    <ul class="big cfix">
                        <li>
                        	<a href="#">
                            <img src="${base}/default/style/images/case/08.jpg"/>
                            <div class="caselistbox">
                            	<p class="case-sz">01</p>
                            	<p class="case-title">最新动态 </p>
                            	<p class="case-en">News</p>
                            </div>
                            </a>
                        </li>
                        <li>
                        	<a href="#">
                            <img src="${base}/default/style/images/case/09.jpg"/>
                            <div class="caselistbox">
                            	<p class="case-sz">02</p>
                            	<p class="case-title">服务介绍</p>
                            	<p class="case-en">Greentimes Services</p>
                            </div>
                            </a>
                        </li>
                        <li class="about-green">
                        	<a href="javascript:void(0);">
                            <img src="${base}/default/style/images/case/10.jpg"/>
                            <div class="caselistbox">
                            	<p class="case-sz">03</p>
                            	<p class="case-title">关于绿色时代</p>
                            	<p class="case-en">About Greentimes</p>
                            </div>
                            </a>
                        </li>
                        <li>
                        	<a href="#">
                            <img src="${base}/default/style/images/case/11.jpg"/>
                            <div class="caselistbox">
                            	<p class="case-sz">04</p>
                            	<p class="case-title">产品展示</p>
                            	<p class="case-en">Greentimes Products</p>
                            </div>
                            </a>
                        </li>
                        <li>
                        	<a href="case.html">
                            <img src="${base}/default/style/images/case/12.jpg"/>
                            <div class="caselistbox">
                            	<p class="case-sz">05</p>
                            	<p class="case-title">工程案例</p>
                            	<p class="case-en">construction Case</p>
                            </div>
                            </a>
                        </li>
                        <li>
                        	<a href="case-show.html">
                            <img src="${base}/default/style/images/case/08.jpg"/>
                            <div class="caselistbox">
                            	<p class="case-sz">06</p>
                            	<p class="case-title">魔法城堡 </p>
                            	<p class="case-en">Magic castle</p>
                            </div>
                            </a>
                        </li>
                        <li>
                        	<a href="case-show.html">
                            <img src="${base}/default/style/images/case/09.jpg"/>
                            <div class="caselistbox">
                            	<p class="case-sz">07</p>
                            	<p class="case-title">蒙来水谢春天</p>
                            	<p class="case-en">The spring water xie</p>
                            </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="controls btn-toolbar" style="display:none">
                    <div class="btn-group">
                        <a href="javascript:void(0);" class="btn prevPage">上一页</a>
                        <a href="javascript:void(0);" class="btn nextPage">下一页</a>
                    </div>  
                </div>            
            </div>
            
            <div class="about-green-box none">
            	
            	<div class="about-warp">
                	<h2 class="about-h2"><p>关于绿色时代</p><p class="p-en">About Greentimes</p></h2>
                    <ul class="about-img">
                    	<li><img src="${base}/default/style/images/case/13.jpg" /></li>
                        <li><img src="${base}/default/style/images/case/14.jpg" /></li>
                        <li><img src="${base}/default/style/images/case/15.jpg" /></li>
                    </ul>
                	<h3 class="about-h3">追逐绿色梦想   探索时代环保</h3>
                    
                    <div class="slyWrap example12">
		
                        <div class="scrollbar">
                            <div class="handle"></div>
                        </div>
                    
                        <div class="sly" data-options='{ "scrollBy": 100, "startAt": 0 }'>
                            <div>
                            	<p>DST GROUP 全球领先以室内空气安全为核心，一站式健康生活整体解决方案。<br />DST专注于人类至关重要的健康需求，以非凡的创意、领先的技术、卓越的空气环境解决方案和创新的产品，致力于改善和提升人们的生活品质。</p>
                                <p>DST是一家由德士特智慧科技（深圳）有限公司、德士特智慧科技（上海）有限公司、德士特智慧科技（山西）有限公司、深圳市绿色时代环境技术有限公司组成的全面整合移动互联网、物联网平台并应用于环境治理、监控及后续个性化定制服务的整体方案服务商，在室内环境监测、全面治理服务、家庭环境智能管理解决方案、创新型应用及增值服务等方面均居业界领先地位。</p>
                                <p>DST绿色时代环境技术有限公司是一家集科研、开发、生产于一体的环境技术产品供应企业，2013年DST综合全国317家同类产品质检测试与实际应用，隆重推出绿色时代，致力于室内环境的改善与治理。绿色时代在环保领域四大系列产品：室内污染防治系列、家居环保用品系列、汽车空气净化系列及HSE装修污染防治系列，销售网络覆盖全国各大中城市。其精良的产品品质，完善的服务网络，卓越的经营理念，为广大消费者提供
了优质的服务，建立了有口皆碑的信誉和行业领先地位。</p>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
                <div class="about-close"></div>
                
            </div>
            
            
    	</div>
    	<div class="case-r">
    	
    		<jsp:include page="common/rightcommon.jsp"></jsp:include>
    		
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

	// 主要调用部分
	$(document).on('activated',function(event){
		var $section = $(".scrollbox");
		var $frame = $section.find('.frame'),
			$ul = $frame.find('ul').eq(0),
			$scrollbar = $section.find('.scrollbar'),
			$buttons = $section.find('.controlbar [data-action]');
		
		populate($ul, 10);
			
		// 控制
		$buttons.on('click',function(e){
			var action = $(this).data('action');
			switch(action){
				case 'reset':
				$frame.sly('toStart');
				setTimeout(function(){
					$ul.find('li').slice(10).remove();
					$frame.sly('reload');
				}, 200);
				break;
				default:
				$frame.sly(action);
			}
		});
		
		$section.find(".slyWrap").each(function(i,e){
			var cont = $(this),
				frame = cont.find(".sly"),
				slidee = frame.find("ul"),
				scrollbar = cont.find(".scrollbar"),
				pagesbar = cont.find(".pages"),
				options = frame.data("options"),
				controls = cont.find(".controls"),
				prevButton = controls.find(".prev"),
				nextButton = controls.find(".next"),
				prevPageButton = controls.find(".prevPage"),
				nextPageButton = controls.find(".nextPage");

			options = $.extend({},options,{
				scrollBar: scrollbar,
				pagesBar: pagesbar,
				prev: prevButton,
				next: nextButton,
				prevPage: prevPageButton,
				nextPage: nextPageButton,
				disabledClass: 'btn-disabled'
			});

			frame.sly( options );

			cont.find("button").click(function(){
				var action = $(this).data('action'),
				arg = $(this).data('arg');
				switch(action){
					case 'add':
					slidee.append(slidee.children().slice(-1).clone().removeClass().text(function(i,text){
						return text/1 + 1;
					}));
					frame.sly('reload');
					break;
					case 'remove':
					slidee.find("li").slice(-1).remove();
					frame.sly('reload');
					break;
					default:
					frame.sly(action, arg);
				}
			});

		});
	
	}).trigger('activated');
	
});
</script>
<script type="text/javascript">
$(".about-green").click(function(){
  $(".about-green-box").removeClass("none");
});
$(".about-close").click(function(){
  $(".about-green-box").addClass("none");
});
</script>
</body>
</html>
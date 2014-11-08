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
<title>工程案例</title>
</head>
<body>
<div id="boxwarp" class="scrollbox">
    <jsp:include page="common/top.jsp"></jsp:include>
     
    <div class="case-warp">
    	<div class="case-list">
    		<div class="slyWrap example">		
                <div class="sly" data-options='{ "horizontal": 1, "itemNav": "centered", "cycleBy": "items","scrollBy": 1, "cycleInterval": 2000 }'>
                    <ul class="big cfix">
                        <li>
                        	<a href="${base}/caseshow">
                            <img src="${base}/default/style/images/case/01.jpg"/>
                            <div class="caselistbox">
                            	<p class="case-sz">01</p>
                            	<p class="case-title">德弘天下华府 </p>
                            	<p>DE hong all Washington</p>
                            </div>
                            </a>
                        </li>
                        <li>
                        	<a href="${base}/caseshow">
                            <img src="${base}/default/style/images/case/02.jpg"/>
                            <div class="caselistbox">
                            	<p class="case-sz">02</p>
                            	<p class="case-title">星河时代花园</p>
                            	<p>Milky Way era garden</p>
                            </div>
                            </a>
                        </li>
                        <li>
                        	<a href="${base}/caseshow">
                            <img src="${base}/default/style/images/case/03.jpg"/>
                            <div class="caselistbox">
                            	<p class="case-sz">03</p>
                            	<p class="case-title">合正香蜜原著</p>
                            	<p class="case-en">Us is fragrant honey original</p>
                            </div>
                            </a>
                        </li>
                        <li>
                        	<a href="${base}/caseshow">
                            <img src="${base}/default/style/images/case/04.jpg"/>
                            <div class="caselistbox">
                            	<p class="case-sz">04</p>
                            	<p class="case-title">花样年花郡家园</p>
                            	<p>Figure in county home</p>
                            </div>
                            </a>
                        </li>
                        <li>
                        	<a href="${base}/caseshow">
                            <img src="${base}/default/style/images/case/05.jpg"/>
                            <div class="caselistbox">
                            	<p class="case-sz">05</p>
                            	<p class="case-title">创世纪滨海花园</p>
                            	<p>Genesis binhai garden</p>
                            </div>
                            </a>
                        </li>
                        <li>
                        	<a href="${base}/caseshow">
                            <img src="${base}/default/style/images/case/06.jpg"/>
                            <div class="caselistbox">
                            	<p class="case-sz">06</p>
                            	<p class="case-title">魔法城堡 </p>
                            	<p>Magic castle</p>
                            </div>
                            </a>
                        </li>
                        <li>
                        	<a href="${base}/caseshow">
                            <img src="${base}/default/style/images/case/07.jpg"/>
                            <div class="caselistbox">
                            	<p class="case-sz">07</p>
                            	<p class="case-title">蒙来水谢春天</p>
                            	<p>The spring water xie</p>
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
</body>
</html>
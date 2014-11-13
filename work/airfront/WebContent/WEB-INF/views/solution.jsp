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
<link rel="stylesheet" type="text/css" href="${base }/default/style/case.css"/>
<link rel="stylesheet" type="text/css" href="${base }/default/style/product-show.css"/>
<script type="text/javascript" src="${base}/default/js/control/jquery.sly.js"></script>
<title>产品</title>
<script>
	$(document).ready(function(){
		
	});
	
</script>
</head>
<body>
<div id="boxwarp" class="scrollbox">
   <jsp:include page="common/top.jsp"></jsp:include>
    <div class="case-warp green">
    	<div class="case-list">
            <div class="about-green-box">
            	<div class="about-warp">
                	<h2 class="about-h2">
                    	<div>
                    	<img src="${base}/default/style/images/case/case_19.png" />
                        <p>${art.basedata.name }</p>
                        <p class="p-en">${art.basedata.name_en }</p>
                        </div>
                    </h2>
                    <div class="about-img">
                        <c:forEach items="${art.imglist }" var="item">
                    		<img src="${base}/images/${item}" />
                    	</c:forEach>                  	
                    </div>
                	<h3 class="about-h3">${art.title }</h3>
                    
                    <div class="slyWrap example12">
		
                        <div class="scrollbar">
                            <div class="handle"></div>
                        </div>
                    
                        <div class="sly" data-options='{ "scrollBy": 100, "startAt": 0 }'>
                            <div>
                            	${art.content }
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
                
            </div>
            
            
    	</div>
    	<div class="case-r jjfa">
    		<ul class="case-rul">
    			<li class="rlist_01"><a href="#">解决方案</a></li>
    			 <c:forEach items="${bdlist}" var="item" varStatus="status">
    				<li <c:if test="${status.index==0 }">class="rlist_02"</c:if> >
    							<a href="${base }/solution?sid=${item.id}">
    								<span><img src="${base}/images/${item.icon}"/></span>
    								${item.name }
    							</a>
    						</li>
    			</c:forEach> 			
    						
    		</ul>
    		<div class="fenxiang">
    			<a href="#"><img src="${base}/default/style/images/case/case_05.png"/></a>
    		</div>
    	</div>
    </div>
</div>
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
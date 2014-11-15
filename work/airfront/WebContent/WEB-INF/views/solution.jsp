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
		var winwidth = $(window).width();	
		var hdleft = (winwidth-1200)/2;
		var conleft = (winwidth-280)/10;
		var contentwid = (winwidth-280)*8/10;
		if(contentwid>1200) {
			$("div.about-warp").width(1200);
			//$("#h3div").width(1200);
		}
		//var tt = ((winwidth-280)*8/10-1200)/2;
		$("div.about-warp").css("right",(conleft-hdleft)+"px");
		//$("#h3div").css("right",(conleft-hdleft)+"px");
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
                	 
                    <c:if test="${! empty art.imglist }">
                    <div class="about-img">
                        <c:forEach items="${art.imglist }" var="item">
                    		<img src="${base}/images/${item}" />
                    	</c:forEach>                  	
                    </div>
                    </c:if>
                    <div id="h3div" style="margin:0 auto;width:300px;text-align:center;padding:30px 0;">
                	<h3 class="about-h3">${art.title }</h3>
                	
                	<p style="padding:5px 0;"><img src="${base }/default/style/images/newhome/line.png"/></p>
                	
                    </div>
                    <div class="slyWrap example14" style="height:80%;">
		
                        <div class="scrollbar">
                            <div class="handle"></div>
                        </div>
                    
                        <div class="sly" data-options='{ "scrollBy": 100, "startAt": 0 }'>
                            <div style="height:40000px;">
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
$(document).ready(function(){
	$("div.sly").sly({ "scrollBy": 100, "startAt": 0 });
});
</script>
</body>
</html>
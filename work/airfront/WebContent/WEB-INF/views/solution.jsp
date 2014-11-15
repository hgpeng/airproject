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
<title>解决方案</title>
<script>
	$(document).ready(function(){
		var winwidth = $(window).width();	
		var hdleft = (winwidth-1200)/2;
		var conleft = (winwidth-280)/10;
		var contentwid = (winwidth-280)*8/10;
		if(contentwid>1200) {
			//$("div.about-warp").width(1200);
			//$("#h3div").width(1200);
		}
		//var tt = ((winwidth-280)*8/10-1200)/2;
		//$("div.about-warp").css("right",(conleft-hdleft)+"px");
		//$("#h3div").css("right",(conleft-hdleft)+"px");
	});
	
</script>
</head>
<body>
<div id="boxwarp" class="scrollbox">
   <jsp:include page="common/top.jsp"></jsp:include>
    <div class="case-warp green" style="padding-right:0px;">
    	<div class="case-list">
            <div class="about-green-box">
            	<div class="about-warp" style="width:1200px;">
                	 
                    
                    <div style="margin: 0px auto; text-align: center; width: 1200px; padding: 20px 0px;">
					    <h3 class="about-h3">${art.title }</h3>             	          	
					</div>
                    <div class="slyWrap example14" style="height:80%;">
		
                        <!-- <div class="scrollbar">
                            <div class="handle"></div>
                        </div> -->
                    
                        <div class="sly" data-options='{ "scrollBy": 100, "startAt": 0 }'>
                            <div style="height:40000px;width:100%;">
                            	<div name="flashdiv">
						    <object type="application/x-shockwave-flash" id="flashcontent" name="flashcontent" 
						    data="${base }/default/style/cpzx_hy.swf" width="100%" 
						    style="visibility: visible; width: 100%;height:600px;">
						    <param name="movie" value="${base }/default/style/cpzx_hy.swf">
						    <param name="quality" value="high">
						    <param name="scale" value="noscale">
						    <param name="wmode" value="transparent" />
						    <param name="allowscriptaccess" value="always">
						    <param name="bgcolor" value="#F1F1F1F1">
						    <param name="flashvars" value="siteXML=xml/site.xml"></object>
	  				</div>
	  				<div name="flashdiv">
						    <object type="application/x-shockwave-flash" id="flashcontent" name="flashcontent" 
						    data="${base }/default/style/cpzx_my.swf" width="100%" 
						    style="visibility: visible; width: 100%;height:600px;">
						    <param name="movie" value="${base }/default/style/cpzx_my.swf">
						    <param name="quality" value="high">
						    <param name="scale" value="noscale">
						    <param name="wmode" value="transparent" />
						    <param name="allowscriptaccess" value="always">
						    <param name="bgcolor" value="#F1F1F1F1">
						    <param name="flashvars" value="siteXML=xml/site.xml"></object>
	  				</div>
                            	${art.content }
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
                
            </div>
            
            
    	</div>
    	
    	<div class="case-rbtn">
             <a href="javascript:void(0)" onclick="shownav()"></a>
        </div>
    	
    	
    	<div class="case-r jjfa" style="display:none;">
    		<ul class="case-rul">
    			<li class="rlist_01"><a href="javascript:void(0)" onclick="shownav()">解决方案</a></li>
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

function shownav(){
	//if($("div.jjfa").is(":visible")){
		$("div.jjfa").toggle();
		$("div.case-rbtn").toggle();

}
</script>
</body>
</html>
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
<script type="text/javascript"  src="${base}/default/js/module/tags.js"></script>
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
                        <c:forEach items="${bdlist }" var="item"  varStatus="status">
                        <li onclick="showdetail(this,event)" 
                        <c:if test="${empty item.url }">
                        url="${base }/viewarticle?type=${item.id}"
                        </c:if>
                         <c:if test="${!empty item.url }">
                         url="${base }${item.url }"
                         </c:if>
                        >
                     		<a href="#">
                            <img src="${base}/images/${item.icon}"/>
                            <div class="caselistbox">
                            	<p class="case-sz">0${status.index+1}</p>
                            	<p class="case-title">${item.name } </p>
                            	<p class="case-en">${item.name_en }</p>
                            </div>
                            </a>
                        </li>
                        </c:forEach>
                        <!-- 
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
                         -->
                    </ul>
                </div>
                <div class="controls btn-toolbar" style="display:none">
                    <div class="btn-group">
                        <a href="javascript:void(0);" class="btn prevPage">上一页</a>
                        <a href="javascript:void(0);" class="btn nextPage">下一页</a>
                    </div>  
                </div>            
            </div>
            
            <div id="detailshow">
            
           
            </div>
            
    	</div>
    	<div class="case-r">
    	
    		<jsp:include page="common/rightcommon.jsp"></jsp:include>
    		
    		</div>
    		</div>
    
    
	 
</div>

<script type="text/javascript">
$("div.sly").sly({ "horizontal": 1, "itemNav": "centered", "cycleBy": "items","scrollBy": 1, "cycleInterval": 2000 });
//$("div.case-list").slide({mainCell:".sly ul",autoPage:true,effect:"left",autoPlay:true,vis:3});



</script>
<script type="text/javascript">

function backlist(){
	$("#detailshow").find("div.about-green-box").remove();
}

function showdetail(obj,event){
	
	var url = $(obj).attr("url");
	if(url.indexOf('viewarticle')>-1){
	$("#detailshow").load(url,function(){	
		
	});
	}else{
		window.location.href = url;
	}
	event.stopPropagation();
}


</script>
</body>
</html>
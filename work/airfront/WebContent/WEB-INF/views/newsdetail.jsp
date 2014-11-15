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
<title>新闻资讯</title>
</head>
<body>
<div id="boxwarp" class="scrollbox">
   <jsp:include page="common/top.jsp"></jsp:include>
    <div class="case-warp green" style="padding-right:0px;">
    	<div class="case-list">
            <div class="about-green-box">
            	<div class="about-warp" style="width:1200px;">
                	 
                    
                    <div style="margin: 0px auto; text-align: center; overflow: hidden; border-bottom: 1px dashed #ccc; width: 1200px; padding: 20px 0px;">
					    <h3 class="about-h3">${art.title }</h3>             	          	
					</div>
                    <div class="slyWrap example14" style="height:80%;">
		
                        <div class="scrollbar">
                            <div class="handle"></div>
                        </div>
                    
                        <div class="sly" data-options='{ "scrollBy": 100, "startAt": 0 }'>
                            <div style="height:40000px;width:100%;">                	
                            	${art.content }
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
                
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
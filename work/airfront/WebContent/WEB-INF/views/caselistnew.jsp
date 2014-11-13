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
                    	<c:forEach items="${aclist }" var="item"  varStatus="status">
                        <li>
                        	<a href="${base}/caseshow?id=${item.id}">
                            <img src="${base}/images/${item.photo}"/>
                            <div class="caselistbox">
                            	<p class="case-sz">0${status.index+1}</p>
                            	<p class="case-title">${item.name } </p>
                            	<p>${item.name_en }</p>
                            </div>
                            </a>
                        </li>
                        </c:forEach>
                        <%-- <li>
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
                        </li> --%>
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
$("div.sly").sly({ "horizontal": 1, "itemNav": "centered", "cycleBy": "items","scrollBy": 1, "cycleInterval": 2000 });
</script>
</body>
</html>
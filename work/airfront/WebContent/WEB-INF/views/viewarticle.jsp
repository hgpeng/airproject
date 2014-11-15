<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="common/commonHead.jsp"></jsp:include>
<script type="text/javascript" src="${base}/default/js/control/jquery.sly.js"></script>
<script>
	$(document).ready(function(){
		$("div.sly").sly({ "scrollBy": 100, "startAt": 0 });
	});
</script>
 <div class="about-green-box">
<c:if test="${!empty data }">

<div class="about-warp">
      <h2 class="about-h2"><p>${data.basedata.name }</p><p class="p-en">${data.basedata.name_en }</p></h2>
                    <c:if test="${!empty data.img }">
                    <ul class="about-img">
                    	<c:forEach items="${data.imglist }" var="item">
                    		<li><img src="${base}/images/${item}" /></li>
                    	</c:forEach>                  	
                    </ul>
                    </c:if>
                	<h3 class="about-h3">${data.title }</h3>
                    
                    <div class="slyWrap example12" style="height:80%;">
		
                        <!-- <div class="scrollbar">
                            <div class="handle"></div>
                        </div> -->
                    
                        <div class="sly" data-options='{ "scrollBy": 100, "startAt": 0 }'>
                            <div  style="height:40000px;width:100%;">
                            	${data.content }
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
                 <div class="about-close" onclick="backlist()"></div>
               
           
                
</c:if>
<c:if test="${empty data }">
<div class="about-warp">
	没有找到相关页面
	</div>
	<div class="about-close" onclick="backlist()"></div>
</c:if>
 </div>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit">
<jsp:include page="common/commonHead.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${base }/default/style/other.css"/>
<link rel="stylesheet" type="text/css" href="${base }/default/style/product-show.css"/>
<title>联系我们</title>
<script>
	$(document).ready(function(){
		$("div.header").hide();
		$("#contro").show();
	});
</script>
</head>
<body>
<div id="boxwarp" class="scrollbox">
	    <jsp:include page="common/top.jsp"></jsp:include>
	<!------内容------->


<!------内容------->
<div class="contact-line font18">
     <div class="w1200"><a class="conatctnow" href="#">联系我们</a></div>
</div>

<div class="w1200 pt20 pb40">
     <div class="combox">
          <div class="contact-l">
               <p class="font16" style="color:#00a0e9;">您的服务中心</p>
               <h1 class="nobold pt10 pb10">德士特智慧科技（深圳）有限公司</h1>
               
               <div class="combox pt30">
                    <div class="fl">
                         中国<br>
                         广东省 深圳市 南山区<br>
                         高新区<br>
                         粤兴大道9号
                    </div>
                    <div class="fr">周一至周五：上午9:00 - 晚上18:00</div>
               </div>
               
               <div class="combox pt40">
                      <p>加盟电话: +86 755 8899 9996</p>
                      <p>服务电话: +86 755 8899 9996</p>
               </div>
               
                <div class="combox pt40" style="padding-bottom:150px;">
                     <img src="${base}/default/style/images/other/ewm.jpg">
                </div>
               
          </div>
          <div class="contact-r"><img src="${base}/default/style/images/other/contact-map.jpg"></div>
     </div>
</div>

<!------版权------->      
	    <jsp:include page="common/footer.jsp"></jsp:include>
  

</div>
</body>
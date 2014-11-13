<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit">
<jsp:include page="common/commonHead.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${base }/default/style/xz.css"/>
<link rel="stylesheet" type="text/css" href="${base }/default/style/shop.css"/>
<title>在线商城</title>
</head>
<body>
<div id="boxwarp">
	 <jsp:include page="common/top.jsp"></jsp:include>
	  <div class="shop_box01">
  		<div class="box01-main">
        	<img src="${base}/default/style/images/other/shop_01.png" class="box01-img01 slideInDown animated" />
            <img src="${base}/default/style/images/other/shop_02.png" class="box01-img02 flipInY animated" />
            <div class="box01-wenzi bounceInRight animated">
            	<p><img src="${base}/default/style/images/other/shop_12.png" /></p>
            	<p class="wenzi_01">智能空气监测仪</p>
                <p class="wenzi_02">看得见 才安全</p>
                <a href="#" class="goumai">商城购买 >></a>
            </div>
        </div>
  </div>
  
  <div class="shop_box02">
  		<div class="box01-main">
        	<img src="${base}/default/style/images/other/shop_04.png" class="box02-img01" />
            <div class="box02-wenzi">
            	<p><img src="${base}/default/style/images/other/shop_13.png" /></p>
            	<p class="wenzi_01">智能空气监测仪</p>
                <p class="wenzi_02">看得见 才安全</p>
                <a href="#" class="goumai">商城购买 >></a>
            </div>
        </div>
  </div>
  
  
  <div class="shop_box03">
  		<div class="box03-main">
        	<div class="box03-left">
            	<img src="${base}/default/style/images/other/shop_05.png" />
                <p class="box03-wen">X- 35 <a href="#">购买>></a></p>
            </div>
            <div class="box03-right01">
            	<img src="${base}/default/style/images/other/shop_06.png" />
                <p class="box03-wen">X- 36 <a href="#">购买>></a></p>
            </div>
            <div class="box03-right02">
            	<img src="${base}/default/style/images/other/shop_07.png" />
                <p class="box03-wen">X- 37 <a href="#">购买>></a></p>
            </div>
            <div class="box03-right03">
            	<img src="${base}/default/style/images/other/shop_08.png" />
                <p class="box03-wen">X- 37 <a href="#">购买>></a></p>
            </div>
        </div>
  </div>
  
   <jsp:include page="common/footer.jsp"></jsp:include>
</div> 
<script type="text/javascript">
$(window).scroll(function(){
	if ($(window).scrollTop()>615){
		$('.box02-img01').addClass('slideInDown animated');
		$('.box02-wenzi').addClass('bounceInLeft animated');
	}
	if ($(window).scrollTop()>1200){
		$('.box03-left').addClass('bounceInLeft animated');
		$('.box03-right01').addClass('slideInDown animated');
		$('.box03-right02').addClass('slideInUp animated');
		$('.box03-right03').addClass('bounceInRight animated');
	}
});
</script>
</body>
</html>
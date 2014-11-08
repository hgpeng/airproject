/*jQuery(".fullSlide").hover(function() {
    jQuery(this).find(".prev,.next").stop(true, true).fadeTo("show", 0.5)
},
function() {
    jQuery(this).find(".prev,.next").fadeOut()
});*/
jQuery(".fullSlide").slide({
    titCell: ".hd ul",
    mainCell: ".bd ul",
    effect: "fold",
    autoPlay: true,
    autoPage: true,
    trigger: "click",
    startFun: function(i) {
        var curLi = jQuery(".fullSlide .bd li").eq(i);
        if ( !! curLi.attr("_src")) {
            curLi.css("background-image", curLi.attr("_src")).removeAttr("_src")
        }
    }
}); 

var winWidth = document.body.clientWidth;
var winHeight = document.body.clientHeight;

if(window.screen.width==1920){
	$(".prev").css('left','16.5%');
	$(".next").css('right','16.5%');
}


else if(window.screen.width==1680){
	$(".prev").css('left','12%');
	$(".next").css('right','12%');
}

else if(window.screen.width==1600){
	$(".prev").css('left','10%');
	$(".next").css('right','10%');
}

else if(window.screen.width==1440){
	$(".prev").css('left','5%');
	$(".next").css('right','5%');
}
else{
	$(".prev").css('left','0%');
	$(".next").css('right','0%');
}

if(window.screen.width<1280){
	$('.prev').css('display','none');
	$('.next').css('display','none');
}











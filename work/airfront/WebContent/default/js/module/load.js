
$(document).ready(function(){function listHeaderHeight(){var HeaderHeight=$(".listheader .filters").outerHeight();if(HeaderHeight>150){$(".listheader").height(507);}}
listHeaderHeight();function setfactsAndDetailsHeights(){$(".factsAndDetails").each(function(){$(this).find(".wallpaper").css("height","auto");$(this).find(".content").css("height","auto");var
viewportHeight=$(window).height()-61,sectionContentHeight=$(this).find(".content").outerHeight();if(sectionContentHeight<viewportHeight){$(this).find(".wallpaper").height(viewportHeight);$(this).find(".content").height(viewportHeight);}else{$(this).find(".wallpaper").height(sectionContentHeight);$(this).find(".content").height(sectionContentHeight);$(this).height(sectionContentHeight);};});}
setfactsAndDetailsHeights();$(window).resize(setfactsAndDetailsHeights);function setSliderHeights(){$(".slider").each(function(){var
viewportHeight=$(window).height()-61,sliderHeight=$(".flexslider").height();console.log("viewport",viewportHeight);console.log("flexslider",sliderHeight);$(this).find(".flexslider").height(viewportHeight);$(this).find(".slides").height(viewportHeight);$(this).find(".flexslider img").imgscale({parent:'.flexslider',scale:'fill'});});}
setSliderHeights();$(window).resize(setSliderHeights);function setSectionWidth(){$("section .centerSection").css("width","auto");$("section .centerSection").each(function(){var
sectionWidth=($("section .centerSection").width())/280,sectionCellNumber=Math.floor(sectionWidth),brickCount=$(this).find('.masonryItem:not(".listheader")').length,sectionCellMaxWidth=(brickCount>sectionCellNumber)?sectionCellNumber*280:brickCount*280;$("section .centerSection").css("width",sectionCellMaxWidth);});}
setSectionWidth();$(window).resize(setSectionWidth);(function initFancyScroll($container){var
$scroller=$(window),topOffset=0,$imgps=$($container).find('.imgp');var lasttime=0,sp=10;function throttle(fn,context){return function(){var now=new Date().getTime();if(now-lasttime>sp){lasttime=now;return fn.apply(context,arguments);}}}
function scrollTop(){return $scroller.scrollTop();}
function isAboveTop(){return $(this)[0].offsetTop<$scroller.scrollTop();}
function isBelowTop(){return $(this)[0].offsetTop>$scroller.scrollTop();}
function prevSection(){return $imgps.filter(isAboveTop).last();}
function nextSection(){return $imgps.filter(isBelowTop).first();}
function currentSectionNumber(){var i=0,scrollTop=$scroller.scrollTop();for(i=0;$imgps[i]&&($($imgps[i]).position().top-($scroller.outerHeight()/2))<=scrollTop;i++){}
return i;}
function scrollTo($target){if($target.length===0){return;}
$('html,body').animate({scrollTop:$target[0].offsetTop},490);}
var timeout=false;function updatePageNumber(){if($(document).outerHeight()-$(document).scrollTop()<=$scroller.outerHeight())
{$('.page-number').text($imgps.length);}
else
{$('.page-number').text(currentSectionNumber());}
if(timeout){clearTimeout(timeout);}
timeout=setTimeout(function(){var i=parseInt($('.page-number').text())-1;scrollTo($($imgps[i]));},500);}
function init(){$('.up').click(function(){scrollTo(prevSection());});$('.down').click(function(){scrollTo(nextSection());});$('.total-pages').text($imgps.length);$scroller.scroll(throttle(updatePageNumber));$scroller.trigger('scroll');if($('.up').length>0){$(document).keydown(function(e){if(e.keyCode==38){scrollTo(prevSection());e.preventDefault();}});$(document).keydown(function(e){if(e.keyCode==40){scrollTo(nextSection());e.preventDefault();}});}
var op="ie";var lastInvocation=0,threshold=500;var scrollFunc=function(e){var now=new Date().getTime();if(now-lastInvocation>threshold){lastInvocation=now;var direct=0;e=e||window.event;if(e.wheelDelta){direct=e.wheelDelta;op="ie";}
else if(e.detail){direct=e.detail;op="fire";}
if(op=="fire")
{if(direct>0)
{timeoutfire=setTimeout(function(){scrollTo(nextSection());},50);}
else
{timeoutfire=setTimeout(function(){scrollTo(prevSection());},50);}}
if(op=="ie")
{if(direct>0)
{setTimeout(function(){scrollTo(prevSection());},50);}
else
{setTimeout(function(){scrollTo(nextSection());},50);}}
if(e.preventDefault)
e.preventDefault();e.returnValue=false;}}
if(document.addEventListener){document.addEventListener('DOMMouseScroll',scrollFunc,false);}
window.onmousewheel=document.onmousewheel=scrollFunc;}
init();}($('#boxwarp')));});
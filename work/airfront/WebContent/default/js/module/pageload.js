
   // $(".tabs").slide({ titCell:".num ul" , mainCell:".tabs-list" , effect:"fold", autoPlay:true, delayTime:1000 , autoPage:true });

    $(document).ready(function(){

       
    });


    /*animation02 indoor*/
    var pageCurrent,
        pageNum;


    var support = function(prop) {
        var _div = document.createElement('div'),
            _vendors = 'webkit moz ms o'.split(' '),
            _len = _vendors.length;
        var result =  function(prop) {
            var _dstyle = _div.style;
            if (prop in _dstyle) return true;
            prop = prop.replace(/^[a-z]/, function(val) {
                return val.toUpperCase();
            })
            while (_len--) {
                if (_vendors[_len] + prop in _dstyle) {
                    return true;
                }
            }
            return false;
        }

        return result(prop);
    }

    var supports = {
        "transition": support("transition")
    }

    $.fn.trans = function(css) {
        var $obj = $(this);
        if (supports.transition) {
            $obj.css(css)
        } else {
            $obj.stop().animate(css, 500)
        }
    }

    var _pageDelay = true;
    var movePage = function(delta) {
        if (_pageDelay) {
            if (!(pageCurrent == 0 && delta > 0) && !(pageCurrent == (pageNum - 1) && delta < 0)) {
                pageCurrent -= delta;
                moveToPage(pageCurrent);
            }
        }
    }
    var moveToPage = function(index) {
        if (_pageDelay) {
            index = parseInt(index);
            pageCurrent = index;

            $(".front-page .page-pre,.front-page .page-next").removeClass("blur");
            if(pageCurrent == 0){
                $(".front-page .page-pre").addClass("blur");
            }else if(pageCurrent == (pageNum-1) ){
                $(".front-page .page-next").addClass("blur");
            }
            
            if(pageCurrent==0){
            	$("#contro").hide();
            }else{
            	$("#contro").show();
            }
            $(".animation-mark").removeClass("animated").hide();
            $("#section" + pageCurrent + " .animation-mark").show().addClass("animated");
            
            if(pageCurrent == (pageNum-1)){
                $("#boxwarp").trans({"top": (-100 * (index-1)) + "%","margin-top":"-88px","transition-duration":"1s"});
                
            }
            else{
                $("#boxwarp").trans({"top": (-100 * index) + "%","margin-top":"0","transition-duration":"1s"});
            }
//            $(".indoor_page_wrap").trans({"top": (-100 * index) + "%"});

			$.each($("div.progress-nav").find("li"),function(i,item){
				if(i==index){
					$(item).addClass("active");
				}else{
					$(item).removeClass("active");
				}
			});
			
            _pageDelay = false;
            setTimeout(function() {_pageDelay = true}, 1300)
        }
    }




    var init = function() {
        pageCurrent = 0;
        pageNum = $("#boxwarp .imgp").size();
        moveToPage(pageCurrent);
        $('body').mousewheel(function(event, delta) {
            event.preventDefault();
            if (delta > 0) {
                delta = 1;
            } else {
                delta = -1;
            }
            movePage(delta);
        })

        $(".front-page .page-pre").click(function(){
            if(pageCurrent != 0){
                moveToPage(pageCurrent-1);
            }

        })
        $(".front-page .page-next").click(function(){
            if(pageCurrent != (pageNum-1)){
                moveToPage(pageCurrent+1);
            }

        })
    }

    var winHeight = $(window).height(),winWidth = $(window).width();

    var imgSize = function(winWidth,winHeight){
        var percent = 2560/1400,winPercent = winWidth/winHeight;
        if(winPercent>percent){
            $(".tabs ul li img.bg").width(winWidth).height("auto");
        }
        else{
            $(".tabs ul li img.bg").width("auto").height(winHeight);
        }

    }

    $(document).ready(function() {
        init();
        imgSize(winWidth,winHeight);
        $(window).resize(function(){
            winHeight = $(window).height();
            winWidth = $(window).width();
            imgSize(winWidth,winHeight);
        })



    });


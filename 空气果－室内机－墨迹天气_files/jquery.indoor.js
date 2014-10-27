define(function(require){
    var $ = require('jquery'), slideE = require('page/mall/product/jquery.superslide.js'), mose = require('page/mall/product/jquery.mousewheel.js');

    $(".tabs").slide({ titCell:".num ul" , mainCell:".tabs-list" , effect:"fold", autoPlay:true, delayTime:1000 , autoPage:true });

    $(document).ready(function(){

        var oPop=$(".video-item li span");
        var oJD=$(".pop-wrap");
        var dialogClose=$(".pop-wrap .close");
        oPop.click(function(){
            var index = $(".video-item li").index($(this).parents("li"));
            $(".pop-bg").show()
            oJD.eq(index).show();
        })
        dialogClose.click(function(){
            $('.pop-wrap').hide();
            $(".pop-bg").hide();
        })
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

            if(pageCurrent == (pageNum-1)){
                $(".indoor_page_wrap").trans({"top": (-100 * (index-1)) + "%","margin-top":"-168px"});
            }
            else{
                $(".indoor_page_wrap").trans({"top": (-100 * index) + "%","margin-top":"0"});
            }
//            $(".indoor_page_wrap").trans({"top": (-100 * index) + "%"});

            _pageDelay = false;
            setTimeout(function() {_pageDelay = true}, 1300)
        }
    }




    var init = function() {
        pageCurrent = 0;
        pageNum = $(".indoor_page_wrap .indoor-page").size();
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

});

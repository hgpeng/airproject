/**
 * Created by sunlan on 14-5-9.
 */
define(function(require){
    var $ = require('jquery'), mse = require('page/mall/product/jquery.mousewheel.js');
    function navActive(){
        var indexlink = $("nav .nav-list a");
        var num = null;
        num = 0;
        for(i=1;i<indexlink.length;i++){
            if(window.location.href.indexOf(indexlink[i].href)>=0)
                num = i;
        }
        $("nav .nav-list a").eq(num).addClass("active").siblings().removeClass("active");
    }
    $(document).ready(function(){
        navActive();
    })

})

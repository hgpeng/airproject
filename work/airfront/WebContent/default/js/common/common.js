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
---
title:         jquery封装插件 # 标题
description:   jQuery封装通用的插件 # 副标题
date:          2017-11-13 # 建立日期
updated:       2017-11-13 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
    - jQuery
---

使用jQuery封装插件，此处我们只讲jquery的导入方法，不去理会import和export的导入导出，常见的如下：

## 通用方法封装
* 封装plugin1
```js
(function(root){
    var YQ = {};
    //  设置cookie
    YQ.setCookie =  function(name, value, day){
        var Days = day || 1;
        var exp = new Date();
        exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
    };

    // 获取cookie
    YQ.getCookie = function(name){
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if(arr=document.cookie.match(reg))
            return unescape(arr[2]);
        else
            return null;
    };

    //  获取链接参数
    YQ.getQuery =  function(item){
        var svalue = location.search.match(new RegExp('[\?\&]' + item + '=([^\&]*)(\&?)', 'i'));
        return svalue ? decodeURIComponent(svalue[1]) : '';
    };

    if(typeof root === "undefined"){
        root = {};
    }

    if(typeof root['YQ'] === 'undefined'){
        root.YQ = YQ;
    }else{
        YQ.extend(root.YQ, YQ);
    }

    if(typeof define === 'function' && define.amd){
        define([], function () {
            'use strict';
            return root.YQ;
        });
    }else if(typeof module !== 'undefined'){
        module.exports = root.YQ;
    }
}(window));
```

* 导入plugin1
```js
<script src="lib/plugin1.js"></script>
```

* 使用plugin1
```js
// 导入之后，可以直接使用YQ当中的任何方法

YQ.getQuery('a');
```



## 常见的插件封装
### 一般封装
* 封装plugin2
```js
/**
 * 封装插件demo
 */

// 自调用匿名函数包裹（块级作用域）
// 前面的;符号 的作用：分割代码，防止代码再合并压缩时出错
;(function() {
    /*
     * @param el: dom 元素
     * @param opt: 传入的配置项参数
     */
    var testObj = function (el, opt) {
        this.$element = el;
        this.defaults = {
            'color': 'red',
            'fontSize': '12px',
            'textDecoration': 'none'
        };
        this.options = $.extend({}, this.defaults, opt); // 拼接传入参数和默认参数
    };

    // 定义方法
    testObj.prototype = {
        changeClass: function() {
            return this.$element.css({
                'color': this.options.color,
                'fontSize': this.options.fontSize,
                'textDecoration': this.options.textDecoration
            });
        },
        methodA: function () {
            // ***
        },
        methodB: function () {
            // ***
        },
    };

    // 调用方法
    $.fn.myPlugin2 = function (options) {
        // 创建实体
        var testIndividual = new testObj(this, options);

        // 调用方法
        return testIndividual.changeClass();
    };
})();

```

* 导入plugin2
```html
<a href="#" id="testDom2">plugin2</a>

<script src="lib/plugin2.js"></script>
```

* 使用plugin2
```js
$('#testDom2').myPlugin2({
    'color': 'blue',
    'fontSize': '20px'
});
```



### 使用$.fn.a
使用$.fn.a(a表示方法名)逐一封装方法，可以写多个
* 封装plugin3.js
```js
;(function() {
    $.fn.myPlugin3 = function (opt) {
        var defaults = {
            Event: 'click',
            msg: 'Hello World'
        };

        var options = $.extend(defaults, opt);
        // var $this = $(this);
        var $this = this; // fn中的this已经是个jquery对象，无需使用$(this)来获取

        // 绑定事件
        $this.on(options.Event, function(e) {
            alert(options.msg);
        });
    }
})();
```

* 导入plugin3
```html
<button id="testDom3">plugin3</button>

<script src="lib/plugin3.js"></script>
```

* 使用plugin3
```js
$('#testDom3').myPlugin3({
    Event: 'click',
    msg: '12112'
});
```



### 使用$.fn.extend
使用$.fn.extend可以同时注册多个方法
* 封装plugin4
```js
;(function() {
    $.fn.extend({
        check: function() {
            return this.each(function() {
                this.checked = true;
            });
        },
        uncheck: function() {
            return this.each(function() {
                this.checked = false;
            });
        }
    });
})();
```


* 导入plugin4
```html
<script src="lib/plugin4.js"></script>
```


* 导入plugin4
```js
$("input[type='checkbox']" ).check();

$("input[type='checkbox']" ).uncheck();
```



### 使用$.fn.a传参（方法名）
使用$.fn.a传参来注册多个方法
* 封装plugin5
```js
(function($) {
    // $.fn.tooltip = function (options) {
        // this
    // };
    // $.fn.tooltipShow = function () {
        // is
    // };
    // $.fn.tooltipHide = function () {
        // bad
    // };
    // $.fn.tooltipUpdate = function (content) {
        // !!!
    // }


    // 上面的方式是不被鼓励的写法，会使$.fn命名空间混乱，可以收集所有方法，通过传参来调用它们

    var methods = {
        init: function (options) {

        },
        show: function () {

        },
        hide: function () {

        },
        update: function (content) {

        }
    };

    $.fn.tooltip = function(methods) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method' + method + 'does not exist on jQuery.tooltip');
        }
    }
})(jQuery);
```

* 导入plugin5
```html
<script src="lib/plugin5.js"></script>
```

* 使用plugin5
```js
// 调用init方法（无参数）:
$('div').tooltip();

// 调用init方法（带参数）:
$('div').tooltip({
    foo: 'bar'
});

// 调用hide方法:
$('div').tooltip('hide');

// 调用update方法:
$('div').tooltip('update', '****');
```

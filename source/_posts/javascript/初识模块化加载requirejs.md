---
title:         初识requirejs # 标题
description:   初识JS模块化工具requirejs # 副标题
tags: # 标签分类
    - JavaScript
---


在浏览器中可以作为js文件的模块加载器，也可以用在Node和Rhino环境。

## 初识requirejs

先看一个小demo：

index.html:
```html
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="a.js"></script>
    </head>
    <body>
      <span>body</span>
    </body>
</html>
```

a.js:
```js
function fun1(){
    alert("it works");
}

fun1();

// 或 使用块作用域来申明function防止污染全局变量
(function(){
    function fun1(){
        alert("it works");
    }

    fun1();
})()
```

运行结果：
alert执行的时候，页面上的span元素还未显示。这是因为js阻塞浏览器渲染，导致body内容未能被读取。



requirejs写法:
先去[require官网](http://requirejs.org)下载js
index.html:
```html
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="require.js"></script>
        <script>
            require(["a"]);
        </script>
    </head>
    <body>
      <span>body</span>
    </body>
</html>
```

a.js:
```js
define(function () {
    function func1 () {
      alert('it works');
    }

    func1();
})
```

运行结果：
alert执行的时候，页面能正常显示body了


这个时候可以知道require的优点：
1.防止js加载阻塞页面渲染
2.管理模块之间的依赖性，便于代码的编写和维护，防止出现如下丑陋的场景。这种写法需要将依赖最大的放在最后加载，如j.js依赖前面的js，就必须放到最后，当关系很复杂时，极难维护。
```js
<script type="text/javascript" src="a.js"></script>
<script type="text/javascript" src="b.js"></script>
<script type="text/javascript" src="c.js"></script>
<script type="text/javascript" src="d.js"></script>
<script type="text/javascript" src="e.js"></script>
<script type="text/javascript" src="f.js"></script>
<script type="text/javascript" src="g.js"></script>
<script type="text/javascript" src="h.js"></script>
<script type="text/javascript" src="i.js"></script>
<script type="text/javascript" src="j.js"></script>
```




## 基本API
require会定义三个变量：define、require、requirejs，require = requirejs，一般使用require更简短

* define 用来定义一个模块
define后面也可以增加参数["jqueyr"],即保证jquery加载完成后读取该js文件
```
define(["jquery"], function ($) {
    console.log('it is loaded')
})
```

* require 加载依赖模块，并执行加载后的回调函数

require(["js/a.js", "js/b.js"])的第一个参数时一个数组，即加载的脚本，第二个参数时callback，处理加载完毕后的回调
```js
require(["js/a.js", "js/b.js"], function () {
    console.log('load finished');
})
```



## 加载文件
使用require()来加载模块的使用只能加载本地js，但如果需要加载服务器、其他网站或CDN，就需要用require.config来配置加载
```js
require.config({
    paths: {
        "jquery": ["https://cdn.bootcss.com/jquery/2.2.4/jquery"], // 或省略中括号
        "bootstrap": ["https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap"]
    }
});

require(["jquery", "js/a.js"], function ($) {
    $(function () {
        console.log('load finished');
    })
});
```

require.config 用来配置加载位置，给模块起一个更短更好记的名字，配置别名之后就可以再require中使用别名了。
注意：require中的可以带.js后缀；paths中的路径不能带.js后缀，否则会报错，paths中的每个别名对应的js如果只有一个时可以省略中括号；

require.config 中也可以用来配置本地的js

```js
require.config({
    paths: {
        "jquery": ["https://cdn.bootcss.com/jquery/2.2.4/jquery"],
        "bootstrap": ["https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap"],
        "a": "js/a"
    }
});

require(["jquery", "a"], function ($) {
    $(function () {
        console.log('load finished');
    })
});
```

最终渲染成下面这样：
```js
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="jquery" src="http://cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="a" src="./a.js"></script>
```


通过require.config配置模块名称时可以配置多个路径，比如配置一个CDN路径，再配一个本地的库
```js
require.config({
    paths: {
        "jquery": ["https://cdn.bootcss.com/jquery/2.2.4/jquery", 'js/jquery'],
        "a": "js/a"
    }
});
require(["jquery", "a"], function ($) {
    $(function () {
        console.log('load finished');
    })
});
```

当paths中都是本地路径时，可以指定一个baseUrl表示目录
```js
require.config({
    baseUrl: "js/lib",
    paths: {
        "jquery": jquery',
        "a": "a"
    }
});
require(["jquery", "a"], function ($) {
    $(function () {
        console.log('load finished');
    })
});
```

上例中require的callback中的参数$是jquery模块的输出变量，如果依赖多个模块，可以依次写入多个参数。将需要输出的模块写在前面，位置不能错乱。
```js
require(["jquery", "underscore", "js/a"], function($, _) {
    $(function () {
        _.each([1,2,3], alert);
    });
})
```




## 全局配置
require.config配置如果在每个页面中都加入，显然会十分不雅，requirejs提供了一种叫”主数据“的功能，我们首先创建一个main.js：
```js

require.config({
    paths: {
        "jquery": ["https://cdn.bootcss.com/jquery/2.2.4/jquery", 'js/jquery'],
        "a": "js/a"
    }
});
```
然后在页面中使用下面的方式来使用requirejs：
```js
<script data-main="js/main src="js/require.js"></script>
```
data-main属性表示指定的js将在加载完require.js后处理，我们把require.config的配置加入到data-main后，就可以使每一个页面都使用这个配置，然后页面中就可以直接使用require来加载所有的短模块名
data-main还有一个功能，当script标签指定data-main属性时，require会默认将data-main指定的js为根路径。如上面的data-main="js/main"设定后，我们在直接使用require(["jquery"])，而不是require(["js/jquery"])，require会自动加载js/jquery这个文件，而不是jquery.js。
相当于默认配置了：
```js
require.config({
    baseUrl: 'js'
});
```


## 第三方模块
通过require加载的模块一般都要符合AMD规范及使用define来申明模块，但是部分时候需要加载非AMD规范的js，这时候就需要用到另一个功能：shim，中文意思”垫“.

1、非AMD模块输出，例如，在老版本的jquery中，是没有继承AMD规范的，所以不能只能require(["jquery"])，这个时候就需要用到 shim，比如要使用underscore类库，但是它并没有实现AMD规范，可以这样配置
```js
requier.config({
    shim: {
        "underscore": {
            export: "_"
        }
    }
})
```
这样配置后，我们就可以再其他模块中引用underscore模块：
```js
require(["underscore"], function (_) {
    _.each([1, 2, 3], alert)
})
```

2、插件形式的非AMD模块，我们经常会用到jquery的插件，而这些插件基本都不符合AMD规范比如，jquery的form插件，这时候就需要将form插件”垫“到jquery中
```js
require.config({
    shim: {
        "underscore" : {
            exports : "_";
        },
        "jquery.form" : {
            deps : ["jquery"]
        }
    }
});
```
也可以简写成：
```js
require.config({
    shim: {
        "underscore" : {
            exports : "_";
        },
        "jquery.form" : ["jquery"]
    }
});
```

exports表明该模块外部调用时的名称，deps数组表示该模块的依赖

这样配置之后我们就可以使用加载插件后的jquery了
```js
require.config(["jquery", "jquery.form"], function($){
    $(function(){
        $("#form").ajaxSubmit({...});
    })
});
```



>来源：[runoob文档](http://www.runoob.com/w3cnote/requirejs-tutorial-1.html)
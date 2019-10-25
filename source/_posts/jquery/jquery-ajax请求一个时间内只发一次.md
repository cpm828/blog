---
title:         jquery-ajax请求一个时间内只发一次 # 标题
description:   jquery-ajax请求一个时间内只发一次 # 副标题
date:          2017-04-04 # 建立日期
updated:       2017-04-04 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - jQuery
---


## 问题解决
解决这种问题有两种方式：
* 当连续进行多个请求，并且请求的url地址相同时。放弃前面的所有请求，只执行最后一次请求。
* 当连续进行多个请求，并且请求的url地址相同时。放弃后面的所有请求，只执行第一次请求。


## 解决方案

* 将ajax请求的async设置为false
```js
  $.ajax({
   async: false,
   type : "POST",
   url : defaultPostData.url,
   dataType : 'json',
   success : function(data) {

   }
  });
  ```
  async:
  类型：Boolean
  默认值: true。默认设置下，所有请求均为异步请求。如果需要发送同步请求，请将此选项设置为 false。
  注意，同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行。


* 利用jquery ajaxPrefilter中断请求

由于第一种方案只是一种曲线救国的方式，其实没能真正的解决上面的问题。所以，建议使用这种方式。
  ```js
  var pendingRequests = {};
  $.ajaxPrefilter(function( options, originalOptions, jqXHR ) {
    var key = options.url;
    console.log(key);
    if (!pendingRequests[key]) {
      pendingRequests[key] = jqXHR;
    }else{
      //jqXHR.abort(); //放弃后触发的提交
      pendingRequests[key].abort(); // 放弃先触发的提交
    }

    var complete = options.complete;
    options.complete = function(jqXHR, textStatus) {
      pendingRequests[key] = null;
      if ($.isFunction(complete)) {
        complete.apply(this, arguments);
      }
    };
  });
  ```

  Prefilters是一个预过滤器，在每个请求之前被发送和$.ajax()处理它们前处理。

  options 是请求的选项
  originalOptions 值作为提供给Ajax方法未经修改的选项，因此，没有ajaxSettings设置中的默认值
  jqXHR 是请求的jqXHR对象
  以上内容的核心思想是维护一个队列，发送请求时，将请求加入队列，请求响应后，从队列中清除，这就保证了在任一时刻只能有一个同样的请求发送.

  局限性：仅仅是前台防止jquery的ajax请求。对于非jquery的ajax请求，不起作用。因为使用的是jquery的ajaxPreFilter函数，仅仅对jquery的ajax请求有作用。

  调用abort后jquery会执行error的方法，抛出abort的异常信息。可以使用以下方式区分出该类型的异常。
  ```js
  var ajax = $.ajax({
   'error':function(jqXHR, textStatus, errorThrown){
    if(errorThrown != 'abort'){
     //ajax被调用abort后执行的方法
     alert('您的ajax方法被停止了');
    }
   }
  })
  ```

## Demo

按钮每次点击都会向后端发送请求，下面的demo实现了多次点击按钮之后，只保证最后一次点击的请求能够成功。
```html
<button id="button1">button1</button>
<button id="button2">button2</button>
<button id="button3">button3</button>  
<script>
  var pendingRequests = {};
  jQuery.ajaxPrefilter(function( options, originalOptions, jqXHR ) {
   var key = options.url;
   console.log(key);
   if (!pendingRequests[key]) {
    pendingRequests[key] = jqXHR;
   }else{
    //jqXHR.abort(); //放弃后触发的提交
    pendingRequests[key].abort(); // 放弃先触发的提交
   }

   var complete = options.complete;
   options.complete = function(jqXHR, textStatus) {
    pendingRequests[key] = null;
    if (jQuery.isFunction(complete)) {
    complete.apply(this, arguments);
    }
   };
  });
  <!-- 异步加载应用列表开始 -->

  $("#button1").live("click", function() {
    $.ajax('config/ajax/appinfoListFetcher.json', {
    type:'POST',
    data: {param1:value1,
       param2:value2,
      },
    success: function(res){
      //后端数据回写到页面中
    },
    error:function(jqXHR, textStatus, errorThrown){
     if(errorThrown != 'abort'){
      //ajax被调用abort后执行的方法
      alert('应用加载失败！');
     }
    }
    });
    <!-- 异步加载应用列表结束 -->
   });
</script>
```

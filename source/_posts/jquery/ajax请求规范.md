---
title:         ajax规范 # 标题
description:   ajax请求规范 # 副标题
date:          2017-03-31 # 建立日期
updated:       2017-03-31 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - jQuery
---


```js
$.ajax({
  url: '',
  type: '',
  dataType: 'json',
  timeout: 3000,
  data: {
    num1: num1,
    num2: num2
  },
  beforeSend: function(xhr, settings) {
    // 发送请求前
    console.log('beforeSend', xhr, settings);
  },
  success: function(data, status, xhr) {
    // 请求成功
    console.log('success', data, status, xhr);
    if (data.code === 200) {
      console.log('处理成功');
    } else {
      console.log('处理失败');
    }
  },
  error: function(xhr, errorType, error) {
    // 请求失败
    console.log('error', xhr, errorType, error);
    alert('请求失败');
  },
  complete: function(xhr, status) {
    // 请求成功或失败都执行
    console.log('complete', xhr, status);
  }
});
```

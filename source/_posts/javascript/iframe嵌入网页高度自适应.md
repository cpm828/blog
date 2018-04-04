---
title:         iframe嵌入网页高度自适应 # 标题
description:   iframe嵌入网页高度自适应 # 副标题
date:          2017-04-01 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---


原理：
1、使用document.body.scrollHeight获取iframe的高度，作为hash添加给window.top.location
2、在主页面获取window.top.location的hash值，再将该值赋给iframe高度

iframe中：
```js
var hostUrl = window.top.location.toString().split("#")[0]; // 去除hash后的字符串
if (hostUrl) {
  hostUrl += "#height=" + document.body.scrollHeight; // 将高度存放在hash中
  window.top.location = hostUrl;
}
```

主页面中：
```js
function iframeHeight() {
  var hash = window.location.hash.slice(1); // 获取第一个hash，即iframe存在地址栏的hash参数
  if (hash && /height=/.test(hash)) {
    document.getElementById('iframePage').height = hash.replace("height=", "");
  }
  setTimeout(iframeHeight, 200);
}

iframeHeight();
```

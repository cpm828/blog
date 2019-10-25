---
title:         js动态插入link标签 # 标题
description:   js动态插入link标签，通过js来加载样式 # 副标题
date:          2017-04-03 # 建立日期
updated:       2017-04-03 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---


```js
var includeCss = function(url) {
  var link = document.createElement("link");
  link.rel = "stylesheet";
  link.type = "text/css";
  link.href = url;
  document.getElementsByTagName("head")[0].appendChild(link)
};
includeCss("./css/Mdate.css");
```
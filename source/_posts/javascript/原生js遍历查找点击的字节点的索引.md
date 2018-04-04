---
title:         原生js遍历查找点击的字节点的索引 # 标题
description:   原生js遍历查找点击的字节点的索引 # 副标题
date:          2017-04-06 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---


```js
var indexLis = document.getElementsByClassName('index-li');
for(var i = 0; i < indexLis.length; i++) {
  indexLis[i].setAttribute("index", i);
  indexLis[i].onclick = function () {
    alert('我是第' + this.getAttribute("index") + '个li';
  }
}
```

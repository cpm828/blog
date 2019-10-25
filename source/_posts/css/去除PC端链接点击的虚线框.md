---
title:         去除链接点击后的虚线框 # 标题
description:   js去除PC端链接点击后出现的虚线框 # 副标题
date:          2017-04-03 # 建立日期
updated:       2017-04-03 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - CSS
---

使用for循环遍历所有的链接，聚焦的时候同时失去焦点
```js
for(var i = 0; i < document.links.length; i++) {
  document.links[i].onfocus = function () {
    this.blur()
  }
}
```

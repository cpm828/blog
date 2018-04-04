---
title:         解决ios在增加overflow_hidden时的滑动不流畅问题 # 标题
description:   解决ios在增加overflow_hidden时的滑动不流畅问题 # 副标题
comments:      true  # 开启评论功能
tags: # 标签分类
    - CSS
---


在移动端html中有时需要使用横向或纵向滑动，我们会增加`over:scroll;`

但是在ios中，滚动速度会变慢，不流畅，在安卓上没有这种感觉

解决办法：
```
-webkit-overflow-scrolling : touch;
```

据说会多消耗内存

但是有了流畅的感觉，who care the memory ^_^

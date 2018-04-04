---
title:        当锚点遇上顶部header占位的解决办法 # 标题
description:  当锚点遇上顶部header占位的解决办法  # 副标题
date:         2017-04-03 # 建立日期
comments:     true  # 开启评论功能
tags: # 标签分类
    - HTML
---


>http://www.ydcss.com/archives/209

背景：在开发PC网站时，有时我们会遇到需要增加锚链接的情况，但是PC网站一般都设有header区域，正常的锚链接跳转会定位到顶部，便会挡住一部分，所以需要考虑解决它，让用户的体验更好

原理：给“锚点内容”加上
```css
padding-top:80px; // 80为header的高度
margin-top:-80px;
```
即解决我们的问题

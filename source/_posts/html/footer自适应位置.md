---
title:        footer自适应底部位置 # 标题
description:  footer部分自适应页面底部位置  # 副标题
date:         2017-04-03 # 建立日期
updated:      2017-04-03 # 更新日期
comments:     true  # 开启评论功能
tags: # 标签分类
    - HTML
---


对于页面的footer部分，有时有这样的需求
1、footer始终固定在页面的底部。
2、当页面内容少于一屏时显示在页面底部，多于一屏时跟随内容前进，在内容的底部。

对于1来说，直接定位在底部就可以
对于2来说，就需要考虑情况了，我们可以使用css来解决这种情况

解决办法：margin + padding + min-height
* 中间主体部分使用min-height：100% ，padding上下为header和footer的高度
*  header使用margin-bottom为负的高度，footer使用margin-top为负的高度
* 中间区域最小高度为一屏，小于一屏时显示一屏高度，大于一屏时为内容高度

html：
```
<div class="header">头部</div>
<div class="content"></div>
<div class="footer">底部</div>
```

css:
```css
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
html,body {
  height: 100%;
}
.header {
  height: 80px;
  margin-bottom: -80px;
  background: #1381cc;
  color: #FFF;
  position: relative;
}
.content {
  background: #CCC;
  min-height: 100%;
  padding: 80px 0 100px;
}
.footer {
  height:100px;
  margin-top: -100px;
  background: #0c4367;
  color: #FFF;
}
```

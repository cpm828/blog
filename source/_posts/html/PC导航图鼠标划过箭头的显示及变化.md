---
title:        PC端导航条上二级菜单的提示箭头 # 标题
description:  PC端导航条上二级菜单的提示箭头的实现（使用字体实现）  # 副标题
date:         2017-04-03 # 建立日期
comments:     true  # 开启评论功能
tags: # 标签分类
    - HTML
---


>[字体下载](https://pan.baidu.com/s/1o7GjMvK)

```css
@font-face{
  src: url('../font/arrow.ttf');
  font-family: 'arrow';
}
```

```css
*:after {
  box-sizing: border-box;
}
.user-mail:after{
  content: "\e602";
  position: absolute;
  top: 50%;
  right: 0;
  transform: translate(0, -50%);
  font-family: 'arrow'; /*自定义字体来显示小图标*/
  font-style: normal;
  font-weight: normal;
  font-variant: normal;
  text-transform: none;
  line-height: 1;
  vertical-align: middle;
}
.user-mail:hover:after{
  content: "\e603";
}
```

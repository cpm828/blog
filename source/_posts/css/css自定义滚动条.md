---
title:         css自定义滚动条 # 标题
description:   css自定义滚动条样式，滚动条漂亮起来吧 # 副标题
date:          2017-04-03 # 建立日期
updated:       2017-04-03 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - CSS
---

>http://www.xuanfengge.com/css3-webkit-scrollbar.html

CSS3自定义滚动条样式 -webkit-scrollbar
```css
/*定义滚动条高宽及背景 高宽分别对应横竖滚动条的尺寸*/
::-webkit-scrollbar{
  width: 0.8rem;
  height: 0.8rem;
  background-color: #eee;
}

/*定义滚动条轨道 内阴影+圆角*/
::-webkit-scrollbar-track{
  -webkit-box-shadow: inset 0 0 0.4rem rgba(0,0,0,0.3);
  border-radius: 0.8rem;
  background-color: #eee;
}

/*定义滑块 内阴影+圆角*/
::-webkit-scrollbar-thumb{
  border-radius: 0.8rem;
  -webkit-box-shadow: inset 0 0 0.4rem rgba(0,0,0,.3);
  background-color: #ccc;
}
```

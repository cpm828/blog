---
title:         img或div在设置正圆时不圆的处理 # 标题
description:   img或div在设置正圆时不圆的处理 # 副标题
date:          2017-04-04 # 建立日期
updated:       2017-04-04 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - CSS
---


## img
  - 问题：img设置border-radius: 50%时，当img宽高比较小时，在一些手机上的圆角加边框时，img留有空白
  - 解决办法：在img外面套一个div，div设置box-sizing: content-box或padding-box即可，当box-sizing设置为border-box时，不能实现


## div
  - 问题：在一些低版本手机上，如安卓4.2, 设置border-radius:50%,背景会超出，仍然显示一个矩形
  - 解决办法：给div设置background-clip: content-box或padding-box即可，将多余的背景裁掉

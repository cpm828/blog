---
title:         CSS盒模型 # 标题
description:   三种盒模型详解 # 副标题
date:          2017-04-04 # 建立日期
updated:       2017-04-04 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - CSS
---



## content-box（默认）
`box-sizing: content-box;` 只算内容，表示`padding`、`border`、`margin`不计算在设置的`width`和`height`中
即 盒模型宽度 = `content` + `padding` + `border` + `margin`


## padding-box（不常用）
`box-sizing: padding-box;` 从`padding`开始算，表示`padding`计算在设置的`width`和`height`中
即 盒模型宽度 = `content` + `border` + `margin`


## border-box（特殊盒模型、开发常用）
`box-sizing: border-box;`  表示`padding`、`border`计算在设置的`width`和`height`中
即 盒模型宽度 = `content` + `margin`


开发时常在根元素设置：`box-sizing: border-box;` 其余元素，设置`box-sizing: inherit;`继承根部的

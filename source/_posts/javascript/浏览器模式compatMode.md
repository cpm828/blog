---
title:         浏览器模式compatMode # 标题
description:   浏览器模式documentcompatMode # 副标题
date:          2019-11-26 # 建立日期
updated:       2019-11-26 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---

## 浏览器有两种模式

- 标准（严格）模式
- 怪异（混杂）模式

## 如何判断浏览器当前的模式

`document.compatMode` 可判断模式类型：
- 值为 `CSS1Compat`：标准模式
- 值为 `BackCompat`：怪异模式

不同模式下，js的方法有可能不同，如：

- 标准模式：
  浏览器可视宽度：`document.documentElement.clientWidth`
  浏览器可视高度：`document.documentElement.clientHeight`
- 怪异模式：
  浏览器可视宽度：`document.body.clientWidth`
  浏览器可视高度：`document.body.clientHeight`
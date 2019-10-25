---
title:         ES7 求幂运算 # 标题
description:   es7求幂运算解析 # 副标题
date:          2018-10-22 # 建立日期
updated:       2018-10-22 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - ES7
---

ES7只新增了2个新特性
* `Array.prototype.includes`
* Exponentiation Operator(求幂运算)

本文只讲解ES7求幂运算，includes方法请移步[ES7 includes](/es7/es7-includes方法.html)

在ES6中，可以使用`Math.pow`来实现求幂运算
```js
Math.pow(2, 3); // 8
Math.pow(3, 2); // 9
```

ES7中，可以使用`**`来实习求幂运算
```js
2 ** 3 // 8
3 ** 2 // 9
```
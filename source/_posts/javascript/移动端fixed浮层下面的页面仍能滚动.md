---
title:         移动端fixed浮层下面的页面仍能滚动 # 标题
description:   移动端fixed浮层下面的页面仍能滚动的解决办法 # 副标题
date:          2017-04-04 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---



在弹窗弹出的时候：
```js
document.body.style.overflow = 'hidden';

// 或：

$('body').css('overflow', 'hidden');
```

在弹窗隐藏的时候：
```js
document.body.style.overflow = 'initial';

// 或：

$('body').css('overflow', 'initial'); // 或改为auto
```

对于多个fixed弹窗，可以写个遍历函数，遍历当某个fixed元素显示的时候将body的滚动禁止

>参考资料：https://segmentfault.com/q/1010000002942948

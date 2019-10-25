---
title:         js判断安卓版本号 # 标题
description:   js利用ua判断安卓版本号 # 副标题
date:          2017-04-03 # 建立日期
updated:       2017-04-03 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---

```
var ua = window.navigator.userAgent.toLowerCase();

ua.substr(ua.indexOf('android') + 8, 3)
```
---
title:         js判断安卓版本号 # 标题
description:   js利用ua判断安卓版本号 # 副标题
tags: # 标签分类
    - JavaScript
---

```
var ua = window.navigator.userAgent.toLowerCase();

ua.substr(ua.indexOf('android') + 8, 3)
```
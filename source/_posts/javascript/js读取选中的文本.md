---
title:         js读取选择的文本 # 标题
description:   js读取选择的文本，如滑词翻译 # 副标题
date:          2020-04-29 # 建立日期
updated:       2020-04-29 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---


在使用滑词翻译插件的时候，能看到当鼠标选择某段文本的时候就能对其进行翻译，那么背后的原理是什么呢？

当选中一段文本的时候，通过 `window.getSelection()` 或 `document.getSelection()` 可以获得一个Selection对象，用于表示用户选择的文本范围或插入符的当前位置。

```js
var selection = window.getSelection() 

var selection = document.getSelection() 

/**
 * 除了能读取选择的文本，还能读取该文本所在标签内所有的内容
 */
```

通过附加空字符串、调用 `Selection.toString()` 、调用 `String()` 方法来获取选中的文本
```js
var selectedText = selection + ''

var selectedText = String(selection)

var selectedText = selection.toString()
```

更多参数参考：https://blog.csdn.net/weixin_42420703/article/details/84892528
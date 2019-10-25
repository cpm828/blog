---
title:         解决checkbox复选框点击label会触发两次的bug # 标题
description:   解决checkbox复选框点击label会触发两次的bug # 副标题
date:          2017-08-03 # 建立日期
updated:       2017-08-03 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
    - Vue
---



通常我们使用checkbox的时候都会增加一个label帮助点击，如
```
<div id="box" @click="selectCheckbox($event)">
  <input type="checkbox">
  <label for="">click checkbox</label>
</div>
```

点击当我们需要js去处理相应的点击事件时，我们会发现点击checkbox复选框本身并无问题，但是点击label时会发生事件冒泡触发两次的bug，解决办法：

1、去除label，呵呵，没意思

2、点击div的时候，判断事件源，忽略label事件源
```js
selectCheckbox: function selectCheckbox (event) {
  // 根据事件源阻止label事件会触发两次的bug
  var ev = event || window.event;
  var eTarget = ev.target || ev.srcElement;

  if (!$(eTarget).is('input')) return false;

  // 正常处理
  // 判断是否选中
  var isSelect = $('#box').find('input').is(":checked");
  // var isSelect = $('#box').find('input').prop("checked");
  if (isSelect) { // 如果是勾选
    console.log('勾选');
    // request
  } else { // 如果是去除
    console.log('去除');
    // request
  }
}
```
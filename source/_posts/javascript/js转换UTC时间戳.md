---
title:         js转换UTC时间戳 # 标题
description:   js将UTC时间转化成普通时间：年月日时分秒 # 副标题
date:          2018-12-19 # 建立日期
updated:       2018-12-19 # 更新日期
tags: # 标签分类
    - JavaScript
---


有时候前端会收到后端返回的时间格式是UTC时间戳格式的，但是他们又不愿意修改，将工作丢给前端，累觉不爱。

我们可以引入一个moment.js插件来快速处理时间格式，但是有时候我们不太方便去引入一个脚本，我们可以使用js来解析它：

转换成年月日
```js
// UTC时间戳转换成年月日(2017-08-01)
function resolveUTCDate (utcData) {
  var myDate = new Date(utcData);
  var year = myDate.getYear();
  var month = ('0' + (myDate.getMonth() + 1)).slice(-2);
  var day = ('0' + myDate.getDate()).slice(-2);
  return year + '-' + month + '-' + day;
}
```


转换成时分秒
```
// UTC时间戳转换成时分秒(08:08:08)
function resolveUTCTime(utcTime) {
  var myDate = new Date(utcTime);
  var hours = ('0' + myDate.getHours()).slice(-2);
  var minutes = ('0' + myDate.getMinutes()).slice(-2);
  var seconds = ('0' + myDate.getSeconds()).slice(-2);
  return hours + ':' + minutes + ':' + seconds;
}
```
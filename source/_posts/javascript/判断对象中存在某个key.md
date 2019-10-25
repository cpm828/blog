---
title:         js判断对象object中存在某个key # 标题
description:   js判断对象object中存在某个key值，检测存不存在 # 副标题
date:          2019-03-03 # 建立日期
updated:       2019-03-03 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---


判断某个object中是否存在某个key，此处不作value真实值判断，key存在即可。

```
var obj = {
  a: "Jack",
  b: "Mark",
  methodA: function () {

  },
  methodB: function () {

  }
}
```

* 直接取key（返回vlaue/undefined）
```js
if (obj && obj.a) {
  // 存在的处理
}

if (obj && obj.methodA) {
  // 存在的处理
}
```

* []取值（返回value/undefined）
```js
if (obj && obj["a"]) {
  // 存在的处理
}

if (obj && obj["methodA"]) {
  // 存在的处理
}
```

* in 关键字（返回true/false）
```js
if (obj && "a" in obj) {
  // 存在的处理
}

if (obj && "methodA" in obj) {
  // 存在的处理
}
```

* hasOwnProperty判断属性是否存在（返回true/false）
```js
if (obj && obj.hasOwnProperty("a")) {
  // 存在的处理
}

if (obj && obj.hasOwnProperty("methodA")) {
  // 存在的处理
}
```


注：
方法1和方法2通过取值的方式不够稳妥，假如改key的真实取值就是undefined，那么便会出问题，方法3和方法4比较靠谱。
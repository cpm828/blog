---
title:         console打印对象时奇怪的现象 # 标题
description:   使用console.log打印对象时，点击展开出现奇怪的现象 # 副标题
date:          2020-02-24 # 建立日期
updated:       2020-02-24 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---

在console执行这一段代码
```js
var obj = {
  a: 1,
  b: 2,
  c: 3
}
console.log(obj)
obj.a = 11
console.log(obj)
```

如下图：
<img src="../images/javascript/js_obj_console1.png" title="console.log打印对象" />

但是当我们展开第一个输出的对象时，会返现一个奇怪的现象，里面的a从1变成了11
<img src="../images/javascript/js_obj_console2.png" title="console.log打印对象" />

原因：
在执行console.log的时候，chrome会对变量obj求一次值，输出到控制台。当点击展开时，又会继续对这个变量求一次值，显示它的属性，但是这个因为这个时候对象引用的值已经改变了，所以会显示新的值。

如果需要详细的看出前后的变化，可以使用 `JSON.stringify(obj)` 来打印obj。


<br><br>

再额外介绍一个小功能：
当我们需要复制控制台输出的对象时，可以右键对象，点击出现的 `Store as global variable`，控制台会自动出现一个temp1的全局变量，执行 `copy(temp1)` 就可以复制到剪切板了。
---
title:         knockout初始化 # 标题
description:   knockout初始化，第一个例子 # 副标题
date:          2017-08-21 # 建立日期
updated:       2017-08-21 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - KnockOut
---

KnockOut是一个优秀的MVVM JavaScript库，由微软提出。
虽然语法相较于目前市面上的Vue、React稍稍落后，但是好在兼容性极好，兼容到IE6，是一些兼容性要求高的开发首选。

>KnockOut官方文档：http://knockoutjs.com/index.html
>CDN:https://cdn.bootcss.com/knockout/3.4.2/knockout-min.js
## demo1(变量式绑定)
```html
<h3>1、变量式绑定</h3>
<p>First Name : <span data-bind="text: firstName1"></span></p>
<p>Last Name : <span data-bind="text: lastName1"></span></p>
<p>Last Name : <input data-bind="value: firstName1" /></p>
<p>Last Name : <input data-bind="value: lastName1" /></p>
```

```js
var viewmodel1 = {
  // 单向绑定
  // firstName: 'John1',
  // lastName: 'Pei1'

  // 双向绑定
  firstName1: ko.observable('John1'),
  lastName1: ko.observable('Pei1')
}

// 开始绑定
ko.applyBindings(viewmodel1);
```

## demo2(函数式绑定)
```html
<h3>1、变量式绑定</h3>
<p>First Name : <span data-bind="text: firstName2"></span></p>
<p>Last Name : <span data-bind="text: lastName2"></span></p>
<p>Last Name : <input data-bind="value: firstName2" /></p>
<p>Last Name : <input data-bind="value: lastName2" /></p>
```

```js
function viewModel2() {
  // this.firstName2 = 'John2'
  // this.lastName2 = 'Pei2'

  this.firstName2 = ko.observable('John2');
  this.lastName2 = ko.observable('Pei2');
}
ko.applyBindings(viewModel2());
```


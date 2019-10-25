---
title:         knockout使用script内嵌模板 # 标题
description:   knockout使用script内嵌模板 # 副标题
date:          2017-11-02 # 建立日期
updated:       2017-11-02 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - KnockOut
---

## HTML
```html
<div>
  <!-- 载入tempalte模板，name属性对应module Id -->
  <div data-bind="template: {name: 'testTemplate1', if: showModuleIndex() === 1}"></div>
  <div data-bind="template: {name: 'testTemplate2', if: showModuleIndex() === 2}"></div>
</div>

<!-- module1 -->
<script id="testTemplate1" type="text/html">
  <div>
    <h2 data-bind="text: title1"></h2>
    <p data-bind="text: para1"></p>
    请输入姓名：<input type="text" data-bind="value: inputText1, valueUpdate: 'keyup'"><br>
    <p data-bind="text: inputText"></p>
    <button>提交</button>
  </div>
</script>

<!-- module2 -->
<script id="testTemplate2" type="text/html">
  <div>
    <h2 data-bind="text: title2"></h2>
    <p data-bind="text: para2"></p>
    请输入姓名：<input type="text" data-bind="value: inputText2, valueUpdate: 'keyup'"><br>
    <button>提交</button>
  </div>
</script>
```

## JS
- 写法1: 属性法
```js
var viewModel = function () {
  var self = this;

  self.title1 = ko.observable('我就是模板标题1');
  self.title2 = ko.observable('我就是模板标题2');
  self.para1 = ko.observable('我是段落1');
  self.para2 = ko.observable('我是段落2');
  self.inputText1 = ko.observable('');
  self.inputText2 = ko.observable('');
  self.showModuleIndex = ko.observable(1);

  self.showModule = function (index, data) {
    self.showModuleIndex(index);
  };
};

ko.applyBindings(viewModel(), document.getElementById('body'));
```

- 写法2: extend法
```js
var viewModel = function () {
  var self = this;

  $.extend(self, {
    title1: ko.observable('我就是模板标题1'),
    title2: ko.observable('我就是模板标题2'),
    para1: ko.observable('我是段落1'),
    para2: ko.observable('我是段落2'),
    inputT: ko.observable(''),
    inputT: ko.observable(''),
    showModuleIndex: ko.observable(1),
    showModule: function (index, data) {
      self.showModuleIndex(index);
    },
  })；
};

ko.applyBindings(new viewModel(), document.getElementById('body'));
```

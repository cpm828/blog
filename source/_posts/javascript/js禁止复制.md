---
title:         js禁止复制 # 标题
description:   js禁止复制 # 副标题
date:          2017-04-05 # 建立日期
updated:       2017-04-05 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---


在做移动端开发的时候，用户禁止会误触页面上的文字，然后会提示复制等操作，体验非常不好，所以我们需要将它禁用掉

## 禁止复制

js部分：控制键盘、选中、右键，可在html head区域或js中

```js
<script>
document.oncontextmenu=stop;
document.ondragstart=stop;
document.onselectstart=stop;
document.onkeydown = function (e) {
  var ev = window.event || e;
  var code = ev.keyCode || ev.which;
  if (code == 116) {
    ev.keyCode ? ev.keyCode = 0 : ev.which = 0;
    cancelBubble = true;
    return false;
  }
}
function stop(){
  return false;
}
</script>
```

css部分：可以放入 header，但是我建议 header 放一份，并将里面的内容往 CSS 文件里再放置一份，这样一来当 F12 去除了其中一个，另外一个再寻找起来会麻烦且花时间（位于 CSS 文件中的代码 对方需要在开发模式中清理 CSS 内容，而且这样可以导致整个无法直视）：
```css
<style type="text/css">
html {
  -ms-user-select: none;
  -moz-user-select: none;
  -webkit-user-select: none;
}
</style>
```

ps：Ctrl + P能调起浏览器的打印机制，在里面可以进行拷贝，如需要禁止，可以增加以下css进行保险
```css
@media print{
  html {display:none; }
}
```


## 部分开启复制
全页禁止复制后在部分区域开启复制功能，如博客中的代码等
```js
// code edit
function clrs_code() {
  var controls = document.getElementsByTagName('pre');
  for(var i=0; i<controls.length; i++){
    controls[i].spellcheck = false;
    controls[i].setAttribute("contenteditable","true")
  };

  var controls = document.getElementsByTagName('code');
  for(var i=0; i<controls.length; i++){
    controls[i].spellcheck = false;
    controls[i].setAttribute("contenteditable","true");
  };

  var controls = document.getElementsByClassName('crayon-pre');
  for(var i=0; i<controls.length; i++){
    controls[i].spellcheck = false;
    controls[i].setAttribute("contenteditable","true");
  };
};

window.onload = clrs_code;
```

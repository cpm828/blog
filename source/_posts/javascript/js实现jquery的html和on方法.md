---
title:         js实现jquery的html和on方法 # 标题
description:   js使用ES5、ES6两种方法实现jquery的html和on、off、once等方法 # 副标题
date:          2020-03-20 # 建立日期
updated:       2020-03-20 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---

html部分：
```html
<div class="box" id="box1">Multi</div>
<div class="box" id="box2">Single</div>

<button onClick="offEvent()">解绑事件</button>
```

使用ES5的原型方法实现：
```js
function Elem (id) {
  this.el = document.getElementById(id)
}
Elem.prototype.html = function (val) {
  const el = this.el
  // 实现可存可取
  if (val) {
    el.innerHTML = val
    return this // 链式操作
  } else {
    return el.innerHTML
  }
}
Elem.prototype.on = function (type, fn) {
  const el = this.el
  el.addEventListener(type, fn)
  return this // 链式操作
}
Elem.prototype.off = function (type, fn) {
  const el = this.el
  el.removeEventListener(type, fn)
  return this // 链式操作
}
Elem.prototype.once = function (type, fn) {
  const el = this.el
  el.addEventListener(type, handler)
  // removeEventListener不能解绑匿名函数，此处使用handler构造一下
  function handler () {
    fn()
    el.removeEventListener(type, handler)
  }
  return this // 链式操作
}

// 实现on、off
var div1 = new Elem('box1')
logHtml()
div1.html('Multi Click').on('click', logHtml)
function logHtml() {
  console.log(div1.html())
}
function offEvent () {
  div1.off('click', logHtml)
}

// 实现once
var div2 = new Elem('box2')
div2.html('Single Click').once('click', logHtml2)
function logHtml2() {
  console.log(div2.html())
}

// 注意第二个参数必须使用外部函数，使用匿名函数时是无法移除的
// document.getElementById('box').addEventListener('click', logHtml)
// document.getElementById('box').removeEventListener('click', logHtml)

// 类似下面这种是无法移除的
// document.getElementById('box').removeEventListener('click', function () { logHtml() })

// 延伸：第二个参数带括号时，只会调用一次，使用场景如防抖、节流中
// document.getElementById('box').removeEventListener('click', logHtml() )
```

使用ES6的 Class 实现：
```js
class Elem2 {
  constructor (id) {
    this.el = document.getElementById(id)
  }
  html (value) {
    const el = this.el
    if (value) {
      el.innerHTML = value
      return this
    } else {
      return el.innerHTML
    }
  }
  on (type, fn) {
    const el = this.el
    el.addEventListener(type, fn)
    return this
  }
  off (type, fn) {
    const el = this.el
    el.removeEventListener(type, fn)
    return this
  }
  once (type, fn) {
    const el = this.el
    el.addEventListener(type, handler)
    function handler () {
      fn()
      el.removeEventListener(type, handler)
    }
    return this
  }
}

// 实现on、off
var div1 = new Elem2('box1')
logHtml()
div1.html('Multi Click').on('click', logHtml)
function logHtml() {
  console.log(div1.html())
}
function offEvent () {
  div1.off('click', logHtml)
}

// 实现once
var div2 = new Elem2('box2')
div2.html('Single Click').once('click', logHtml2)
function logHtml2() {
  console.log(div2.html())
}
```
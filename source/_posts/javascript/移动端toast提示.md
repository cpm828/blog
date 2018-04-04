---
title:         toast实现 # 标题
description:   toast实现的样式及脚本 # 副标题
date:          2017-04-03 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---


## 手动写入

前端经常需要写toast提示，每做个项目都得写一些，还是存在来，需要的时候拷贝过去。

JS:
```js
function toast(message='', ms='1500') {
  // js写法
  var outerDiv = document.createElement('div');
  outerDiv.id = "outer-div";
  outerDiv.className = "toast-box";
  var innerDiv = document.createElement('div');
  innerDiv.id = "inner-div";
  innerDiv.className = "toast-para";
  innerDiv.innerText = message;
  outerDiv.appendChild(innerDiv);
  document.body.appendChild(outerDiv);
  setTimeout(function(){
    outerDiv.remove()
  }, ms)

  // jquery写法
  const $toast = "<div class='toast-box'><p class='toast-para'>" + message + "</p></div>";
  jQuery(document.body).append($toast);
  setTimeout(function(){
    jQuery('.toast-box').remove()
  }, ms)

  // es6写法
  const $toast = jQuery(`<div class="toast-box"><div class="toast-para">${message}</div></div>`);
  jQuery(document.body).append($toast);
  setTimeout(() => $toast.remove(), ms);
}

export default toast
```

使用：
```js
import toast from 'toast'
```

CSS:
```css
/*toast只占一行，这样分两个标签的原因是为了兼容低版本浏览器*/
.toast{
  width: 100%;
  position: absolute;
  left: 0;
  top: 50%;
  transform: translate(0, -50%);
  text-align: center;
}
.toast-content{
  height: 1.875rem;
  line-height: 1.875rem;
  background: rgba(51,51,51,.8);
  border-radius: 0.3125rem;
  word-wrap: break-word;
  word-break: break-all;
  padding: 0 0.3125rem;
  color: #ffffff;
}
```



## 自动化toast

为了更好的更快的开发，我将整个的toast进行了封装，实际应用中只需要引入下面的脚本即可
```js
// toast函数
function toast (message = '', ms = '1500') {
  // js写法
  var outerDiv = document.createElement('div')
  outerDiv.id = 'outer-div'
  outerDiv.className = 'toast-box'
  var innerDiv = document.createElement('div')
  innerDiv.id = 'inner-div'
  innerDiv.className = 'toast-para'
  addCSS('.toast-box{ width:100%; position: fixed; left: 0; top: 50%; margin-top: -1rem; text-align: center; z-index: 999999999; }.toast-para { max-width: 12.5rem; display: inline-block; line-height: 1.5em; margin: auto; font-size: 0.75rem; color: white; background: rgba(0,0,0,.8); border-radius: 0.3125rem; word-wrap: break-word; word-break: break-all; padding: 0.4rem; }')
  innerDiv.innerText = message
  outerDiv.appendChild(innerDiv)
  document.body.appendChild(outerDiv)
  setTimeout(function () {
    outerDiv.remove()
  }, ms)
}

// 动态添加样式
function addCSS (cssText) {
  var style = document.createElement('style') // 创建一个style元素
  var head = document.head || document.getElementsByTagName('head')[0] // 获取head元素
  style.type = 'text/css' // 这里必须显示设置style元素的type属性为text/css，否则在ie中不起作用
  if (style.styleSheet) { // IE
    var func = function () {
      try { // 防止IE中stylesheet数量超过限制而发生错误
        style.styleSheet.cssText = cssText
      } catch (e) {
      }
    }
    // 如果当前styleSheet还不能用，则放到异步中则行
    if (style.styleSheet.disabled) {
      setTimeout(func, 10)
    } else {
      func()
    }
  } else { // w3c
    // w3c浏览器中只要创建文本节点插入到style元素中就行了
    var textNode = document.createTextNode(cssText)
    style.appendChild(textNode)
  }
  head.appendChild(style) // 把创建的style元素插入到head中
}

export default toast
```

使用：
```js
import toast from 'toast'
```



附加：常用的flex布局、tranform:translateX(-50%)在安卓webview低版本有兼容性

要想使用flex布局，建议参考：https://github.com/cpm828/flex.css

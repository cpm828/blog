---
title:         js实现手机号输入框中间空格效果 # 标题
description:   js实现在手机号输入框中输入时自动空格的效果 # 副标题
date:          2017-04-03 # 建立日期
updated:       2017-04-03 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---


效果如下：

<img src="/images/javascript/phone-input-space.png" width="300"/>

具体实现如下：
```html
<input type="tel" class="phone" v-model="phoneText" @keydown="keyDown" @keyup.delete="keyUp" maxlength="13">
```

```js
keyDown (e) { // 按下时判断在指定位置添加空格
  if (e.keyCode !== 8 && (this.phoneText.length === 3 || this.phoneText.length === 8)) {
    this.phoneText += ' '
  }
},
keyUp () { // 删除键抬起后清楚结尾空格
  // 非vue写法 if (e.keyCode === 8) {}
  this.phoneText = this.phoneText.replace(/\s*$/g, '')
}
```

如果想要初始化赋值：
```
this.phoneText = this.phoneText
  .replace(this.phoneText.substr(2, 1), this.phoneText.substr(2, 1) + ' ')
  .replace(this.phoneText.substr(6, 1), this.phoneText.substr(6, 1) + ' ')
```
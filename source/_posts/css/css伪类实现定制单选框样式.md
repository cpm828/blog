---
title:         css伪类实现定制单选框样式 # 标题
description:   css伪类实现定制单选框样式 # 副标题
date:          2017-04-04 # 建立日期
updated:       2017-04-04 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - CSS
---


原生单选框的样式实在太丑，UI肯定是不会用的啦，他们一般都会重新设计一种单选框，比如下面这种
<img src="../images/css/single-choice.png" width="60px">

## 设计原理
使用span模拟一个大圆，再利用::before伪类画一个小圆，实际上是一样大的圆，只是小圆的边框很大，占据一定的位置

```bash
# HTML
li.pay-source
  input(type="radio", name="pay-source")
  span.replace-input
```

```css
span{
  display: block;
  width: 30px;
  height: 30px;
  border: 1px solid #ccc;  
  border-radius: 50%;
}
span::before{
  display: block;
  content: '';
  width:100%;
  height: 100%;
  border: 8px solid #fff;
  background: #f00;
  box-sizing: border-box;
  border-radius: 50%;
}
```

## 扩展demo
<img src="../images/css/single-choice-demo.png" width="200px">
```css
input[type=radio] {    //原始input-radio保留但隐藏
  position: absolute;
  visibility: hidden;
}

input[type=radio] + .replace-input {    //input的兄弟接待 假span
  display: inline-block;
  width: r(36);
  height: r(36);
  border: $border-width solid $color-divider;
  border-radius: 50%;
}

input[type=radio]:checked + .replace-input {    //被选中的情况下的兄弟节点 假span 的before伪类
  &:before {
    display: block;
    content: "";
    width: 100%;
    height: 100%;
    background-color: $red;
    border-radius: 50%;
    border: r(7) solid $white;
  }
}
```

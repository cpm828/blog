---
title:         scss用法 # 标题
description:   scss的一些常用方法（scss需编译称css才能正常运行） # 副标题
date:          2017-05-20 # 建立日期
updated:       2017-05-20 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - CSS
---


## 变量
sass中可以定义变量，方便统一修改和维护
```scss
$fontStack: Helvetica, sans-serif;
$primaryColor: #333;

body {
  font-family: $fontStack;
  color: $primaryColor;
}
```

转换成：

```css
body {
  font-family: Helvetica, sans-serif;
  color: #333;
}
```


## 嵌套
sass可以进行选择器的嵌套，表示层级关系，看起来很优雅整齐
```scss
nav {
  background: red;
  ul {
    margin: 0;
    padding: 0;
    list-style: none;
    li {
      display: inline-block;
    }
  }
}
```

转换成：

```css
nav {
  background: red;
}
nav ul {
  margin: 0;
  padding: 0;
  list-style: none;
}
nav ul li {
  display: inline-block;
}
```


## 导入
sass中如导入其他sass文件，最后编译为一个css文件，优于纯css的@import
```scss
_reset.css如下：
html,
body,
ul,
ol {
   margin: 0;
   padding: 0;
}

base.css如下：
@import 'reset';
body {
  font-size: 100% Helvetica, sans-serif;
  background-color: #efefef;
}
```

转换后：

```css
html, body, ul, ol {
  margin: 0;
  padding: 0;
}
body {
  background-color: #efefef;
  font-size: 100% Helvetica, sans-serif;
}
```

## mixin混合
sass中可用mixin定义一些代码片段，且可传参数，方便日后根据需求调用。从此处理css3的前缀兼容轻松便捷。

适用于css3加厂商前缀、加背景图、设置宽高等
```scss
@mixin box-sizing ($sizing) {
  -webkit-box-sizing:$sizing;     
  -moz-box-sizing:$sizing;
  box-sizing:$sizing;
}
.box-border{
  border:1px solid #ccc;
  @include box-sizing(border-box);
}
```

转换成：

```css
.box-border {
  border: 1px solid #ccc;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
```

## 扩展/继承
sass可通过@extend来实现代码组合声明，使代码更加优越简洁。
```scss
.message {
  border: 1px solid #ccc;
  padding: 10px;
  color: #333;
}
.success {
  @extend .message; //表示公用message的样式
  border-color: green;
}
```

转换成：

```css
.message, .success {
  border: 1px solid #cccccc;
  padding: 10px;
  color: #333;
}
.success {
  border-color: green;
}
```

## 运算
sass可进行简单的加减乘除运算等
```scss
article {
  width: 600px / 960px * 100%;
}
```

转换成：

```css
article{
  width: 62.5%;
}
```

##颜色
sass中集成了大量的颜色函数，让变换颜色更加简单
```scss
$linkColor: #08c;
a {
  text-decoration:none;
  color:$linkColor;
  &:hover{
    color:darken($linkColor,10%);
  }
}
```

转换成：

```css
a {
  text-decoration: none;
  color: #0088cc;
}
a:hover {
  color: #006699;
}
```

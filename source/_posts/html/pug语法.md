---
title:        Pug语法 # 标题
description:  pug（jade）的一些常用语法  # 副标题
date:         2017-04-03 # 建立日期
updated:      2017-04-03 # 更新日期
comments:     true  # 开启评论功能
tags: # 标签分类
    - HTML
---


> 原本是叫jade的，后来因为jade的版本问题，官方已改称pug了，后续使用均用pug

## pug是什么？
* 模板引擎
* 用js实现
* 供node使用

## pug安装
nodeJs中输入一下命令
```
npm install pug -g
pug -h
```

## pug语法
### 标签
```
p 转换成 <p></p>
input 转换成 <input/>
```
### 文本
```
//标签中添加文本
p 欢迎学习pug语法    
转换成：   
<p>欢迎学习pug语法 </p>

//标签中嵌套标签
p 欢迎学习pug语法 <b>哈哈</b>    
装换成：    
<p>欢迎学习pug语法 <b>哈哈</b></p>

//标签中有大段的块内容
1、在标签后面添加 .
script.
    console.log("aaaaa");
    console.log("bbbbb");
转换成：
<script>
    console.log("aaaaa");
    console.log("bbbbb");
</script>

2、在每段后面添加 |
script
    | console.log("aaaaa");
    | console.log("bbbbb");
转换成：
<script>
    console.log("aaaaa");
    console.log("bbbbb");
</script>
```

### 属性
```
//以()来分割属性
a(rel="aa", href="http://www.baidu.com") click
转换成：
<a rel="aa" href=""http://www.baidu.com">click</a>
```

### 注释
```
1、单行注释
// 这是一个单行注释
转换成：
<!-- 这是一个单行注释 -->
2、多行注释
body
  //
    p 这是一个注释段落
转换成：
<body>
<!--p 这是一个注释段落
-->
3、不输出的注释
// - 这段注释不会输出
p 文本测试
转换成：
<p>文本测试</p>
</body>
```

### doctype
```
添加一个doctype只需要一个doctype，然后跟一个可选的值，默认是html
doctype html
转换成：
<!DOCTYPE  html>

后面可选值包括： xml、transitionall、strict、frameset、1.1、basic、mobile
```

### 设置id或class
```
1、标签后面跟上#id，.classname，如果没有标签则使用默认标签div
#content
p#info
a.btn
转换成：
<div id="content"></div>
<p id="info"></p>
<a class="btn"></a>

2、1个id和多个class
a#download-btn.btn.blue-btn
转换成：
<a id="download" class="btn blue-btn"></a>
```

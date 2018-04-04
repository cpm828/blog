---
title:         flex布局的兼容写法 # 标题
description:   flex弹性布局的兼容写法 # 副标题
date:          2017-04-04 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - CSS
---


>[阮一峰 Flex 布局教程：语法篇](http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html)
>[阮一峰 Flex 布局教程：实例篇](http://www.ruanyifeng.com/blog/2015/07/flex-examples.html)

flex布局在PC端兼容到IE10，移动端兼容也不是很好，使用flex时需增加一些兼容代码，注意先后顺序
实际应用中，可通过添加类class实现

## 兼容写法
```css
display: flex;  // 弹性布局
====>
display:-webkit-box;
display:-webkit-flex;
display:-ms-flexbox;
display:flex;


flex-direction: row;  // 从左到右排列
====>
-webkit-box-direction: normal;
-webkit-box-orient: horizontal;
-moz-flex-direction: row;
-webkit-flex-direction: row;
flex-direction: row;


flex-direction: row-reverse;  // 从右到左排列
====>
-webkit-box-pack: end;
-webkit-box-direction: reverse;
-webkit-box-orient: horizontal;
-moz-flex-direction: row-reverse;
-webkit-flex-direction: row-reverse;
flex-direction: row-reverse;


flex-direction:cloumn;  // 从上到下排列
====>
display:-webkit-box;
display:-webkit-flex;
display:-ms-flexbox;
display:flex;


flex-direction:cloumn;  // 从上到下排列
====>
-webkit-box-pack: end;
-webkit-box-direction: reverse;
-webkit-box-orient: vertical;
-moz-flex-direction: column-reverse;
-webkit-flex-direction: column-reverse;
flex-direction: column-reverse;


align-items:center;  // 水平居中
====>
-webkit-box-align:center;
-webkit-align-items:center;
-ms-flex-align:center;
align-items:center;


jusify-content: center;  // 垂直居中
====>
-webkit-box-pack:center;
-webkit-justify-content:center;
-ms-flex-pack:center;
justify-content:center;


justify-content: space-between;  // 两端对齐
====>
-webkit-box-pack:justify;
-webkit-justify-content:space-between;
-ms-flex-pack:justify;
justify-content:space-between;


justify-content: space-around;  // 各个子级两端对齐
====>
因旧版本flex不支持此属性，所以暂时不能兼容
```

## flex有6个属性
* flex-direction：主轴排列方向
  * row：默认水平，起点在左
    →
  * row-reverse：水平，起点在右
    ←  
  * cloumn：垂直，起点在上
     ↓
  * cloumn-reverse：垂直，起点在下
    ↑

* flex-warp：换行
  * now-wrap：默认不换行
    12345678
  * wrap：换行，第一行在上
    12345
    678
  * wrap-reverse：换行，第一行在下
    678
    12345

* flex-flow：flex-direction和flex-warp的简写
  row nowrap：默认水平且不换行
  _ || _  :其他写法

* jusitfy-content：主轴的对齐方式
  * flex-start：默认左对齐，往左靠
  * flex-end：右对齐，往右靠
  * center：居中对齐，往中间靠
  * space-between：两端对其，各个子级间隔相等
  * space-around：各个子级两端相等

* align-items：交叉轴的对齐方式
  * flex-start：默认，顶对齐，往上靠
  * flex-end：底对齐，往下靠
  * center：垂直居中对齐，往中间靠
  * baseline：以第一行文字的基线对齐
  * stretch：若未设置高度或auto，将占满整个高度

* align-content：多根轴线的对齐方式,一根轴线不起作用
  * flex-start：与交叉轴起点对齐
  * flex-end：与交叉轴终点对齐
  * center：与交叉轴中点对齐
  * space-between：与交叉轴两端对齐
  * space-around：每根轴线两端间隔相等
  * stretch：轴线占满整个交叉轴


## 使用flex.css兼容
>https://github.com/lzxb/flex.css/blob/master/docs/zh-ch.md
>http://lzxb.name/flex.css/

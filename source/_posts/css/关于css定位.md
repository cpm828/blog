---
title:         关于css定位 # 标题
description:   css常见的几种定位方法 # 副标题
date:          2017-04-04 # 建立日期
updated:       2017-04-04 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - CSS
---


position 属性值的含义：

- static:默认值
没有定位，元素出现在正常的流中（忽略 top, bottom, left, right 或者 z-index 声明）。

- relative:生成相对定位的元素
相对定位写法：`position：relative;`
通过top,bottom,left,right的设置相对于其正常位置进行定位。可通过z-index进行层次分级。他原本所占的空间扔保留

- absolute:生成绝对定位的元素
绝对定位写法：`position：absolute;`
相对于 static 定位以外的第一个父元素进行定位。元素的位置通过 "left", "top", "right" 以及 "bottom" 属性进行规定。可通过z-index进行层次分级。

- fixed:生成固定定位的元素
固定定位写法：`position:fixed;`
相对于浏览器窗口进行定位。元素的位置通过 "left", "top", "right" 以及 "bottom" 属性进行规定。可通过z-index进行层次分级。


>[实例参考网站](http://www.jb51.net/css/22786.html)
>[故事版本的介绍](http://www.zhangxinxu.com/wordpress/2011/08/css%e7%9b%b8%e5%af%b9%e5%ae%9a%e4%bd%8drelative%e7%bb%9d%e5%af%b9%e5%ae%9a%e4%bd%8dabsolute%e7%b3%bb%e5%88%97%ef%bc%88%e5%9b%9b%ef%bc%89/)
>[实例参考网站](http://www.php100.com/html/webkaifa/DIV_CSS/2010/0503/4417.html)

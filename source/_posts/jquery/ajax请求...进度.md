---
title:         ajax请求...进度 # 标题
description:   ajax请求...进度 # 副标题
date:          2017-04-03 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - jQuery
---


## 效果图：
<img src="../images/jquery/ajax-dots.png">

## 实现原理:
HTML：
```html
<a href="javascript:" id="submit" class="grebtn">提交订单</a>
```

CSS：
```css
.dotting {
  display: inline-block; width: 10px; min-height: 2px;
  padding-right: 2px;
  border-left: 2px solid currentColor; border-right: 2px solid currentColor;   
  background-color: currentColor; background-clip: content-box;
  box-sizing: border-box;
  -webkit-animation: dot 4s infinite step-start both;
  *zoom: expression(this.innerHTML = '...'); /* IE7 */
}
.dotting:before { content: '...'; } /* IE8 */
.dotting::before { content: ''; }
:root .dotting { margin-left: 2px; padding-left: 2px; } /* IE9+ */

@-webkit-keyframes dot {
  25% { border-color: transparent; background-color: transparent; }          /* 0个点 */
  50% { border-right-color: transparent; background-color: transparent; }    /* 1个点 */
  75% { border-right-color: transparent; }                                   /* 2个点 */
}
```

JS：
```js
$("#submit").bind("click", function() {
  if (!this.ajaxing) {
    this.ajaxing = true;
    this.innerHTML = '提交订单中<span class="ani_dot">...</span>';
    setTimeout( function() {
      this.ajaxing = false;
      this.innerHTML = "提交超时";
    }.bind(this), 30000);
  }
});
```

## 说明：

同样是4秒动画，每秒钟显示1个点；

IE7/IE8实现原理跟上面box-shadow方法一致，都是内容生成，如果无需兼容IE7/IE8, 可以按照第一个例子CSS代码注释说明删除一些CSS；

currentColor关键字可以让图形字符化，必不可少；

最大功臣是CSS3 background-clip属性，可以让IE9+浏览器下左右padding没有背景色，于是形成了等分打点效果。CSS3 Background博大精深，有兴趣可参考一篇很赞的文章[CSS3 Backgrounds相关介绍](http://www.zhangxinxu.com/wordpress/2011/05/%E7%BF%BB%E8%AF%91-css3-backgrounds%E7%9B%B8%E5%85%B3%E4%BB%8B%E7%BB%8D/)，很多图，移动端非wifi慎点；

box-sizing是让现代浏览器和IE7/IE8占据宽度完全一样的功臣：IE7/IE8实际宽度是width+padding-right为12像素，其他现代浏览器为width+margin-left也是12像素；
这里CSS代码主要用来展示原理，故没有显示-webkit-animation以及@-webkit-keyframes私有前缀，实际目前还是需要的；


## 优势所在
  - CSS生成的点没有虚化，效果更好；
  - 占据的尺寸各个浏览器完全一致，都是12像素宽度；
  - 颜色继承；
  - 天然字符化显示，与文字浑然天成；

---
title:         js检测浏览器是否出于放缩状态 # 标题
description:   js检测浏览器是否出于放缩状态 # 副标题
tags: # 标签分类
    - JavaScript
---


先来说说浏览器提供的标准检测接口，window.devicePixelRatio 是设备上物理像素和设备独立像素的比例，该属性就可以用于检测网页是否被缩放了。在普通的 PC 浏览器上，在默认无缩放的情况下其默认值是 1。目前Firefox、chrome等都得到了很好的支持。

好吧，接下来该说说 IE 的处理方法了。IE 提供了 window.screen.deviceXDPI 和 window.screen.logicalXDPI 两个属性，deviceXDPI 就是对应的设备上的物理像素，而 logicalXDPI 就是对应了设备独立像素的比例。估计标准的检测接口也只是基于 IE 这种方法的一种改进。这两个属性在 windows XP+ 以上的系统上的默认值都是 96，因为系统默认的就是 96dpi 。

对于以上两种都不支持的浏览器，还可以利用window.outerWidth 和 window.innerWidth 这两个属性。outerWidth 返回的是窗口元素的外部实际宽度，innerWidth 返回的是窗口元素的内部实际宽度，这两个宽度都包含了滚动条在内的宽度。

```js
function detectZoom (){ 
  var ratio = 0,
    screen = window.screen,
    ua = navigator.userAgent.toLowerCase();

  if (window.devicePixelRatio !== undefined) {
    ratio = window.devicePixelRatio;
  } else if (~ua.indexOf('msie')) {  
    if (screen.deviceXDPI && screen.logicalXDPI) {
      ratio = screen.deviceXDPI / screen.logicalXDPI;
    }
  } else if (window.outerWidth !== undefined && window.innerWidth !== undefined) {
    ratio = window.outerWidth / window.innerWidth;
  }
  
  if (ratio){
    ratio = Math.round(ratio * 100);
  }
  
   return ratio;
};
```

detectZoom 函数的返回值如果是 100 就是默认缩放级别，大于 100 则是放大了，小于 100 则是缩小了。
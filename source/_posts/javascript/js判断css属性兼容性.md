---
title:         js判断css属性兼容性 # 标题
description:   js判断css属性兼容性，是否可以是否，向下兼容 # 副标题
date:          2017-04-03 # 建立日期
updated:       2017-04-03 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - CSS
    - JavaScript
---


在css3兴起的今天，仍然有一些阻碍进步的机器在被使用中，web开发人员依然要痛苦的兼容它们。

我们可以在js中判断css属性是否可以正常使用，以便来正确的向下兼容。

```js
cssSupport: function (attr, value) {
  var element = document.createElement('div');
  if (attr in element.style) {
    element.style[attr] = value; // 此处会直接设置
    return element.style[attr] === value;
  } else {
    return false;
  }
}


// 例如我们检测css3的position:sticky的兼容性
// 需求，吸顶悬浮效果（向上滚动到顶部时，tab栏吸顶，向下离开顶部时tab又跟随页面移动）
init: function () {
  if (this.cssSupport('position', 'sticky')) {
    return ;
  }

  // 对于不支持position:sticky的还是走常规的监听scroll事件（mescroll插件中，iOS使用sticky属性，安卓走scroll监听）
  $('el_parent').on('scroll', function () {
    if (scrollTop > topValue) {
      $el.style.position = 'fixed';
    } else {
      $el.style.position = 'relative';
    }
  });
}
```

---
title:         js实现上拉加载 # 标题
description:   js实现上拉加载数据 # 副标题
date:          2017-04-11 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---

前端加载列表的时候，当列表过多时，需要考虑使用上拉加载，每次只加载其中的几条数据，这种情况一般都是通过触发scroll事件或是全局绑定scroll事件


## 整页上拉加载
```js
window.addEventListener('scroll', function () {
  this.scrollLoader()
}.bind(this))


scrollLoader () {
  var screenHeight = window.innerHeight // 页面内容高度
  var pageHeight = window.document.documentElement.scrollHeight // 页面高度（包括滚动条）
  var scrollHeight = window.scrollY // 已经滚动的高度
  if (pageHeight - screenHeight - scrollHeight > 100) return;
  this.requestData()
}


requestData () {
  $.ajax({
    url: '',
    data: {
      page: '', // 请求第几页，全局变量，请求成功+1
      num: '' // 请求几条数据
    }
  })
  // 结合返回的left值（还剩余几条数据）来决定到底后是否继续请求
}
```


## 弹窗（部分）上拉加载
```js
ul(@scroll="scrollLoader()")
  li


scrollLoader () {
  var operateDom = document.querySelector('.awardlist-ul'); // alert
  var viewHeight = operateDom.offsetHeight;  // 可见高度
  var contentHeight = operateDom.scrollHeight;  // 内容高度
  var scrollTop = operateDom.scrollTop;  // 滚动条高度
  if (contentHeight - viewHeight - scrollTop > 100) return;
  this.requestData();
}


requestData() {
  $.ajax({
    url: '',
    data: {
      page: '', // 请求第几页，全局变量，请求成功+1
      num: '' // 请求几条数据
    }
  })
}
```

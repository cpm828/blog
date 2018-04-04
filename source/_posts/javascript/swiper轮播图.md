---
title:         swiper轮播图实现 # 标题
description:   swiper实现移动端上下滑屏和PC端banner轮播图 # 副标题
date:          2017-04-03 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---


## 移动端wap页
HTML:
```html
div.swiper-container
    div.swiper-wrapper
      div.swiper-slide
      div.swiper-slide
      div.swiper-slide
      div.swiper-slide

 //- 分页器
 div.swiper-pagination
 //- 按钮
 div.swiper-button-next
```

CSS
```css
.swiper-container,
.swiper-wrapper,
.swiper-slide{
  width: 100%;
  height: 100%;
}
.swiper-pagination{
  right: 10px;
  top: 50%;
  transform: translate(-50%, 0);
  display: none;
}
.swiper-button-next{
  width: r(60);
  height: r(60);
  border-radius: 50%;
  background: url('../img/scroll-btn.png') no-repeat;
  background-size: 100% 100%;
  left: 50%;
  top: 100%;
  margin-top: r(-90);
  transform: translate(-50%, 0);
}
.swiper-button-ani{
  animation: swiper-btn-ani 1s linear infinite;
}
@keyframes swiper-btn-ani{
  0%, 100%{
    transform: translate(-50%, 0);
  }
  50%{
    transform: translate(-50%, r(10));
  }
}

.slidebox1,
.slidebox2,
.slidebox3,
.slidebox4{
  width: 100%;
  height: 100%;
  background: url('../img/bg1.png') no-repeat center center;
  background-size: cover;
  overflow: hidden;
}
```

JS：
```js
// 轮播图
var mySwiper = new Swiper ('.swiper-container', {
  initialSlide: 0, // 初始页数
  direction: 'vertical', // 控制水平或垂直
  // autoplay: 3000, // 3s自动切换
  apeed: 300, // 划过的速度
  // loop: true,
  onlyExternal: false, /*不能拖动*/
  autoplayDisableOnInteraction: false, // 用户操作后不禁用自动播放
  // pagination: '.swiper-pagination', // 底部分页按钮
  // paginationClickable: true, // 分页按钮可点击
  // prevButton: '.swiper-button-prev'， // 左按钮
  nextButton: '.swiper-button-next', // 右按钮
  onInit: function (swiper) { // swiper初始化
    $('.swiper-button-next').addClass('swiper-button-ani');
  },
  onReachEnd: function (swiper) { // 到达最后一页的事件操作
    $('.swiper-button-next').removeClass('swiper-button-ani').hide();
  },
  onSlidePrevEnd: function (swiper) { //从最后往左切换的事件操作
    $('.swiper-button-next').addClass('swiper-button-ani').show();
  }
});
```


## PC端banner轮播图
HTML:
```html
<div class="swiper-container">
  <div class="swiper-wrapper">
    <div class="swiper-slide">
      <a href="" target="blank" class="swiper-link"><img src="" alt="" class="swiper-img"></a>
    </div>
    <div class="swiper-slide">
      <a href="" target="blank" class="swiper-link"><img src="" alt="" class="swiper-img"></a>
    </div>

    <div class="swiper-slide">
      <a href="" target="blank" class="swiper-link"><img src="" alt="" class="swiper-img"></a>
    </div>
  </div>
  <!-- 底部分页器 -->
  <div class="swiper-pagination"></div>
  <div class="operate-box">
    <!-- 左右按钮 -->
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
  </div>
</div>
```

django:
```html
<div class="swiper-container">
  <div class="swiper-wrapper">
    {% for banner in banners %}
    <div class="swiper-slide">
      {% if banner.url %}
      <a href="{{ banner.url }}" target="blank" class="swiper-link">
        <img src="{{ banner.banner_img_url }}" alt="" class="swiper-img">
      </a>
      {% else %}
      <a href="javascript:void(0)" class="swiper-link">
        <img src="{{ banner.banner_img_url }}" alt="" class="swiper-img">
      </a>
      {% endif %}
    </div>
    {% endfor %}
  </div>

  <!-- 底部分页器 -->
  <div class="swiper-pagination"></div>
  <div class="operate-box">
    <!-- 左右按钮 -->
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
  </div>
</div>
```

CSS:
```css
.swiper-container{
  /*width: auto;*/ /*宽度由js给出*/
  width: 100%;
  height: 700px;
  /*position: absolute;
  left: 50%;
  top: 0;
  -webkit-transform: translate(-50%, 0);
  transform: translate(-50%, 0);*/
}
.swiper-wrapper{
  width: 100%;
  height: 700px;
}
.swiper-slide{
  width: 100%;
  height: 700px;
}
/*link 和 img由开发者另行创建*/
.swiper-link{
  display: inline-block;
  width: 100%;
  height: 700px;
  position: relative;
}
.swiper-img{
  height: 700px;
}
.swiper-slide-active .swiper-img{
  max-width: none;
  height: 700px;
  position: absolute;
  left: 50%;
  top: 0;
  -webkit-transform: translate(-50%, 0);
  transform: translate(-50%, 0);
}

/* 1、对于banner图使用常用长图页*/
/* 由于宽度的不确定性，故增加左右按钮的父级div，方便定位 */
/* 但当父级div高度太大时会影响图片的点击效果 */
/* 故将父级div设置再banner图外，再配合margin-top手动将左右按钮设置到所需位置 */

/* 2、对于banner使用中间图片加左右填充色 */
/* 正常定位即可 */
.operate-box{
  width: 960px;
  height: 40px;
  position: absolute;
  left: 50%;
  top: -40px;
  -webkit-transform: translate(-50%, 0);
  transform: translate(-50%, 0);
  z-index: 50;
}
.swiper-pagination{
  z-index: 500;
}
.swiper-container-horizontal > .swiper-pagination-bullets{
  bottom: 20px;
}
.swiper-pagination .swiper-pagination-bullet{
  width: 8px;
  height: 8px;
  border-radius: 50%;
  opacity: 1;
  background: #ffffff;
}
.swiper-pagination .swiper-pagination-bullet-active{
  width: 20px;
  height: 8px;
  background: #ffffff;
  border-radius: 4px;
}
.swiper-button-prev{
  width: 40px;
  height: 40px;
  left: 0;
  background: url('../img/left-btn.png');
  z-index: 500;
  margin-top: 370px;
}
.swiper-button-next{
  width: 40px;
  height: 40px;
  right: 0;
  background: url('../img/right-btn.png');
  z-index: 500;
  margin-top: 370px;
}
```

JS:
```js
<script src="http://cdn.bootcss.com/Swiper/3.3.1/js/swiper.min.js"></script>
<script>
$(function(){
  // 轮播图
  var mySwiper = new Swiper ('.swiper-container', {
    // width: window.innerWidth,
    direction: 'horizontal', // 控制水平或垂直
    autoplay: 3000, // 3s自动切换
    apeed: 300, // 划过的速度
    loop: true,
    onlyExternal: false, /*不能拖动*/
    autoplayDisableOnInteraction: false, // 用户操作后不禁用自动播放
    pagination: '.swiper-pagination', // 底部分页按钮
    paginationClickable: true, // 分页按钮可点击
    nextButton: '.swiper-button-next', // 左按钮
    prevButton: '.swiper-button-prev' // 右按钮
  });
});
</script>
```

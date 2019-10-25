---
title:         jquery-qrcode生成二维码 # 标题
description:   jquery-qrcode生成二维码（img、canvas等） # 副标题
date:          2017-04-04 # 建立日期
updated:       2017-04-04 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - jQuery
---


有时候，我们需要在页面上生成一个二维码给用户查看，二维码的信息可以是个链接，也可以是别的。

但是需要可能只是给用户看一下，用户可以选择保存下来，过后并不需要再次打开找到二维码，也就是说生成的二维码是一次性的。

这个时候，我们也就没必要让后端同学生成后返回给我们一个二维码地址，前端可以自己吃用插件生成一个二维码。

## 资料

* 用法：http://tt4it.com/exchange/blog/discuss/115/

* demo：https://larsjung.de/jquery-qrcode/latest/demo/

* 官网：https://larsjung.de/jquery-qrcode/

* github：https://github.com/lrsjng/jquery-qrcode



## CDN：
```js
<script src="http://cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
<script src="http://cdn.bootcss.com/lrsjng.jquery-qrcode/0.12.0/jquery.qrcode.min.js"></script>
```

## 配置
```html
<img src="" id="qr_logo">  <!-- 中间logo，可选 -->
<div id="qrcode"></div>
```

```js
$("#qr_code").empty().qrcode({  
 render: 'image',   // 模式，canvas、image、div，注明只有image图片模式才支持长按保存
  mode: 0,  // 中间的logo, 0表示默认无，1表示满行文字，2表示一定宽的文字，3表示满行方形图片，4表示一定宽的方形图片
  image: $("#qr_logo")[0],   // 中间的logo
  minVersion: 8,  // 二维码缩放等级
  size: 800,  // 单位:px，生成的尺寸，注意生成后的清晰度
  text: 'no text'  // 跳转链接，或显示的文本
});
```


## 样式
```css
#qrcode， #qrcode img{
  display: block;  
  width: 500px;
}
```


## 特殊情况

当需要在二维码中间插入logo时，

如果是用本地地址，在img中直接使用即可。

如果是用网络地址，二维码中间会出现空白，这是因为初始化的时候网络地址还没加载出来，二维码就已经生成了。可以考虑将网络图片提前使用，使用过一次后图片会被缓存，下次使用会直接用而不会加载。

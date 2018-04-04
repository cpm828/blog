---
title:        meta标签 # 标题
description:  常见的meta标签  # 副标题
date:         2017-04-03 # 建立日期
comments:     true  # 开启评论功能
tags: # 标签分类
    - HTML
---


## name属性
* description网站描述（content中为一段介绍语）
```html
<meta name="description" content="今天是个好日子，嘻嘻哈哈我们真开心。">
```

* keywords关键字（content中为关键字，以英文逗号分开）
```html
<meta name="keywords" content="**,**,**,**">
```

* viewport移动端窗口
```html
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
```

参数：
`width=device-width`:视口宽度等于设备浏览器视窗宽度
`initial-scale=1`   :缩放比为1:1，对于retina屏，根据dpr的值设定该值
`user-scalable=no`  :禁止移动端缩放

```
var scaleValue = 1.0 / dpr;
var metaEl = document.createElement('meta');
metaEl.setAttribute('name', 'viewport');
metaEl.setAttribute('content', 'initial-scale=' + scaleValue + ', maximum-scale=' + scaleValue + ', minimum-scale=' + scaleValue + ', user-scalable=no');
document.getElementsByTagName('head')[0].appendChild(metaEl);
```

详见：http://www.ghugo.com/css-retina-hairline/

* robots定义搜索引擎爬虫的索引方式
```html
<meta name="robots" content="none">
```
  参数：
  `none`    : 搜索引擎将忽略此网页，等价于 `noindex，nofollow。`
  `noindex` : 搜索引擎不索引此网页。
  `nofollow`: 搜索引擎不继续通过此网页的链接索引搜索其它的网页。
  `all`     : 搜索引擎将索引此网页与继续通过此网页的链接索引，等价于 `index，follow。`
  `index`   : 搜索引擎索引此网页。
  `follow`  : 搜索引擎继续通过此网页的链接索引搜索其它的网页。

* 搜索引擎爬虫重访时间
```html
<meta name="revisit-after" content="7 days" >
```

* 作者信息
```html
<meta name="author" content="Lxxyx,841380530@qq.com">
```

* 网页制作软件
```html
<meta name="generator" content="Sublime Text3">
```

* 版权信息
```html
<meta name="copyright" content="Lxxyx"> //代表该网站为Lxxyx个人版权所有。
```


## http-equiv属性
* X-UA-Compatible浏览器采取何种版本渲染当前页面
```html
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> //指定IE和Chrome使用最新版本渲染当前页面
```

* cache-control指定请求和响应遵循的缓存机制
```html
<meta http-equiv="cache-control" content="no-cache">
```
  参数：
  `no-cache`: 先发送请求，与服务器确认该资源是否被更改，如果未被更改，则使用缓存。
  `no-store`: 不允许缓存，每次都要去服务器上，下载完整的响应。（安全措施）
  `public`  : 缓存所有响应，但并非必须。因为max-age也可以做到相同效果
  `private` : 只为单个用户缓存，因此不允许任何中继进行缓存。（比如说CDN就不允许缓存private的响 应）
  `maxage`  : 表示当前请求开始，该响应在多久内能被缓存和重用，而不去服务器重新请求。例如：max-age=60表示响应可以再缓存和重用 60 秒。

* expires网页到期时间
```html
<meta http-equiv="expires" content="Sunday 26 October 2016 01:00 GMT" />
```

* Set-Cookie设置cookie
```html
<meta http-equiv="Set-Cookie" content="name, date"> //格式
<meta http-equiv="Set-Cookie" content="User=Lxxyx; path=/; expires=Sunday, 10-Jan-16 10:00:00 GMT"> //具体范例
```

* refresh指定时间内页面自动刷新或指向指定页面
```html
<meta http-equiv="refresh" content="2"> //2秒刷新一次
<meta http-equiv="refresh" content="2；URL=http://www.baidu.com"> //2秒后跳转到百度页面
```

---
title:        网站IE低版本不兼容提示 # 标题
description:  IE6、7、8不兼容的提示信息  # 副标题
date:         2017-04-03 # 建立日期
updated:      2017-04-03 # 更新日期
comments:     true  # 开启评论功能
tags: # 标签分类
    - HTML
---


```html
<!--[if lt IE 9]>
  <div class="ie-disclaimer">
    <h2 class="text-20 text-dark text-center ie-disclaimer-title">不支持的浏览器</h2>
    <p class="text-center ie-disclaimer-para">*** 提醒您，微软正式停止对 Internet Explorer 8、9 和 10 的支持。旧版 IE 将不会再获得安全更新，因此我们不支持这些浏览器。请您更换 IE 11、Chrome、Firefox 或其他现代浏览器访问本站。</p>
    <a href="mailto:" class="contactus-btn">联系我们</a>
    <p class="text-ceter">***客服帮助：***-****-****</p>
  </div>
<![endif]-->

```css
/*IF IE 6、7、8、9*/
.ie-disclaimer{
  width: 500px;
  max-width: 500px;
  margin: 2em auto 0;
  padding: 5em;
  text-align: center;
}

.ie-disclaimer-title{
  font-size: 30px;
  font-weight: lighter;
  margin: 100px 0 20px;
}

.ie-disclaimer-para{
  line-height: 1.5em;
}

.contactus-btn{
  display: block;
  width: 120px;
  height: 40px;
  line-height: 40px;
  text-align: center;
  background: #eeeeee;
  margin: 20px auto;
}

```

---
title:        其他不常用的a链接 # 标题
description:  其他不常用的a链接  # 副标题
date:         2017-04-03 # 建立日期
updated:      2017-04-03 # 更新日期
comments:     true  # 开启评论功能
tags: # 标签分类
    - HTML
---


## 邮箱链接
```html
<!-- 最简式 -->
<a href="mailto:xxx@xx.com">联系站长</a>

<!-- cc标签帮你填抄送地址 -->
<a href="mailto:xxx@xx.com?cc=xxxx@xx.com">联系站长</a>

<!-- bcc标签帮你填暗送地址 -->
<a href="mailto:xxx@xx.com?bcc=xxxx@xx.com">联系站长</a>

<!-- subject标签帮你填主题 -->
<a href="mailto:xxx@xx.com?subject=给你主页提个建议">有话直说</a>

<!-- body标签帮你填邮件内容 -->
<a href="mailto:xxx@xx.com?body=你的网页做得不错啊,不过就是人气不够哦">评价</a>

多址发送
<a href="mailto:xxx@xx.com,xxxx@xx.com">联系站长</a>
```

## QQ对话框
```html
<a href="tencent://message/?uin=602455990&Site=QQ交谈&Menu=yes">点击打开QQ聊天对话框</a>
```

## 电话链接
```html
<a href="tel:13811112222">13811112222</a>
```

## 短信链接
```html
<!-- 给一个号码发短信 -->
<a href="sms:10086">给 10086 发短信</a>

<!-- body标签给一个号码发送已编辑好的短信 -->
<a href="sms:10086?body=cxye">给 10086 发送内容为"cxye"的短信</a>

<!-- body标签给多个号码发送已编辑好的短信 -->
<a href="sms:10086,10010?body=cxye">给 10086 和 10010 发送内容为"cxye"的短信</a>
```
注意：发短信的时候有可能会出现乱码，这个与页面的编码格式有关系，需要将页面的编码格式改为 Unicode(UTF-8)。

## 安卓市场
```html
<!-- 激活安卓市场的搜索功能 -->
<a href="market://search?q=MyApp">MyApp</a>
```

---
title:         hexo博客404页面支持https # 大标题
description:   hexo博客腾讯公益404页面支持https，解决部分资源不支持https的问题 # 小标题
date:          2018-05-31 # 建立日期
updated:       2018-05-31 # 更新日期
comments:      true  # 开启评论功能
tags:
    - Other
---

原始404页面资源：
```html
<link rel="stylesheet" type="text/css" href="https://qzone.qq.com/gy/404/style/404style.css">

<script type="text/plain" src="http://www.qq.com/404/search_children.js"
        charset="utf-8" homePageUrl="/"
        homePageName="回到我的主页">
</script>
<script src="https://qzone.qq.com/gy/404/data.js" charset="utf-8"></script>
<script src="https://qzone.qq.com/gy/404/page.js" charset="utf-8"></script>
```

将对应的资源替换成：
```html
<link rel="stylesheet" type="text/css" href="//qzonestyle.gtimg.cn/qzone/hybrid/app/404/style/404style_min.css">

<script type="text/plain" src="//qzonestyle.gtimg.cn/qzone/hybrid/app/404/search_children.js"
        charset="utf-8" homePageUrl="/"
        homePageName="回到我的主页">
</script>
<script src="//qzonestyle.gtimg.cn/qzone/v6/portal/gy/404/data.js" charset="utf-8"></script>
<script src="//qzonestyle.gtimg.cn/qzone/v6/portal/gy/404/page.js" charset="utf-8"></script>
```

也可以直接复制404页面给外部使用
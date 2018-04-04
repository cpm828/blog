---
title:         vue-resource前后端请求 # 标题
description:   vue-resource前后端请求 # 副标题
date:          2017-04-03 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Vue
---

vue 有自己的请求机制，即vue-resource
>https://github.com/pagekit/vue-resource

```
<script src="https://cdn.jsdelivr.net/vue.resource/1.0.3/vue-resource.min.js"></script>
{
  // GET or POST
  this.$http.get('url').then((response) => {
    // success callback
  }, (response) => {
    // error callback
  })
}
```

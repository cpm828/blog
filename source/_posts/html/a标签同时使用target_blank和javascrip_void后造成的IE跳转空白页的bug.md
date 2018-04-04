---
title:        a标签同时使用target_blank和javascrip_void后造成的IE跳转空包页的bug # 标题
description:  a标签同时使用target="_blank"和javascrip:void(0);后造成的IE跳转空白页的bug  # 副标题
tags: # 标签分类
    - HTML
---



在项目中有个位置的点击a标签这里要加一个权限判断，但是之前使用的是js动态添加a标签，href的属性值是一个url，但是我要做权限判断之后，我的url就不能设置在href属性中了，这样的话我可以在a标签里面新增一个属性来放置url的值，然后把href属性改为“javascript:void(0)”，这样使得点击的时候不会有任何操作，但是我改了之后还是会打开一个空白页面，后来找了一下发现是后面的target=“_blank”这个没有去掉，把这个去掉之后问题就解决了。

> 原文：http://www.cnblogs.com/wgl1995/p/6392991.html
---
title:         vue开发完成之后拷贝文件给后端 # 标题
description:   利用系统的复制命令将文件拷贝给后端 # 副标题
comments:      true  # 开启评论功能
tags: # 标签分类
    - Vue
---

vue项目开发完成之后，需要将文件拷贝至后端目录下

可利用系统的复制命令（目录依后端目录结构而定）进行

```
rm -rf ../../mall/coupon/templates/mall/*
&& rm -rf ../../mall/coupon/static/mall/*
&& cp dist/index.html ../../mall/coupon/templates/mall
&& cp -R dist/static/* ../../mall/coupon/static/mall
```

将其放在package.json下的script的copy中即可

```
"scripts": {
  "dev": "node build/dev-server.js",
  "build": "node build/build.js",
  "copy": ""
},
```

执行命令：`npm run copy`即可复制

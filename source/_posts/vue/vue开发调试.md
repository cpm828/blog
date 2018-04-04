---
title:         vue开发调试 # 标题
description:   vue开发调试 # 副标题
date:          2017-04-03 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Vue
---


1、最初开发时：
```bash
cnpm run build
# 使用localhost:8080即可开发页面
```

2、前端本地起服务（测试接口）
```bash
# 本地起服务：python manage runserver 0.0.0.0:8080
# 将3中的target换成127.0.0.1:8080，全部注释也可以

vue index.js中将port换成8082
cnpm run dev

打开页面：localhost:8082/*****
接口会默认代理到127.0.0.1:8080
```

3、后端电脑IP起服务时（测试接口）：
```js
在config/index.js 配置代理proxyTable：
dev: {
    env: require('./dev.env'),
    port: 8081,
    assetsSubDirectory: 'static',
    assetsPublicPath: '/',
    proxyTable: {
      '/api': {
        target: 'http://127.0.0.1:8080',
        // target: 'http://192.168.21.164:8000',
        changeOrigin: true,
        pathRewrite: {
          '^/api': '/api'
        }
      }
    },
    // CSS Sourcemaps off by default because relative paths are "buggy"
    // with this option, according to the CSS-Loader README
    // (https://github.com/webpack/css-loader#sourcemaps)
    // In our experience, they generally work as expected,
    // just be aware of this issue when enabling this option.
    cssSourceMap: false
  }
// proxyTable中使用后端电脑的IP，使用127.0.0.1:8081来打开页面，这样打开页面仍然时打开前端的代码，默认接口都会代理到IP上
```

4、测试render:
```bash
# 将代码copy到后端的目录下
python manage runserver 0.0.0.0:8080
localhost:8080/guessgame/guess_index?uid=***** # 此时打开的就是前端build之后且拷贝到后端目录里面的代码
```

注明：index.js中设置代理知识在开发模式下生效，测试环境和线上环境不会读取

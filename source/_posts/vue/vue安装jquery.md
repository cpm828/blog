---
title:         vue安装jquery # 标题
description:   vue安装jquery # 副标题
date:          2017-04-03 # 建立日期
updated:       2017-04-03 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Vue
---


vue组件中使用`jquery`

## 引入CDN
1-2或1-3-4-5

1、index.html中引入CDN

2、如果使用window.   在组件中可以直接使用window.$或window.jQuery就可以了

3、如果不想使用window. 可以在build的配置文件中增加全局变量别名
```js
externals: {
  jquery: 'jQuery'
}
```

4然后在组件中增加（externals中的和import中的和使用的需统一）
```js
import jQuery from 'jquery'
```

5、然后就可以使用jQuery了
```js
jQuery('.class').....
```

## 不引入CDN
不引入CDN就不能使用window.jQuery，也无需到externals中设置别名
1、安装jquery
```js
cnpm i -D jquery
```

2、组件内import
```js
import jQuery from 'jquery'
```

3、使用
```js
jQuery('.class').....
```

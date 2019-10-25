---
title:         vue-router懒加载 # 标题
description:   vue-router懒加载的几种写法 # 副标题
date:          2017-04-03 # 建立日期
updated:       2017-04-03 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Vue
---


默认的加载模式：
```js
import Vue from 'vue'
import Router from 'vue-router'

import HelloWorld from '@/components/HelloWorld'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    }
  ]
})

```


但当项目过大时需要使用懒加载方法

用法1：
```js
import Vue from 'vue'
import Router from 'vue-router'

const HelloWorld = resolve => require(['@/components/HelloWorld'], resolve)

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    }
  ]
})
```

用法2：
```js
import Vue from 'vue'
import Router from 'vue-router'

const HelloWorld = resolve => import('@/components/HelloWorld').then((module) => resolve(module))

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    }
  ]
})
```

用法3：
```js
import Vue from 'vue'
import Router from 'vue-router'

const HelloWorld = resolve => require.ensure([], () => resolve(require('@/components/HelloWorld')), 'HelloWorld')

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    }
  ]
})
```
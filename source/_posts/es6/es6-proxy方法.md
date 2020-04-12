---
title:         es6-proxy方法 # 标题
description:   es6-proxy方法 # 副标题
date:          2020-02-23 # 建立日期
updated:       2020-02-23 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - ES6
---

> 参考：http://es6.ruanyifeng.com/#docs/proxy

## 概述
`Proxy` 用于修改某些操作的默认行为。

`Proxy` 可以理解成，在目标对象之前架设一层“拦截”，外界对该对象的访问，都必须先通过这层拦截，因此提供了一种机制，可以对外界的访问进行过滤和改写。`Proxy` 这个词的原意是代理，用在这里表示由它来“代理”某些操作，可以译为“代理器”。

```js
var obj = new Proxy({}, {
  get: function (target, propKey, receiver) {
    console.log(`getting ${propKey}!`);
    return Reflect.get(target, propKey, receiver);
  },
  set: function (target, propKey, value, receiver) {
    console.log(`setting ${propKey}!`);
    return Reflect.set(target, propKey, value, receiver);
  }
});

/**
 * get:
 *    target: 目标对象
 *    propKey: 访问的属性
 *    receiver: Proxy实例
 *
 * set:
 *    target: 目标对象
 *    propKey: 访问的属性
 *    value: 设置的新值
 *    receiver: Proxy实例
 */
```
上面代码对一个空对象架设了一层拦截，重定义了属性的读取（`get`）和设置（`set`）行为。
```js
obj.count = 1
//  setting count!

obj.count += 1
//  getting count!
//  setting count!
//  2
```

ES6 原生提供 `Proxy` 构造函数，用来生成 `Proxy` 实例。
```js
var proxy = new Proxy(target, handler);

/**
 * new Proxy()表示生成一个Proxy实例
 * harget参数表示所要拦截的目标对象
 * handler参数也是一个对象，用来定制拦截行为。
 */
```

当然，我们也可以拦截读取属性：
```js
var proxy = new Proxy({}, {
  get: function(target, propKey) {
    return 35;
  }
});

proxy.time // 35
proxy.name // 35
proxy.title // 35
```
拦截元素返回35，所以无法访问哪个属性，都返回35。


Vue3.0 里面的监听器（Observer）由 `Object.defineProperty` 改用 `Proxy`，解决了增加或删除属性、修改数组某一项值的双向绑定问题。



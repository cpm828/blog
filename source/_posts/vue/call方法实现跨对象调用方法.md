---
title:         call方法实现跨对象调用方法 # 标题
description:   call方法实现对象之间的调用方法，可用于this转移 # 副标题
comments:      true  # 开启评论功能
tags: # 标签分类
    - Vue
---


在vue的项目开发中，我们知道，在一个组件中，this指向的是当前的组件对象，但是当我们在处理一个大型的项目，而且要调用一些公共的方法或函数，且在函数中又要继续调用下一个函数，例如：
组件A中：
```
mounted () {
  this.funcA
},
methods: {
  funcA () {
    this.funcB(b)
  },
  funcB (B) {
    // 一些公共的函数，如支付或js bridge等
    this.funcC(c)
  },
  funcC (C) {
    // 一些公共的函数，如支付或js bridge等
    this.funcD(d)
  },
  funcD (D) {
  }
}
```

在上面的示例中，我们在调用组件A的方法funcA()之后需要连续调用两个外部支持的函数，且之前有参数传递，最后又要调用组件A的方法funcD()，当funcB()和funcC()方法在组件B
中也需要调用时，我们如果在组件B中再重复写一套就很麻烦了，所有有些时候，我们需要将一定的方法剥离出去。


可以这样做:
组件A中：
```js
import {funcB, funcC} from '../tools/bridge.js'

mounted () {
  this.funcA
},
methods: {
  funcA () {
    funcB.call(this, b) // 此处将this对象通过call方法传递给外部函数funcB
  },
  funcD (D) {
  }
}
```

公共方法bridge.js中：
```js
funcB (B) {
  let self = this
  // 一些公共的函数，如支付或js bridge等
  funcC.call(self, c)
}

funcC (C) {
  // 一些公共的函数，如支付或js bridge等
  self.funcD(d) // 此处通过self指向组件中的funcD
}

export { funcB, funcC }
```
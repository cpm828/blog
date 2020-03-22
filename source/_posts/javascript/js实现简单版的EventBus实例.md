---
title:         js实现简单版的EventBus实例 # 标题
description:   js手动实现简单版的EventBus实例，包含on、once、emit、off等方法 # 副标题
date:          2020-03-22 # 建立日期
updated:       2020-03-22 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---

```bash
在vue中，可以利用EventBus来派发和接收事件

# eventBus.js:
import Vue from 'vue';
let eventHub = new Vue();
export default eventHub;

# a.vue
import eventBus from '../js/eventBus'
eventHub.$on('event', (data) => {})

# b.vue
import eventBus from '../js/eventBus'
eventHub.$emit('event', data);

设计模式：
  订阅者发布者模式（也称观察者模式），这种设计模式在前端很常见。一般来说：先订阅（on），再发布（emit）
  DOM事件也是一个订阅发布模式
    订阅：DOM.addEventListener('click', function () { })
    发布：一个点击事件

如何手动实现简单版的EventBus实例：
  API的设计：
    on('event', fn)    订阅消息（event: 订阅的消息名称、fn: 订阅的消息）
    once('event', fn)  仅订阅一次消息，一旦被执行立即销毁
    emit('event', msg) 发布消息（event: 消息名称、msg: 发布的消息）
    off('event')       移除消息（不传参数: 销毁所有消息）
```

> 参考：[Vue $on api](https://cn.vuejs.org/v2/api/#vm-on)

```js
// es5实现eventBus实例

// 简易版如下：
function EventBusClass () {
  this.eventObj = {} // 管理事件
}
EventBusClass.prototype = {
  // 订阅消息
  on: function (event, fn) {
    const vm = this
    this.eventObj[event] = fn
    return vm
  },
  // 订阅消息，派发一次后即销毁
  once: function (event, fn) {
    const vm = this
    // 思考：如何在执行完fn之后销毁该event呢，需要重新构造一个新的fn
    function fn2 () {
      fn.apply(vm, arguments)
      vm.off(event)
    }
    this.eventObj[event] = fn2
    return vm
  },
  // 发布消息
  emit: function (event, msg) {
    const vm = this
    // 未订阅的忽略
    if (!this.eventObj.hasOwnProperty(event)) return
    this.eventObj[event](msg)
    return vm
  },
  // 销毁消息（不传销毁所有）
  off: function (event) {
    const vm = this
    if (event === undefined) {
      this.eventObj = {}
      return
    }
    // 未订阅的忽略
    if (!this.eventObj.hasOwnProperty(event)) return
    delete this.eventObj[event]
    return vm
  }
}
```

ES6实现按照下列结构改造即可
```js
class EventBusClass2 {
  constructor () {
    this.eventObj = {}
  }
  on (event, fn) {
  }
  once (event, fn) {
  }
  emit (event, msg) {
  }
  off (event) {
  }
}
```

测试：
```html
<button onClick="on_a()">订阅A事件</button>
<button onClick="on_b()">订阅B事件</button>
<br>
<button onClick="once_a()">订阅A事件一次</button>
<button onClick="once_b()">订阅B事件一次</button>
<br>
<button onClick="emit_a()">派发A事件</button>
<button onClick="emit_b()">派发B事件</button>
<br>
<button onClick="off()">销毁A</button>
<button onClick="off_all()">销毁所有</button>
<br>
<button onClick="chain()">链式调用：订阅A事件，派发A事件</button>
```
```js
const EventBus = new EventBusClass()
// 订阅
function on_a () {
  EventBus.on('click', (data) => {
    console.log(data)
  })
}
function on_b () {
  EventBus.on('dbClick', (data) => {
    console.log(data)
  })
}
// 订阅一次
function once_a () {
  EventBus.once('click', (data) => {
    console.log(data)
  })
}
function once_b () {
  EventBus.once('dbClick', (data) => {
    console.log(data)
  })
}
// 发布
function emit_a () {
  EventBus.emit('click', {a: 1})
}
function emit_b () {
  EventBus.emit('dbClick', {b: 1})
}
// 销毁
function off () {
  EventBus.off('click')
}
function off_all () {
  EventBus.off()
}
// 链式调用
function chain () {
  EventBus
    .on('mouseup', (data) => {
      console.log(data)
    })
    .emit('mouseup', {c: 1})
}
```

以上只实现了一个简易版的EventBus，更多的参数支持和复杂情况未作处理，详细实现可查看[Vue源码 eventsMixin方法](https://github.com/vuejs/vue/blob/dev/src/core/instance/events.js)
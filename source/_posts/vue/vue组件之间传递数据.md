---
title:         vue组件传递数据 # 标题
description:   vue各组件之间传递简单的数据，父对子、子对父、兄弟之间通信 # 副标题
date:          2017-04-03 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Vue
---



## 父组件修改子组件
> vue官方介绍：http://cn.vuejs.org/v2/guide/components.html#单向数据流

### 传递单个变量
例1：

父组件：
```js
// html:
btn(@click="isShowDesigner = true")
// 引用子组件
designer(:msg.sync='isShowDesigner' v-show="isShowDesigner")

// script:
data(){
  return {
    isShowDesigner: false
  }
},
components: {Designer}
```

子组件designer：
```js
// html:
btn(@click="dismiss()")


// script:
props: ['msg'],
methods: {
  dismiss(){
    this.msg = false
  }
}
```

例1解析：
例1父子组件之间传递的是一个变量，父级派发一个msg事件，用来传递isShowDesigner变量，子组件通过props来接收父级派发的事件msg。此时在父组件中使用isShowDesigner变量，子组件中使用msg代替isShowDesigner变量

### 传递一个object对象
例2：

父组件：
```js
// html:
btn(@click="designerMessage.isShowDesigner = true")
// 引用子组件
designer(:designer-msg.sync='designerMessage' v-show="designerMessage.isShowDesigner")

// script:
data(){
  designerMessage: {
    isShowDesigner: false,
    designerInfo: ''
  }
},
components: {Designer}
```

子组件designer：
```js
// html:
input(v-model="inputText")
btn(@click="dismiss()")

// script:
props: ['designerMsg'],
data() {
  return {
    inputText: ''
  }
},
methods: {
  dismiss(){
    this.designerMsg.isShowDesigner = false
    this.designerMsg.designerInfo = this.inputText
  }
}
```

例2解析：
例2中父级派发designer-msg（不能使用驼峰时，连接符），子级通过designerMsg（使用驼峰时）接收，传递的是一个对象，传递对象时可不使用.sync，默认就是双向绑定；当子组件有多个父级时，props后面可以写多个

### 指定验证规则的传递
如果传入的数据不符合要求，Vue会发出警告
父组件：
```js
// html
designer(:prop-a="propDataA", :prop-b="propDataB", :prop-c="propDataC")

// script
data () {
  return {
    propDataA: '',
    propDataB: '',
    propDataC: ''
  }
}
```

子组件designer:
```js
// html

// script
props: {
  // 基础类型检测(null允许任何类型)
  propA: Number,
  // 可能是多种类型
  propB: [String, Number],
  // 必传且是字符串
  propC: {
    type: String,
    required: true
  },
  // 数字且有默认值
  poopD: {
    type: Number,
    default: 100
  },
  // 数组/对象的默认值应当由一个工厂函数返回
  propE: {
    type: Object,
    default: function () {
      return { message: 'Hello' }
    }
  },
  // 自定义验证函数
  propF: {
    valiator: function (value) {
      return value > 10
    }
  }
}
```

type可以是下面原生构造器：
* String
* Number
* Boolean
* Function
* Object
* Array
* Symbol

type也可以是一个自定义的构造器函数，使用instanceof检测




## 子组件修改父组件
> vue官方介绍：http://cn.vuejs.org/v2/guide/components.html#使用-v-on-绑定自定义事件
> other：http://www.cnblogs.com/wisewrong/p/6266038.html

### 只触发事件，不传递数据
子组件designer:
```
btn(@click="ShowSibling")

methods：{
  ShowSibling () {
    this.$emit('showBrother') // 派发一个事件，显示兄弟组件
  }
}
```

父组件：
```
designer(@showBrowther="showOtherChildren")

data () {
  return {
  }
},
methods: {
  showOtherChildren (msg) {
    this.otherChildren.isShow = true // 控制显示其他的子组件
  }
}
```

### 触发事件同时传递数据
子组件designer:
```
btn(@click="ShowSibling")

data () {
  return {
    propHandle: ''
  }
},
methods：{
  ShowSibling () {
    this.$emit('showBrother', propHandle) // 派发一个事件，去显示兄弟组件，同时传递transmitData数据
  }
}
```

父组件：
```
designer(@showBrowther="showOtherChildren")
data () {
  return {
    getData: ''
  }
},
methods: {
  // 此例在html中写成@showBrowther="showOtherChildren"
  // 也可在事件中心写this.$on('showOtherChildren', {})
  showOtherChildren (msg) {
    this.otherChildren.isShow = true // 控制显示其他的子组件
    this.getData = msg
    // 控制显示其他的子组件
  }
}
```





## 兄弟组件之间修改
> vue官方介绍：http://cn.vuejs.org/v2/guide/components.html#非父子组件通信
> vue1.0升2.0：https://cn.vuejs.org/v2/guide/migration.html#dispatch-和-broadcast-替换
> other：http://www.javascriptcn.com/read-1774.html

有时候两个非父子组件之间也需要通信，如兄弟组件或祖父子组件，我们可以考虑使用一个空的Vue实例作为中央事件总线：

公共js:
```js
import Vue from 'vue'
let eventHub = new Vue()

export default eventHub
```

子组件A:
```js
// NewTodoInput

import eventHub from '../utilities/centerHub'

methods: {
  addTodo: function () {
    eventHub.$emit('add-todo', { text: this.newTodoText })
    this.newTodoText = ''
  }
}
```

子组件B:
```js
// DeleteTodoButton

import eventHub from '../utilities/centerHub'

methods: {
  deleteTodo: function (id) {
    eventHub.$emit('delete-todo', id)
  }
}
```

父组件：
```js
// Todos

created: function () {
  eventHub.$on('add-todo', this.addTodo)
  eventHub.$on('delete-todo', this.deleteTodo)
},
// 最好在组件销毁前
// 清除事件监听
beforeDestroy: function () {
  eventHub.$off('add-todo', this.addTodo)
  eventHub.$off('delete-todo', this.deleteTodo)
},
methods: {
  addTodo: function (newTodo) {
    this.todos.push(newTodo)
  },
  deleteTodo: function (todoId) {
    this.todos = this.todos.filter(function (todo) {
      return todo.id !== todoId
    })
  }
}
```



## 复杂组件通信
复杂的组件通信应当考虑使用vuex来通信
> vuex官方介绍：http://vuex.vuejs.org/zh-cn/intro.html
> 个人：http://blog.pimichen.com/vue/vuex%E7%BB%84%E4%BB%B6%E9%80%9A%E4%BF%A1.html


> 注：$dispatch和$broadcast在vue2.0中已经被移除
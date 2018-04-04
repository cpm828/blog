---
title:         vue中使用mint-ui移动端组件库 # 标题
description:   在vue-cli中使用ElemeFE提供的mint-ui移动端组件库 # 副标题
tags: # 标签分类
    - Vue
---

> [mint-ui官网](http://mint-ui.github.io/#!/zh-cn)
> [mint-ui 1.0文档](http://mint-ui.github.io/docs/#/zh-cn)
> [mint-ui 2.0文档](http://mint-ui.github.io/docs/#/zh-cn2)

## 预览
http://elemefe.github.io/mint-ui/#/

## 安装
```
# Vue 1.x
npm install mint-ui@1 -S

# Vue 2.0
npm install mint-ui -S
```

## 引入
```
// main.js引入全部组件
import Vue from 'vue';
import Mint from 'mint-ui';
import 'mint-ui/lib/style.css' 
Vue.use(Mint);

// 按需引入部分组件
import { Toast, Indicator } from 'minu-ui';
import 'mint-ui/lib/style.css' 

components: {Toast, Indicator}
```

##  部分用法
* Toast
```js
Toast('我就是那个3s的toast') // 默认3s

Toast({
  message: '哈哈，我是5s的toast',
  position: 'bottom',
  duration: 5000 // -1表示一直开启
})

Toast({
  message: '操作成功',
  iconClass: 'icon icon-success' // 增加icon class类名
})

let instance = Toast('提示信息');
setTimeout(() => {
  instance.close(); // 手动关闭
}, 2000);
```

* Indicator加载
```js
Indicator.open('加载中...')

Indicator.open({
  text: '加载中...',
  spinnerType: 'triple-bounce' // snake(默认)、fading-circle、double-bounce、triple-bounce
})

Indicator.close(); // 手动关闭
```

* MessageBox
```js
MessageBox('提示', '操作成功')

MessageBox({
  title: '提示',
  message: '操作成功',
  showCancelButton: true // 带取消按钮
})

MessageBox.alert('操作成功', '提示')
MessageBox.alert('操作成功', '提示').then(action => {
  // 点击按钮的回调
});

MessageBox.confirm('确定执行此操作', '提示')
MessageBox.confirm('确定执行此操作', '提示').then(action => {
  // 点击按钮的回调
});

MessageBox.prompt('请输入姓名', '提示');
MessageBox.prompt('确定执行此操作', '提示').then(({value, action}) => {
  // 点击按钮的回调
  console.log(value)
});

// title: 标题
// message: 提示框内容
// showConfirmButton: 是否显示确认按钮，默认true
// showCancelButton: 是否显示取消按钮，默认false
// confirmButtonText、confirmButtonHighlight、confirmButtonClass: 确认按钮文本、加粗、类名
// cancelButtonText、cancelButtonHighlight、cancelButtonClass: 取消按钮文本、加粗、类名
// closeOnClickModal: 点击遮罩关闭提示框
// showInput、inputType、inputValue、inputPlaceholder: 是否显示输入框、输入框类型、输入框的值、输入框的占位符
```

* Action sheet操作表
```js
// template
<button @click="showActionSheet">点击上拉 action sheet</button>

<mt-actionsheet
      :actions="actions"
      :cancelText="cancelText"
      :closeOnClickModal="true"
      v-model="sheetVisible"></mt-actionsheet>


// js:
data () {
  return {
    actions: [ // 可选择的
      {
        name: '拍照',
        method: this.choiceCamera // 点击后回调
      },
      {
        name: '从相册中选择',
        method: this.choicePhoto
      }
    ],
    sheetVisible: false,
    cancelText: '取消', // 取消按钮的文本
  }
},
methods: {
  showActionSheet () {
    this.sheetVisible = true
  },
  choiceCamera () {
    console.log('选择了拍照')
  },
  choicePhoto () {
    console.log('选择了从相册中选择')
  }
}
```


更多用法请查看官方文档
> [mint-ui 1.0文档](http://mint-ui.github.io/docs/#/zh-cn)
> [mint-ui 2.0文档](http://mint-ui.github.io/docs/#/zh-cn2)

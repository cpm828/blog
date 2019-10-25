---
title:        js脚本实现复制剪切效果 # 标题
description:  js脚本实现复制剪切效果 # 副标题
date:          2017-06-23 # 建立日期
updated:       2017-06-32 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---

> 参考：https://github.com/cpm828/clipboard.js
> CDN:http://cdn.bootcss.com/clipboard.js/1.5.12/clipboard.min.js

```
data-clipboard-action: 操作行为，默认为copy，剪切为cut
data-clipboard-target: 操作目标，通过标签、id或class号指向
data-clipboard-text: 具体文本

e.action: 操作名称
e.text: 操作的文本
e.trigger: dom节点
```


常用方法：
- 复制
```html
<p class="para">123456789</p>

<button class="btn1" data-clipboard-target=".para">复制</button>

<script>
var clipboard1 = new Clipboard('.btn1');
clipboard1.on('success', function(e) {
  console.info('Action:', e.action); // 操作名称
  console.info('Text:', e.text); // 操作的文本
  console.info('Trigger:', e.trigger); // dom节点
  e.clearSelection(); // 取消选中
});
clipboard1.on('error', function(e) {
  console.error('Action:', e.action);
  console.error('Trigger:', e.trigger);
});
</script>
```


- 剪切
```html
<input type="text" class="input" value="我就是那个input">

<button class="btn2" data-clipboard-action="cut" data-clipboard-target=".input">剪切</button>

<script>
var clipboard2 = new Clipboard('.btn2');
clipboard2.on('success', function(e) {
  console.info('Action:', e.action); // 操作名称
  console.info('Text:', e.text); // 操作的文本
  console.info('Trigger:', e.trigger); // dom节点
  e.clearSelection(); // 取消选中
});
clipboard2.on('error', function(e) {
  console.error('Action:', e.action);
  console.error('Trigger:', e.trigger);
});
</script>
```


- 复制固定文本
```html
<button class="btn3" data-clipboard-text="我就是那个隐藏的文字">复制固定数据</button>

<script>
var clipboard3 = new Clipboard('.btn3');
clipboard3.on('success', function(e) {
  console.info('Action:', e.action); // 操作名称
  console.info('Text:', e.text); // 操作的文本
  console.info('Trigger:', e.trigger); // dom节点
  e.clearSelection(); // 取消选中
});
clipboard3.on('error', function(e) {
  console.error('Action:', e.action);
  console.error('Trigger:', e.trigger);
});
</script>
```


- 动态将目标指向下一个节点
```html
<button class="btn4">看我如下操作下一个节点</button>

<script>
new Clipboard('.btn4', {
  target: function(trigger) {
    return trigger.nextElementSibling; // 动态指向下一个节点，及操作下一个节点
  }
});
</script>
```


- 动态操作属性值
```html
<button class="btn5" aria-label="我用了自己的属性">看我如何复制我的属性值</button>

<script>
new Clipboard('.btn5', {
  text: function(trigger) {
    return trigger.getAttribute('aria-label'); // 操作属性值
  }
})
</script>
```


在vue项目中，使用如上方法，ios会有bug，可以安装vue-cliboards组件

> 参考：https://github.com/cpm828/vue-clipboards

1、安装vue-clipboards
```
npm install vue-clipboards

```

2、导入（可放在组件中也可放在main.js中）
```
import Vue from 'vue'
import VueClipboards from 'vue-clipboards'
Vue.user(VueClipboards)
```

3、使用
```
<button v-clipboard="copyData" @success="handleSuccess" @error="handleError">Copy</button>

new Vue({
  data() {
    return {
      copyData: 'copy data'
    }
  },
  methods: {
    handleSuccess(e) {
      console.log(e);
    },
    handleError(e) {
      console.log(e);
    }
  }
});

```

4、说明
该组件默认只能绑定一个

解决办法：
  4.1 增加:key="1"
  ```
  <button v-clipboard="copyData1" :key="1" @success="handleSuccess" @error="handleError">Copy</button>
  <button v-clipboard="copyData2" :key="2" @success="handleSuccess" @error="handleError">Copy</button>
  ```
  具体见：https://github.com/zhuowenli/vue-clipboards/blob/master/example/App.vue#L8
  4.2 可以考虑设置一个真实复制的按钮，其他按钮trigger click给这个按钮
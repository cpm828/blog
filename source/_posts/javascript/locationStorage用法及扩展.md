---
title:         locationStorage用法及扩展 # 标题
description:   locationStorage用法及扩展 # 副标题
date:          2017-04-04 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
    - Vue
---


localStorage 和 sessionStorage

* localStorage为永久性保存
* sessionStorage为暂时保存，关闭浏览器后失效
* 存储单个字符串

```js
window.localStorage.setItem('name', 'Jack')
window.localStorage.getItem('name')
```

* 一次存储多个字符串

localStorage只能存储字符串，对于一次性需要存储大量的数据，建议存储为json对象，但使用localStorage必须先经过JSON.stringify()转换成字符串和JSON.parse()解析字符串方可成功，故封装了一个函数local.js，如下：

```js
const {localStorage, JSON} = window;
const storage = {
  set (key, val = {}) {
    let _value = JSON.stringify(val);
    localStorage.setItem(key, _value);
  },
  get (key) {
    const _value = localStorage.getItem(key);
    return _value === null ? {} : JSON.parse(_value);  // 存空对象和没有存都返回空对象
  },
  remove (...keys) {
    keys.forEach(key => localStorage.removeItem(key));
  },
  clear () {
    localStorage.clear();
  }
};

export default storage;
```

使用如下：

```js
import local from './local.js'

let obj = {  
  today: '周五',
  tommorow: '周六'
}

local.set('obj', obj); // 存
local.get('obj'); // 取
local.get('obj').today; // 取
local.remove('obj', 'abc'); // 删出俩个
local.clear(); // 清空
```

sessionStorage与之类似， 只是把所有的localStorage换成sessionStorage就行了

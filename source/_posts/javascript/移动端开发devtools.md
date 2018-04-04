---
title:         移动端开发devtools # 标题
description:   移动端开发devtools迷你版 # 副标题
tags: # 标签分类
    - JavaScript
    - Tools
---

>来源：[eruda](https://github.com/liriliri/eruda)

CDN:https://cdn.bootcss.com/eruda/1.2.6/eruda.min.js

用法：
```js
<script src="https://cdn.bootcss.com/eruda/1.2.6/eruda.min.js"></script>
<script>
  window.eruda.init();
  // 自定义显示面板，默认全显示
  // window.eruda.init({
  //   tool: ['console', 'element']
  // });
</script>

<script>
  // test
  console.log('11111');

  var obj = {
    a: '1',
    b: '2', 
    c: '3'
  };
  console.log(obj);
  console.dir(obj);

  window.localStorage.setItem('a', '123');
</script>
```


DEMO:
<img src="../images/javascript/mobile-console-demo.png" width="200px" />


>非常感谢[liriliri](https://github.com/liriliri)提供的[eruda](https://github.com/liriliri/eruda)工具，非常赞
---
title:         js执行机制 # 标题
description:   这一次，彻底弄懂 JavaScript 执行机制 # 副标题
tags: # 标签分类
    - JavaScript
---

抛出问题，输出下列程序：
```
setTimeout(function(){
    console.log('定时器开始啦')
});

new Promise(function(resolve){
    console.log('马上执行for循环啦');
    for(var i = 0; i < 10000; i++){
        i == 99 && resolve();
    }
}).then(function(){
    console.log('执行then函数啦')
});

console.log('代码执行结束');
```

```
马上执行for循环啦
代码执行结束
执行then函数啦
定时器开始啦
```


>内部执行机制查看[掘金 ssssyoki](https://juejin.im/post/59e85eebf265da430d571f89)
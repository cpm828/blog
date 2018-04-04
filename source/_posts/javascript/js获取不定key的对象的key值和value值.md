---
title:         js获取不定key的对象的key值和value值 # 标题
description:   js获取不定key的对象的key值和value值 # 副标题
tags: # 标签分类
    - JavaScript
---

对于已经固定key的对象，我们很容易可以去到它对应的value值，但有时候拿到的是不定key的对象，这个时候该怎么取

如：
```
var array=[
  {'50026460': '童装'},
  {'50022517': '男装'},
  {'50022620': '女装'},
  {'50022740': '孕妇装'}
];
```

可以使用Object.keys方法来处理

获取key值：
```
for(var i=0;i<array.length;i++){
    var item=array[i];
    var key=Object.keys(item);
    console.log(key);
}
```

获取value值：
```
for(var i=0;i<array.length;i++){
    var item=array[i];
    var key=Object.keys(item);
    console.log(item[key]);
}
```

最后吐槽一下，这种数据结构有些不太合理，实际应用中应当减少使用这种数据结构。

理想的数据结构应该是这种：
```
var array=[
  {id: '50026460', name: '童装'},
  {id: '50022517', name: '男装'},
  {id: '50022620', name: '女装'},
  {id: '50022740', name: '孕妇装'}
];
```
---
title:         js遍历数据根据条件删除数组元素 # 标题
description:   js遍历数据根据条件删除数组元素 # 副标题
date:          2017-04-03 # 建立日期
updated:       2017-04-03 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---



有时，我们会有这样一个需求，当我们从后端取到一个list数组时，我们需要进行二次处理，处理成我们需要的数据，如：

```js
var arr = [
  {
    status:0
  },
  {
    status:1
  },
  {
    status:0
  },
  {
    status:0
  },
  {
    status:3
  },
  {
    status:0
  },
  {
    status:7
  },
  {
    status:0
  },
  {
    status:2
  }
];
```

遍历上面的数组，删除status=0的项，我们很容易想到，先for循环（或forEach、map等）遍历，然后使用array的splice方法删除指定索引未知的项。

但在操作之后，我们发现，当我们删除一个之后索引值会变化，这就造成只能删除第一个。我们发现，for循环遍历时，遍历一次，i加1，那我们可以这样当执行splice删除的时候，我们不让i+1，否则才递增。该如何实现呢？

```js
for(var i=0, flag=true, len=arr.length; i<len; flag ? i++ : i){
 if( arr[i] && arr[i].status==0 ){
    arr.splice(i, 1);
    flag = false;
  } else {
    flag = true;
  }
}
console.log(arr);
```

这种做法效率非常高，值得推荐。

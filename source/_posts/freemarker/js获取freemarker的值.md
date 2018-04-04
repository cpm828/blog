---
title:        在ftl的js中获取freemarker的值 # 标题
description:  在ftl的js中获取freemarker的值  # 副标题
tags: # 标签分类
    - FreeMarker
---


假设后端往ftl模板中注入了下列值
```js
testA: 'aaaa'

testB: {
  bDataOne: 'b1',
  bDateTwo: 'b2'
}

testC: [
  {
    cDateOne: 'c11'
    cDateTwo: 'c12'
  },
  {
    cDateOne: 'c21'
    cDateTwo: 'c22'
  }
]
```


想在ftl页面的js中获取testA、testB、testC
```
// 获取testA
var getA = "${testA!''}";


// 获取testB
<#if testB?? && testB.bDataOne??>
  var getB1 = "${testB.bDataOne!''}";
  var getB2 = "${testB.bDataTwo!''}";
</#if>


// 获取testC，对于list，我们不能直接使用list数据，必选转换一下才能正常使用
// 收集list中每一项的某个key
<#if testC??>
  var arr = [];
  <#list testC as c>
    arr.push('${c.cDateOne}')
  </#list>
</#if>
console.log(arr); // 然后将可以正常的使用了

// 获取整个list，正在搜索中...
```
---
title:        freemarker部分语法 # 标题
description:  freemarker部分语法  # 副标题
tags: # 标签分类
    - FreeMarker
---


假设后端往ftl模板中注入了下列值
```js
testA: '1111'

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

testD: false

testE: {
  eData: false
}
```

在ftl中页面中我们可以这样获取：
```ftl
"${testA}" // 直接获取

"${testA!}" // 获取，取不到时为空串，空序列或空哈希表（arr or object）

"${testA!''}" // 获取，取不到时为空字符串

"${testA!'test'}" // 获取，取不到位test字符串

"${testD.eData!false}" // 获取testD里面的eData，取不到为false;取到testD，取不到eData，为false;取不到testD会出问题

"${(testD.eData)!false}" // 获取testD里面的eData，取不到testD或testD.eData，均为false

${(testA!false)?string}  // 获取布尔值


// 判断testA存在时
<#if testA>
  ***
</#if>

// 判断testA存在时
<#if testA??>
  ***
</#if>

// 判断testA存在时
<#if testA?has_content>
  ***
</#if>

// 判断testA为'1111'时
<#if testA === '1111'>
  ***
</#if>

// 判断testD为false存在时，如果取不到就用false
<#if testD!false>
  ***
</#if>

// 判断testB及testB.bDataOne存在时
<#if testB?? && testB.bDataOne??>
  ***
</#if>

// 渲染列表testC
<#list testC as c>
  <p><span>${c.cDateOne!}</span>和<span>${c.cDateTwo!}</span></p>
</#list>

// data属性存储testD
<p data-isShow="${(testD!false)?string('yes', 'no')}"> // testD为true时，属性记录为yes，为false时或取不到时为false

// data属性存储testE.eData
<p data-isShow="${((testE.eData)!false)?string('yes', 'no')}"> // testD为true时，属性记录为yes，为false时或取不到时为false

...
```


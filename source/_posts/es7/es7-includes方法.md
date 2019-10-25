---
title:         ES7 includes方法 # 标题
description:   es7includes方法解析 # 副标题
date:          2018-10-22 # 建立日期
updated:       2018-10-22 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - ES7
---

ES7只新增了2个新特性
* `Array.prototype.includes`
* Exponentiation Operator(求幂运算)

本文只讲解includes方法，Exponentiation Operator(求幂运算)请移步[ES7求幂运算](/es7/es7-求幂运算.html)

`Array.prototype.includes`用法都容易和简单。它是一个替代`indexOf`（ES6新增），开发人员用来检查数组中是否存在值，`indexOf`是一种尴尬的使用，因为它返回一个元素在数组中的位置或者-1当这样的元素不能被找到的情况下。所以它返回一个数字，而不是一个布尔值。

```js
let arr = ['react', 'angular', 'vue']

// WRONG
if (arr.indexOf('react')) { // 0 -> evaluates to false, definitely as we expected
  console.log('Can use React') // this line would never be executed
}

// Correct
if (arr.indexOf('react') !== -1) {
  console.log('Can use React')
}
```

或者使用一点点`hack` 位运算符 `~` 使代码更加紧凑一些，因为`~`（位异或）对任何数字相当于`-(a + 1)`:

```js
let arr = ['react', 'angular', 'vue']

// Correct
if (~arr.indexOf('react')) {
  console.log('Can use React')
}
```

而在`ES7`中，可以使用`includes`开替代`indexOf`作为检测：

```js
let arr = ['react', 'angular', 'vue']

// Correct
if (arr.includes('react')) {
  console.log('Can use React')
}
```

开发者还能在字符串中使用`includes`:
```js
let str = 'React Quickly'

// Correct
if (str.toLowerCase().includes('react')) {  // true
  console.log('Found "react"')  
}
```

includes第二可选参数fromIndex，这对于优化是有好处的，因为它允许从特定位置开始寻找匹配。

```js
console.log([1, 2, 3].includes(2)) // === true
console.log([1, 2, 3].includes(4)) // === false
console.log([1, 2, NaN].includes(NaN)) // === true
console.log([1, 2, -0].includes(+0)) // === true
console.log([1, 2, +0].includes(-0)) // === true
console.log(['a', 'b', 'c'].includes('a')) // === true
console.log(['a', 'b', 'c'].includes('a', 1)) // === false
console.log('React Quickly'.includes('React')) // === true
```
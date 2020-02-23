---
title:         es6-iterator遍历器 # 标题
description:   Array、String、Map、Set、NodeList等可遍历的对象 # 副标题
date:          2020-02-22 # 建立日期
updated:       2020-02-22 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - ES6
---

> 参考：http://es6.ruanyifeng.com/#docs/iterator

`JavaScript` 原有的表示“集合”的数据结构，主要是数组（`Array`）和对象（`Object`），ES6 又添加了 `Map` 和 `Set`。

遍历器（`Iterator`）是一种访问机制，只要部署了 `Iterator` 接口，就可以完成遍历操作。

`Iterator` 的作用有三个：
- 为各种数据结构，提供一个统一的、简便的访问接口；
- 使得数据结构的成员能够按某种次序排列；
- ES6 创造了一种新的遍历命令 for...of 循环，`Iterator` 接口主要供 for...of 消费。


`Iterator` 的遍历过程是这样的。

（1）创建一个指针对象，指向当前数据结构的起始位置。也就是说，遍历器对象本质上，就是一个指针对象。

（2）第一次调用指针对象的next方法，可以将指针指向数据结构的第一个成员。

（3）第二次调用指针对象的next方法，指针就指向数据结构的第二个成员。

（4）不断调用指针对象的next方法，直到它指向数据结构的结束位置。


原生具备 `Iterator` 遍历接口的数据结构如下
- **Array**
- **String**
- [**Map**](http://es6.ruanyifeng.com/#docs/set-map)
- [**Set**](http://es6.ruanyifeng.com/#docs/set-map)
- **TypedArray**
- **函数的 arguments 对象**
- **NodeList 对象**


以数组Array为例，内部共有 `Symbol.iterator`、`keys`、`values`、`entries`这几种遍历器：
```js
const colors = ['red', 'green', 'blue']

// Symbol遍历器
const iterator1 = colors[Symbol.iterator]() // Array Iterator {}
// 调用next()，返回相应的元素值，直到done为true
console.log(iterator1.next()) // {value: "red", done: false}
console.log(iterator1.next()) // {value: "green", done: false}
console.log(iterator1.next()) // {value: "blue", done: false}
console.log(iterator1.next()) // {value: undefined, done: true}
console.log(iterator1.next()) // {value: undefined, done: true}

console.log('--分割线--')

// values遍历器（同Symbil.iterator）
const iterator2 = colors.values() // Array Iterator {}
// 调用next()，返回相应的元素值，直到done为true
console.log(iterator2.next()) // {value: "red", done: false}
console.log(iterator2.next()) // {value: "green", done: false}
console.log(iterator2.next()) // {value: "blue", done: false}
console.log(iterator2.next()) // {value: undefined, done: true}
console.log(iterator2.next()) // {value: undefined, done: true}

console.log('--分割线--')

// keys遍历器
const iterator3 = colors.keys() // Array Iterator {}
// 调用next()，返回相应的索引，直到done为true
console.log(iterator3.next()) // {value: 0, done: false}
console.log(iterator3.next()) // {value: 1, done: false}
console.log(iterator3.next()) // {value: 2, done: false}
console.log(iterator3.next()) // {value: undefined, done: true}
console.log(iterator3.next()) // {value: undefined, done: true}

console.log('--分割线--')

// entries遍历器
const iterator4 = colors.entries() // Array Iterator {}
// 调用next()，返回相应的索引和元素组成的数组，直到done为true
console.log(iterator4.next()) // {value: [0, "red"], done: false}
console.log(iterator4.next()) // {value: [1, "green"], done: false}
console.log(iterator4.next()) // {value: [2, "blue"], done: false}
console.log(iterator4.next()) // {value: undefined, done: true}
console.log(iterator4.next()) // {value: undefined, done: true}
```

当然我们可以自己编写遍历器，比如我们编写一个 `values2` 遍历器，实现 `values` 遍历器的功能：
```js
Array.prototype.values2 = function () {
  let i = 0;
  let items = this;
  return {
    next() {
      const done = i >= items.length;
      const value = done ? undefined : items[i++]
      return {
        value,
        done
      }
    }
  }
}

const iterator5 = colors.values2() // Array Iterator {}
// 调用next()，返回相应的元素值，直到done为true
console.log(iterator5.next()) // {value: "red", done: false}
console.log(iterator5.next()) // {value: "green", done: false}
console.log(iterator5.next()) // {value: "blue", done: false}
console.log(iterator5.next()) // {value: undefined, done: true}
console.log(iterator5.next()) // {value: undefined, done: true}
```

同理，
通过查找new String().\_\_proto\_\_可发现，***String***拥有Symbol.iterator遍历器
通过查找new Map().\_\_proto\_\_可发现，***Map***拥有Symbol.iterator、keys、values、entries
通过查找new Set().\_\_proto\_\_可发现，***Set***拥有Symbol.iterator、keys、values、entries
通过查找document.querySelectorAll('li').\_\_proto\_\_可发现，***NodeList***拥有Symbol.iterator、keys、values、entries
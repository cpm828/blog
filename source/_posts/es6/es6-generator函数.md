---
title:         es6-generator函数 # 标题
description:   es6 generator函数 # 副标题
date:          2020-02-23 # 建立日期
updated:       2020-02-23 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - ES6
---

> 参考：http://es6.ruanyifeng.com/#docs/generator


## 概述

`Generator` 函数的两大特征：`*`、`yield`（产出）。

`Generator` 函数的表示法：
```js
function * foo(x, y) { yield 'hello' }
function *foo(x, y) { yield 'hello' }
function* foo(x, y) { yield 'hello' }
function*foo(x, y) { yield 'hello' }
```

通常将 `*` 号紧跟在 `function` 关键字的后面，即：
```js
function* foo(x, y) { ··· }
```

例：
```js
function* helloWorld() {
  yield 'hello';
  yield 'world';
  return 'ending';
}

var hw = helloWorld();
```
上面代码定义了一个 `Generator` 函数helloWorld，它内部有两个 `yield` 表达式（hello和world），即该函数有三个状态：hello，world 和 return 语句（结束执行）。

`Generator` 函数的调用和普通的函数一样在函数名后面加括号，但是不同的是，调用之后不会立即执行，而是指向内部状态的指针对象。需要和 `Iterator` 一样调用 `next` 方法。每调用一次 `next` 方法。每调用一次，指针移动一次，直到遇到 `yield` 或 `return` 才停下来这一步，并且返回一个done来标识是否完全停止。

上例中调用 `next`：
```js
hw.next() // {value: "hello", done: false}

hw.next() // {value: "world", done: false}

hw.next() // {value: "ending", done: true}

hw.next() // {value: undefined, done: true}
```

由于 `yield` 可以起到暂停执行的操作，因此可以利用该特性实现异步操作。完整逻辑如下：

（1）遇到 `yield` 关键字，就暂停执行后面的操作。并将紧跟在 `yield` 后面的表达式的值，作为返回对象的value值返回。

（2）下一次调用 `next` 方法，再继续往下执行，知道遇到下一个 `yeild` 表达式。

（3）如果没有遇到 `yield` 表达式，就一直运行到函数结束，直到 `return` 为止。

（4）如果没有 `return`，则返回的对象的value值为 `undefined`。


需要注意的是，`yield` 后面的表达式，只有在调用 `next` 方法，内部指针指到这一句时，才会执行这条语句。如：
```js
function* gen() {
  console.log(123)
  console.log(456)
  yield 123 + 456 // 只有调用next方法指到该行时，才会执行 123+456
}
```

当然，`Generator` 函数也可以不搭配 `yield` 使用，这样就变成了一个简单的暂缓函数。如：
```js
function* f() {
  console.log('执行了！')
}
var generator = f()

setTimeout(function () {
  generator.next() // "执行了！"
}, 2000);
```

`yield` 关键字只能用在 `Generator` 函数中，用在普通函数里面会报错。
```js
function test() {
  yield 1;
}
// Uncaught SyntaxError: Unexpected number
```


## for...of循环
`for...of` 循环可以自动遍历 `Generator` 函数运行时生成的 `Iterator` 对象，且此时不再需要调用next方法。
```js
function* foo() {
  yield 1;
  yield 2;
  yield 3;
  yield 4;
  yield 5;
  return 6;
}

for (let v of foo()) {
  console.log(v);
}
// 1 2 3 4 5
```
使用 `for...of` 循环，依次显示 5 个yield表达式的值。一旦 `next` 方法返回的值是 `true`，就会停止循环，且不包含该返回对象，即不包含 `return` 语句的6。


## Generator.prototype.throw()
`Generator` 函数返回的遍历器对象，都有一个throw方法，可以在函数体外抛出错误，然后在 `Generator` 函数体内捕获。
```js
var g = function* () {
  try {
    yield;
  } catch (e) {
    console.log('内部捕获', e);
  }
};

var i = g();
i.next();

try {
  i.throw('a');
  i.throw('b');
} catch (e) {
  console.log('外部捕获', e);
}
// 内部捕获 a
// 外部捕获 b
```

特殊情况1：
注意不要混淆 `Generator.prototype.throw()` 和全局的 `throw` 方法。
将上面的 `throw` 改用全局方法，则会在函数体外的 `catch` 语句中捕获。
```js
var g = function* () {
  try {
    yield;
  } catch (e) {
    console.log('内部捕获', e);
  }
};

var i = g();
i.next();

try {
  i.throw('a');
  i.throw('b');
} catch (e) {
  console.log('外部捕获', e);
}
// 外部捕获 a
```

特殊情况2：
如果 `Generator` 函数中没有try...catch语句，在外面调用 `Generator.prototype.throw()`，则会被外部的 `try...catch` 捕获。如：
```js
var g = function* () {
  yield;
};

var i = g();
i.next();

try {
  i.throw('a');
  i.throw('b');
} catch (e) {
  console.log('外部捕获', e);
}
// 外部捕获 a
```

特殊情况3：如果内部外部都没有 `try...catch`，则会报错。
```js
var g = function* () {
  yield;
};

var i = g();
i.next();
i.throw(); // Uncaught undefined
```


## Generator.prototype.return()
`Generator` 函数返回的遍历器对象，还有一个 `return` 方法，可以返回给定的值，并且终结遍历 `Generator` 函数。
```js
function* gen() {
  yield 1;
  yield 2;
  yield 3;
}

var g = gen();

g.next()        // { value: 1, done: false }
g.return('foo') // { value: "foo", done: true }
g.next()        // { value: undefined, done: true }
```
---
title:         Promise对象 # 标题
description:   ES6中的promise对象及用法 # 副标题
tags: # 标签分类
    - ES6
---


>摘自：[阮一峰 ECMAScript 6 入门](http://es6.ruanyifeng.com/#docs/promise)

## 介绍
Promise是异步编程的一种解决方案

所谓Promise，简单说就是一个容器，里面保存着某个未来才会结束的事件（通常是一个异步操作）的结果。从语法上说，它是一个对象，从它可以获取异步操作的消息。

* 对象的状态不受外界影响，Promise对象代表这一个异步操作，有三个状态：如下，只有异步操作的结果才可以决定当前是哪一种状态
  * Pending（进行中）
  * Resolved（已完成，又称Fulled）
  * Rejected（已失败）

* 一旦状态改变，就不会再变，任何时候都可以得到这个结果，Promised对象的状态改变，只有两种，如下：，只要这两种情况发生，状态就凝固了，不会再变了。会一直保持这个结果。
  * 从Pending变为Resolved
  * 从Pending变为Rejected


## 基本用法
* Promise对象是一个构造函数，用来生成Promise对象

```js
var promise = new Promise(function(resolve, reject) {
  if (/* 异步操作成功时 */) {
    resolve(value)
  } else {
    reject(error)
  }
})
```
resolve函数的作用是，将Promise对象的状态从“未完成”变为“成功”（从Pending变为Resolved），在异步操作成功的时候调用，并将异步操作的结果，作为参数传递出去；
reject函数的作用是，将Promise对象的状态从“未完成”变为“失败”（从Pending变为Rejected），在异步操作失败的时候调用，并将异步操作返回的错误，作为参数传递出去。

* Promise实例生成之后，可以用then方法指定Resolved和Reject状态的回调函数，两个参数，一个成功回调，一个失败回调，第二个参数失败回调可选

```js
promise.then(function (value) {
  // success
}, function (error) {
  // error
})

```

例如下例：

```js
function timeout(ms) {
  return new Promise((resolve, reject) => {
    setTimeout(resolve, ms, 'done');
  });
}

timeout(100).then((value) => {
  console.log(value);
});
```

上例中：timeout方法返回一个Promise实例，表示一段时间以后才会发生的结果。过了指定的时间（ms参数）以后，Promise实例的状态变为Resolved，就会触发then方法绑定的回调函数。

Promise新建后就会立即执行

例如下例：

```js
let promise = new Promise(function(resolve, reject) {
  console.log('Promise');
  resolve();
});

promise.then(function() {
  console.log('Resolved.');
});

console.log('Hi!');

// Promise
// Hi!
// Resolved
```
上例中：Promise实例新建后立即执行，先输出“Promise”，然后then方法指定回调，当时回调会在当前脚本的同步方法之后才会执行，所以其次是输出“Hi！”，最后才会输出回调里面的“Resolved”


下面是异步加载图片的例子：

```js
function loadImageAsync(url) {
  return new Promise(function(resolve, reject) {
    var image = new Image();

    image.onload = function() {
      resolve(image);
    };

    image.onerror = function() {
      reject(new Error('Could not load image at ' + url));
    };

    image.src = url;
  });
}
```


下面是用Promise对象实现Ajax操作的例子

```js
var getJSON = function(url) {
  var promise = new Promise(function(resolve, reject){
    var client = new XMLHttpRequest();
    client.open("GET", url);
    client.onreadystatechange = handler;
    client.responseType = "json";
    client.setRequestHeader("Accept", "application/json");
    client.send();

    function handler() {
      if (this.readyState !== 4) {
        return;
      }
      if (this.status === 200) {
        resolve(this.response);
      } else {
        reject(new Error(this.statusText));
      }
    };
  });

  return promise;
};

getJSON("/posts.json").then(function(json) {
  console.log('Contents: ' + json);
}, function(error) {
  console.error('出错了', error);
});
```

resolve函数参数除了可能是正常的值以外也可能是另一个Promise实例，即回调里面是请求，如下例：

```js
var p1 = new Promise(function (resolve, reject) {
  // ...
});

var p2 = new Promise(function (resolve, reject) {
  // ...
  resolve(p1);
})
```

上例中：p1和p2都是Promise的实例，但是p2的resolve方法将p1作为参数，即p1的状态决定了p2的状态。如果p1是Pending，那么p2就必须要等待。如果p1是Resolved或Rejected，那么p2的回调函数将会立即执行。


```js
var p1 = new Promise(function (resolve, reject) {
  setTimeout(() => reject(new Error('fail')), 3000)
})

var p2 = new Promise(function (resolve, reject) {
  setTimeout(() => resolve(p1), 1000)
})

p2
  .then(result => console.log(result))
  .catch(error => console.log(error))
// Error: fail
```

上面代码中：p1是一个Promise，3s后变为rejected。p2的状态在1s之后改变，resolve方法返回的是p1。此时，由于p2返回的是另一个Promise，所以后面的then语句都变成针对后者（p1）。又过了2s，p1变为rejected，导致出发catch方法指定的回调函数。


## Promise.prototype.then()

then方法是定义在原型对象Promise.prototype上的。它的作用是为Promise实例添加状态改变时的回调。前面说过，then方法的第一个参数是Resolved成功后的回调，第二个参数（可选）是Rejected失败后的回调。

then方法返回的是一个新的Promise实例，因此可以采用链式写法，及then方法后再调用一个then方法

```js
getJSON("/posts.json").then(function(json) {
  return json.post;
}).then(function(post) {
  // ...
});
```

上面的代码中，使用then方法一次指定了两个回调，第一个回调完成以后，会将返回的结果作为参数，传入第二个回调。

这种链式的then可以指定一组按照次序调用的回调。这时，前一个回调有可能还是一个Promise实例，这时后一个就必须等待。如下例：

```js
getJSON("/post/1.json").then(function(post) {
  return getJSON(post.commentURL);
}).then(function funcA(comments) {
  console.log("Resolved: ", comments);
}, function funcB(err){
  console.log("Rejected: ", err);
});
```

上例中：第一个then方法指定的回调是一个Promise实例。这时，第二个then方法指定的回调，就会等待这个新的Promise对象状态先发生变化。如果变为Resolved，就调用funcA，如果变为Rejected，就调用funcB。

采用箭头函数：

```js
getJSON("/post/1.json").then(
  post => getJSON(post.commentURL)
).then(
  comments => console.log("Resolved: ", comments),
  err => console.log("Rejected: ", err)
);
```

## Promise.prototype.catch()

Promise.ptototype.catch方法是.then(null, rejection)的别名，用于指定发生错误时的回调函数。

```js
getJSON('/posts.json').then(function(posts) {
  // ...
}).catch(function(error) {
  // 处理 getJSON 和 前一个回调函数运行时发生的错误
  console.log('发生错误！', error);
});
```

上例中：如果该对象状态变为Resolved，会调用then方法指定的回调，如果异步操作抛出错误，状态就会变为Rejected，就会调用catch方法指定的回调。另外，如果运行中抛出错误，也会被catch捕获。

```js
p.then((val) => console.log('fulfilled:', val))
  .catch((err) => console.log('rejected', err));

// 等同于
p.then((val) => console.log('fulfilled:', val))
  .then(null, (err) => console.log("rejected:", err));
```

如下例：

```js
var promise = new Promise(function(resolve, reject) {
  throw new Error('test');
});
promise.catch(function(error) {
  console.log(error);
});
// Error: test
```

promise抛出一个错误，就会被catch方法指定的回调函数捕获。注意，上面的写法与下面两种写法是等价的。

```js
// 写法一
var promise = new Promise(function(resolve, reject) {
  try {
    throw new Error('test');
  } catch(e) {
    reject(e);
  }
});
promise.catch(function(error) {
  console.log(error);
});

// 写法二
var promise = new Promise(function(resolve, reject) {
  reject(new Error('test'));
});
promise.catch(function(error) {
  console.log(error);
});
```

上述也说明，reject方法的作用，等同于抛出错误。

如果Promise状态已经变成Resolved，再抛出错误是无效的。

```js
var promise = new Promise(function(resolve, reject) {
  resolve('ok');
  throw new Error('test');
});
promise
  .then(function(value) { console.log(value) })
  .catch(function(error) { console.log(error) });
// ok
```

上面代码中：Promise在resolve语句后面，再抛出错误，不会被捕获，等同于没有抛出。因为Promise的状态一旦改变，就永久保持该状态，不会再改变了。


一般来说，不要在then方法里面定义Rejected失败状态的回调，应该使用catch语句

```js
// bad
promise
  .then(function(data) {
    // success
  }, function(err) {
    // error
  });

// good
promise
  .then(function(data) { //cb
    // success
  })
  .catch(function(err) {
    // error
  });
```

因为，Promise对象的错误具有冒泡性质，会一直向后传递，直到被捕获。错误总可以被catch语句捕获。

then catch语句更容易捕获错误，而且接近同步的写法（try/catch）语句。

## Promise.all()

Promise.all方法用于将多个Promise实例，包装成一个新的Promise实例。

```js
var p = Promise.all([p1, p2, p3]);
```

Promise.all的参数可以不是数组，但必须具有接口，且返回的每个成员都是Promise实例

p的状态有p1、p2、p3决定，分成两种情况

* 只有p1、p2、p3的状态都变成fulfilled，p的状态才会变成fulfilled。此时p1、p2、p3的返回值组成一个数组，传递给p的回调

* 只要p1、p2、p3的状态有一个被rejected，p的状态就会变成rejected，此时，第一个被rejected的实例的返回值，会传递给p的回调


## Promise.race()

Promise.race方法同样是将多个Promise实例，包装成一个新的Promise实例。

```js
var p = Promise.race([p1, p2, p3]);
```

## Promise.resolve()

有时需要将现有对象转为Promise对象，Promise.resolve方法就起到这个作用

```js
var jsPromise = Promise.resolve($.ajax('/whatever.json'));
```

Promise.resolve等价于下面的写法

```js
Promise.resolve('foo')
// 等价于
new Promise(resolve => resolve('foo'))
```

## Promise.reject()

Promise.reject方法也会返回一个新的Promise实例，状态未rejected

```js
var p = Promise.reject('出错了');
// 等同于
var p = new Promise((resolve, reject) => reject('出错了'))

p.then(null, function (s) {
  console.log(s)
});
// 出错了
```

## 应用

将图片的加载写成一个Promise，一旦加载完成，Promise的状态就发生变化。

```js
const preloadImage = function (path) {
  return new Promise(function (resolve, reject) {
    var image = new Image();
    image.onload  = resolve;
    image.onerror = reject;
    image.src = path;
  });
};
```

---
title:         let 和 const # 标题
description:   ES6中的let和const用法 # 副标题
tags: # 标签分类
    - ES6
---


## let

* 只在代码块内有效
* 不存在变量提升（只能先声明后使用）（变量提升指变量在声明之前使用，值为ReferenceError）
  ```js
  // var 的情况
  console.log(foo); // 输出undefined
  var foo = 2;

  // let 的情况
  console.log(bar); // 报错ReferenceError
  let bar = 2;
  ```

* 暂时性死区（声明之前变量不可用）（暂时性死区简称“TDZ”）
  例1：
  ```js

  var tmp = 123;

  if (true) {
    tmp = 'abc'; // ReferenceError
    let tmp;
  }
  ```

  例2：
  ```js
  if (true) {
    // TDZ开始
    tmp = 'abc'; // ReferenceError
    console.log(tmp); // ReferenceError

    let tmp; // TDZ结束
    console.log(tmp); // undefined

    tmp = 123;
    console.log(tmp); // 123
  }
  ```

  例3：
  ```
  typeof x; // ReferenceError
  let x;
  ```

* 不允许重复申明（不允许在相同作用域内重复声明同一个变量）
  例1：
  ```js
  // 报错
  function () {
    let a = 10;
    var a = 1;
  }

  // 报错
  function () {
    let a = 10;
    let a = 1;
  }
  ```

  例2：
  ```js
  function func(arg) {
    let arg; // 报错
  }

  function func(arg) {
    {
      let arg; // 不报错
    }
  }
  ```

* let新增块级作用域
  * ES5只有全局作用域和函数作用域
  * ES5函数只能在顶层作用域和函数作用域内声明，不能在块级作用域内声明
    ```js
    // ES5 情况一：非法
    if (true) {
      function f () {}
    }

    // ES5 情况二：非法
    try {
      function f () {}
    } catch (e) {
      // ...
    }

    // ES6
    if (true) {
      function f () {}
    }
    ```

  * 在块级作用域内，函数声明语句的行为类似于let，在块级作用域之外不可引用，对作用域之外并不会影响
    ```js
    // 对于本例：
    function f() { console.log('I am outside!'); }
    (function () {  
      if (false) {   
       // 重复声明一次函数f    
        function f() { console.log('I am inside!'); }   
      }  
     f();
    }());
    ```
    ```js
    // ES5实际运行代码：结果为：I am inside!
    function f() { console.log('I am outside!');  }
    (function () {  
      function f() { console.log('I am inside!'); }   
      if (false) {   
      }  
     f();
    }());
    ```
    ```js
    // ES6实际运行代码：结果为：I am outside!
    function f() { console.log('I am outside!');  }
    (function () {  
     f();
    }());
    ```

## const
声明常量，不可变指的是该常量指向的地址，而不是常量本身
* const声明一个只读的常量，一旦声明，常量的值就不能改变
  ```js
  const PI = 3.1415;
  PI // 3.1415

  PI = 3;
  // TypeError: Assignment to constant variable.
  ```

* const一旦声明变量，就必须立即初始化，不能等到以后赋值
  ```js
  const foo;
  // SyntaxError: Missing initializer in const declaration
  ```

* 只在声明所在的块级作用域内有效
  ```js
  if (true) {
    const MAX = 5;
  }

  MAX // Uncaught ReferenceError: MAX is not defined
  ```

* const声明的常量也不存在变量提升
* 存在暂时性死区
* 只能先声明后使用
* 不可重复声明
* 对于复合类型的变量，变量名不指向数据，而是指向数据所在的地址。即const命令只是保证变量名指向的地址不变，而不是保证数据不变，所以使用const声明为常量必须小心。
  ```js
  const foo = {};
  foo.prop = 123;
  foo.prop
  // 123
  foo = {}; // TypeError: "foo" is read-only
  ```

上例中：常量foo存储的是一个地址，这个地址指向一个对象。所谓不可变的是这个地址，不能把foo指向另一个地址，但是该对象本身是可变的，可以为这个对象添加新属性等
```js
const a = [];
a.push('Hello'); // 可执行
a.length = 0;    // 可执行
a = ['Dave'];    // 报错
```

上例中：常量a是一个数组，这个数组本身是可写的，但是将另一个数组赋给a，就会报错，因为改变了a指向的地址

## ES6其他声明变量的方法
共6中声明变量的方法:
* ES5两种：var 和 function
* ES6新增的：let 和 const
* ES6其他：import 和 class

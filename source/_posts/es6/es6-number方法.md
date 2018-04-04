---
title:         ES6 number方法 # 标题
description:   es6中一些较常使用的数字方法 # 副标题
tags: # 标签分类
    - ES6
---


>参考：[阮一锋 ES6 Number方法](http://es6.ruanyifeng.com/#docs/number)

* 进制表示法

  * 二进制：前缀0b（或0B）
    ```js
    Number('0b111')  // 7
    ```

  * 八进制：前缀0o（或0O）
    ```js
    Number('0o10') // 8
    ```

* Number.isInfinte()：检查一个数值是否为有限的
  ```js
  Number.isFinite(15); // true

  Number.isFinite(Infinity); // false

  Number.isFinite(-Infinity); // false

  Number.isFinite(NaN); // false，任何非数值都是无限的

  Number.isFinite('foo'); // false

  Number.isFinite('15'); // false

  Number.isFinite(true); // false

  ```

* Number.isNan()：检查一个值是否为NaN
  ```js
  Number.isNaN(NaN) // true

  Number.isNaN(9/NaN) // true

  Number.isNaN('true'/0) // true

  Number.isNaN('true'/'true') // true

  Number.isNaN(15) // false

  Number.isNaN('15') // false

  Number.isNaN(true) // false

  ```

* Number.parseInt()：es6保持不变，转换成整型
  Number.parseFloat()：es6保持不变，转换成浮点型
  ```js
  // ES5的写法

  parseInt('12.34') // 12

  parseFloat('123.45#') // 123.45

  // ES6的写法

  Number.parseInt('12.34') // 12

  Number.parseFloat('123.45#') // 123.45

  ```

* Number.isInteger()：判断一个值是否为整数，js中3和3.0被视为同一个值
  ```js
  Number.isInteger(25) // true

  Number.isInteger(25.0) // true

  Number.isInteger(25.1) // false

  Number.isInteger("15") // false

  Number.isInteger(true) // false

  ```

* Number.EPSILON()：极小的常量
  ```js
  Number.EPSILON // 2.220446049250313e-16

  Number.EPSILON.toFixed(20) // '0.00000000000000022204'
  ```

  因浮点数运算存在误差，引入一个这么小的常量目的在于为浮点数计算设置一个误差范围

  es5中：
  ```js
  0.1 + 0.2 // 0.30000000000000004

  0.1 + 0.2 - 0.3 // 5.551115123125783e-17

  5.551115123125783e-17.toFixed(20) // '0.00000000000000005551'
  ```

  es6中：
  ```js
  5.551115123125783e-17 < Number.EPSILON // true  
  ```

  ```js
  function withinErrorMargin (left, right) {
    return Math.abs(left - right) < Number.EPSILON;
  }

  withinErrorMargin(0.1 + 0.2, 0.3) // true

  withinErrorMargin(0.2 + 0.2, 0.3) // false
  ```

* Number.isSafeInteger()：判断一个整数是否落在这个范围之内  
  这个范围：```Number.MAX_SAFE_INTEGER```和```Number.MIN_SAFE_INTEGER```这两个常量之间

  JavaScript能够准确表示的整数范围再-2^53到2^53之间（不含两个端点），超过这个范围，无法精确表示

  es5:
  ```js
  Math.pow(2, 53) // 9007199254740992

  9007199254740992  // 9007199254740992

  9007199254740993  // 9007199254740992

  Math.pow(2, 53) === Math.pow(2, 53) + 1 // true
  ```

  es6:
  ES6引入了```Number.MAX_SAFE_INTEGER```和```Number.MIN_SAFE_INTEGER```这两个常量，用来表示这个范围的上下限  
  ```js
  Number.MAX_SAFE_INTEGER === Math.pow(2, 53) - 1 // true

  Number.MAX_SAFE_INTEGER === 9007199254740991 // true

  Number.MIN_SAFE_INTEGER === -Number.MAX_SAFE_INTEGER // true

  Number.MIN_SAFE_INTEGER === -9007199254740991 // true  
  ```

  应用：
  ```js
  Number.isSafeInteger('a') // false

  Number.isSafeInteger(null) // false

  Number.isSafeInteger(NaN) // false

  Number.isSafeInteger(Infinity) // false

  Number.isSafeInteger(-Infinity) // false

  Number.isSafeInteger(3) // true

  Number.isSafeInteger(1.2) // false

  Number.isSafeInteger(9007199254740990) // true

  Number.isSafeInteger(9007199254740992) // false

  Number.isSafeInteger(Number.MIN_SAFE_INTEGER) // true

  Number.isSafeInteger(Number.MIN_SAFE_INTEGER - 1) // false

  Number.isSafeInteger(Number.MAX_SAFE_INTEGER) // true

  Number.isSafeInteger(Number.MAX_SAFE_INTEGER + 1) // false
  ```

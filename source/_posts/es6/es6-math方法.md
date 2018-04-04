---
title:         ES6 math方法 # 标题
description:   es6中一些较常使用的数学方法 # 副标题
tags: # 标签分类
    - ES6
---


>参考：[阮一峰 ES6 Math对象扩展](http://es6.ruanyifeng.com/#docs/number)

* Math.trunc()：用于去除一个数的小数部分，返回整数部分
  ```js
  Math.trunc(4.1) // 4

  Math.trunc(4.9) // 4

  Math.trunc(-4.1) // -4

  Math.trunc(-4.9) // -4

  Math.trunc(-0.1234) // -0

  Math.trunc('123.456') // 123，数值字符串会先经过Number()方法转换成数值

  Math.trunc(NaN);      // NaN

  Math.trunc('foo');    // NaN

  Math.trunc();         // NaN
  ```

* Math.sign()：判断一个输是正数、负数还是零

  * 参数为正数，返回+1；

  * 参数为负数，返回-1；

  * 参数为0，返回0；

  * 参数为-0，返回-0;

  * 其他值，返回NaN

  ```js
  Math.sign(-5) // -1

  Math.sign(5) // +1

  Math.sign(0) // +0

  Math.sign(-0) // -0

  Math.sign(NaN) // NaN

  Math.sign('foo'); // NaN

  Math.sign();  // NaN
  ```

* Math.cbrt()：计算一个数的立方根
  ```js
  Math.cbrt(-1) // -1

  Math.cbrt(0)  // 0

  Math.cbrt(1)  // 1

  Math.cbrt(2)  // 1.2599210498948734  

  Math.cbrt('8') // 2，数值字符串会先经过Number转换

  Math.cbrt('hello') // NaN
  ```

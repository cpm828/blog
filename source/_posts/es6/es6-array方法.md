---
title:         ES6 array方法 # 标题
description:   es6中一些较常使用的数组方法 # 副标题
tags: # 标签分类
    - ES6
---


>参考：[阮一峰 ES6 Array方法](http://es6.ruanyifeng.com/#docs/array)

* Array.from()：将两类对象（类似数组的对象和可遍历的对象）转为真正的数组
  ```js
  let arrayLike = {
    '0': 'a',
    '1': 'b',
    '2': 'c',
    length: 3
  };

  // ES5的写法：
  var arr1 = [].slice.call(arrayLike); // ['a', 'b', 'c']

  // ES6的写法：
  let arr2 = Array.from(arrayLike); // ['a', 'b', 'c']
  ```

* Array.of()：将一组值转换成数组
  ```js
  Array.of(3, 11, 8) // [3,11,8]

  Array.of(3) // [3]

  Array.of(3).length // 1

  Array.of() // []

  Array.of(undefined) // [undefined]
  ```

* copyWithin()：将指定位置的成员复制到其他位置（会覆盖原有成员），然后返回当前数组

  Array.prototype.copyWithin(target, start = 0, end = this.length)

  target（必需）：从该位置开始替换数据。

  start（可选）：从该位置开始读取数据，默认为0。如果为负值，表示倒数。

  end（可选）：到该位置前停止读取数据，默认等于数组长度。如果为负值，表示倒数。正从0开始，负从-1开始。

  这三个参数都应该是数值，如果不是，会自动转为数值。

  ```js
  [1, 2, 3, 4, 5].copyWithin(0, 3)  // [4, 5, 3, 4, 5]
  // 从3号位直到数组结束的成员（4和5），复制到从0号位开始的位置，结果覆盖了原来的1和2

  [1, 2, 3, 4, 5].copyWithin(0, 3, 4) // [4, 2, 3, 4, 5]
  // 将3号位复制到0号位

  [1, 2, 3, 4, 5].copyWithin(0, -2, -1) // [4, 2, 3, 4, 5]
  // -2相当于3号位，-1相当于4号位

  [].copyWithin.call({length: 5, 3: 1}, 0, 3) // {0: 1, 3: 1, length: 5}
  // 将3号位复制到0号位

  var i32a = new Int32Array([1, 2, 3, 4, 5]); i32a.copyWithin(0, 2); // Int32Array [3, 4, 5, 4, 5]
  // 将2号位到数组结束，复制到0号位

  // 对于没有部署TypedArray的copyWithin方法的平台

  // 需要采用下面的写法:

  [].copyWithin.call(new Int32Array([1, 2, 3, 4, 5]), 0, 3, 4); // Int32Array [4, 2, 3, 4, 5]
  ```

* find()：用于找出第一个符合条件的数组成员
  ```js
  [1, 4, -5, 10, -1].find((n) => n < 0) // -5
  // 找出数组中第一个小于0的成员，-1布什第一个，不返回。

  [1, 5, 10, 15].find(function(value, index, arr) {  
    return value > 9;
  }) // 10
  // 找出大于9的，15不是第一个，不返回
  ```

* findIndex()：返回第一个符合条件的数组成员的位置，如果所有成员都不符合条件，则返回-1
  ```js
  [1, 5, 10, 15].findIndex(function(value, index, arr) {  
    return value > 9;
  }) // 2

  [NaN].indexOf(NaN) // -1

  [NaN].findIndex(y => Object.is(NaN, y)) // 0
  ```

* fill()：使用给定值，填充一个数组

  第二个参数（可选）表示替换起始位置，第三个参数（可选），表示结束位置
  ```js
  ['a', 'b', 'c'].fill(7) // [7, 7, 7]

  new Array(3).fill(7) // [7, 7, 7]

  ['a', 'b', 'c'].fill(7, 1, 2) // ['a', 7, 'c']
  ```

* includes()：是否包含指定元素，es7语法，babel转换器已支持

  第二个参数可选，表示指定搜索起始位置，从起始位置到结尾，默认为0，负数表示倒数；当大于数组长度，会重置为从0开始
  ```js
  [1, 2, 3].includes(2);     // true

  [1, 2, 3].includes(4);     // false

  [1, 2, NaN].includes(NaN); // true


  [1, 2, 3].includes(3, 3);   // false

  [1, 2, 3].includes(3, -1);   // true


  [1, 2, 3].includes(2, 0);    // true

  [1, 2, 3].includes(2, 1);    // true

  [1, 2, 3].includes(2, 2);    // false

  [1, 2, 3].includes(2, 3);    // false


  [1, 2, 3].includes(2, -1);    // false

  [1, 2, 3].includes(2, -2);    // true

  [1, 2, 3].includes(2, -3);    // true

  [1, 2, 3].includes(2, -4);    // true
  ```

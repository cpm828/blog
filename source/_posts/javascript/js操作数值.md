---
title:         js操作数值 # 标题
description:   js操作数值，取整、精确小数位数等 # 副标题
date:          2017-04-12 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---


经常需要用到js来操作数值，如取整、精确小数点后面的位数等等


## 取浮点数
```js
parseFloat('123.45') = 123.45

parseFloat('123.45abc') = 123.45

parseFloat('abc 123.45') = NaN

parseFloat(true) = NaN
```


## 对象转换成数字
```js
Number(true) = 1

Number(false) = 0

Number(new Date()) = 1491972682647

Number('999') = 999

Number('999 888') = NaN
```


## 取整
- 将字符串或浮点数开头的整数提取出来
  ```js
  parseInt(123) = 123

  parseInt(123.45) = 123

  parseInt(123.45abc) = 123 // error:Invalid or unexpected token

  parseInt('123') = 123

  parseInt('123.45') = 123

  parseInt('123,,45') = 123

  parseInt('123.45abc') = 123

  parseInt(true) = NaN
  ```

- 四舍五入
  ```js
  // 四舍
  Math.round(5 / 4) = 1

  // 五入
  Math.round(5 / 2) = 3
  ```

- 向上取整（有小数就+1）
  ```js
  Math.ceil(5 / 2) = 3
  ```

- 丢弃小数
  ```js
  Math.floor(5 / 2) = 2
  ```


## 精确到小数点后两位
- 四舍五入型
  ```js
  // 四舍
  var a = 123.451789
  (a / 100).toFixed(2) = '123.45'

  // 五入
  var a = 123.456789
  (a / 100).toFixed(2) = '123.46'

  // 建议增加零判断（00.00 = 0）：
  var a = 123.456789
  parseFloat(a / 100).toFixed(2) == 0 ? 0 : (a / 100).toFixed(2)
  ```

- 全舍型
  ```js
  var a = 123.456789
  Math.floor(a * 100) / 100
  // 无需增加零判断
  ```

- 全入型
  ```js
  var a = 123.456789
  Math.ceil(a * 100) / 100
  // 无需增加零判断
  ```

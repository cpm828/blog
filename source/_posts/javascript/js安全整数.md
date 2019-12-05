---
title:         js最大安全整数 # 标题
description:   js最大安全整数，Number.MAX_SAFE_INTEGER、Number.MIN_SAFE_INTEGER、Number.MAX_VALUE、Number.MIN_VALUE # 副标题
date:          2019-11-22 # 建立日期
updated:       2019-11-22 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---

**`Number.isSafeInteger(testValue)`** 判断是否是安全整数

**`Number.MAX_SAFE_INTEGER`** 常量表示在 JavaScript 中最大的安全整数（2^53 - 1）

**`Number.MIN_SAFE_INTEGER`** 常量表示在 JavaScript 中最小的安全整数 (-(2^53 - 1))

**`Number.MAX_VALUE`** 属性表示在 JavaScript 里所能表示的最大数值

**`Number.MIN_VALUE`** 属性表示在 JavaScript 里所能表示的最小数值

JavaScript中规定安全表示数字的范围为：**[-(2^53 - 1), 2^53 - 1]**，即 **[-(Math.pow(2, 53) - 1)**, **Math.pow(2, 53) - 1]**，安全的意思是能够准确的表示整数和正确的比较整数。
```js
Number.isSafeInteger(9007199254740991) // true
Number.isSafeInteger(9007199254740992) // false
Number.MAX_SAFE_INTEGER   // 9007199254740991
Number.MIN_SAFE_INTEGER   // -9007199254740991
Number.MAX_VALUE          // 1.7976931348623157e+308 即 1.7976931348623157 * 10 ^ (+308)
Number.MIN_VALUE          // 5e-324 即 5 * 10^(-324)
```

```js
console.log(9007199254740993)  // 9007199254740992
9007199254740991 + 1 === 9007199254740991 + 2 // true
```

当要对超大整数进行加法运算时，使用 + 是无法达到的，一旦超过 `Number.MAX_SAFE_INTEGER`，数字计算可能会出现异常，建议改成后端下发。
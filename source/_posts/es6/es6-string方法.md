---
title:         ES6 string方法 # 标题
description:   es6中一些较常使用的字符串方法 # 副标题
tags: # 标签分类
    - ES6
---



>参考：[阮一峰 ES6 字符串方法](http://es6.ruanyifeng.com/#docs/string)

* at(): 返回给定字符的位置
  ```js
  var s = 'Hello world!';
  s.at(0) // H
  ```

* includes(): 是否包含指定字符串，第二个参数可选，表示起始查找位置
 
* startsWith(): 参数是否在头部，第二个参数可选，表示起始查找位置

* endsWith(): 参数是否在尾部，第二个参数可选，表示起始查找位置
  ```js
  var s = 'Hello world!';
  s.startsWith('Hello') // true
  s.endsWith('!') // true
  s.includes('o') // true

  var s = 'Hello world!';
  s.startsWith('world', 6) // true
  s.endsWith('Hello', 5) // true
  s.includes('Hello', 6) // false   
  ```

* repeat(): 返回重复多次后的字符串
  ```js
  var s = 'Hello'
  s.repeat(3)  // HelloHelloHello
  s.repeat(2.9) // HelloHello，参数为小数时为取整次数
  s.repeat(Infinity) // 报错
  s.repeat(-1) // 报错
  s.repeat(-0.8) // ""，-1~0取整后为0
  s.repeat("2") // HelloHell0，字符串先转换成数字再取整
  s.repeat("world") // ""
  ```

* padStart(): 头部补全，第一参数表示字符串长度，第二参数可选，表示替补的字符串，如无，以空格替补

* padEnd(): 尾部补全，第一参数表示字符串长度，第二参数可选，表示替补的字符串，如无，以空格替补
  ```js
  var s = 'x'
  s.padStart(5, 'ab') // 'ababx'
  s.padStart(4, 'ab') // 'abax'
  s.padStart(4, 'abcdefg') // 'abcx' ，多余的会被去掉
  s.padEnd(5, 'ab') // 'xabab'
  s.padEnd(4, 'ab') // 'xaba'  
  s.padEnd(4, 'abcdefg') // 'xabc' ，多余的会被去掉

  var s = 'xxxx'
  s.padStart(2, 'ab') // 'xxxx'，当设置的字符串长度小于原本长度，返回原字符串
  s.padEnd(4, 'ab') // 'xxxx' ，当设置的字符串长度小于原本长度，返回原字符串

  var s = 'x'
  s.padStart(3) // '  x'
  s.padEnd(4) //  'x   '

  常用来补全位数：
  '10'.padStart(10, '0') // "0000000010"   
  ```

* 模板字符串
  ```js
  传统输出模板：
  $('#result').append(  
    'There are <b>' + basket.count +
    '</b> ' +  'items in your basket, ' +
    '<em>' + basket.onSale +
    '</em> are on sale!'
  );  

  es6输出模板：
  $('#result').append(`
    There are <b>${basket.count}</b>
    items   in your basket, <em>${basket.onSale}</em>
    are on sale!
  `);
  ```

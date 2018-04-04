---
title:         export和module.export语法 # 标题
description:   export和module.export的用法 # 副标题
date:          2017-03-31 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---


## export（es6语法）
>参考：[阮一峰 export](http://es6.ruanyifeng.com/#docs/module#export)命令

在vue中，可以将所有的外部函数、变量等写在一个外部的js文件中并使用export暴露出来，再在相关的组件中import相应的函数或变量

method.js：
```
function aa (a, b) {
  *****
  *****
  *****
  return ***;
}

function bb (c, d) {
}
var cc;
var dd;

输出1（输出多个）：
export {aa, bb, cc ,dd}  
输入1（对应输入时加括号）：
import {aa} from ''

输出2（输出一个）：
export default aa
输入2（对应输入时无括号）：
import aa from ''
```

组件：
```
import {aa, cc} from 'method.js' // import 需要的变量或函数
import * from 'method.js'   // 当需要import所有的变量或函数时
methods : {
  var mn = aa(123, 456);
}

组件里面可以直接使用method.js里面的函数或变量，如果放在组件里面，则需要使用this.aa(), 这样会造成文件过长，不易阅读，且重用性差
```


## module.exports（node语法）
Module.exports导出的其实是整个模块对象


## exports（node语法）
>参考:[小白妹妹写代码 module.export和export](http://sabrinaluo.com/tech/2015/12/16/difference-between-Module-exports-with-exports-in-NodeJS/)

exports是对Module.exports的一种引用，常规情况下，两者基本一致，可以混用，但部分情况下不可

例1：OK
```js
module.exports.name = '小白妹妹';
exports.age = 10;
module.exports.print = function(){
  console.log(12345)
};
```

例2：OK
```js
module.exports = {
  name = '小白妹妹';
};

exports.age = 10;

module.exports.print = function(){
  console.log(12345)
};

```

例3：ERROR
```js
module.exports = {
  name = '小白妹妹';
};

exports = {
  age:10
}; // exports现在是{age:10}这个对象的引用，不再是module.exports的引用了

console.log(module); //你会看到Module的exports中只有name属性！！
```

例4：ERROR
```js
exports.age = 10;
console.log(module); //你会看到Module的exports中多了age属性

module.exports = {
  name = '小白妹妹';
};

console.log(module); //你会看到Module的exports中还是只有name属性！！！
```


## 使用

* 例1：es6 export单个变量或方法导出导入
  ```js
  A.js:

  function a () {
  }
  // 输入：
  export default a     


  B.js:

  // 输入：
  import a from 'A.js'
  // 使用：
  a()
  ```

* 例2：es6 export多个变量或方法导出导入
  ```js
  A.js:

  function  a () {}

  function b () {}

  function c () {}

  // 输出:
  export {a, b, c}


  B.js:

  // 输入1：
  import {a, b, c} from 'A.js'

  // 使用1：
  a()、b()、c()

  // 输入2 或*号全部导出：

  import * as method from 'A.js'

  // 使用2：
  method.a()、method.b()、method.c()
  ```

* 例3：Node.js module.exports 多个变量或方法导入导出
　```js
  A.js:

  function  a () {}

  function b () {}

  function c () {}

  // 输出：
  module.exports {a, b, c}


  B.js:

  // 输入1：
  import {a, b, c} from 'A.js'

  // 使用1：
  a()、b()、c()

  // 输入2 或*号全部导出：
  import * as method from 'A.js'

  // 使用2：
  method.a()、method.b()、method.c()

  // 输入3 别名全部导出（当只有一个方法时不支持别名导出）：
  import  method from 'A.js'

  // 使用3
  method.a()、method.b()、method.c()
  ```

* 例4：Node.js 使用Module.exports直接导出
  ```js
  A.js:

  // 直接输出
  module.exports = {
    a: function() {},

    b: function() {},

    c: function() {}
  }


  B.js:

  // 输入1：
  import {a, b, c} from 'A.js'

  // 使用1：
  a()、b()、c()

  // 输入2：
  import method from 'A.js'

  // 使用2：
  method.a()、method.b()、method.c()
  ```

* 例5：Node.js exports 导出失败，不可用
  ```js
  A.js:

  function  a () {}
  function b () {}
  function c () {}
  // 输出
  exports {a, b, c}


  B.js:

  // 输入
  import {a, b, c} from 'A.js'
  ```

## 总结

1、es6 export支持：default aa 导出aa导入、{aa, bb}导出{aa, bb}导入、* as method全部导入

2、es6 export不支持：别名导入

3、node.js module.exports支持：{aa, bb}导出{aa, bb}导入、* as method全部导入、method别名导入

4、node.js module.exports不支持：

5、node.js exports 不支持：少于exports

6、require对应的是module.export

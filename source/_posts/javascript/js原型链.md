---
title:         js原型链 # 标题
description:   js原型链、构造函数、原型对象、实例 # 副标题
date:          2018-12-19 # 建立日期
updated:       2018-12-19 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---



### 创建对象的几种方式
  1、字面量法
  ```js
  var o1 = {name: 'o1'};
  ```

  2、构造函数法（构造函数首字母大写）
  ```js
  var o2 = new Object({name: 'o2'});


  var M = function (name) {
    this.name = name;
    // return this // 默认有这一行
  };
  var o3 = new M('o3'); // 实例
  ```

  3、Object.create()法
  ```js
  var o4 = Object.create({name: 'o4'});
  ```

  以上的运行结果如下：
  <img src="../images/javascript/js_object_result.png" width="60%" title="几种创建对象的运行结果" />

  我们看到o3和o4的运行结果有些不一样，o3前面的M表示构造函数，o4却不显示属性

  但是运行`o4.name`发现其实是有值的，具体原因参考：[leijee blog](https://www.cnblogs.com/leijee/p/7490822.html)
  <img src="../images/javascript/js_object_result2.png" width="60%" title="" />


### 构造函数扩展
1. `var arr = []` 其实是 `var a = new Array()` 的语法糖；
2. `var obj = {}` 其实是 `var a = new Object()` 的语法糖；
3. `function Foo(){}` 其实是 `var Foo = new Function(){}`；

即 arr 的构造函数是 `Array`, obj 的构造函数是 `Object`，Foo 的构造函数是 `Function`。


### 原型规则
- 规则1：所有的引用类型（数组、对象、函数），都具有对象特性，可自有扩展属性（null 除外）
  ```js
  var obj = {};
  obj.a = 100; // {a: 100}

  var arr = [];
  arr.a = 100; // [a: 100]

  function fn(){};
  fn.a = 100;
  ```
- 规则2：所有的引用类型（数组、对象、函数），都有一个 `__proto__` (隐式原型) 属性，属性值是一个普通的对象
  ```js
  console.log(obj.__proto__);
  console.log(arr.__proto__);
  console.log(fn.__proto__);
  ```
  结果如下图：
  <img src="../images/javascript/js__proto__.png" width="80%" title="__proto__属性" />


- 规则3：所有的函数，都有一个 `prototype` (显示原型) 属性，属性值是一个普通的对象
  ```js
  console.log(fn.prototype); // {constructor: ƒ}
  ```

- 规则4：所有的引用类型（数组、对象、函数），`__proto__` (隐式属性) 属性值指向它的构造函数的 `prototype` (显示原型) 属性值
  ```js
  console.log(obj.__proto__ === Object.prototype); // true
  console.log(arr.__proto__ === Array.prototype); // true
  console.log(fn.__proto__ === Function.prototype); // true
  ```

- 规则5：当试图得到一个对象的某个属性时，如果这个对象本身没有这个属性，那么会去它的 `__proto__`（即它的构造函数的 `prototype`）中去寻找，如果一层没有找到，就继续往上查找，一直到 `Object.prototype` 为止。因为 `Object.prototype` 等于 `null` 会自动停止。
  ```js
  // 构造函数
  function Foo(name, age) {
    this.name = name;
  }
  // 扩展属性（规则1）
  Foo.prototype.alertName = function () {
    alert(this.name);
  };

  // 创建一个实例f
  var f = new Foo('zhangsan');
  // 扩展属性（规则1）
  f.printName = function () {
    console.log(this.name);
  };

  // 测试
  f.printName();
  f.alertName(); // (规则5)
  // f本身没有 alertName 属性，它会去它自身的隐式原型 即f.__proto__ (也即是它的构造函数的显示原型 Foo.prototype)中去寻找这个属性
  

  f.toString(); // (规则5)
  // f本身没有 toString 属性，它会去它自身的隐式原型 即f.__proto__ (也即是它的构造函数的显示原型 Foo.prototype)中去寻找这个属性
  // 但是 Foo.prototype 中并没有找到这个属性，但是因为 Foo.prototype 本身也是一个对象，所以会继续向上寻找，Foo.prototype 的构造函数是 Object
  // 即去 f.__proto__.__proto__中查找，也即是 Object.prototype 中查找，最终发现了toString
  
  f.__proto__ === Foo.prototype; // true
  f.__proto__.__proto__ === Object.prototype; // true
  ```

  <img src="../images/javascript/js_prototype2.png" width="100%" title="原型链图解" />


### 循环对象自身的属性
对于上例，循环f自身的属性：
```js
for (let item in f) {
  if (f.hasOwnProperty(item)) {
    console.log(item);
  }
}

// name
// printName
```

### instanceof
```js
f instanceof Foo; // f是否是Foo的一个实例

// 判断逻辑是：
// f的 __proto__ 一层一层往上，能否对应到 Foo.prototype，结果为true

// 同理：
f instanceof Object; // f是否是Object的一个实例，结果为true
```



### 构造函数、原型对象、实例、原型链关系网
  关系网如下：
  <img src="../images/javascript/js_prototype.png" width="100%" title="构造函数、原型对象、实例、原型链关系网" />
  ```js
  var M = function (name) {
    this.name = name;
  }; // 构造函数

  var o3 = new M('o3'); // 实例o3
  var o4 = new M('o4'); // 实例o4

  // M: 是一个构造函数，任何普通函数在使用new运算符之后都变成构造函数
  // o3、o4: 实例
  // M.prototype: 原型对象
  // M.prototype.constructor: 原型对象的构造器，M.prototype.constructor === M
  // o3.__proto__: 实例的__prto__属性，o3.__proto__ === M.prototype


  // 实际上函数也有__proto__属性，M.__proto__ === Function.prototype，这个逻辑说明M构造函数是Function的一个实例
  ```

  <img src="../images/javascript/js_prototype_result.png" width="60%" title="构造函数、原型对象、实例、原型链" />


### 面试题：写一个原型链继承的demo
```js
// 父类
function A() {
  this.name = 'test name';
}
A.prototype.getName = function() {
  return this.name;
}


// 子类B
function B() {
  this.age = 12;
}
// B继承A
B.prototype = new A();
B.prototype.getAge = function() {
  return this.age;
}


// 子类C
function C() {
  this.sex = 'male';
}
// C继承B
C.prototype = new B();
C.prototype.getSex = function() {
  return this.sex;
}


// 创建实例（abc是C的实例，C继承B，B继承A，所以abc可以调用A、B、C的方法）
var abc = new C();

console.log(abc.getSex()); // male
console.log(abc.getAge()); // 12
console.log(abc.getName()); // test name
```

打印 `console.dir(abc);`

<img src="../images/javascript/js_prototype3.png" width="80%" title="多次继承的实例输出图" />
从图中我们可以看出，通过 `prototype` 扩展的属性会挂载在 `__proto__` 属性下，通过 `hasOwnProperty` 方法可过滤扩展的属性
```js
abc.hasOwnProperty('sex'); // true
abc.hasOwnProperty('getSex'); // false
```

我们可以打印一下隐式原型 `__proto__` 和显式原型 `prototype` 的关系图
<img src="../images/javascript/js_prototype4.png" width="80%" title="隐式原型__proto__和显式原型的关系" />

打印 `console.log(abc.prototype)`，输出为 `undefined`，我们可以知道，实例是没有 `prototype` 属性的


### 面试题：写一个实际应用中使用原型链的例子
```js
// 实现类似jquery html()和on(event, fn)方法
function Elem(id) {
  this.elem = document.getElementById(id);
}

// 扩展一个设置html内容的方法
Elem.prototype.html = function(val) {
  var elem = this.elem;
  if(val) {
    elem.innerHTML = val;
    return this; // 链式操作
  } else {
    return elem.innerHTML;
  }
}

// 扩张一个事件绑定的方法
Elem.prototype.on = function(type, fn) {
  var elem = this.elem;
  elem.addEventListener(type, fn);
  return this; // 链式操作
}


var div1 = new Elem('div1');
// console.log('div1');
div1.html('<p>hello word</p>'); // 设置html内容
div1.on('click', function() { // 绑定一个点击事件
  alert('clicked');
});

// 我们在扩展html方法的时候写了一个 return this返回这个实例，就可以实现类似jquery链式操作的功能
div1.html('<p>hello word</p>').on('click', function() { // 绑定一个点击事件
  alert('clicked');
});
// 因为我们在每个扩展的方法里面都写了一个return this，所以链式操作的顺序可以调换

// 甚至我们可以重复调用多次扩展的方法
div1.html('<p>hello word</p>').html('<p>Hello Word</p>');
```


### 面试题：描述 new 一个对象的过程
```js
function Foo(name, age) {
  this.name = name;
  this.age = age;
  // return this;
}
var f = new Foo('zhangsan', 18);
```

1. 创建一个对象
2. `this` 指向这个新对象
3. 执行代码，即对 `this` 赋值
4. 返回 `this`，内部会有一句默认的 `return this`



>本文参考：[慕课网 原型链](https://coding.imooc.com/class/129.html)
>更多参考：[JS原型链简单图解](https://www.cnblogs.com/libin-1/p/5820550.html)
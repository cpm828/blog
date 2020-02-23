---
title:         es6-标签模板 # 标题
description:   es6容易被忽略的标签模板 # 副标题
date:          2020-02-22 # 建立日期
updated:       2020-02-22 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - ES6
---

## ES6模板字符串

ES5 中拼接字符串是这样做的:
```js
var name = 'ZhangSan';
var age = 20;

console.log("My name is " + name + ", my age is " + age);
```

使用 ES6 模板字符串的字符串很简单：
```js
const name = 'ZhangSan';
const age = 20;

console.log(`My name is ${name}, my age is ${age}`);
```

特别是在创建html元素的时候更加方便，
ES5中：
```js
var name = 'ZhangSan';
var age = 20;
var sex = 'male'

var messageHTML =
  "<div>" +
    "<p>name: " + name + "</p>" +
    "<p>age: " + age + "</p>" +
    "<p>sex: " + male + "</p>" +
  "</div>"
```
ES6中：
```js
const name = 'ZhangSan';
const age = 20;
const sex = 'male'

const messageHTML =
  `<div>
    <p>name: ${name}</p>
    <p>age: ${age}</p>
    <p>sex: ${male}</p>
  </div>`
```


## 标签模板
### 示例

下面开始介绍标签模板，也是使用
```bash
``
```

模板字符串跟在一个函数名后面，表示作为函数的参数，如：
```js
alert`hello` // 相当于调用 alert('hello')
```

继续看一点复杂的，实现高亮一个字符串中的两个变量值 user、topic
```js
const user = 'Peter'
const topic = 'Learn to use markdown'
const sentence = highlight`${user} has commented on your topic ${topic}`

function highlight() {
  return 'Hello world'
}
console.log(sentence) // 'Hello world'
```

可以看出标签模板的输出是由函数的return语句决定的，所以想高亮字符串中的字符，需要去修改函数的返回值
```js
const user = 'Peter'
const topic = 'Learn to use markdown'
const sentence = highlight`${user} has commented on your topic ${topic}`

function highlight(strings, ...values) {
  // 此处从第二个参数开始使用rest方式以数组的形式获取剩余的参数
  console.log(strings) // ["", " has commented on your topic ", ""]
  console.log(values) // ["Peter", "Learn to use markdown"]
  return 'Hello world'

  // 我们可以看出第一个参数默认为字符串被变量拆分所剩下的字符串组成的数组，后面的参数为变量
}
console.log(sentence) // 'Hello world'
```

获取函数参数后，改造返回值：
```js
const user = 'Peter'
const topic = 'Learn to use markdown'
const sentence = highlight`${user} has commented on your topic ${topic}`
document.body.innerHTML = sentence // 再搭配hightlight样式即可

function highlight(strings, ...values) {
  const hignlighted = values.map(value => `<span class="hightlight">${value}</span>`)

  // let str = ''
  // strings.forEach((string, i) => str += `${string}${hignlighted[i] || ''}`) // 此处很巧妙的将两个数组又拼合在一起，需要注意最后一个hignlighted[i]为undefined，因为values.length始终比strings.length小1
  // return str

  // 此处也可以使用reduce来拼合，参数1为fn，参数2为起始值
  // console.log([1, 2, 3, 4].reduce((prev, cur, i) => prev + cur, 0)) // 10
  return strings.reduce((prev, cur, i) => `${prev}${cur}${hignlighted[i] || ''}`, '')
}
```

最终sentence输出为：
```html
<span class="hightlight">Peter</span> has commented on your topic <span class="hightlight">Learn to use markdown</span>
```

### 标签模板重要用途
- 过滤 HTML 字符串，防止用户输入恶意内容。
  ```js
  let message =
  SaferHTML`<p>${sender} has sent you a message.</p>`;

  function SaferHTML(templateData) {
    let s = templateData[0];
    for (let i = 1; i < arguments.length; i++) {
      let arg = String(arguments[i]);

      // Escape special characters in the substitution.
      s += arg.replace(/&/g, "&amp;")
              .replace(/</g, "&lt;")
              .replace(/>/g, "&gt;");

      // Don't escape special characters in the template.
      s += templateData[i];
    }
    return s;
  }
  ```

  上面代码中，sender变量往往是用户提供的，经过 `SaferHTML` 函数处理，里面的特殊字符都会被转义。

  ```js
  let sender = '<script>alert("abc")</script>'; // 恶意代码
  let message = SaferHTML`<p>${sender} has sent you a message.</p>`;

  message
  // <p>&lt;script&gt;alert("abc")&lt;/script&gt; has sent you a message.</p>
  ```


- 多语言转换（国际化处理）
  ```js
  i18n`Welcome to ${siteName}, you are visitor number ${visitorNumber}!`
  // "欢迎访问xxx，您是第xxxx位访问者！"
  ```
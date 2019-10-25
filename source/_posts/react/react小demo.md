---
title:         React小Demo # 标题
description:   快速理解react的小demo # 副标题
date:          2017-04-29 # 建立日期
updated:       2017-04-29 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - React
---

>参考：[阮一峰 React 入门实例教程](http://www.ruanyifeng.com/blog/2015/03/react.html)

## 注意
1、引入三个js文件
2、script中注明type="text/babel" 即使用JSX的语法（JSX：在JS中直接使用HTML标签语法）
3、使用ReactDOM.render()


## CDN
```js
<script src="react.js"></script>
<script src="react-dom.js"></script>
<script src="browser.min.js"></script>
```

或：

```js
<script src="https://npmcdn.com/react@15.3.1/dist/react.js"></script>    
<script src="https://npmcdn.com/react-dom@15.3.1/dist/react-dom.js"></script>    
<script src="https://npmcdn.com/babel-core@5.8.38/browser.min.js"></script>    

<script src="https://npmcdn.com/jquery@3.1.0/dist/jquery.min.js"></script>    
<script src="https://npmcdn.com/remarkable@1.6.2/dist/remarkable.min.js"></script>
```

## Demo1：简单React
```js
<div id="example" class="container"></div>

<script type="text/babel">
  ReactDOM.render(
    <h1>Hello, React !</h1>,
    document.getElementById('example')
  );
</script>
```

结果：
<img src="../images/react/react-demo1.png">


## Demo2：渲染简单数组
```js
<div id="example"></div>

<script type="text/babel">
  var names = ['Alice', 'Emily', 'Kate'];

  ReactDOM.render(
    <div>
    {
      names.map(function (name) {
        return <div>Hello, {name}!</div>
      })
    }
    </div>,
    document.getElementById('example')
  );
</script>
```

结果：
<img src="../images/react/react-demo2.png">

详解：

遇到HTML标签（以 < 开头），就用HTML规则解析；遇到代码块（以 { 开头），就用JavaScript规则解析


## Demo3：渲染带标签的数组
```js
<div id="example"></div>

<script type="text/babel">
  var arr = [
    <h1>Hello world!</h1>,
    <h2>React is awesome</h2>,
    <p>Reactsdjfkasfj</p>
  ];

  ReactDOM.render(
    <div>{arr}</div>,
    document.getElementById('example')
  );
</script>
```

结果：
<img src="../images/react/react-demo3.png">


## Demo4：组件
```js
<div id="example"></div>

<script type="text/babel">
  var HelloMessage = React.createClass({
    render: function() {
      return <h1>Hello {this.props.name}</h1>;
    }
  });

  ReactDOM.render(
    <HelloMessage name="John" />,
    document.getElementById('example')
  );
</script>
```

结果：
<img src="../images/react/react-demo4.png">

详解：

1、HelloMessage就是一个组件类，React.createClass 方法用于生成一个组件类，组件类必须有自己的render方法，用于输入组件

2、组件类的第一个字面必须大写，否则报错，组件类只能包含一个顶层标签，否则报错

3、模板插入<HelloMessage>就会自动生成一个组件类的实例

4、通过this.props来读取组件的属性，组件属性如果有class属性需要写成className，for属性需要写成htmlFor，因为class和for是JavaScript的保留字


## Demo5：this.props.children

```js
<div id="example"></div>

<script type="text/babel">
  var NotesList = React.createClass({
    render: function() {
      return (
        <ol>
          {
            React.Children.map(this.props.children, function (child) {
              return <li>{child}</li>;
            })
          }
        </ol>
      );
    }
  });

  ReactDOM.render(
    <NotesList>
      <span>hello</span>
      <span>world</span>
    </NotesList>,
    document.getElementById('example')
  );
</script>
```

结果：
<img src="../images/react/react-demo5.png">

详解：

1、this.props对象属性与组件的属性一一对应，但是this.props.children属性例外，它表示组件的所有子节点

2、NotesList组件有两个span子节点，可以通过this.props.children读取

3、如果当前组件没有子节点，它就是underfined；如果有一个子节点，数组类型是object；如果有多个子节点，数据类型就是array

4、React提供一个React.Children方法来处理this.props.children


## Demo6：PropTypes，组件属性验证

```js
<div id="example"></div>

<script type="text/babel">
  var data = 123;  // 使用123会报错，必须使用字符串'123...'
  var MyTitle = React.createClass({
    propTypes: {
      title: React.PropTypes.string.isRequired,
    },

    render: function() {
      return <h1> {this.props.title} </h1>;
    }
  });

  ReactDOM.render(
    <MyTitle title={data} />,
    document.getElementById('example')
  );
</script>
```

结果：
<img src="../images/react/react-demo6.png">

详解：

1、PropTupes属性用来验证组件实例属性是否符合要求

2、此例中使用PropsTypes来验证title必须是字符串，所有当data=123时会报错，提示类型错误，当data='123'时则顺利通过


## Demo7：getDefaultProps，设置组件属性默认值
```js
<div id="example"></div>

<script type="text/babel">
  var MyTitle = React.createClass({
    getDefaultProps : function () {
      return {
        title : 'Hello World'
      };
    },

    render: function() {
      return <h1> {this.props.title} </h1>;
    }
  });

  ReactDOM.render(  
    <MyTitle />,
    document.getElementById('example')
  );
</script>
```

结果：
<img src="../images/react/react-demo7.png">

详解：

getDefaultProps方法用来设置组件属性的默认值


## Demo8：获取真实DOM节点
```js
<div id="example"></div>

<script type="text/babel">
var MyComponent = React.createClass({
  handleClick: function() {
    this.refs.myTextInput.focus();
  },

  render: function() {
    return (
      <div>
        <input type="text" ref="myTextInput" />
        <input type="button" value="Focus the text input" onClick={this.handleClick} />
      </div>
    );
  }
});
</script>
```

详解：

1、组件并不是真实的DOM节点，而是存在于内存之中的一种虚拟结构，叫做虚拟DOM。只有当它插入文档以后，才会变成真实的DOM。所有的DOM变动，都先在虚拟DOM上发生，然后再将实际发生变动的部分，反映在真实的DOM上，这种算法叫做DOM diff，可以极大的提高网页的性能表现。

2、虚拟DOM拿不到用户输入的，使用ref属性获取真实的DOM节点。此例中```this.refs.[refName]```返回真实DOM节点，在click事件后确保了真实的DOM

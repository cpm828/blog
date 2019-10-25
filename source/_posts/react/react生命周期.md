---
title:         React生命周期介绍 # 标题
description:   react各个生命周期的介绍 # 副标题
date:          2017-04-29 # 建立日期
updated:       2017-04-29 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - React
---


## React 生命周期如下：
```js
componentWillMount：1、渲染前调用

render：2、渲染

componentDidMount：3、第一次渲染完调用，此时可获取dom


componentWillReceiveProps：4、接收到一个新的props时调用

shouldComponentUpdate：5、接收props或state时判断是否该update

componentWillUpdate：6、接收到props或state时开始更新

render：7、render

componentDidUpdate：8、组件更新完毕


componentWillUnmount：～移除组件时调用
```


## 生命周期实例demo
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <script src="http://static.runoob.com/assets/react/react-0.14.7/build/react.min.js"></script>
  <script src="http://static.runoob.com/assets/react/react-0.14.7/build/react-dom.min.js"></script>
  <script src="http://static.runoob.com/assets/react/browser.min.js"></script>
</head>
<body>
  <div id="example"></div>
  <script type="text/babel">
    var Button = React.createClass({
      getInitialState: function () {
        return {
          data: 0
        };
      },

      // 自定义事件
      setNewNumber: function () {
        // this.setState({data: this.state.data + 1})
        // this.setState(function (state) {
        //   return {data: state.data + 1}
        // })

        this.setState(function (state) {
          state.data++
        })
      },

      render: function () {
        return (
          <div>
            <button onClick = { this.setNewNumber }>INCREMENT</button>
            <Content myNumber = { this.state.data } />
          </div>
        );
      }
    });

    var Content = React.createClass({
      // 1、渲染前调用
      componentWillMount:function () {
        console.log('Component Will Mount!')
      },

      // 3、第一次渲染完调用，此时可获取dom
      componentDidMount: function () {
        console.log('Component Did Mount!')
      },

      // 4、接收到一个新的props时调用
      componentWillReceiveProps: function () {
        console.log('Component Will Receive Props!')
      },

      // 5、接收props或state时判断是否该update
      shouldComponentUpdate: function (nextProps, nextState) {
        console.log('Should Component Update')
        return true;
      },

      // 6、接收到props或state时开始更新
      componentWillUpdate: function () {
        console.log('Component Will Update!')
      },

      // 7、再次render

      // 8、组件更新完毕
      componentDidUpdate: function () {
        console.log('Component Did Update!')
      },

      // ～移除组件时调用
      componentWillUnmount: function () {
        console.log('Component Will UnMount!')
      },

      // 2、渲染
      render: function () {
        console.log('Render')
        return (
          <div>
            <h3>{this.props.myNumber}</h3>
          </div>
        );
      }

      // 正确的顺序：

      // 1、componentWillMount

      // 2、render

      // 3、componentDidMount

      //

      // 4、componentWillReceiveProps

      // 5、shouldComponentUpdate

      // 6、componentWillUpdate

      // 7、render

      // 8、componentDidUpdate

      //

      // 9、componentWillReceiveProps

      // 10、shouldComponentUpdate

      // 11、componentWillUpdate

      // 12、render

      // 13、componentDidUpdate

      //

      // ～componentWillUnmount

    })

    ReactDOM.render(
      <Button />,
      document.getElementById('example')
    );
  </script>
</body>
</html>
```

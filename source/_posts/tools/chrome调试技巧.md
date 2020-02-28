---
title:         chrome调试小技巧 # 大标题
description:   不被人所知的Chrome调试技巧，入行十年也不一定全知道 # 小标题
date:          2020-02-28 # 建立日期
updated:       2020-02-28 # 更新日期
comments:      true  # 开启评论功能
tags:
    - Tools
---

> 参考：西瓜视频>盆盆儿WEB前端>chrome调试小技巧合集

## 检查元素Dom hover状态
  1. 鼠标选中元素，找到Dom节点位置
  2. 右键选择 `Force state`，选择 `hover`，就能看到 `hover` 状态的样式了，同理 `focus`、`active` 等
  <img src="../images/tools/chrome_tip1.png" title="检查元素Dom hover状态" />


## $0获取Dom元素
  1. 鼠标选中元素，找到Dom节点位置
  2. 控制台输入 `$0` 即为当前的Dom元素，可进行相关的操作
  <img src="../images/tools/chrome_tip2.png" title="$0获取Dom元素" />


## console.log样式
  1. 第一个参数为需要打印的内容，使用 `%c` 作为分隔符，第二个参数开始依次对应每个 `%c` 后面的内容的样式，如需插入图片，使用空格修饰，如：
  ```js
  console.log('%c出错了', 'font-size:20px;')

  console.log('%c出错了', 'font-size:20px;color:#f00;')

  console.log(
    '%c出错了%c ', 
    'font-size:20px;color:#f00;',
    'font-size:100px;background:url(***.jpg) no-repeat center center;background-size:100%;'
  )

  console.log(
    '%c %c出错了%c ', 
    'font-size:100px;background:url(***.jpg) no-repeat center center;background-size:100%;',
    'font-size:20px;color:#f00;',
    'font-size:100px;background:url(***.jpg) no-repeat center center;background-size:100%;'
  )
  ```

  <img src="../images/tools/chrome_tip3.png" title="console.log样式" />


## console.count打印调用次数
  默认使用default来描述
  ```js
  for (let i = 0; i < 10; i++) { console.count(); }
  ```
  <img src="../images/tools/chrome_tip14.png" title="console.count打印调用次数" />

  也可以设定一个描述，如:
  ```js
  for (let i = 0; i < 10; i++) { console.count('count'); }
  ```
  <img src="../images/tools/chrome_tip15.png" title="console.count打印调用次数" />
  这样就能只管看出某个方法具体被调用了多少遍，注意次数和程序无关，只和 `console.count` 被调用多少次有关，即如果页面不刷新，继续执行，次数会累加。


## Dom断点调试
  比如页面有一个p标签和两个按钮，一个按钮的功能为修改p段落样式，一个按钮的功能为删除p段落，通过在Dom上添加断点来定位到相应的js代码。
  1. 鼠标选中元素，找到Dom节点位置
  2. 右键选择 `Break on`，选择 `attributes modifications`
    <img src="../images/tools/chrome_tip4.png" title="Dom断点调试" />
  3. 当我们点击按钮的时候，会自动帮我们定位到js中的代码位置断点
    <img src="../images/tools/chrome_tip5.png" title="Dom断点调试" />
  同理，选择 `node removal`，既可以在元素删除的时候断点


## Dom绑定事件断点调试
  上一个方法我们介绍了如何给Dom断点调试，但是该方法仅支持调试属性修改和节点删除事件。下面我们介绍如何给Dom绑定的时候进行断点，差点执行流程。
  1. 鼠标选中元素，在 `Elements` 一栏打开 `Event Listeners`
  2. 知道绑定的方法，以 `click` 方法为例，展开该方法
    <img src="../images/tools/chrome_tip11.png" title="Dom绑定事件断点调试" />
  3. 找到引用的js文件并打开
    <img src="../images/tools/chrome_tip12.png" title="Dom绑定事件断点调试" />
  4. 这样就找到了该Dom元素对应的click方法
    <img src="../images/tools/chrome_tip13.png" title="Dom绑定事件断点调试" />
  5. 然后我们就可以设置相应的断点，进行单步调试了


## 错误断点调试
  当我们的js遇到错误的时候，有的时候我们可以通过错误信息后面的js来定位到错误的地方。下面介绍一下另外一种方法：
  1. 打开开发者工具，切换到source面板
  2. 点击 `Pause on exceptions`，勾选 `Pause on caught exceptions`
  3. 刷新页面，这个时候页面会自动在发生错误的位置增加断点
  <img src="../images/tools/chrome_tip16.png" title="错误断点调试" />



## 控制台代码手动添加debug
  1. 比如我们需要在控制台测试我们编写的某一段代码，且需要在代码执行的时候添加debug断点，除了手动在代码中添加debugger外，还可以这样：
  2. 也可以用于给当前页面的全局方法添加断点
  ```js
  function test() {
    console.log('I need debug!');
  }
  debug(test)

  test()
  ```
  <img src="../images/tools/chrome_tip6.png" title="控制台代码手动添加debug" />


## 控制台拷贝对象
  1. 在打印的对象上右键，找到 `Store as global variable`，此时会自动输出一个temp1的全局变量，手动执行 `copy(temp1)` 就可以复制到剪切板了。
  <img src="../images/tools/chrome_tip7.png" title="控制台拷贝对象" />
  <img src="../images/tools/chrome_tip8.png" title="控制台拷贝对象" />


## 控制台$符号
  1. 在chrome中，除了使用 `document.getElementById` 系列方法或 `document.querySelector` 系列方法外，还可以使用 `$` 来选择元素，<span style="color:red">注意此 `$` 并不等同于jQuery中的 `$`。</span>

  假设有个这样的结构：
  ```html
  <p id="para">Hello World</p>
  <button onclick="changeColor()">修改颜色</button>
  <button onclick="deleteDom()">删除元素</button>
  ```

  通过$也可以选择p和button
  ```js
  $('p') // <p id="para">Hello World</p>
  $('button') // <button onclick="changeColor()">修改颜色</button>
  // $ 方法的效果相当于 document.querySelector()，获取单个元素，如果存在多个，返回第一个元素

  $$('p') // [p]
  $$('button') // [button, button]
  // $$ 方法的效果相当于 document.querySelectorAll()，获取多个元素，返回数组
  ```
  <img src="../images/tools/chrome_tip9.png" title="控制台$符号" />


## 调试nodejs程序
  1. 通常我们在执行node程序的时候，会这样操作，这样的话我们只能使用命令行工具来进行debug：
  ```bash
  node app.js
  ```
  2. 我们也可以这样启动命令：
  ```bash
  node --inspect-brk app.js
  ```
  3. 启动完成之后，我们使用chrome打开任意一个页面，打开开发者工具，开发者工具会自动多出一个测试node的工具，点击这个就可以在chrome中debug了。
  <img src="../images/tools/chrome_tip10.png" title="调试nodejs程序" />


## chrome充当编辑器
  1. 打开开发者工具，切换到source面板
  2. 选择 `Filesystem` ，如果看不见，点击后面的箭头展开，点击 `Add floder to workspace` 选择本地磁盘的文件夹
  3. 然后就可以在chrome上操作文件了，保存的时候会自动同步到本地磁盘
  4. 如果是html文件，可以右键 `Copy link address` 到地址栏打开
  <img src="../images/tools/chrome_tip17.png" title="调试nodejs程序" />


## 保存代码片段
  我们可以在chrome中保存一些常用的代码片段，来减少我们重复性的输入
  1. 打开开发者工具，切换到source面板
  2. 选择 `Snippets` ，如果看不见，点击后面的箭头展开，点击 `New Snippet` 添加自己的代码片段
  <img src="../images/tools/chrome_tip18.png" title="chrome保存代码片段" />
  3. 假设我们添加一个名为localstorage的代码片段，如：
  <img src="../images/tools/chrome_tip19.png" title="chrome保存代码片段" />
  4. 快捷键 `command + p`，在搜索框中输入 `！`，会列出所有的代码片段，选择相应的执行即可
  <img src="../images/tools/chrome_tip20.png" title="chrome保存代码片段" />
  5. 这个时候就会在控制台执行相应的代码，如
  <img src="../images/tools/chrome_tip21.png" title="chrome保存代码片段" />


## 动画检查器
  假设我们实现了一个动画的效果，代码如下：
  ```html
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <title>Document</title>
      <style>
          *{
              margin: 0;
              padding: 0;
          }
          .run{
              width: 100px;
              height: 100px;
              background-color: #ccc;
              display: flex;
              justify-content: center;
              align-items: center;
          }
          .run.ani{
              animation: runAni 1s linear infinite;
          }
          @keyframes runAni {
              0% {
                  transform: translate(0, 0);
              }
              50% {
                  transform: translate(300px, 0);
              }
              100% {
                  transform: translate(0px, 0);
              }
          }
          .btn{
              width: 50px;
              height: 30px;
              border: 1px solid #ccc;
              display: flex;
              justify-content: center;
              align-items: center;
              margin-top: 50px;
              cursor: pointer;
          }
      </style>
  </head>
  <body>
      <div class="run">running</div>
      <div class="btn" onclick="startRun()">开始</div>
      <script>
          var box = document.querySelector('.run')
          function startRun() {
              box.classList.add('ani');
          }
      </script>
  </body>
  </html>
  ```

  当PM过来验收的时候觉得动画时间不太满意，这个时候我们可能需要不停的修改代码，让PM去看哪个时间比较OK。相对来说会比较烦，我们可以通过chrome字自带的动画检查器来控制动画。

  流程如下：

  1. 打开开发者工具
  2. 快捷键 `command + shift + p` (或 `command + p`，再输入>)，输入 `Show Animations`
  <img src="../images/tools/chrome_tip24.png" title="性能监控" />
  3. 会多出一个窗口显示Animation，运行动画（按钮触发或刷新页面）会抓取到动画，点击查看详细动画
  <img src="../images/tools/chrome_tip25.png" title="性能监控" />
  4. 每一个线段即为一个动画周期，节点即为keyframes的节点
  <img src="../images/tools/chrome_tip26.png" title="性能监控" />
  5. 这个时候就可以让PM自己来拖动，选择合适的动画时间了


## 性能监控
  1. 打开开发者工具
  2. 快捷键 `command + shift + p` (或 `command + p`，再输入>)，输入 `Show Performace Monitor`
  <img src="../images/tools/chrome_tip22.png" title="性能监控" />
  3. 会多出一个窗口显示网页性能Performace
  <img src="../images/tools/chrome_tip23.png" title="性能监控" />
  4. 通过分析这些指标来了解网页的性能


## 定位代码的内存泄漏
  [查看视频](https://www.ixigua.com/i6762436172716179980/)、[查看视频](https://www.ixigua.com/i6780614829343244812/)

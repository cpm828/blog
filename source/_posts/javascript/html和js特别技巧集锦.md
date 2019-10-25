---
title:         HTML和JavaScript特别技巧集锦 # 标题
description:   HTML和JavaScript特别技巧集锦 # 副标题
date:          2017-04-01 # 建立日期
updated:       2017-04-01 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - HTML
    - JavaScript
---


* 让弹出窗口总是在最上面:
```html
<body onblur="this.focus();">
```

* 不要滚动条
  让竖条没有:
  ```html
  <body style="overflow:scroll;overflow-y:hidden"></body>
  ```

  让横条没有:
  ```html
  <body style="overflow:scroll;overflow-x:hidden"></body>
  ```

  两个都去掉？更简单了
  ```html
  <body scroll="no"></body>
  ```

* 怎样去掉图片链接点击后，图片周围的虚线？
  ```html
  <a href="#" onFocus="this.blur()"><img src="logo.jpg" border=0></a>
  ```

* 电子邮件处理提交表单
  ```html
  <form name="form1" method="post" action="mailto:**@**.com" enctype="text/plain">
    <input type="submit">
  </form>
  ```

* 在打开的子窗口刷新父窗口的代码里如何写？
  ```js
  window.opener.location.reload()
  ```

* 如何设定打开页面的大小
  ```html
  打开页面的大小<body onload="top.resizeTo(300,200);">
  打开页面的位置<body onload="top.moveBy(300,200);">
  ```

* 在页面中如何加入不是满铺的背景图片,拉动页面时背景图不动
  ```html
  <style>
  body{
    background-image:url(logo.gif);
    background-repeat:no-repeat;
    background-position:center;
    background-attachment: fixed
  }
  </style>
  ```

* 获得一个窗口的大小
  ```js
  document.body.clientWidth;
  document.body.clientHeight
  ```

* 怎么判断是否是字符
  ```js
  if (/[^/x00-/xff]/g.test(s)) alert("含有汉字");
  else alert("全是字符");
  ```

* 日期减去天数等于第二个日期
  ```js
  <script language="javascript">
  function cc(dd,dadd){
    //可以加上错误处理
    var a = new Date(dd);
    a = a.valueOf();
    a = a - dadd * 24 * 60 * 60 * 1000;
    a = new Date(a);
    alert(a.getFullYear() + "年" + (a.getMonth() + 1) + "月"
      + a.getDate() + "日");
  }
  cc("12/23/2002",2)
  </script>
  ```

* 脚本永不出错
  ```js
  <script language="javascript">
  <!-- Hide
  function killErrors() {
  return true;
  }
  window.onerror = killErrors;
  // -->
  </script>
  ```

* ENTER键可以让光标移到下一个输入框
  ```html
  <input onkeydown="if(event.keyCode==13) event.keyCode=9">
  ```

* 各种样式的光标
  - auto ：标准光标
  - default ：标准箭头
  - hand ：手形光标
  - wait ：等待光标
  - text ：I形光标
  - vertical-text ：水平I形光标
  - no-drop ：不可拖动光标
  - not-allowed ：无效光标
  - help ：?帮助光标
  - all-scroll ：三角方向标
  - move ：移动标
  - crosshair ：十字标
  - e-resize
  - n-resize
  - nw-resize
  - w-resize
  - s-resize
  - se-resize
  - sw-resize

* 页面进入和退出的特效
  进入页面:
  ```html
  <meta http-equiv="Page-Enter" content="revealTrans
  (duration=x, transition=y)">
  ```

  推出页面:
  ```html
  <meta http-equiv="Page-Exit" content="revealTrans(duration=x, transition=y)">
  ```
  这个是页面被载入和调出时的一些特效。duration表示特效的持续时间，以秒为单位。transition表示使用哪种特效，取值为1-23:

  0 矩形缩小
  1 矩形扩大
  2 圆形缩小
  3 圆形扩大
  4 下到上刷新
  5 上到下刷新
  6 左到右刷新
  7 右到左刷新
  8 竖百叶窗
  9 横百叶窗
  10 错位横百叶窗
  11 错位竖百叶窗
  12 点扩散
  13 左右到中间刷新
  14 中间到左右刷新
  15 中间到上下
  16 上下到中间
  17 右下到左上
  18 右上到左下
  19 左上到右下
  20 左下到右上
  21 横条
  22 竖条
  23 以上22种随机选择一种

* 在规定时间内跳转
  ```html
  <meta http-equiv=V="REFRESH" content="5;url=http://www.51js.com">
  ```
* 网页是否被检索
  ```
  <meta name="ROBOTS" content="属性值">
  ```
  其中属性值有以下一些:
  属性值为"all": 文件将被检索，且页上链接可被查询；
  属性值为"none": 文件不被检索，而且不查询页上的链接；
  属性值为"index": 文件将被检索；
  属性值为"follow": 查询页上的链接；
  属性值为"noindex": 文件不检索，但可被查询链接；
  属性值为"nofollow": 文件不被检索，但可查询页上的链接。

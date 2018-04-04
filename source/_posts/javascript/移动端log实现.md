---
title:         移动端显示console.log # 标题
description:   移动端显示console.log # 副标题
date:          2017-04-04 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---


我们在电脑上面开发页面的时候可以通过console.log来打印日志，或是用debugger来设置断点等。

但是一旦转到手机上测试的时候，很多错误日志我们无法及时捕获到，所以在手机上显示log是有必要的。


CDN:http://oi3ygguq6.bkt.clouddn.com/log.js

移动的console.log会对数据左JSON.stringify处理

data-class为输出的样式

默认情况下log不会开启，可在地址栏增加参数?showlog=true 即可手动开启log，如需自动开启log，只需增加 data-showlog="true" 即可
```js
<script src="http://oi3ygguq6.bkt.clouddn.com/log.js" data-class="m-log"></script>

<script src="http://oi3ygguq6.bkt.clouddn.com/log.js" data-class="m-log" data-showlog="true"></script>
```

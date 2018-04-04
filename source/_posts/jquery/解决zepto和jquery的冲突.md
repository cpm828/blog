---
title:         解决zepto和jquery的冲突 # 标题
description:   解决zepto和jquery的冲突 # 副标题
date:          2017-04-05 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - jQuery
---



引入顺序：
```js
<script type="text/javascript" src="js/jquery.min.js"></script>
<script>$.noConflict();</script>
<script type="text/javascript" src="js/zepto.min.js"></script>
```

中间增加：
```
<script>$.noConflict();</script>
```

之后jQuery使用jQuery，Zepto使用Zepto，不再使用$

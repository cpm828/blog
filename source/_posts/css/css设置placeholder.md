---
title:         css设置placeholder # 标题
description:   css设置input输入框的placeholder # 副标题
date:          2017-04-03 # 建立日期
updated:       2017-04-03 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - CSS
---


>http://stackoverflow.com/questions/4919680/html5-placeholder-css-padding

```css
input::-webkit-input-placeholder { /* WebKit browsers */
  line-height: 1.5em;
}
input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
  line-height: 1.5em;
}
input::-moz-placeholder { /* Mozilla Firefox 19+ */
  line-height: 1.5em;
}
input:-ms-input-placeholder { /* Internet Explorer 10+ */
  line-height: 1.5em;
}
```

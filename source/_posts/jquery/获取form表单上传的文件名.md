---
title:         获取form表单的文件名 # 标题
description:   获取form表单的文件名，如上传的图片名称或excel文件名 # 副标题
date:          2017-04-03 # 建立日期
updated:       2017-04-03 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - jQuery
---


## 正则法取文件名


上传后input的value值为："C:\fakepath\工作簿1.xlsx"这种格式

```js
$('#testInput').val().substring($('#testInput').val().lastIndexOf("\\") + 1) // 第一个表示转义符号
```
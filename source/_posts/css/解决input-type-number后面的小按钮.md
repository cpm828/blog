---
title:         解决input-type-number后面的小按钮 # 标题
description:   解决input-type-number后面的小按钮 # 副标题
date:          2017-04-04 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - CSS
---


在使用input type为number时，在输入框的后面会有上下加减按钮，好难看，(v_v)，想去掉，怎么搞？

## 增加样式：
>https://www.zhihu.com/question/26476738/answer/32918388

```css
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
   -webkit-appearance: none;
 }
```


## 更换类型
使用tel类型代替

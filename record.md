- 博客分类
  -tags 分类：
  - Angular
  - CSS
  - ES6
  - ES7
  - ES8
  - FreeMarker
  - Git
  - HTML
  - JavaScript
  - jQuery
  - KnockOut
  - Linux
  - MacOS
  - Node
  - Other
  - Tools
  - Vue

-博客本地预览
```
hexo server
```

- 博客清除缓存
```
hexo clean
```

- 博客发布
```
hexo g -d
```


- 博客搜索功能
博客的搜索功能使用了第三方服务插件：Algolia
新增的文章要想能被搜索到：必须执行`hexo algolia`更新才可以



- 加密文档
对文档进行软加密（假性加密），可通过查看源码后进行显示

在需要进加密的文档前面加

在theme config.yml的开头增加了全局变量，将hassecret设置为false后，所有的加密都会被剔除，secret就是设置的密码。
```html
<div class="secret-box" id="secret-box">
  <label for="input-secret" class="input-label">请输入密码：</label><input type="password" class="input-secret" id="input-secret" /><button class="submit-btn" id="submit-btn">提交</button>
</div>
```

在 `themes/next/layout/_partials/head.swig` 底部增加了css和js
原理：
判断dom中有没有secret-box这个节点，无则退出，有则遍历子节点，将所有内容和左侧列表及导航隐藏，输入的密码与设置的密码一致时，遍历子节点，将所有内容和左侧列表及导航显示



- 添加文档
添加心博客时在markdown文档钱面增加以下：
```bash
---
title:         被遗忘的位运算符 # 标题
description:   被遗忘的位运算符& 、|、^ # 副标题
tags: # 标签分类
    - JavaScript
---
```
可选项：
date：创建日期，默认取当前时间
updated：更新日期，默认取当前时间
comments：开启评论，默认为true，如不需评论则设置为false



- 插入图片
1、HTML标签法：`<img src="../images/tag/a.png" title="介绍文字" />`
2、markdown语法：`![](../images/javascript/js_bubble_sort.gif "介绍文字")`



- 粗体/斜体
```
**这是加粗的文字**
*这是倾斜的文字*`
***这是斜体加粗的文字***
~~这是加删除线的文字~~
```

- 列表
  * 无序列表
  ```
  - 列表内容
  + 列表内容
  * 列表内容
  ```

  * 有序列表
  ```

  ```

- 表格
|Tables|Are|Cool|
|:---|:---:|---:|
|what|are|you 弄啥类|
|what|are you|弄啥类|
|what are you|弄|啥类|


- 引用
```
>这是引用的内容
>>这是引用的内容
>>>>>>>>>>这是引用的内容
```


- makedown语法奇怪处：
1、段落与段落之间空一行，否则会被认为是使用<br>换行，认作一个段落
2、对于多级列表，每降一级，缩进两个空格
3、段落下的代码块无需缩进，多级列表下的代码块保持缩进
4、代码块后面一定空一行，除非仍是代码块
5、hexo makedown 中“{{ }}”或`{{ }}`会解析错误，```{{ 换行 }}```不会解析错误，需注意，可在括号中间增加`&nbsp;`或手动空格

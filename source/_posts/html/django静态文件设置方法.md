---
title:        django静态文件设置方法 # 标题
description:  python django模板语言  # 副标题
date:         2017-04-03 # 建立日期
updated:      2017-04-03 # 更新日期
comments:     true  # 开启评论功能
tags: # 标签分类
    - HTML
---



## 全局替换静态资源方法：
```js
// 使用正则替换：
"\./([^\s]+)"    --------   "{% static 'newyear/$1' %}"
// 上面的newyear为当前项目的名称
```

## 用法:
* 所有页面顶部引用：
```js
{% load staticfiles %}
```

* 公用的css文件或js外部引入：
```js
{% include '**/header.html' %}
```

* a链接href地址：
跳转的页面名如果是驼峰式命名，需改成下划线连接，如indexPage改成index_page；且需指明以何种方式跳转，此处为website:，因为PC端和m端的页面是放在一个目录下的，如website:表示以PC端方式跳转，wapsite:表示以m端方式跳转：
```js
{% url 'website:index_page' %}
{% url 'wapsite:index_page' %}
```

* img标签src地址：
```js
{% static 'website/img/logo.png' %}
```

* link标签href地址：
```js
{% static 'website/css/index.css' %}
```

* script标签src地址：
```js
{% static 'website/js/index.js' %}
```

* for循环（开始处加第一行，结尾处加第二行）：
```js
{% for item in items %}
{% endfor %}
```

* for循环含特殊控制（最后一下特殊处理，此处表示最后一项含有```</a>```标签）：
```js
{% for item in items %}
{% if forloop.last %}
</a>
{% endif %}
{% endfor %}
```

---
title:         innerText和textContent的异同 # 标题
description:   innerText和textContent的异同 # 副标题
date:          2017-04-01 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---



>参考资料：http://www.jb51.net/article/25082.htm


innerText: IE
textContent: FF


## innerText
它的内容实际上就是你在浏览器看到的内容。
它会将innerHTML中的转义字符（<、 &）进行换码
它将元素的innerHTML换码、解释，最终显示出来
去除各种格式信息留下的纯文本。
它会将多个空格并成一个空格对待，会把<br/>换成换行符，而本来的换行符却并不会引起换行

总结：换行必须使用<br>标签，回车无效
     多个空格只显示一个空格


## textContent
它的内容则是innerHTML去除所有标签后的内容
它会将innerHTML中的转义字符（<、 &）进行换码
不对任何html标签进行解释，而是直接剔除它们。
不对innerHTML中的文本按照HTML的方式进行格式转换

比如多个空格不会合并为一个空格，换行符仍然存在，相反<br/>却不会导致换行


总结：换行必须回车，<br>无效
    多个空格不会合并成一个


## 操作
1、HTML转义（对>、<、&等转义字符进行处理）
2、经过HTML解释和CSS解释
3、剔除格式信息


innerText:     处理1、2、3

textContent:   只处理1

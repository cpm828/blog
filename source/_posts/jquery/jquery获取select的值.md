---
title:         获取select的值 # 标题
description:   获取select下拉框选中的值 # 副标题
tags: # 标签分类
    - JavaScript
    - jQuery
---


js方法获取：
```
var obj = document.getElementById("testSelect"); //定位id
var index = obj.selectedIndex; // 选中索引
var text = obj.options[index].text; // 选中文本
var value = obj.options[index].value; // 选中值
```


jquery方法获取：
```
$('#testSelect option:selected').text();//选中的文本
$('#testSelect option:selected') .val();//选中的值
$("#testSelect").get(0).selectedIndex;//索引

$('#testSelect').text();//选中的文本
$('#testSelect').find('option:selected').val();//选中的值
```
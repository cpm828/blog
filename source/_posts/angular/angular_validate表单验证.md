---
title:        Angular validate 表单验证 # 标题
description:  angular表单验证  # 副标题
date:         2017-04-01 # 建立日期
comments:     true  # 开启评论功能
tags: # 标签分类
    - Angular
---

1、CDN

```
http://cdn.static.runoob.com/libs/angular.js/1.4.6/angular.min.js
```



2、DEMO

```
<h1>angular validate</h1>
<form name="myForm" ng-app="myApp" ng-controller="myCtrl" novalidate>
  用户名：<br>
  <input type="text" name="user" ng-model="user" required ng-minlength="2" ng-maxlength="5"/>
  <span style="color:red" ng-show="myForm.user.$dirty && myForm.user.$invalid">
    <span ng-show="myForm.user.$error.required">用户名是必须的</span>
    <span ng-show="myForm.user.$error.minlength">用户名至少两个字符</span>
    <span ng-show="myForm.user.$error.maxlength">用户名至多五个字符</span>
  </span> <br>

  年龄：<br>
  <input type="number" name="age" ng-model="age" required ng-min="18" ng-max="60"/>
  <span style="color:red" ng-show="myForm.age.$dirty && myForm.age.$invalid">
    <span ng-show="myForm.age.$error.required">年龄是必须的</span>
    <span ng-show="myForm.age.$error.min">年龄必须大于18</span>
    <span ng-show="myForm.age.$error.max">年龄必须小于60</span>
  </span><br>

  邮箱：<br>
  <input type="email" name="email" ng-model="email" required />
  <span style="color:red" ng-show="myForm.email.$dirty && myForm.email.$invalid">
    <span ng-show="myForm.email.$error.required">邮箱是必须的</span>
    <span ng-show="myForm.email.$error.email">非法的邮箱格式</span>
  </span><br>

  <input type="submit" ng-disabled="myForm.user.$pristine ||
                                    myForm.user.$invalid ||
                                    myForm.age.$pristine ||
                                    myForm.age.$invalid ||
                                    myForm.email.$pristine ||
                                    myForm.email.$invalid">

<!--  无填写记录或者内容不合法时，按钮为不可点击状态  -->
<!--  此验证为表单实时验证  -->
</form>
```
- form中的novalidate表示禁用浏览器默认的验证
- $dirty: 表单有填写记录
- $pristine: 表单没有填写记录
- $valid: 字段内容是合法的
- $invalid: 字段内容是非法的

> 参考：http://www.runoob.com/try/try.php?filename=try_ng_validate

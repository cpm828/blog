---
title:        freemarker继承 # 标题
description:  freemarker继承语法  # 副标题
tags: # 标签分类
    - FreeMarker
---

freemarker有很好的继承机制，大体用法如下：


```hash
|
|__layout.ftl
  |
  |__changeClazz.ftl
  |
  |__module.ftl
    |
    |__center.ftl
```


## 父级文件 layout.ftl
```html
<#marko page pageName="index" clazzName="t-center-bg1"> 
<!-- 此处暴露pageName和clazzName，可在子级中设置 -->

  <div class="${clazzName!''}" data-page="${pageName!''}">
    <div class="header"></div>

    <#nested />  # 此处暴露接口

    <div class="footer"></div>
  </div>

</#macro>
```





## 子级文件

* 无孙子文件`changeClazz.ftl`
  ```html
  <#import "./layout.ftl" as temp />
  <!-- import 父文件layout.ftl -->

  @temp.page pageName='changeClazz' clazzName='t-center-bg2'>
  <!-- 设置layout的pageName 和 clazzName -->

    <div class="left"></div>
    <div class="center"></div>
    <div class="right"></div>

  </@temp.page>
  ```


* 有孙子文件`module.ftl`
  ```html
  <#import "./layout.ftl" as temp />
  <!-- import 父文件 -->

  <#marko center currentPage="index">
  <!-- 此处暴露currentPage，可在子级中设置 -->

    @temp.page pageName='center' clazzName='t-center-bg3'>
    <!-- 设置layout的pageName 和 clazzName -->

      <div class="left"></div>

      <div class="center" data-currentpage="${currentPage!''}">
        <div class="top"></div>
        
        <#nested />  # 此处暴露接口

        <div class="bototm"></div>
      </div>

      <div class="right"></div>

    </@temp.page>
  </#macro>
  ```




## 孙子文件center.ftl
```html
<#import "module.ftl" as module>
<!-- import 父文件module.ftl -->

@module.center currentPage='1'>
<!-- 设置module的currentPage -->

  <div class="main"></div>

</@module.page>
```
---
title:         vue编译后的文件目录结构 # 标题
description:   vue编译后的文件目录结构变化 # 副标题
comments:      true  # 开启评论功能
tags: # 标签分类
    - Vue
---


当我们使用vue-cli脚手架时，执行`npm run build`之后会在根目录生成一个dist文件，如下图

<img src="../images/vue/vue_build1.png" width="100px">

对应的配置文件，根目录下config/index.js中，如下图

<img src="../images/vue/vue_build3.png" width="300px">

但是当我我们将编译后的文件放在后端的目录下时，目录结构并不一定还是这样，所以我们需要根据实际情况来设置编译的文件目录结构

比如我们需要将静态文件进行一层嵌套，我的配置为：
<img src="../images/vue/vue_build4.png" width="300px">

对应的编译后的目录为：
<img src="../images/vue/vue_build2.png" width="100px">

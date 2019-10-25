---
title:         NPM安装插件 # 标题
description:   npm安装插件...  # 副标题
date:          2017-03-30 # 建立日期
updated:       2017-03-30 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Node
---


## 安装组件
要添加项目到您的package.json的devDependencies：
```js
npm i -D ***

或：

npm install <package_name> --save -dev
```

要添加项目到您的package.json的dependencies：
```js
npm i ***

或：

npm install <package_name> --save
```


## 删除组件
```js
cnpm uninstall *** *** --save-dev
```

## 安装自动补全厂商前缀
* 安装autoprefixer-loader
  ```
  cnpm i -D autoprefixer-loader
  ```

* 配置loader
  ```js
  {
    test: /\.scss$/,
    loader: 'autoprefixer!sass'
  }
  ```

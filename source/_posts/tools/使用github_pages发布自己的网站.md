---
title:         使用github pages发布自己的网站 # 大标题
description:   使用github pages发布自己的网站，并设置绑定自己的域名 # 小标题
date:          2019-11-07 # 建立日期
updated:       2019-11-07 # 更新日期
comments:      true  # 开启评论功能
tags:
    - Tools
---

当我们使用[Github](https://github.com)、[Coding Net](https://coding.net)、[码云Gitee](https://gitee.com/)等存储工程代码时，都会有相应的pages服务。

它们提供的pages如下：
- Github Pages:  `****.github.io`
- CodingNet Pages:  `****.coding.me`
- Gitee Pages:  `****.gitee.io`

以Github Pages为例，操作流程如下：

1. 为了使多个项目可以共用该Github Pages，我们不建议将某个项目直接设置使用。

2. 在github中新建一个以自己 用户名.github.io 开头的工程名称，并设置为public，如 `cpm828.github.io`。
<img src="../images/tools/github_pages_1.png">

3. 在 `cpm828.github.io` 工程下新建一个index.html，用于存放一个路由导航页面，可以导航到其他工程。操作完成之后就可以使用 `https://cpm828.github.io` 来访问这个index.html了。

4. 继续绑定自己购买的域名。

5. 在Settings页面 `Github Pages` 模块里面设置 `Custom domain` 为自己的域名，如 `pimichen.com`，如图：
<img src="../images/tools/github_pages_2.png">

6. 在 `cpm828.github.io` 新建一个 `CNAME` 文件，里面写上自己的域名。如图：
<img src="../images/tools/github_pages_3.png">

7. 如果操作正确，会出现该提示，如图。现在，你可以使用自己的域名访问了。
<img src="../images/tools/github_pages_4.png">

8. 继续设置https协议。

9. 在Settings页面 `Github Pages` 模块，勾选 `Enforce HTTPS`，如果出现置灰无法勾选的情况，打开网页控制台，找到该input，手动删除 `disabled` 属性，然后勾选即可成功。哈哈，`Github` 你不要太调皮。
<img src="../images/tools/github_pages_5.png">

10. 成功之后即可以使用https来访问了。
<img src="../images/tools/github_pages_6.png">

附加：

Github 里面的工程可以设置一个 `gh-pages` 分支用于存放需要使用 `Github Pages` 的代码内容。如新建了一个 `cpm-ui` 的工程，我们将编译后的目录存放到 `gh-pages` 分支中，`vue-cli` 生成 `gh-pages` 分支步骤如下：

1. 正常创建工程并存放到github上

2. npm安装gh-pages
    ```
    npm install gh-pages -D
    ```

3. 配置快速启动脚本，配置homepages
    package.json:
    ```js
    "homepage": "https://cpm828.github.io/cpm-ui", // 首页地址
    "script": {
        "deploy": "gh-pages -d examples/dist"
    }
    ```

    如果是vue-cli项目，需要修改config/index.js:
    ```js
    build: {
        assetsPublicPath: ''
    }
    ```

4. 执行编译，即可成功创建 `gh-pages`
    ```
    npm run deploy
    ```


操作成功后访问 `https://pimichen.com/cpm-ui` 即可以直接指向 `cpm-ui` 工程下 `gh-pages` 分支中的内容。
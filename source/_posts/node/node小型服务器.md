---
title:        node安装的小型服务器 # 标题
description:  node安装的小型服务器  # 副标题
tags: # 标签分类
    - Node
---

node可以安装一些小型的服务器，如[browser-sync](#browser-sync)、[live-server](#live-server)、[npx](#npx)、[Python服务器](#python)、[anyproxy](#anyproxy)、[spy-debugger](#spy-debugger)

## <span id="browser-sync">browser-sync</span>
  > 详见[BrowserSync](http://www.browsersync.cn/)

  * 安装
  ```bash
  npm install -g  browser-sync  # 全局安装

  npm install --save-dev browser-sync  # 局部安装
  ```

  * 使用
  ```bash
  browser-sync start --server --files "css/*.css"  # 执行具体目录

  browser-sync start --server --files "css/*.css, *.html"  # 监听多个类型的文件，逗号分开

  browser-sync start --server --files "**"  # 自动运行
  ```





## <span id="live-server">live-server</span>
  > 详见[live-server](https://www.npmjs.com/package/live-server)

  * 安装
  ```bash
  npm install -g live-server  # 全局安装

  npm install --save-dev live-server  # 局部安装
  ```

  * 使用
  ```bash
  live-server

  live-server --port=8080  # 指定端口

  live-server --browser=chrome  # 指定浏览器访问
  ```

  * 其他用法
  在`package.json`的`scripts`下配置
  ```js
  "scripts": {  
    "server": "live-server ./ --port=8081"  
  }  
  ```
  运行
  ```
  npm run server
  ```



## <span id="npx">npx</span>
  如果你把NPM升级到最新版本npm@5.2.0，可能会发现，它会安装一个新的包npx。
  开启静态服务器
  ```bash
  npx http-server
  ```



## <span id="python">Python服务器</span>
  安装了 Python 的机器上，可以使用 nohup python -m SimpleHTTPServer [port] & 快速搭建一个http服务。

  * 使用
  ```bash
  python -m SimpleHTTPServer 8000  # 只能前台运行

  python -m SimpleHTTPServer 8000 &  # 可后台运行，不影响终端的使用
  ```



## <span id="anyproxy">anyproxy</span>
  > 详见[anyproxy](http://anyproxy.io/cn/)
  
  * 安装
  ```bash
  npm install -g anyproxy  # 全局安装

  npm install --save-dev anyproxy  # 局部安装
  ```

  * 使用
  ```bash
  1、anyproxy

  2、电脑打开相应地址

  3、手机设置代理，默认端口9888

  4、手机浏览器方位调试
  ```

  * 更改端口
  ```bash
  anyproxy --port 1080  # 更改端口
  ```

  * 代理HTTPS
    - AnyProxy默认不对https请求做处理，如需看到明文信息，需要配置CA证书
      >解析https请求的原理是中间人攻击（man-in-the-middle），用户必须信任AnyProxy生成的CA证书，才能进行后续流程
    
    - 生成证书并解析所有https请求
    ```bash
    anyproxy-ca #生成rootCA证书，生成后需要手动信任
    anyproxy --intercept #启动AnyProxy，并解析所有https请求
    ```
    
    - [附录：如何信任CA证书](http://anyproxy.io/cn/#%E8%AF%81%E4%B9%A6%E9%85%8D%E7%BD%AE)





## <span id="spy-debugger">spy-debugger</span>
  > 详见[spy-debugger](https://github.com/wuchangming/spy-debugger)
  
  集成了anyproxy，可进行微信调试，各种WebView样式调试、手机浏览器的页面真机调试。便捷的远程调试手机页面、抓包工具，支持：HTTP/HTTPS，无需USB连接设备。

  * 安装
  ```bash
  npm install -g spy-debugger  # 全局安装

  npm install --save-dev spy-debugger  # 局部安装
  ```

  * 使用
  ```bash
  1、spy-debugger

  2、电脑打开相应地址

  3、手机设置代理，默认端口9888

  4、手机安装证书，手机浏览器访问http://s.xxx

  5、手机浏览器方位调试
  ```
  
  * 配置
  ```bash
  spy-debugger -p 8888  # 更改端口

  spy-debugger -e http://127.0.0.1:8888  # 设置外部代理

  spy-debugger -c true  # 是否允许HTTP缓存，默认false

  spy-debugger -b false  # 是否只拦截浏览器发起的https请求，默认true

  spy-debugger -w true  # 设置页面内容为可编辑模式，默认false

  spy-debugger -i true  # 是否允许weinre监控iframe加载的页面
  ```
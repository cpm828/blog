---
title:        使用pm2永久开启node服务器 # 标题
description:  pm永久开启node服务器，无需开启终端  # 副标题
tags: # 标签分类
    - Node
---


前言：我们知道在跑node程序的时候，我们需要开启一个终端来执行node的命令，当终端关闭时，node服务器也相应的关闭了，如何保持node服务器的永久开启而不依赖窗口呢？

使用[pm2](http://pm2.keymetrics.io/docs/usage/quick-start/#usage)可以永久开启node服务器而不受终端窗口的限制，pm2 是一个带有负载均衡功能的Node应用的进程管理器.当你要把你的独立代码利用全部的服务器上的所有CPU，并保证进程永远都活着，0秒的重载， pm2是完美的。

1、全局安装
```bash
sudo npm install pm2@latest -g
```

2、举例
如使用`vue-cli`工具时我们需要用到`npm run dev`命令，我们知道，执行的其实下面的`node build/dev-server.js`命令
```js
"scripts": {
  "dev": "node build/dev-server.js",
  "build": "node build/build.js",
  "test": "",
  "lint": "eslint --ext .js,.vue src"
}
```

我们可以使用`pm2`来替代运行上面的程序

- 方法1：
  ```bash
  pm2 start build/dev-server.js
  ```

  当我们启动一个程序的时候，会看到：
  <img src="../images/node/pm1.png" title="pm2运行结果图" />

  当我们启动一两个个程序的时候，会看到：
  <img src="../images/node/pm2.png" title="pm2运行结果图" />

  我们可以给这个进程自定义一个名字：
  ```bash
  pm2 start build/dev-server.js --name vue-cli
  ```
  这个时候会看到原先的那个进程被杀掉了`errored`
  <img src="../images/node/pm3.png" title="pm2运行结果图" />

- 方法2：
  直接通过原先的命令来替换执行
  ```bash
  pm2 start npm -- run dev    # npm run dev 的替换命令
  ```


3、用法
- 最简单的启用一个应用：`pm2 start app.js`

- 停止：`pm2 stop app_name|app_id`

- 删除：`pm2 delete app_name|app_id`

- 删除所有：`pm2 delete all`

- 重启：`pm2 restart app_name|app_id`

- 停止所有：`pm2 stop all`

- 查看所有的进程：`pm2 list`

- 查看所有的进程状态：`pm2 status`

- 查看某一个进程的信息：`pm2 describe app_name|app_id`

- 监视每个node进程的CPU和内存的使用情况：`pm2 monit`


4、负载均衡
```bash
pm2 start app.js -i 3   # 开启三个进程

pm2 start app.js -i max   # 根据机器CPU核数，开启对应数目的进程 
```


5、开机自动启动
```
通过 pm2 save 保存当前进程状态。

通过 pm2 startup [platform] 生成开机自启动的命令。例如：pm2 startup centos/ubuntu

将步骤2生成的命令，粘贴到控制台进行，搞定。
```


6、更新pm2
```bash
npm install pm2@latest -g    # 更新版本

pm2 update    # 更新内存
```


>和pm2相同的工具，如forever，请查看简书[极地瑞雪 (使用forever让node.js持久运行)](https://www.jianshu.com/p/669a618f3212)
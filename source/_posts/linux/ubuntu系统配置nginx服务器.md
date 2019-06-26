---
title:         ubuntu系统配置nginx服务器 # 标题
description:   ubuntu系统配置nginx服务器 # 副标题
tags: # 标签分类
    - Linux
---

## ssh登录
```bash
ssh root@ip地址
输入密码，回车
```



## 安装nginx
1、选定源码目录，原则上可以是任何目录。这里我选择`/usr/local/src`：
```bash
cd /usr/local/src    # 进到src目录
```

2、安装`PCRE`库，`zlib`库，`ssl`（某些vps默认没装ssl)：
```bash
sudo apt-get install libpcre3 libpcre3-dev libpcrecpp0v5 libssl-dev zlib1g-dev
```
3、安装Nginx：
Nginx 一般有两个版本，分别是稳定版和开发版，您可以根据您的目的来选择这两个版本的其中一个，下面是把 Nginx 安装到 `/usr/local/nginx` 目录下的详细步骤：(注意：需要在sudo下)
```bash
cd /usr/local/src

wget http://nginx.org/download/nginx-1.13.1.tar.gz

tar -zxvf nginx-1.13.1.tar.gz

cd nginx-1.13.1

./configure

make

make install
```

4、查看端口状态：
```bash
netstat -ano|grep 80
```

5、启动Nginx
```bash
sudo /usr/local/nginx/sbin/nginx
```

6、打开浏览器访问机器的IP，如果看到如下图，恭喜你安装成功了！
<img src="../images/linux/nginx_success.png" title="nginx 配置成功效果图" />




## 修改nginx配置
1、进到配置文件
```bash
cd /usr/local/nginx/conf

vi nginx.conf
```

2、修改
修改`server`模块（可配置多个`server`模块）
<img src="../images/linux/nginx_conf.png" title="nginx config文件" />
默认情况下，会指向`nginx`文件夹下的`html`文件夹，这里我们修改为：`/home/files;`，后续只需要将我们的文件存放在`/home/files`目录下即可

3、反向代理
我们可以把`server`模块修改成下面这样：
```bash
server {
    listen    8080;
    server_name    localhost;    # 如果需要配置二级域名，此处填写即可，如 work.pimichen.com
    location  /  {
        proxy_pass    http：//127.0.0.1:8899;    # 代理的地址  
    }
}
```
上面的意思：监听公网地址的8080端口，并将通过此端口的请求代理到服务器本地nodejs服务的8899端口（跑node服务器时设定的）上面。如
```bash
node程序运行后应该是：127.0.0.1:8899

访问：公网ip地址:8080 即可实现代理
```

注：80端口为http的默认端口，443端口为https的默认端口

4、重载配置
```bash
sudo /usr/local/nginx/sbin/nginx -s reload
```
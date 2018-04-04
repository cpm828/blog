---
title:         Linux安装QQ # 标题
description:   linux安装Wine QQ # 副标题
date:          2017-04-01 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Linux
---


Wine QQ7.8

支持的版本：
ubuntu 12.04，32位
由于时间及人手原因，没有来得及测试其他发行版，此版本基于32位ubuntu 12.04开发，也请大家多多帮助测试其他发行版，非常感谢！

安装方法：
ubuntu系统安装说明：
如以前装过其他版本的Wine QQ，请先卸载（通过dpkg -l | grep qq查看），然后运行：
sudo dpkg -i WineQQ7.8-20151109-Longene.deb

非Ubuntu系统：
1、解压deb包
2、按照deb的目录结构，复制的对应的目录，如把opt目录下的所有文件复制到系统的/opt目录下，
3、在终端运行qq即可

成功后的截图：

<img src="../images/linux/wine-qq1.png">
<img src="../images/linux/wine-qq2.png">

是不是很开心^_^

我自己安装的目前存在一些问题，一旦网络切换（电脑没网的情况下）就会自动掉线，而且还不能重新登录，重启电脑或将QQ进程杀死后才能重开。

掉线后处理：
1、杀进程
```bash
ps -ef | grep qq

kill -9 **
```

2、重启

虽然有这些问题，但总比没有要好，凑合着用吧！哈哈！


>[下载地址](http://www.longene.org/download/WineQQ7.8-20151109-Longene.deb)
>[百度网盘](http://pan.baidu.com/s/1kTu9ZUZ)
>[参考链接](http://www.longene.org/forum/viewtopic.php?f=6&t=30516)

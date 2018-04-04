---
title:         Linux安装搜狗输入法后失效的解决办法 # 标题
description:   linux安装搜狗输入法后，经常无故失效，该怎么解决呢？ # 副标题
date:          2017-04-01 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Linux
---



## 方法一:重新启动搜狗输入法

通过下面的两个命令重启搜狗输入法,看重启之后是否可以正常使用:
```bash
~$ killall fcitx
~$ killall sogou-qinpanel
```

## 方法二:检查修复安装依赖

因为我是在正常使用下出现的问题,所以不是安装依赖的问题不适用,刚安装好的朋友如果无法使用,可以用下面的领了排查或者修复安装依赖问题
```bash
~$ sudo apt-get install -f
```

## 方法三：删除配置文件，重启搜狗
ubuntu下搜狗的配置文件在 ~/.config下的3个文件夹里：

`SogouPY`、`SogouPY.users`、`sogou-qimpanel`

删除这3个文件夹，然后重启搜狗。

我使用方法三解决了无法输入中文问题。

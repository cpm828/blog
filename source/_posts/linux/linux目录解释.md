---
title:         linux目录解释 # 标题
description:   linux的目录解释 # 副标题
date:          2017-04-01 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Linux
---


## Linux 根目录
计算机下的根目录 (pm@pm-pc:/$ )

```bash
/bin # 存放必要的命令
/boot # 存放内核以及启动所需的文件等
/dev # 存放设备文件
/etc # 存放系统的配置文件
/home # 用户文件的主目录，用户数据存放在其主目录中
/lib # 存放必要的运行库
/mnt # 存放临时的映射文件系统，我们常把软驱和光驱挂装在这里的floppy和cdrom子目录下。
/proc # 存放存储进程和系统信息
/root # 超级用户的主目录
/sbin # 存放系统管理程序
/tmp # 存放临时文件的目录
/usr # 包含了一般不需要修改的应用程序，命令程序文件、程序库、手册和其它文档。
/var # 包含系统产生的经常变化的文件，例如打印机、邮件、新闻等假脱机目录、日志文件、格式化后的手册页以及一些应用程序的数据文件等等。建议单独的放在一个分区。[separator]
```


## home目录
```bash
/home
```
主文件夹目录


## 个人电脑
```bash
/home/pm/ # (pm@pm-pc:) (终端默认)
```

## 各文件
```bash
/Project
/Deskup
/Documents
/Downloads
/Music
......
```

## 操作
使用`cd **`和`cd ..`来进入和退出目录

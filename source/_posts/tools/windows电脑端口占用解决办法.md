---
title:         windows系统端口占用解决办法 # 大标题
description:   解决windows系统端口占用的命令 # 小标题
tags:
    - Tools
---


```
1、查看端口对应的PID（最后一项）
  netstat -ano |findstr "8081"

2、查看PID对应的应用程序
  tasklist |findstr "PID"

3、杀掉该应用程序的进程
  taskkill /f /t /im "java.exe"
```

注：必须使用window的 cmd 窗口来运行程序，某些应用的内置终端无法运行
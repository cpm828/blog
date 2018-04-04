---
title:         Linux点击链接打开chrome显示空页面解决办法 # 标题
description:   点击空链接打开chrome显示空页面 # 副标题
date:          2017-04-01 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Linux
---


Ubuntu 点击链接弹出chrome是空白页

原因：

```
~/.local/share/applications/
```
该目录下有google-chorome.desktop文件，浏览器会优先使用.local下的配置

解决办法：
```
sudo vim google-chrome.desktop
```
修改，或者删除该文件即可
```
Exec=/opt/google/chrome/chrome %U
```

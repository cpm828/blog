---
title:         Linux创建桌面图标 # 标题
description:   linux创建桌面小图标，实现和windows一样的快捷方式 # 副标题
date:          2017-04-01 # 建立日期
updated:       2017-04-01 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Linux
---

如果是系统自带的程序，默认的桌面图标放在 /usr/share/applications/下面，可以直接将对应的图标放到当前用户的~/Desktop/目录下即可

如果是从网上下载已编译的二进制文件(eclipse之类的)，可以进行手动的创建

将以下代码放在一个sublime.desktop的文件中，并复制到桌面上，授予可执行权限即可：

```bash
[Desktop Entry]
Categories=Development;
Comment[zh_CN]=
Comment=
Exec=/home/zhxia84/software/tool/SublimeText2/sublime_text
GenericName[zh_CN]=IDE
GenericName=IDE
Icon=/home/zhxia84/software/tool/SublimeText2/Icon/32x32/sublime_text.png
MimeType=
Name[zh_CN]=sublime
Name=sublime
Path=
StartupNotify=true
Terminal=false
Type=Application
X-DBUS-ServiceName=
X-DBUS-StartupType=
X-KDE-SubstituteUID=false
X-KDE-Username=owen
```

> 参考：http://www.cnblogs.com/xiazh/p/3821863.html

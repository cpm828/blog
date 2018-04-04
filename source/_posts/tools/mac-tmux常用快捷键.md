---
title:         Mac Tmux常用快捷键 # 大标题
description:   mac tmux一些常用的快捷键 # 小标题
tags:
    - Tools
---

已经把ctrl-b修改成ctrl-a，横向切割和纵向切割也修改成功|和-

修改：   vim ~/.tmux.conf
修改生效：ctrl-a : source-file ~/.tmux.conf

tmux       :  启动tmux
ctrl-a d   :  退出tmux会话

tmux a -t 0 : 启动之前的tmux窗口

ctrl-a ,   :  重命名窗口名
ctrl-a c   :  新开窗口(对应的窗口数字：0, 1, 2, 3, ...)
ctrl-a &   :  关闭当前整个窗口
ctrl-a num :  切换到指定的窗口(0, 1, 2, 3, ...)
ctrl-a p   :  切换到上一个窗口(循环)
ctrl-a n   :  切换到下一个窗口(循环)
ctrl-a w   :  以菜单形式显示所有窗口，再切换窗口
 
ctrl-a |   :  横向切割
ctrl-a -   :  纵向切割
ctrl-a o   :  切换到下一个分割窗口(循环)
ctrl-a direaction : 上下左右切换分割窗口
ctrl-a x   :  询问是否关闭当前的分割窗口
ctrl-d     :   直接关闭当前分割窗口
ctrl-a !   :  关闭所有的分割窗口
ctrl-a z   :  最大化/最小化 当前分割窗口

ctrl-a ?   :  显示帮助
ctrl-a t   :  显示时钟

ctrl-a [   :  开始滚屏，按方向键滚动，q 退出

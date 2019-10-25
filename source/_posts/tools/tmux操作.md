---
title:         tmux相关操作 # 标题
description:   tmux的一些常用操作 # 副标题
date:          2018-07-12 # 建立日期
updated:       2018-07-12 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Tools
---


tmux快捷键（已经修改了默认配置）
```bash
tmux 终端快捷键设置：
cat ~/.tmux.conf    查看
sudo vim ~/.tmux.conf    修改

使用tmux开启多个终端，快捷键如下：
tmux    进入tmux

我的快捷键使用（通过cat ~/.tmux.conf设置）:
Ctrl + A 、 -    横向分屏
Ctrl + A 、 |    竖向分屏
exit    关闭当前窗口
Ctrl + A 、D    # 将多个终端放入后台隐藏，显示一个终端
tmux at    # 重新切换回多个终端状态
Ctrl + A、（up、down、left、right）    # 在多个终端中切换输入
Ctrl + A +（up、down、left、right）    # 改变当前终端的大小
Ctrl + A、[ 、（up、down、left、right）    # 在当前终端可以滚Z
Ctrl + A、Z    # 当前终端最大化最小化
Ctrl + A、C    # 当前窗口分屏（全屏）
Ctrl + A、，   # 更改窗口地步名称
```

修改配置如下：
```bash
# 编码
setw -g utf8 on
set -g status-utf8 on

# 基础设置
set -g default-terminal "screen-256color"
set -g display-time 3000
set -g escape-time 0
set -g history-limit 65535
set -g base-index 1
set -g pane-base-index 1

# 前缀绑定 (Ctrl+a)
set -g prefix ^a
unbind ^b
bind a send-prefix

# 分割窗口
unbind '"'
bind - splitw -v
unbind %
bind | splitw -h

# 选中窗口
bind-key k select-pane -U
bind-key j select-pane -D
bind-key h select-pane -L
bind-key l select-pane -R

# copy-mode 将快捷键设置为 vi 模式
setw -g mode-keys vi

# 启用鼠标(Tmux v2.1 之前)
setw -g mode-mouse on
set -g mouse-select-pane on
set -g mouse-resize-pane on
set -g mouse-select-window on

# Ubuntu 支持复制
bind -t vi-copy y copy-pipe "xclip -sel clip -i"

# 启用鼠标(Tmux v2.1)
#setw -g mouse on
# to enable mouse scroll, see https://github.com/tmux/tmux/issues/145#issuecomment-150736967
#bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'copy-mode -e'"

# 更新配置文件
bind r source-file ~/.tmux.conf \; display "已更新"
```

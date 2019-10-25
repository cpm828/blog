---
title:         Windows Sublime编辑器常用快捷键 # 大标题
description:   windows sublime及其他常用编辑器的快捷键 # 小标题
date:          2018-07-12 # 建立日期
updated:       2018-07-12 # 更新日期
comments:      true  # 开启评论功能
tags:
    - Tools
---


## 查找快捷键
Ctrl+F:           搜索查找
F3:               查找下一个
Shift+F3:         查找上一个
Ctrl+F3:          快速查找出光标定位的某个元素，连续可查找一个
Alt+F3:           快速查找出光标定位的所有元素，查找所有
Ctrl+Shift+F:     查找并替换
Ctrl+H:           替换
Ctrl+G:           跳转到第几行
Ctrl+M:           选择当前匹配的括号

## 关闭快捷键
Ctrl+W:           关闭当前打开文件
Ctrl+Shift+W:     关闭所有打开文件

## 注释快捷键
Ctrl+/ /:         注释HTML
Ctrl+/:           注释当前行
Ctrl+Shift+/:     注释段落

## 选择快捷键
Ctrl+D:           选中光标定位的单词，连续可选中下一个
Ctrl+L:           选中当前行，连续可选中下一行
Ctrl+Enter:       在该行下面增加一行
Ctrl+Shift+Enter: 在该行上面增加一行
Ctrl+X:           删除当前行
Shift+up:         从光标前面开始选择行，连续可选中上一行
Shift+down:       从光标后面开始选择行，连续可选中下一行
Shift+left:       从光标处连续选择左边的文本
Shift+right:      从光标处连续选择右边的文本
Ctrl+Shift+up:    选择本行，并向上移动一行
Ctrl+Shift+down:  选择本行，并向下移动一行
Ctrl+Shift+left:  从光标处连续选择左边的单位
Ctrl+Shift+right: 从光标处连续选择右边的单位
Ctrl+Alt+up:      向上添加多个光标，可同时输入
Ctrl+Alt+down:    向下添加多个贯标，可同时输入

## 切换标签快捷键
Ctrl+PageUp:      向左切换标签页
Ctrl+PageDown:    向右切换标签页


## 插件快捷键
代码快速编写(Emmet)：                 Tab/Ctrl+E
语法提示框架(SublimeLinter)：
右键菜单增强(SideBarEnhancements)：
JS格式化工具(JSFormat)：              Ctrl+Alt+F
HTML格式化工具(TAG)：                 Ctrl+Alt+F
全局格式化工具(HTML+CSS+JS Prettify): Ctrl+Shift+H
颜色选择器(ColorPicker)：             Ctrl+Shift+C
代码高亮显示(SublimeHighlight)：      Edit--Highlight--Convert to HTML（写博客时使用）
代码提示工具(BracketHighlighter)：    光标左侧出现提示（提示匹配的括号、引号和标签）
代码提示工具(TrailingSpacer)：        光标左侧出现提示（提示多余空格和Tab）


Sublime Text3设置F12打开默认浏览器：
1.安装SlideBar插件
2.用户操作设置
```bash
{
  "default_browser": "chrome"
}
```
3.用户按键设置
```bash
[{
  "keys": ["f12"],
  "command": "side_bar_open_in_browser",
  "args": {
    "paths": [],
    "type": "testing",
    "browser": ""
  }
}]
```

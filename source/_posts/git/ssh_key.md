---
title:        Git ssh key操作 # 标题
description:  生成ssh key等  # 副标题
date:         2017-03-30 # 建立日期
updated:      2017-03-30 # 更新日期
comments:     true  # 开启评论功能
tags: # 标签分类
    - Git
---

``` bash
ssh-keygen -t rsa -C "$your_email"    // 生成SSH KEY

cat ~/.ssh/id_rsa.pub    // 列出SSH KEY

clip -sel clip < ~/.ssh/id_rsa.pub    // 将SSH KEY复制到粘贴板

```

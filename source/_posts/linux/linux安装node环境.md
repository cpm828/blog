---
title:         Linux安装node环境 # 标题
description:   linux配置node环境、npm等 # 副标题
tags: # 标签分类
    - Linux
---

1 安装
```bash
wget https://nodejs.org/dist/v8.11.3/node-v8.11.3-linux-x64.tar.xz  # 二进制地址（from node website）
```

2 解压
```bash
xz -d node-v8.11.3-linux-x64.tar.xz

tar -xvf node-v8.11.3-linux-x64.tar
```

3 重命名
```bash
mv node-v8.11.3-linux-x64 node
```

4 创建软链接
```bash
ln -s /usr/local/node/bin/node /usr/bin/node

node --version

ln -s /usr/local/node/bin/npm /usr/bin/npm

npm --version

ln -s /usr/local/node/bin/npx /usr/bin/npx

npx --version
```
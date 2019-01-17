---
title:        Git常用命令 # 标题
description:  一些自己常用的Git命令  # 副标题
date:         2017-03-30 # 建立日期
comments:     true  # 开启评论功能
tags: # 标签分类
    - Git
---

> 经常忘记git的一些命令，so还是把常用的一些命令记下来，忘记了再来查

## git和svn的区别

- `svn`是集中式版本控制系统
- `git`是分布式版本控制系统


## git常用命令

```
init    初始化
// mkdir aa
// cd aa
// git  init    把当前目录变成git可以管理的仓库，初始化

add    添加
// git add readme1.txt    把文件1添加到仓库
// git add readme2.md    把文件2添加到仓库

commit    提交
// git commit -m "添加的是什么文件"    把文件提交到仓库（-m后面的是本次提交的说明）

// add和commit的区别
// 操作共两部，先add，后commit
// 因为commit可以一次提交很多文件，所以可以多次add不同的文件
// git add file1.txt
// git add file2.txt file3.txt
// git commit -m "add file1、file2 and file3"

status    仓库状态
// git status    status命令可以时刻掌握仓库当前的状态

diff    差异
// git diff    diff命令可以比较版本差异

log    版本
// git log    log命令可以查看历史记录（从近到远）

checkout    撤销工作区（本地）修改
// git checkout --readme.txt    把 readme.txt 文件在工作区的修改全部撤销

1:如果readme.txt还未存放到暂存区，执行后就回到和版本库一样的状态
2:如果readme.txt已经存放到暂存区，执行完后就回到暂存区中一样的状态
总之：就是回到上一次git add 或 git commit的状态

reset(默认为--mixed)    版本撤回
// git reset --soft HEAD    回退时不重置暂存区和工作区
// git reset --mixed HEAD    回退时重置缓存区，默认选项（--mixed可不写）
// git reset --hard HEAD    回退时重置暂存区和工作区

// git reset HEAD^    回退到上一版本，并重置暂存区
// git reset HEAD~10    回退到10个版本之前，并重置暂存区
// git reset --hard HEAD^    回退到上一版本，并重置工作区和暂存区
// git reset --hard HEAD~10    回退到10个版本之前，并重置工作区和暂存区

// git reset    不指定HEAD，用来清空暂存区的修改
// git reset filename    清空暂存区中指定文件的修改
// git reset --hard    不指定HEAD，用来清空工作区和暂存区的修改
// git reset --hard filename    清空工作区和暂存区中指定文件的修改

// 撤回时，首先判断是否需要版本回退（HEAD控制），再判断工作区是否保留（--hard控制）
// 工作区撤回：git checkout / git checkout filename
// 暂存区撤回（工作区保留）: git reset / git reset filename
// 暂存区撤回（工作区不保留）： git reset --hard / git reset --hard filename
// 版本区撤回（工作区保留）: git reset HEAD / git reset HEAD
// 版本区撤回（工作区不保留）：git reset --hard HEAD / git reset --hard HEAD filename

reflog    记录每一次commit命令
// 查看之前版本的commit id，然后可以返回来
// 穿梭和回退
// HEAD指向的版本就是当前的版本，使用命令 git reset --hard commit_id
// 穿梭历史前：用 git log 先查看提交历史，确定要回退到历史的哪个版本
// 要重返未来：用 git reflog 先查看命令历史，确定要回重回到未来的哪个版本

rm    删除（先删除后提交）
//git rm test.txt
//git commit -m "remove test.txt"
//rm -rf .git  删除git信息，脱离git
//find . -name ".git" | xargs rm -Rf    
本地文件夹下的git文件，然后在重新初始化新建的git仓库

stash  暂存
//git stash   对当前的暂存区和工作区状态进行保存
//git stash list   列出所有保存的进度列表
//git statsh pop [--index][<stash>]   恢复工作进度
--index：不仅回复工作区，还恢复暂存区
<stash>：指定恢复一个具体进度，如果没有参数，默认恢复最新进度
如：git stash pop --index stash@{0}    恢复编号为0的进度的工作区和暂存区

push    将分支推送成为远端上的分支
//git push <remote> [branch]
//git push origin master:master    //将master分支下的本地修改push到master分支下（可初始化时提交未修改的分支，当前在其他分支时可使用，若当前已经在master分支，则使用 git push即可）

pull    下载数据
//git pull    从远端的服务器上下载数据，实现同步更新
//git pull origin master    //从其他分支上拉取master下的代码

clone    克隆项目
//git clone ****   首次克隆线上项目到本地,*****表示git地址

remote    远程分支
//git remote set-url origin Url    更换url（ssh url 和 http url）
//git remote -v    查看远程
//git remote rm origin    删除远程
//git remote add origin Url    设置远程
//git remote prune origin    清理远程无效分支

config    配置别名（配置目录在主目录下.gitconfig中，如不需要，删除记录即可）
//git config --global alias.st status（将git status 配置成git st）
//git config --global alias.ad add（将git add 配置成git ad）
//git config --global alias.cm commit（将git commit配置成git cm）
```


## git分支 branch

```
branch    分支
//git branch    查看分支
//git branch <name>    创建分支
//git checkout <name>   切换分支
//git checkout -b <name>    创建+切换分支
//git merge <name>    合并某分支到当前分支
//git branch -d <name>    删除本地分支
//git push origin :master   删除远程分支(或git push origin --delete master，只删除远程分支，本地不会删除)

// git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort -k5n -k2M -k3n -k4n    查看分支创建者和创建时间
```


## git pull
```
git pull <远程主机名> <远程分支名>:<本地分支名>

git pull origin next:master // 表示取回origin主机上的next分支与本地分支master合并
git pull origin next  // 表示拉取远程next分支与本地next分支合并
等同于
/**/
git fetch   // 表示先从远程上获取最新版本到本地，不会自动合并
git merge origin/next  // 表示合并
/**/

某些场合，git会在本地分支和远程分支之间建立一种tracking追踪关系，如git clone，通常为对应分支，也可手动建立追踪关系：
git branch --set-upstream master origin/next   // 表示指定本地的master分支追踪远程的origin/next分支

当建立追踪关系后：
git pull origin  // 表示本地的当前分支自动与origin主机上的追踪分支进行合并，如上方的会将远程next分支拉取到本地master分支上
git pull  // 如果当前分支只有一个追踪的分支，可以省略origin，当前分支会自动与唯一一个追踪分支进行合并


良好的拉取过程：
git fetch origin master:tmp  // 拉取远程的master分支到本地tmp分支
git diff tmp  // 对比本地分支和刚从master分支上拉取下来的差异
git merge tmp  // 合并
```

## git push

```
git push <远程主机名> <本地分支名>:<远程分支名>

git push // 表示将当前分支推送到origin诸暨市的对应分支（操作当前分支）
git push origin master // 表示将本地的master分支推送到origin主机的master分支，如果master不存在，则会被创建（可操作当前分支，也可操作其他分支）
git push -u origin master  // 当前分支与多个主机存在追踪关系，使用-u指定一个默认主机，之后就可以使用git push了
git push --all origin  // 将本地所有分支都推送到远程主机origin
git push origin :master
等同于
git push origin --delete master // 删除远程master分支
```


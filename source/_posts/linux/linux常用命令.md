---
title:         linux常用命令 # 标题
description:   linux的常用的一些命令 # 副标题
date:          2017-04-01 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Linux
---


Linux常用命令
```bash
根目录表示： pm@pm-pc:/$
主文件目录表示： pm@pm-pc:~$
超级用户主目录表示：root@pm-pc:~# （输入sudo -i 可以切换到root权限，按ctrl+d 可退出root权限）


cd    改变目录
# cd home 或 cd /home    查找home目录并定位
# cd home/pm    查找home目录下的pm目录并定位
# cd ~    回到用户目录
# cd ..    返回上一级
# cd ../..    返回上两级


ls    查看文件详情
# ls -a    列出文件下的所有文件
# ls -l    列出文件的详细信息
# ls -al    列出文件下的所有文件的详细信息
# ls -s    在每个文件的后面打印出文件大小
# ls -t    按时间进行排序
# ls -R    将目录下的所有子目录都列出来
# ls -S    以文件大小进行排序
# ls -L    列出文件的Link链接
# 注意大小写参数的区别


cp    复制（将前面的文件复制到后面的文件中，若最后的文件不存在，则报错，加-R复制目录）
# cp file1 file2    将文件file1复制到文件file2
# cp file1 file2 file3    将文件file1和file2复制到文件file3
# cp -i file1 file2    采用交互方式将文件file1复制到文件file2
# cp -f file1 file2    因file2已存在所以强制将文件file1复制到文件file2
# cp -R dir1 dir2    将目录dir1复制到dir2中
# cp -R file1 file2 dir1 dir2     将fiel1、file2、目录dir1复制到dir2中


mv    移动或重命名（将前面的文件移动到后面的文件中）
# mv test.log test1.txt     将文件test.log重命名为test1.txt（因为都是文件而不是文件夹，所以只能改名不能移动）
# mv test1.txt file1    将文件test1.txt移动到fiel1文件夹中
# mv log1.text log2.text log3.text file1    将文件og1.text、log2.text、log3.text都移动到file1文件夹中
# mv -i file1 file2    将file1文件夹移动到file2文件夹中，如果存在，则询问
# mv -f file1 file2    将file1文件夹移动到file2文件夹中，即使存在，也会直接覆盖
# mv -u file1 file2    将file1文件夹移动到file2文件夹中，如果存在，当源文件file1更新时，才会更新
# mv dir1 dir2    将dir1目录移动到dir2目录中，如果dir2不存在，则为重命名
# mv * ../    移动当前文件夹下的所有文件到上一级目录
# mv log1.txt -b log2.txt    加-b表示文件在覆盖前做简单备份


mkdir    创建文件夹（必须增加sudo 最高权限）
# sudo mkdir aa    在当前文件夹下创建文件夹aa
# sudo mkdir aa/bbb/cccc    创建该目录下的文件夹cccc


touch    创建文件 （必须增加sudo 最高权限）
# sudo touch aa.txt    在当前目录下创建文件aa.txt
# sudo touch aa/bbb/cccc.txt    创建该目录下的文件cccc.txt


rm    删除文件或文件夹 （必须增加sudo 最高权限，删除文件必须加-rf）
# sudo rm aa.js    删除当前目录下的aa.js
# sudo rm aa/bbb/cccc.js    删除该目录下的文件cccc.js
# sudo rm -f aa.js    强制删除当前目录下的aa.js
# sudo rm -f aa/bbb/cccc.js   强制 删除该目录下的文件cccc.js
# sudo rm -i aa.js    先询问再删除当前目录下的aa.js
# sudo rm -i aa/bbb/cccc.js   先询问再删除该目录下的文件cccc.js
# sudo rm -rf aa    删除当前目录下的文件aa
# sudo rm -rf aa/bbb/cccc    删除该目录下的文件cccc


pwd    查看完整路径
# pwd


apt-get    安装文件（每种系统的命令不一致，Ubuntu的命令为apt-get，最高权限sudo安装）
# sudo apt-get install **


ifconfig     查看IP地址（不能再超级用户root下查找）
# ifconfig 查找所有ip信息
# ifconfig | grep 192  使用grep快速查找处192的信息


grep    管道符过滤
# ifconfig | grep 192   查找打印ip地址
# grep word file_name    打印file_name文件中的word字符串所在的一行
# grep -i Word file_name    打印file_name文件中的Word或word（不区分大小写）字符串所在的一行
# grep -c wordfile_name   打印file_name文件中word字符串的个数
# grep -n wordfile_name   打印file_name文件中word字符串所在的一行并列出行数
# grep -w word file_name   打印file_name文件中word字符串（只匹配整个单词，不匹配字符串的一部分，如word_name不算）所在的一行并列出行数
# grep word file_name --color   打印file_name文件中的word字符串所在的一行并给***高亮


ssh    通过ip地址访问局域网电脑
ssh pm@192.168.20.133  （通过ip连接系统）
12****  （电脑密码）

杀死进程：
# ps -ef | grep node    # 查看node进程是否存在，-e表示显示所有进程，-f表示全格式，-ef表示两者
# 找到被占用进程，查找第二个参数id号，假定为10001
# kill -9 10001    # 杀死

解除端口占用
1.查找被占用的端口
# netstat -tln
# netstat -tln | grep 80
2.查看端口属于哪个程序
# lsof -i :80
3.杀死端口被占用的进程
# kill -9 进程id

查看系统软件状态
# service *** status

系统软件重启
# service *** restart

清空终端
# Ctrl + L

更改主机名
#  vim /etc/hosts     查看
#  sudo vim /etc/hosts    修改        
# 如：输入127.0.0.1  hongbaocloud.com 保存修改并退出后，原先访问的127.0.0.1或localhost就可以改为hongbaocloud.com访问了           
# 注：vim编辑器只是其中一个选择，也可以选择其他的编辑器（如subl或atom）打开文件并修改配置
```

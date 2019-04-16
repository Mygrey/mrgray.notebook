################################################################################################################
##############
##############        linux-note
##############
################################################################################################################

note0="shell注意感叹号等于字符、变量之间的空格。"

#vim查找和替换
 :%s/from/to/g   ：  对所有行的内容进行替换。

#查看服务状态和日志
 systemctl status nginx.service
 journalctl -xe

#查看每个文件占用的磁盘空间
du -sch /var/*

#docker运行镜像：
docker run -it  --name tensorflow1.0 -v /home/docker/data/tensorflow/notebooks:/notebooks -p 7777:8888 tensorflow/tensorflow
#7777端口在8888端口占用情况下使用，进行映射
token=3e75c4a6d8d8dbf34a0932c7fe2aa5058acebc353e419c07
#token用于登录，启动时注意查看。
docker search python3.4 搜索镜像

通过name删除镜像
[kass@localhost ~]$ sudo docker rmi docker.io/ubuntu
docker pull    获取镜像
docker start 已经停止的容器id

docker rm -f 容器id

docker exec -it f883cb5a8cf1 /bin/bash 进入正在运行的容器
exit 退出但不停止容器
docker stop停止容器
jupyter-notebook list获取token，重新设置密码。
请按Ctrl+P+Q进行退出容器


uname -a查看内核版本

可以使用：ps -fe|grep filename， 
也可以使用：fuser filename查看 
然后可以看这个进程跟哪里东西有关联，使用了哪些端口 
只查看该进程：ps -ef | grep ID 
查看该进程打开的文件：lsof -p ID 
查看内存分配：lcat /proc/ID/maps 
查看堆栈：pstack 11ID 
查看发出的系统调用:strace -p ID 
查看调用库函数:ltrace -p ID

################################################################################################################
##############
##############        idea-note
##############
################################################################################################################
#IDEA 网络https改为http
找到settings->system settings->updata下面的Use secure Connetion去掉。

idea 注释：/**+回车
ctrl+alt+t  快速增加try
alt+insert  快速get/set

spring中ClassPathXmlApplicationContext读取路径是project structure-->modules里面配置
的 resources folds

#添加一个Spring Bean的配置文件（xml）
在src/main/resource/目录中点击右键，New->XML Configure file->Spring Config，

#idea创建子工程：
在父工程上右键点击new Module,依次点击maven，同样不要勾选“create from archetype”

#idea快捷键：
今天偶然发现了IntelliJ中 创建main函数的快捷键，依次还有for循环，System.out.println();

在编写代码的时候直接输入psv就会看到一个psvm的提示，此时点击tab键一个main方法就写好了。

psvm 也就是public static void main的首字母。
依次还有在方法体内键入for会有一个fori的提示，选中然后tab键，就会自动创建一个for循环。
如何像写一个System.out.println();就是sout
更多的提示可以CTRL + j 可以查看(前提是你用的默认的keymap模板)，mac系统下是command＋j。


#idea maven 依赖树，解决包冲突：
ctrl+alt+shift+U
图中的红色实线就算是冲突的，可以入上图那样，右键，排除，他就自动在pom文件里面给exclud啦。
还有一种是虚线的红线。
这种虚线，告诉你同一个jar都在哪里被多次引用了。



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

docker start 已经停止的容器id
docker exec -it f883cb5a8cf1 /bin/bash 进入正在运行的容器
exit 退出但不停止容器
docker stop停止容器
jupyter-notebook list获取token，重新设置密码。


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
################################################################################################################
##############
##############        quick_key_map-note
##############
################################################################################################################
Python PEP8 Autoformat，快捷键Ctrl+Shift+R
#sqlbeautiful插件
sql格式化 ctrl+k  然后ctrl+f

################################################################################################################
##############
##############        hive-note
##############
################################################################################################################
#hive从本地文件导入数据
load data infile '/home/ljj/data/v_jg_veh_lock.csv' into table v_jg_veh_lock fields terminated by ',' optionally enclosed by '"' escaped by '"'  lines terminated by '\r\n';
#beeline以hdfs用户建立连接
beeline -n hdfs -u jdbc:hive2://localhost:10000

#hive msck命令报错，HIVE Execution Error, return code 1 from org.apache.hadoop.hive.ql.exec.DDLTask
set hive.msck.path.validation=ignore;
MSCK REPAIR TABLE table_name;

#时间格式处理
 select from_unixtime(unix_timestamp(cclzrq,'dd/MM/yyyy HH:mm:ss'),'yyyy-MM-dd HH:mm:ss') from v_jg_drivinglicense limit 10;

#hive导出数据并替换分隔符
 hive -e "select score,count(0) from traffic.t_score_info group by score" | sed 's/\t/,/g'> ./data_m.csv
hive -e "select * from pms.pms_algorithm_desc" | sed 's/\t/,/g' > ./aaa.txt

#hive替换
 select  cast(substring(regexp_replace('2016-06-05 00:00:00.0', '-', ''),1,8) as int);

#hive正则：
regexp
rlike

#hdfs清空回收站
hdfs dfs -expunge
不一定清的掉，hdfs dfs -du -h /查看每个文件占用的磁盘空间

#impala连接
impala：connect 10.1.40.105:21000
################################################################################################################
##############
##############        mysql-note
##############
################################################################################################################


#mysql将表导出为sql文件
mysqldump -h 10.1.80.6 -uroot -pbigDataTeam traffic zc_level_result > level.sql

#mysql导出数据到文件，目录需指定为mysql设置的安全目录
mysql> SELECT * FROM tablename INTO OUTFILE 'target_file' [option];

其中 option 参数可以是以下选项：

命令参数	说明
fields terminated by '字符'	字段分隔符，默认字符为制表符'\t'
fields [optionally] enclosed by '单字符'	字段引用符，加上optionally后在数字类型上不会有引用符号
fields escaped by '单字符'	转义字符，默认为'\'
lines starting by '字符'	每行前都加此支付，默认为空
lines terminated by '字符'	行结束符，默认为'\n'


在安装mysql5.7版本时，经常会遇到mysql -u root -p直接回车登陆不上的情况，原因在于5.7版本在安装时自动给了一个随机密码，坑爹的是在init步骤的时候不像linux系统会给出命令行提示，需要手动在mysql目录下搜索*.err，以文本形式打开才能看到如下内容：

016-02-25T15:09:43.033062Z 1 [Note] A temporary password is generated for root@localhost: >mso<k70mrWe

红色字母即为第一次的登陆密码，记得加双引号。

ALTER USER 'root'@'localhost' IDENTIFIED BY '新密码';


################################################################################################################
##############
##############        sqoop-note
##############
################################################################################################################

sqoop import --connect jdbc:mysql://10.1.40.104:3306/test?characterEncoding=utf-8 --username root --password root --query 'select jszh,zjcx,syxz,wfsj,wfxw,wfjfs,fkje,znj,pzbh,jsjqbj,sgdj,nl,xb from v_jg_vio_violation where $CONDITIONS'  --num-mappers 1 --target-dir /home/hdfs/data/traffic/v_jg_vio_violation --delete-target-dir --fields-terminated-by ','


sqoop import --connect jdbc:mysql://10.1.40.104:3306/test?characterEncoding=utf-8 --username root --password root --query 'select SFZMHM,CCLZRQ,LJJF,BZCS,ZT,RYZT,SXBJ from v_jg_drivinglicense where $CONDITIONS'  --num-mappers 1 --target-dir /home/hdfs/data/traffic/v_jg_drivinglicense --delete-target-dir --fields-terminated-by ','


sqoop import --connect jdbc:mysql://10.1.40.104:3306/test?characterEncoding=utf-8 --username root --password root --query 'select code,jb from v_jg_wf_info where $CONDITIONS'  --num-mappers 1 --target-dir /home/hdfs/data/traffic/v_jg_wf_info --delete-target-dir --fields-terminated-by ','


sqoop import --connect jdbc:mysql://10.1.40.104:3306/test?characterEncoding=utf-8 --username root --password root --query 'select SGBH,SGFSSJ,SWRS30,SZRS,ZSRS,QSRS,ZJCCSS,SFTY from v_jg_acd_file where $CONDITIONS'  --num-mappers 1 --target-dir /home/hdfs/data/traffic/v_jg_acd_file --delete-target-dir --fields-terminated-by ','

sqoop import --connect jdbc:mysql://10.1.40.104:3306/test?characterEncoding=utf-8 --username root --password root --query 'select SGBH,SFDSR,SFZMHM,SFTY,SWSJ,SGZR,XYJJHL,SFCZ from v_jg_acd_filehuman where $CONDITIONS'  --num-mappers 1 --target-dir /home/hdfs/data/traffic/v_jg_acd_filehuman --delete-target-dir --fields-terminated-by ','


sqoop export --connect jdbc:mysql://10.1.80.6:3306/traffic?characterEncoding=utf-8 --username root --password bigDataTeam --table zc_driver_train --input-fields-terminated-by ","  --export-dir /home/hdfs/data/traffic/zc_driver_train


sqoop export --connect jdbc:mysql://10.1.80.6:3306/traffic?characterEncoding=utf-8 --username root --password bigDataTeam --table zc_driver_matrix --input-fields-terminated-by ","  --export-dir /home/hdfs/data/traffic/zc_driver_matrix

sqoop export --connect jdbc:mysql://10.1.80.6:3306/traffic?characterEncoding=utf-8 --username root --password bigDataTeam --table zc_feature_woe --input-fields-terminated-by ","  --export-dir /home/hdfs/data/traffic/zc_feature_woe


sqoop import --connect jdbc:mysql://10.1.80.6:3306/traffic?characterEncoding=utf-8 --username root --password bigDataTeam --query 'select sfzhm,jf,jb from t_elec_credit_info where $CONDITIONS'  --num-mappers 1 --target-dir /home/hdfs/data/traffic/t_elec_credit_info --delete-target-dir --fields-terminated-by ','

sqoop export --connect jdbc:mysql://10.1.80.6:3306/traffic?characterEncoding=utf-8 --username root --password bigDataTeam --table zc_black_table --input-fields-terminated-by ","  --export-dir /home/hdfs/data/traffic/zc_black_table

sqoop export --connect jdbc:mysql://10.1.80.6:3306/traffic?characterEncoding=utf-8 --username root --password bigDataTeam --table t_score_info --input-fields-terminated-by ","  --export-dir /home/hdfs/data/traffic/t_score_info


 sqoop export --connect jdbc:mysql://172.16.25.4:3306/test?characterEncoding=utf-8 --username root --password 123456 --table t_elec_credit_info --update-key "id" --update-mode allowinsert  --input-fields-terminated-by ","  --export-dir /home/hdfs/data/traffic/t_elec_credit_info

环境hive到MySQL：
 sqoop export --connect jdbc:mysql://172.16.25.18:3306/zc_elec?characterEncoding=utf-8 --username zcelec --password zcelec --table t_elec_credit_info --update-key "id" --update-mode allowinsert  --input-fields-terminated-by ","  --export-dir /home/hdfs/data/traffic/t_elec_credit_info





 ################################################################################################################
##############
##############        windows-note
##############
################################################################################################################
#屏保保存地址：
path=C:\Users\root\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets


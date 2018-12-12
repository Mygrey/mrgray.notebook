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



#!/bin/bash
#################################
#author:   ljj
#version:  1.0                              
#date:     2018-08
################################

function show(){
echo "
-r:  重跑标识,1为重跑,0为非重跑
-i:  insert_time,上次任务执行时间,非重跑输入当前时间,格式为2018-01-01
-p:  数据分区时间,格式为20180101
-f:  日表,周表,月表标识位,0为日表,1为周表,2为月表
-h:  帮助信息
"
}

while getopts ":r:i:p:f:h" opt
do
   case $opt in
        r ) rerun_flag=$OPTARG;;
        i ) rerun_time=$OPTARG;;
        p ) partition_time=$OPTARG;;
        f ) table_flag=$OPTARG;;
        h ) echo "help"
            show;;
        ? ) echo "erro!"
            exit 1;;
   esac
done

if [ $table_flag == 0 ];then
status_file_path_1="/home/hdfs/status/subject_one/transfrom/"
table_list="t_exam_info,t_examinee_apply"
elif [ $table_flag == 1 ];then
status_file_path_1="/home/hdfs/status/subject_one/transfrom_1/"
table_list="t_exam_order_week_number,t_exam_order_week_pass,t_exam_week_number,t_exam_week_pass,t_seat_week_pass"
else
status_file_path_1="/home/hdfs/status/subject_one/transfrom_2/"
table_list="t_exam_month_number,t_exam_month_pass,t_exam_order_month_number,t_exam_order_month_pass,t_seat_month_pass"
fi

ip=10.1.40.237
port=3306
mysql_user="root"
mysql_password="123456"
db_name="communication_gateway"
status_file_path_2="/home/hdfs/status/subject_one/load/"
logpath="/tmp/data_synchronize_mysql"
failed_table_list=""
success_table_list=""
logfile="$logpath/data_synchronize_mysql.log"
task_time=`date "+%Y%m%d"`
bak_time=`date "+%Y%m%d%H%M"`
status_file_read="${status_file_path_1}${task_time}_STATUS"
read_bak="${status_file_read}_SUCCESS"
rerun_status_file_read="${status_file_path_1}${rerun_time//-/}_STATUS_SUCCESS"
status_file_write="${status_file_path_2}${task_time}_STATUS"
status_file_bak="${status_file_write}_BAK_$bak_time"
root_dir="/home/hdfs/data/"
my_status_info="$logpath/${task_time}_STATUS"

echo "
#################任务开始#################
时间：$bak_time
#################任务开始#################
"

echo "
#################参数列表#################
table_list:  $table_list
logfile:  $logfile
status_file_read:  $status_file_read
read_bak:  $read_bak
rerun_status_file_read:  $rerun_status_file_read
status_file_write:  $status_file_write
status_file_bak:  $status_file_bak
my_status_info:  $my_status_info
#################参数列表#################
"

#判断日志文件路径是否存在,不存在则创建
if [ ! -d $logpath ]; then
mkdir $logpath
fi

rm -f $my_status_info

function print_log(){
local log_info=$1
local log_file=$2
echo -e $log_info
echo -e $log_info >> $log_file
}


print_log "*******************数据同步开始********************" $logfile


print_log "**************任务时间: $task_time*****************" $logfile


if [ "$rerun_flag" == "1" ]; then
status_info_file=$rerun_status_file_read
else
status_info_file=$status_file_read
fi

#读取状态文件
status_info=`hadoop fs -cat $status_info_file|head -n 3 | while read line
do
if [ -n "$line" ]; then
echo $line
break
fi
done`

status_arr=(${status_info//|/ })
load_time=${status_arr[0]}
is_success=${status_arr[2]}
is_rerun=${status_arr[3]}
insert_time=${status_arr[4]}

opt_list_str="\n*******************参数列表********************\n手动重跑参数rerun_flag:    $rerun_flag \n手动重跑参数rerun_time:    $rerun_time \n任务时间：                 $task_time \n状态文件(读取):            $status_info_file \n状态文件(写入):            $status_file_write \n*****************状态文件信息****************** \n数据分区时间:              $load_time \n前任务是否成功:            $is_success \n是否重跑:                  $is_rerun \n数据insert_time:           $insert_time \n**********************************************"


print_log "$opt_list_str" $logfile

#判断之前的任务是否成功
if [ ! $is_success -eq 0 ]; then
print_log "***************前任务失败，程序退出****************" $logfile
exit 1
else
print_log "*************前任务成功，同步开始执行**************" $logfile 
fi

#sqoop 函数定义
function SQOOP_TABLE(){

local rerun_opt=$1
local time_stemp=$2
local load_time_value=$3

tables=${table_list//,/ }
for task in ${tables}
do
#定义MySQL语句，用于删除mysql上旧的数据
if [ $rerun_opt -eq 1 ]; then
rerun_sql="delete from $task where insert_time like '%$time_stemp%'; "
else
rerun_sql=""
fi



print_log "**************开始同步表 $task**************" $logfile
data_dir="$root_dir$task/load_time=$load_time_value"
print_log "director:$data_dir" $logfile
temp_table="${task}_temp"

#创建临时表，同事删除旧数据
mysql -h 10.1.40.237 -u root -p123456 <<EOF
use $db_name;
create table $temp_table like $task;
$rerun_sql
exit
EOF

/usr/bin/sqoop export --connect jdbc:mysql://$ip:$port/$db_name?characterEncoding=utf-8 --username $mysql_user --password $mysql_password --table $task --staging-table $temp_table --clear-staging-table --input-fields-terminated-by '|' --export-dir $data_dir

#判断表同步结果
if [ $? -eq 0 ];then
print_log "**********TABLE $task SYCHRONIZE  SUCCESSED!********" $logfile
echo "$load_time|$task|0|$rerun_opt|$time_stemp" >> $my_status_info
success_table_list="$success_table_list$task,"
else
print_log "******ERROR:TABLE $task SYCHRONIZE  FAILED!********" $logfile
echo "$load_time|$task|1|$rerun_opt|$time_stemp" >> $my_status_info
failed_table_list="$failed_table_list$task,"
fi

#删除临时表
mysql -h 10.1.40.237 -u root -p123456 <<EOF
use $db_name;
drop table $temp_table;
exit
EOF

done

print_log "*****************      同步完成   *****************" $logfile

}

new_insert_time=`date +%Y-%m-%d`

if [ "$rerun_flag" == "1" ]; then
SQOOP_TABLE 1 $rerun_time $partition_time
elif [ "$rerun_flag" == "0" ]; then
SQOOP_TABLE 0 $rerun_time $partition_time
elif [ $is_rerun -eq 1 ]; then
SQOOP_TABLE 1 $insert_time $load_time
else
SQOOP_TABLE 0 $new_insert_time $load_time
fi

#状态文件重命名，创建和删除
if [ "$rerun_flag" == "1" || "$rerun_flag" == "0" ]; then
echo "-"
else
hdfs dfs -rm -f $read_bak
hdfs dfs -cp $status_file_read $read_bak
hdfs dfs -rm -f $status_file_read
fi

hdfs dfs -cp $status_file_write $status_file_bak
hdfs dfs -rm -f $status_file_write
hdfs dfs -put $my_status_info $status_file_path_2

print_log "*****************SHELL FINISHED! *******************" $logfile

success_table_list=${success_table_list::-1}
failed_table_list=${failed_table_list::-1}
success_table_list=${success_table_list//,/\\n}
failed_table_list=${failed_table_list//,/\\n}


table_result_info="\n***********************表格同步结果******************************\n成功表格：\n$success_table_list\n****************************************************************\n失败表格：\n$failed_table_list\n****************************************************************"

print_log "$table_result_info" $logfile

exit 0

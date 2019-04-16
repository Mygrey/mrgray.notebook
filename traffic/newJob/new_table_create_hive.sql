drop table if exists t_acd_one;
create table t_acd_one(
sfzh  string,
acd_count  int,
score  int,
qbzr_1  int,
qbzr_2  int,
qbzr_3  int,
zyzr_1  int,
zyzr_2  int,
zyzr_3  int,
tdzr_1  int,
tdzr_2  int,
tdzr_3  int,
cyzr_1  int,
cyzr_2  int,
cyzr_3  int
)ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'=',',                               
   'serialization.format'=',')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/t_acd_one';

drop table if exists t_acd_two;
create table t_acd_two(
sfzh  string,
acd_count  int,
score  int,
qbzr_1  int,
qbzr_2  int,
qbzr_3  int,
zyzr_1  int,
zyzr_2  int,
zyzr_3  int,
tdzr_1  int,
tdzr_2  int,
tdzr_3  int,
cyzr_1  int,
cyzr_2  int,
cyzr_3  int
)ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'=',',                               
   'serialization.format'=',')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/t_acd_two';

drop table if exists t_acd_three;
create table t_acd_three(
sfzh  string,
acd_count  int,
score  int,
qbzr_1  int,
qbzr_2  int,
qbzr_3  int,
zyzr_1  int,
zyzr_2  int,
zyzr_3  int,
tdzr_1  int,
tdzr_2  int,
tdzr_3  int,
cyzr_1  int,
cyzr_2  int,
cyzr_3  int
)ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'=',',                               
   'serialization.format'=',')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/t_acd_three';

drop table if exists t_vio_info;
create table t_vio_info(
sfzh  string,
score  int,
level1_count  int,
level2_count   int,
level3_count  int
)ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'=',',                               
   'serialization.format'=',')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/t_vio_info';

drop table if exists t_score_info;
create table t_score_info(
sfzh  string,
last_month  int,
acd_one   int,
acd_two   int,
acd_three   int,
vio_score   int,
acd_add    int,
black_mark  int,
score   double
)ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'=',',                               
   'serialization.format'=',')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/t_score_info';

drop table if exists zc_black_table;
create table zc_black_table(
sfzh  string,
black_mark  int
)ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'=',',                               
   'serialization.format'=',')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/zc_black_table';

/*
create table t_kckp_score(
sfzh  string,
score   double
)ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'=',',                               
   'serialization.format'=',')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/t_kckp_score';


drop table if exists t_elec_credit_info;
create table t_elec_credit_info(
id  int,
sfzhm  string,
jf    string,
jb   string,
insert_time  string
)ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'=',',                               
   'serialization.format'=',')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/t_elec_credit_info';

*/

create table t_test(
n1  string,
n2   string,
n3  string,
n4  string,
n5   string,
n6  string,
n7  string,
n8   string
)ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'=',',                               
   'serialization.format'=',')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/t_test';



create table t_score_info(
sfzh  varchar(30),
last_month  int,
acd_one   int,
acd_two   int,
acd_three   int,
vio_score   int,
kckp_score   double,
acd_add    int,
black_mark  int,
score   double
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

create table t_level_result(
sfzh    varchar(50),
score   double,
level   tinyint
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

create table zc_black_table(
sfzh  varchar(30),
black_mark  int
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
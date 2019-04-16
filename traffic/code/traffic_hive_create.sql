
create table v_jg_vio_violation(
jszh   string,
zjcx   string,
syxz   string,
wfsj   string,
wfxw   string,
wfjfs   string,
fkje   string,
znj     string,
pzbh    string,
jsjqbj    string,
sgdj    string,
nl      string,
xb      string
)
ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'=',',                               
   'serialization.format'=',')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/v_jg_vio_violation';
/**
create table v_jg_vio_violation(
jszh   string,
zjcx   string,
syxz   string,
wfsj   string,
wfxw   string,
wfjfs   string,
fkje   string,
znj     string,
pzbh    string,
jsjqbj    string,
sgdj    string,
nl      string,
xb      string
)
ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'='^',                               
   'serialization.format'='^')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/v_jg_vio_violation';

**/
create table t_jg_drivinglicense(
SFZMHM  string,
CCLZRQ  string,
LJJF  string,
BZCS  string,
ZT    string,
RYZT  string,
SXBJ  string,
ccfzjg  string
)
ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'=',',                               
   'serialization.format'=',')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/t_jg_drivinglicense';
/*
create table v_jg_drivinglicense(
DABH    string,
SFZMHM    string,
ZJCX    string,
YZJCX    string,
QFRQ    string,
SYRQ    string,
CCLZRQ    string,
CCFZJG    string,
JZQX    string,
YXQS    string,
YXQZ    string,
LJJF    string,
CFRQ    string,
XXTZRQ    string,
BZCS    string,
ZT    string,
LY    string,
JXMC    string,
JLY    string,
XZQH    string,
XZQJ    string,
FZRQ    string,
JBR    string,
GLBM    string,
FZJG    string,
GXSJ    string,
LSH    string,
XGZL    string,
BZ    string,
JYW    string,
YDABH    string,
SQDM    string,
ZXBH    string,
XH    string,
SFZMMC    string,
HMCD    string,
XM    string,
XB    string,
CSRQ    string,
GJ    string,
DJZSXZQH    string,
DJZSXXDZ    string,
LXZSXZQH    string,
LXZSXXDZ    string,
LXZSYZBM    string,
LXDH    string,
SJHM    string,
DZYX    string,
ZZZM    string,
ZZFZJG    string,
ZZFZRQ    string,
SFBD    string,
DWBH    string,
SYYXQZ    string,
XCZG    string,
XCZJCX    string,
RYZT    string,
SXBJ    string,
XZCRQ    string,
SXQKSBJ    string
)
ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'='^',                               
   'serialization.format'='^')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/v_jg_drivinglicense';




 */

create table v_jg_vio_violation(
WFBH   string,
JDSLB   string,
JDSBH   string,
WSJYW   string,
RYFL   string,
JSZH   string,
DABH   string,
FZJG   string,
ZJCX   string,
DSR   string,
ZSXZQH   string,
ZSXXDZ   string,
DH   string,
LXFS   string,
CLFL   string,
HPZL   string,
HPHM   string,
JDCSYR   string,
SYXZ   string,
JTFS   string,
WFSJ   string,
XZQH   string,
DLLX   string,
GLXZDJ   string,
WFDD   string,
LDDM   string,
DDMS   string,
DDJDWZ   string,
WFDZ   string,
WFXW   string,
WFJFS   string,
FKJE   string,
SCZ   string,
BZZ   string,
ZNJ   string,
ZQMJ   string,
JKFS   string,
FXJG   string,
FXJGMC   string,
CLJG   string,
CLJGMC   string,
CFZL   string,
CLSJ   string,
JKBJ   string,
JKRQ   string,
PZBH   string,
JSJQBJ   string,
JLLX   string,
LRR   string,
LRSJ   string,
JBR1   string,
JBR2   string,
SGDJ   string,
CLDXBJ   string,
JDCCLDXBJ   string,
ZDJLBJ   string,
XXLY   string,
XRMS   string,
DKBJ   string,
JMZNJBJ   string,
ZDBJ   string,
JSJG   string,
FSJG   string,
GXSJ   string,
BZ   string,
YWJYW   string,
ZJMC   string,
CCLZRQ   string,
NL   string,
XB   string,
HCBJ   string,
JD   string,
WD   string,
YLZZ1   string,
YLZZ2   string,
YLZZ3   string,
YLZZ4   string,
YLZZ5   string,
YLZZ6   string,
YLZZ7   string,
YLZZ8   string,
CJFS   string,
WFSJ1   string,
WFDD1   string,
LDDM1   string,
DDMS1   string,
JSRXZ   string,
CLYT   string,
XCFW   string,
DZZB   string,
SFZDRY   string,
XYSFZMHM   string,
XYXM   string,
YLZZ11   string,
YLZZ12   string,
YLZZ13   string,
YLZZ14   string,
YLZZ15   string,
YLZZ16   string,
YLZZ17   string,
YLZZ18   string
)ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'='^',                               
   'serialization.format'='^')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/v_jg_vio_violation';


create table kckp_accidentinfo(
ACCIDENTINFOID   string,
DRIVER1INFOID   string,
DRIVER2INFOID   string,
ACCIDENTTIME   string,
ACCIDENTADDR   string,
ACCEPTTIME   string,
FINISHTIME   string,
USERID   string,
STATUS   string,
DRIVER1FAULT   string,
DRIVER2FAULT   string,
DRIVER1RESPONSIBILITY   string,
DRIVER2RESPONSIBILITY   string,
DRIVER3INFOID   string,
DRIVER3FAULT   string,
DRIVER3RESPONSIBILITY   string
)ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'='^',                               
   'serialization.format'='^')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/kckp_accidentinfo';

create table kckp_users(
USERID   string,
USERNAME   string,
USERTEL   string,
LOGINNAME   string,
STATUS   string,
ORDERNUMBER   string,
CREATEDATE   string
)ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'='^',                               
   'serialization.format'='^')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/kckp_users';

create table kckp_driverinfo(
driverinfoid    string,
drivername  string,
sex   string,
drivinglicense   string,
PLATENUMBER    string,
CARMODELS    string,
CARCOLOR   string,
CREATETIME    string
)ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'='^',                               
   'serialization.format'='^')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/kckp_driverinfo';


create table v_jg_wf_info(
code  string,
level  int
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
   '/home/hdfs/data/traffic/v_jg_wf_info';


create table zc_violation_info(
jszh   string,
max_wfxw   int,
level1_count   int,
level2_count   int,
level3_count   int,
wfxw_count    int,
max_wfjfs     int,
avg_wfjfs    float,
wfjfs_count  int,
max_fkje   int,
avg_fkje   double,
fkje_count  int,
max_znj   double,
avg_znj   double,
znj_count double,
qzcs   int,
cqts    int
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
   '/home/hdfs/data/traffic/zc_violation_info';


create table zc_driver_vio(
sfzh   string,
jl    int,
zt   int,
ryzt   int,
max_wfxw   int,
level1_count   int,
level2_count   int,
level3_count   int,
wfxw_count    int,
max_wfjfs     int,
avg_wfjfs    float,
wfjfs_count  int,
max_fkje   int,
avg_fkje   double,
fkje_count  int,
max_znj   double,
avg_znj   double,
znj_count double,
qzcs   int,
cqts    int
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
   '/home/hdfs/data/traffic/zc_driver_vio';

drop table if exists v_jg_acd_file;
create table v_jg_acd_file(
sgbh   string,
xzqh   string,
djbh   string,
kskcsj   string,
jskcsj   string,
xq   string,
sgfssj   string,
lh   string,
lm   string,
gls   string,
ms   string,
qdms   string,
jdwz   string,
sgdd   string,
zhdmwz   string,
zyglss   string,
dlaqsx   string,
jtxhfs   string,
fhsslx   string,
dlwlgl   string,
lmzk   string,
lbqk   string,
lmjg   string,
lkldlx   string,
dlxx   string,
dllx   string,
kcr1   string,
kcr2   string,
bar1   string,
bar2   string,
swrs   string,
swrsq   string,
swrs24   string,
ssrs24   string,
swrs3   string,
ssrs3   string,
swrs7   string,
ssrs7   string,
swrs30   string,
ssrs30   string,
szrs   string,
zsrs   string,
qsrs   string,
ssrs   string,
jdcsl   string,
fjdcsl   string,
xrsl   string,
xsglbm   string,
xsbadw   string,
xsbar   string,
tpzs   string,
xctzs   string,
xczpzs   string,
zjccss   string,
sglx   string,
lwsglx   string,
ccyyfl   string,
rdyyfl   string,
sgccyy   string,
sgrdyy   string,
jyaq   string,
tq   string,
njd   string,
xc   string,
swsg   string,
sgxt   string,
sfty   string,
cljsg   string,
dcsg   string,
pzfs   string,
tysgzp   string,
tyzpsj   string,
dx   string,
zmtj   string,
tjr1   string,
tjr2   string,
yzwxp   string,
yzwxphg   string,
cclrsj   string,
jllx   string,
scsjd   string,
jbr   string,
tjsj   string,
gxsj   string,
sszd   string,
glxzdj   string,
dah   string,
jnh   string,
sxxz   string,
sb   string,
tjsgbh   string,
glbm   string,
ylzd1   string,
ylzd2   string,
ylzd3   string,
ylzd4   string,
ylzd5   string,
dzzb   string,
tdyl1   string,
tdyl2   string,
tdyl3   string,
tdyl4   string,
tdyl5   string,
tdyl6   string,
tdyl7   string,
tdyl8   string,
tdyl9   string,
tdyl10   string,
balxfs   string,
badw   string,
xyxdm   string,
jyw   string,
sfecsg   string,
sfdxsg   string,
dlaqyhdj   string,
dsrzs   string,
fsjg   string,
ffjg   string,
sdsgdscwz   string,
hlzt   string,
zblx   string,
ajmc   string
)ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'='^',                               
   'serialization.format'='^')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/v_jg_acd_file';


create table v_jg_acd_file(
SGBH  string,
SGFSSJ   string,
SWRS30   string,
SZRS    string,
ZSRS    string,
QSRS    string,
ZJCCSS   string,
SFTY     string
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
   '/home/hdfs/data/traffic/v_jg_acd_file';

drop table if exists v_jg_acd_filehuman;
create table v_jg_acd_filehuman(
sgbh    string,
xzqh    string,
rybh    string,
sfdsr    string,
dwgr    string,
xm    string,
xb    string,
sfzmhm    string,
nl    string,
csny    string,
mz    string,
gj    string,
whcd    string,
jg    string,
hjz    string,
zz    string,
dh    string,
rylx    string,
wgrlx    string,
dw    string,
sfty    string,
swsj    string,
shcd    string,
shcd24    string,
shcd3    string,
shcd7    string,
shcd30    string,
ssbw    string,
zsyy    string,
hkxz    string,
wfxw1    string,
wfxw2    string,
wfxw3    string,
zyysdw    string,
yzbm    string,
jtfs    string,
glxzqh    string,
dabh    string,
jl    string,
jszzl    string,
jsrlx    string,
zjcx    string,
cclzrq    string,
fzjg    string,
jxmc    string,
sgzr    string,
bx    string,
bxgs    string,
bxpzh    string,
xyjjhl    string,
xszt    string,
aqdtkqk    string,
xrzt    string,
xrsd    string,
pzjs    string,
clbsqdw    string,
clzxdzt    string,
clzmdzt    string,
claqqnzt    string,
hphm    string,
hpzl    string,
clfzjg    string,
clpp    string,
clxh    string,
syq    string,
jdcsyr    string,
clsyxz    string,
clsbdh    string,
fdjh    string,
jdcxh    string,
csys    string,
sfcz    string,
hzl    string,
szl    string,
cllx    string,
jdczt    string,
hpzl1    string,
hphm1    string,
cllx1    string,
clpp1    string,
clxh1    string,
hzl1    string,
szl1    string,
clhfzt    string,
claqzk    string,
glkylc    string,
glkyjyfs    string,
yzwxp    string,
wxpzl    string,
ysxk    string,
wxpcyzg    string,
yzwxphg    string,
czclbh    string,
ylzd1    string,
ylzd2    string,
ylzd3    string,
ylzd4    string,
ylzd5    string,
tdyl1    string,
tdyl2    string,
tdyl3    string,
tdyl4    string,
tdyl5    string,
tdyl6    string,
tdyl7    string,
tdyl8    string,
tdyl9    string,
tdyl10    string,
cjcxbj    string,
jyw    string,
fsjg    string,
ffjg    string,
clsyxzy    string,
ytsx    string,
sfxcfw    string,
xcjszg    string,
xdzt    string,
xyxm    string,
xysfzmhm    string,
sfgxqc    string,
sgzzkqnwz    string,
fydpyw    string,
hcsfzbfhzz    string,
hcywfgbs    string,
sfdtjk    string,
dtjksfzcyx    string,
ddzxcsfcb    string,
ddzxcsfyhp    string,
ddzxcjgtz    string,
ddzxcywbx    string,
rlzl    string,
xnyzl    string,
wfxw4    string,
wfxw5    string
)ROW FORMAT SERDE                                   
'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
WITH SERDEPROPERTIES (                             
   'field.delim'='^',                               
   'serialization.format'='^')                      
STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
LOCATION                                           
   '/home/hdfs/data/traffic/v_jg_acd_filehuman';

create table v_jg_acd_filehuman(
SGBH  string,
SFDSR   string,
SFZMHM  string,
SFTY    string,
SWSJ    string,
SGZR    string,
XYJJHL  string,
SFCZ    string
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
   '/home/hdfs/data/traffic/v_jg_acd_filehuman';


create table zc_acd_info(
sfzh   string,
sfty   int,
qbzr   int,
zyzr   int,
tdzr   int,
cyzr   int,
myzr   int,
wfrd   int,
swrs   int,
szrs   int,
zsrs   int,
qsrs   int,
zjccss  double
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
   '/home/hdfs/data/traffic/zc_acd_info';


create table zc_driver_feature(
sfzh   string,
jl    int,
zt   int,
ryzt   int,
max_wfxw   int,
level1_count   int,
level2_count   int,
level3_count   int,
wfxw_count    int,
max_wfjfs     int,
avg_wfjfs    float,
wfjfs_count  int,
max_fkje   int,
avg_fkje   double,
fkje_count  int,
max_znj   double,
avg_znj   double,
znj_count double,
qzcs   int,
cqts    int,
sfty   int,
qbzr   int,
zyzr   int,
tdzr   int,
cyzr   int,
myzr   int,
wfrd   int,
swrs   int,
szrs   int,
zsrs   int,
qsrs   int,
zjccss  double
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
   '/home/hdfs/data/traffic/zc_driver_feature';


create table zc_driver_matrix(
sfzh  string,
jl_1  tinyint,
jl_2  tinyint,
jl_3  tinyint,
jl_4  tinyint,
jl_5  tinyint,
zt_1  tinyint,
zt_2  tinyint,
zt_3  tinyint,
zt_4  tinyint,
ryzt_1  tinyint,
ryzt_2  tinyint,
wfxw_1  tinyint,
wfxw_2  tinyint,
wfxw_3  tinyint,
wfxw_4  tinyint,
level1_1  tinyint,
 level1_2  tinyint,
 level1_3  tinyint,
 level1_4  tinyint,
 level1_5  tinyint,
level1_6  tinyint,
level2_1  tinyint,
level2_2  tinyint,
level2_3  tinyint,
level2_4  tinyint,
level3_1  tinyint,
level3_2  tinyint,
level3_3  tinyint,
wfxwc_1  tinyint,
wfxwc_2  tinyint,
wfxwc_3  tinyint,
wfxwc_4  tinyint,
wfxwc_5  tinyint,
wfxwc_6  tinyint,
wfjfs_m1  tinyint,
wfjfs_m2  tinyint,
wfjfs_m3  tinyint,
wfjfs_a1  tinyint,
wfjfs_a2  tinyint,
wfjfs_a3  tinyint,
wfjfs_c1  tinyint,
wfjfs_c2  tinyint,
wfjfs_c3  tinyint,
wfjfs_c4  tinyint,
fkje_m1  tinyint,
fkje_m2  tinyint,
fkje_m3  tinyint,
fkje_m4  tinyint,
fkje_m5  tinyint,
fkje_m6  tinyint,
fkje_a1  tinyint,
fkje_a2  tinyint,
fkje_a3  tinyint,
fkje_a4  tinyint,
fkje_a5  tinyint,
fkje_a6  tinyint,
fkje_c1  tinyint,
fkje_c2  tinyint,
fkje_c3  tinyint,
fkje_c4  tinyint,
fkje_c5  tinyint,
znj_m1  tinyint,
znj_m2  tinyint,
znj_m3  tinyint,
znj_m4  tinyint,
znj_m5  tinyint,
znj_a1  tinyint,
znj_a2  tinyint,
znj_a3  tinyint,
znj_a4  tinyint,
znj_c1  tinyint,
znj_c2  tinyint,
znj_c3  tinyint,
znj_c4  tinyint,
znj_c5  tinyint,
qzcs_1  tinyint,
qzcs_2  tinyint,
qzcs_3  tinyint,
cqts_1  tinyint,
cqts_2  tinyint,
cqts_3  tinyint,
cqts_4  tinyint,
cqts_5  tinyint,
sfty_1  tinyint,
sfty_2  tinyint,
qbzr_1  tinyint,
qbzr_2  tinyint,
qbzr_3  tinyint,
zyzr_1  tinyint,
zyzr_2  tinyint,
zyzr_3  tinyint,
tdzr_1  tinyint,
tdzr_2  tinyint,
tdzr_3  tinyint,
cyzr_1  tinyint,
cyzr_2  tinyint,
cyzr_3  tinyint,
myzr_1  tinyint,
myzr_2  tinyint,
wfrd_1  tinyint,
wfrd_2  tinyint,
wfrd_3  tinyint,
swrs_1  tinyint,
swrs_2  tinyint,
szrs_1  tinyint,
szrs_2  tinyint,
zsrs_1  tinyint,
zsrs_2  tinyint,
zsrs_3  tinyint,
qsrs_1  tinyint,
qsrs_2  tinyint,
qsrs_3  tinyint,
qsrs_4  tinyint,
ccss_1  tinyint,
ccss_2  tinyint,
ccss_3  tinyint,
ccss_4  tinyint,
ccss_5  tinyint
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
   '/home/hdfs/data/traffic/zc_driver_matrix';

create table zc_driver_flag(
sfzh  string,
score float,
rank   int,
num   int,
level  tinyint,
label  tinyint
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
   '/home/hdfs/data/traffic/zc_driver_flag';



create table zc_driver_train(
sfzh   string,
jl    int,
zt   int,
ryzt   int,
max_wfxw   int,
level1_count   int,
level2_count   int,
level3_count   int,
wfxw_count    int,
max_wfjfs     int,
avg_wfjfs    float,
wfjfs_count  int,
max_fkje   int,
avg_fkje   double,
fkje_count  int,
max_znj   double,
avg_znj   double,
znj_count double,
qzcs   int,
cqts    int,
sfty   int,
qbzr   int,
zyzr   int,
tdzr   int,
cyzr   int,
myzr   int,
wfrd   int,
swrs   int,
szrs   int,
zsrs   int,
qsrs   int,
zjccss  double,
level  tinyint,
label  tinyint
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
   '/home/hdfs/data/traffic/zc_driver_train';


create table zc_feature_woe(
jl_1  decimal(10,5),
jl_2  decimal(10,5),
jl_3  decimal(10,5),
jl_4  decimal(10,5),
jl_5  decimal(10,5),
zt_1  decimal(10,5),
zt_2  decimal(10,5),
zt_3  decimal(10,5),
zt_4  decimal(10,5),
ryzt_1  decimal(10,5),
ryzt_2  decimal(10,5),
wfxw_1  decimal(10,5),
wfxw_2  decimal(10,5),
wfxw_3  decimal(10,5),
wfxw_4  decimal(10,5),
level1_1  decimal(10,5),
 level1_2  decimal(10,5),
 level1_3  decimal(10,5),
 level1_4  decimal(10,5),
 level1_5  decimal(10,5),
level1_6  decimal(10,5),
level2_1  decimal(10,5),
level2_2  decimal(10,5),
level2_3  decimal(10,5),
level2_4  decimal(10,5),
level3_1  decimal(10,5),
level3_2  decimal(10,5),
level3_3  decimal(10,5),
wfxwc_1  decimal(10,5),
wfxwc_2  decimal(10,5),
wfxwc_3  decimal(10,5),
wfxwc_4  decimal(10,5),
wfxwc_5  decimal(10,5),
wfxwc_6  decimal(10,5),
wfjfs_m1  decimal(10,5),
wfjfs_m2  decimal(10,5),
wfjfs_m3  decimal(10,5),
wfjfs_a1  decimal(10,5),
wfjfs_a2  decimal(10,5),
wfjfs_a3  decimal(10,5),
wfjfs_c1  decimal(10,5),
wfjfs_c2  decimal(10,5),
wfjfs_c3  decimal(10,5),
wfjfs_c4  decimal(10,5),
fkje_m1  decimal(10,5),
fkje_m2  decimal(10,5),
fkje_m3  decimal(10,5),
fkje_m4  decimal(10,5),
fkje_m5  decimal(10,5),
fkje_m6  decimal(10,5),
fkje_a1  decimal(10,5),
fkje_a2  decimal(10,5),
fkje_a3  decimal(10,5),
fkje_a4  decimal(10,5),
fkje_a5  decimal(10,5),
fkje_a6  decimal(10,5),
fkje_c1  decimal(10,5),
fkje_c2  decimal(10,5),
fkje_c3  decimal(10,5),
fkje_c4  decimal(10,5),
fkje_c5  decimal(10,5),
znj_m1  decimal(10,5),
znj_m2  decimal(10,5),
znj_m3  decimal(10,5),
znj_m4  decimal(10,5),
znj_m5  decimal(10,5),
znj_a1  decimal(10,5),
znj_a2  decimal(10,5),
znj_a3  decimal(10,5),
znj_a4  decimal(10,5),
znj_c1  decimal(10,5),
znj_c2  decimal(10,5),
znj_c3  decimal(10,5),
znj_c4  decimal(10,5),
znj_c5  decimal(10,5),
qzcs_1  decimal(10,5),
qzcs_2  decimal(10,5),
qzcs_3  decimal(10,5),
cqts_1  decimal(10,5),
cqts_2  decimal(10,5),
cqts_3  decimal(10,5),
cqts_4  decimal(10,5),
cqts_5  decimal(10,5),
sfty_1  decimal(10,5),
sfty_2  decimal(10,5),
qbzr_1  decimal(10,5),
qbzr_2  decimal(10,5),
qbzr_3  decimal(10,5),
zyzr_1  decimal(10,5),
zyzr_2  decimal(10,5),
zyzr_3  decimal(10,5),
tdzr_1  decimal(10,5),
tdzr_2  decimal(10,5),
tdzr_3  decimal(10,5),
cyzr_1  decimal(10,5),
cyzr_2  decimal(10,5),
cyzr_3  decimal(10,5),
myzr_1  decimal(10,5),
myzr_2  decimal(10,5),
wfrd_1  decimal(10,5),
wfrd_2  decimal(10,5),
wfrd_3  decimal(10,5),
swrs_1  decimal(10,5),
swrs_2  decimal(10,5),
szrs_1  decimal(10,5),
szrs_2  decimal(10,5),
zsrs_1  decimal(10,5),
zsrs_2  decimal(10,5),
zsrs_3  decimal(10,5),
qsrs_1  decimal(10,5),
qsrs_2  decimal(10,5),
qsrs_3  decimal(10,5),
qsrs_4  decimal(10,5),
ccss_1  decimal(10,5),
ccss_2  decimal(10,5),
ccss_3  decimal(10,5),
ccss_4  decimal(10,5),
ccss_5  decimal(10,5)
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
   '/home/hdfs/data/traffic/zc_feature_woe';


CREATE TABLE `t_elec_credit_info` (
  `sfzhm` string,
  `jf` string,
  `jb` string
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

create table zc_month_vio(
sfzh  string,
vio_1  int,
vio_2   int,
vio_3   int
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
   '/home/hdfs/data/traffic/zc_month_vio';


create table zc_month_acd(
sfzh  string,
acd_1  int,
acd_2   int,
acd_3   int
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
   '/home/hdfs/data/traffic/zc_month_acd';


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


INSERT overwrite table zc_violation_info
SELECT
jszh,
max_wfxw,
level1_count,
level2_count,
level3_count,
wfxw_count,
max_wfjfs,
avg_wfjfs,
wfjfs_count,
max_fkje,
avg_fkje,
fkje_count,
max_znj,
avg_znj,
znj_count,
qzcs,
ceil(avg_znj*100/(avg_fkje*3+1)) as cqts
FROM(
SELECT
jszh,
max(jb) as max_wfxw,
count(case when jb=1 then 1 else null end) as level1_count,
count(case when jb=2 then 1 else null end) as level2_count,
count(case when jb=3 then 1 else null end) as level3_count,
count(0) as wfxw_count,
max(wfjfs) as max_wfjfs,
round(avg(wfjfs),2) as avg_wfjfs,
sum(wfjfs) as wfjfs_count,
max(fkje) as max_fkje,
round(avg(fkje),2) as avg_fkje,
sum(fkje) as fkje_count,
max(znj) as max_znj,
round(avg(znj),2) as avg_znj,
sum(znj) as znj_count,
sum(qzcs) as qzcs
FROM(
SELECT
a.jszh,
a.wfxw,
a.WFJFS,
a.FKJE,
a.ZNJ,
a.qzcs,
cast(if(b.level is NULL,1,b.level) as int) as jb
FROM(
SELECT
jszh,
wfxw,
if(wfjfs is NULL,0,cast(wfjfs as int)) as wfjfs,
if(fkje is NULL,0,cast(fkje as int)) as fkje, 
if(znj is NULL,0.0,cast(znj as double)) as znj,
case when pzbh is NULL or pzbh='' then 0 else 1 end as qzcs
FROM
v_jg_vio_violation
WHERE datediff(current_date,substring(wfsj,1,10)) < 1095
) a
LEFT JOIN v_jg_wf_info b
ON a.wfxw=b.code
) c  group by jszh
) d;



INSERT overwrite table zc_driver_vio
SELECT
a.sfzmhm as sfzh,
a.currentime-a.lztime as jl,
a.zt,
a.ryzt,
if(b.max_wfxw is null,0,b.max_wfxw) as max_wfxw,
if(b.level1_count is null,0,b.level1_count) as level1_count,
if(b.level2_count is null,0,b.level2_count) as level2_count,
if(b.level3_count is null,0,b.level3_count) as level3_count,
if(b.wfxw_count is null,0,b.wfxw_count) as wfxw_count,
if(b.max_wfjfs is null,0,b.max_wfjfs) as max_wfjfs,
if(b.avg_wfjfs is null,0.0,b.avg_wfjfs) as avg_wfjfs,
if(b.wfjfs_count is null,0,b.wfjfs_count) as wfjfs_count,
if(b.max_fkje is null,0,b.max_fkje) as max_fkje,
if(b.avg_fkje is null,0.0,b.avg_fkje) as avg_fkje,
if(b.fkje_count is null,0,b.fkje_count) as fkje_count,
if(b.max_znj is null,0.0,b.max_znj) as max_znj,
if(b.avg_znj is null,0.0,b.avg_znj) as avg_znj,
if(b.znj_count is null,0.0,b.znj_count) as znj_count,
if(b.qzcs is null,0,b.qzcs) as qzcs,
if(b.cqts is null,0,b.cqts) as cqts
FROM(
SELECT
sfzmhm,
cast(year(current_date) as int) as currentime,
cast(substring(cclzrq,1,4) as int) as lztime,
case 
when zt in ('A','C','K') then 1 
when zt in ('H','I','M','N','P','R','S') then 2
when zt in ('B','D','U','L') then 3
when zt in ('E','F','G','J') then 4
else 1 end as zt,
if(ryzt='1',1,0) as ryzt
FROM
v_jg_drivinglicense ) a
LEFT JOIN
zc_violation_info b
on a.sfzmhm=b.jszh;


insert overwrite table zc_acd_info
SELECT
sfzh,
max(sfty) as sfty,
sum(qbzr) as qbzr,
sum(zyzr) as zyzr,
sum(tdzr) as tdzr,
sum(cyzr) as cyzr,
sum(myzr) as myzr,
sum(wfrd) as wfrd,
sum(swrs) as swrs,
sum(szrs) as szrs,
sum(zsrs) as zsrs,
sum(qsrs) as qsrs,
sum(zjccss) as zjccss
FROM(
SELECT
a.sfzmhm as sfzh,
a.sfty,
a.qbzr,
a.zyzr,
a.tdzr,
a.cyzr,
a.myzr,
a.wfrd,
case when b.swrs is null or a.myzr=1 then 0 else b.swrs end as swrs,
case when b.szrs is null or a.myzr=1 then 0 else b.szrs end as szrs,
case when b.zsrs is null or a.myzr=1 then 0 else b.zsrs end as zsrs,
case when b.qsrs is null or a.myzr=1 then 0 else b.qsrs end as qsrs,
case when b.zjccss is null or a.myzr=1 then 0.0 else b.zjccss end as zjccss
FROM
(SELECT
SGBH,
SFZMHM,
if(SFTY='2' or SFTY='3',1,0) as sfty,
if(sgzr='1',1,0) as qbzr,
if(sgzr='2',1,0) as zyzr,
if(sgzr='3',1,0) as tdzr,
if(sgzr='4',1,0) as cyzr,
if(sgzr='5',1,0) as myzr,
case when sgzr is null or sgzr='' or sgzr='6' then 1 else 0 end as wfrd
FROM v_jg_acd_filehuman
WHERE length(swsj) < 2
) a
LEFT JOIN
(SELECT
SGBH,
cast(if(SWRS30<0,0,SWRS30) as int) as swrs,
cast(if(SZRS<0,0,SZRS) as int) as szrs,
cast(if(ZSRS<0,0,ZSRS) as int) as zsrs,
cast(if(QSRS<0,0,QSRS) as int) as qsrs,
cast(if(ZJCCSS<0,0.0,ZJCCSS) as double) as zjccss
FROM v_jg_acd_file
WHERE  datediff(current_date,substring(SGFSSJ,1,10)) < 1095 )b
on a.sgbh=b.sgbh )c
group by sfzh;

insert overwrite table zc_driver_feature
SELECT
a.sfzh,
a.jl,
a.zt,
a.ryzt,
a.max_wfxw,
a.level1_count,
a.level2_count,
a.level3_count,
a.wfxw_count,
a.max_wfjfs,
a.avg_wfjfs,
a.wfjfs_count,
a.max_fkje,
a.avg_fkje,
a.fkje_count,
a.max_znj,
a.avg_znj,
a.znj_count,
a.qzcs,
a.cqts,
if(b.sfty is null,0,b.sfty) as sfty,
if(b.qbzr is null,0,b.qbzr) as qbzr,
if(b.zyzr is null,0,b.zyzr) as zyzr,
if(b.tdzr is null,0,b.tdzr) as tdzr,
if(b.cyzr is null,0,b.cyzr) as cyzr,
if(b.myzr is null,0,b.myzr) as myzr,
if(b.wfrd is null,0,b.wfrd) as wfrd,
if(b.swrs is null,0,b.swrs) as swrs,
if(b.szrs is null,0,b.szrs) as szrs,
if(b.zsrs is null,0,b.zsrs) as zsrs,
if(b.qsrs is null,0,b.qsrs) as qsrs,
if(b.zjccss is null,0.0,b.zjccss) as zjccss
FROM zc_driver_vio a
LEFT JOIN zc_acd_info b
on a.sfzh=b.sfzh;


INSERT OVERWRITE TABLE zc_driver_matrix
SELECT
sfzh,
if(jl>10,1,0) as jl_1,
if(jl>5 and jl<=10,1,0) as jl_2,
if(jl>3 and jl<=5,1,0) as jl_3,
if(jl>1 and jl<=3,1,0) as jl_4,
if(jl<=1,1,0) as jl_5,
if(zt=1,1,0) as zt_1,
if(zt=2,1,0) as zt_2,
if(zt=3,1,0) as zt_3,
if(zt=4,1,0) as zt_4,
if(ryzt=0,1,0) as ryzt_1,
if(ryzt=1,1,0) as ryzt_2,
if(max_wfxw=0,1,0) as wfxw_1,
if(max_wfxw=1,1,0) as wfxw_2,
if(max_wfxw=2,1,0) as wfxw_3,
if(max_wfxw=3,1,0) as wfxw_4,
if(level1_count=0,1,0) as level1_1,
if(level1_count>0 and level1_count<=5,1,0) as  level1_2,
if(level1_count>5 and level1_count<=10,1,0) as  level1_3,
if(level1_count>10 and level1_count<=20,1,0) as  level1_4,
if(level1_count>20 and level1_count<=50,1,0) as  level1_5,
if(level1_count>50,1,0) as level1_6,
if(level2_count=0,1,0) as level2_1,
if(level2_count>0 and level2_count<=5,1,0) as level2_2,
if(level2_count>5 and level2_count<=10,1,0) as level2_3,
if(level2_count>10,1,0) as level2_4,
if(level3_count=0,1,0) as level3_1,
if(level3_count>0 and level3_count<=3,1,0) as level3_2,
if(level3_count>3,1,0) as level3_3,
if(wfxw_count=0,1,0) as wfxwc_1,
if(wfxw_count>0 and wfxw_count<=5,1,0) as wfxwc_2,
if(wfxw_count>5 and wfxw_count<=10,1,0) as wfxwc_3,
if(wfxw_count>10 and wfxw_count<20,1,0) as wfxwc_4,
if(wfxw_count>20 and wfxw_count<=50,1,0) as wfxwc_5,
if(wfxw_count>50,1,0) as wfxwc_6,
if(max_wfjfs=0,1,0) as wfjfs_m1,
if(max_wfjfs>0 and max_wfjfs<=3,1,0) as wfjfs_m2,
if(max_wfjfs>3,1,0) as wfjfs_m3,
if(avg_wfjfs=0,1,0) as wfjfs_a1,
if(avg_wfjfs>0 and avg_wfjfs<=3,1,0) as wfjfs_a2,
if(avg_wfjfs>3,1,0) as wfjfs_a3,
if(wfjfs_count=0,1,0) as wfjfs_c1,
if(wfjfs_count>0 and wfjfs_count<=6,1,0) as wfjfs_c2,
if(wfjfs_count>6 and wfjfs_count<12,1,0) as wfjfs_c3,
if(wfjfs_count>=12,1,0) as wfjfs_c4,
if(max_fkje=0,1,0) as fkje_m1,
if(max_fkje>0 and max_fkje<=10,1,0) as fkje_m2,
if(max_fkje>10 and max_fkje<=100,1,0) as fkje_m3,
if(max_fkje>100 and max_fkje<=500,1,0) as fkje_m4,
if(max_fkje>500 and max_fkje<=1000,1,0) as fkje_m5,
if(max_fkje>1000,1,0) as fkje_m6,
if(avg_fkje=0,1,0) as fkje_a1,
if(avg_fkje>0 and avg_fkje<=10,1,0) as fkje_a2,
if(avg_fkje>10 and avg_fkje<=100,1,0) as fkje_a3,
if(avg_fkje>100 and avg_fkje<=500,1,0) as fkje_a4,
if(avg_fkje>500 and avg_fkje<=1000,1,0) as fkje_a5,
if(avg_fkje>1000,1,0) as fkje_a6,
if(fkje_count=0,1,0) as fkje_c1,
if(fkje_count>0 and fkje_count<=50,1,0) as fkje_c2,
if(fkje_count>50 and fkje_count<=500,1,0) as fkje_c3,
if(fkje_count>500 and fkje_count<=2000,1,0) as fkje_c4,
if(fkje_count>2000,1,0) as fkje_c5,
if(max_znj=0,1,0) as znj_m1,
if(max_znj>0 and max_znj<=10,1,0) as znj_m2,
if(max_znj>10 and max_znj<=50,1,0) as znj_m3,
if(max_znj>50 and max_znj<=100,1,0) as znj_m4,
if(max_znj>100,1,0) as znj_m5,
if(avg_znj=0,1,0) as znj_a1,
if(avg_znj>0 and avg_znj<=10,1,0) as znj_a2,
if(avg_znj>10 and avg_znj<=50,1,0) as znj_a3,
if(avg_znj>50,1,0) as znj_a4,
if(znj_count=0,1,0) as znj_c1,
if(znj_count>0 and znj_count<=50,1,0) as znj_c2,
if(znj_count>50 and znj_count<=200,1,0) as znj_c3,
if(znj_count>200 and znj_count<=500,1,0) as znj_c4,
if(znj_count>500,1,0) as znj_c5,
if(qzcs=0,1,0) as qzcs_1,
if(qzcs>0 and qzcs<=3,1,0) as qzcs_2,
if(qzcs>3,1,0) as qzcs_3,
if(cqts=0,1,0) as cqts_1,
if(cqts>0 and cqts<=10,1,0) as cqts_2,
if(cqts>10 and cqts<=20,1,0) as cqts_3,
if(cqts>20 and cqts<=30,1,0) as cqts_4,
if(cqts>30,1,0) as cqts_5,
if(sfty=0,1,0) as sfty_1,
if(sfty=1,1,0) as sfty_2,
if(qbzr=0,1,0) as qbzr_1,
if(qbzr>0 and qbzr<=3,1,0) as qbzr_2,
if(qbzr>3,1,0) as qbzr_3,
if(zyzr=0,1,0) as zyzr_1,
if(zyzr>0 and zyzr<=3,1,0) as zyzr_2,
if(zyzr>3,1,0) as zyzr_3,
if(tdzr=0,1,0) as tdzr_1,
if(tdzr>0 and tdzr<=3,1,0) as tdzr_2,
if(tdzr>3,1,0) as tdzr_3,
if(cyzr=0,1,0) as cyzr_1,
if(cyzr>0 and cyzr<=3,1,0) as cyzr_2,
if(cyzr>3,1,0) as cyzr_3,
if(myzr=0,1,0) as myzr_1,
if(myzr!=0,1,0) as myzr_2,
if(wfrd=0,1,0) as wfrd_1,
if(wfrd>0 and wfrd<=3,1,0) as wfrd_2,
if(wfrd>3,1,0) as wfrd_3,
if(swrs=0,1,0) as swrs_1,
if(swrs>0,1,0) as swrs_2,
if(szrs=0,1,0) as szrs_1,
if(szrs>0,1,0) as szrs_2,
if(zsrs=0,1,0) as zsrs_1,
if(zsrs>0 and zsrs<=3,1,0) as zsrs_2,
if(zsrs>3,1,0) as zsrs_3,
if(qsrs=0,1,0) as qsrs_1,
if(qsrs>0 and qsrs<=5,1,0) as qsrs_2,
if(qsrs>5 and qsrs<=10,1,0) as qsrs_3,
if(qsrs>10,1,0) as qsrs_4,
if(zjccss=0,1,0) as ccss_1,
if(zjccss>0 and zjccss<=100,1,0) as ccss_2,
if(zjccss>100 and zjccss<=1000,1,0) as ccss_3,
if(zjccss>1000 and zjccss<=10000,1,0) as ccss_4,
if(zjccss>10000,1,0) as ccss_5
FROM zc_driver_feature;

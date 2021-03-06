use traffic;

insert overwrite table t_acd_one
SELECT
sfzh,
sum(qbzr)+sum(zyzr)+sum(tdzr)+sum(cyzr) as acd_count,
(sum(qbzr_1)*100+sum(qbzr_2)*50+sum(qbzr_3)*20+sum(zyzr_1)*80+sum(zyzr_2)*40+sum(zyzr_3)*15+sum(tdzr_1)*50
+sum(tdzr_2)*30+sum(tdzr_3)*10+sum(cyzr_1)*20+sum(cyzr_2)*10+sum(cyzr_3)*5) as score,
sum(qbzr_1),
sum(qbzr_2),
sum(qbzr_3),
sum(zyzr_1),
sum(zyzr_2),
sum(zyzr_3),
sum(tdzr_1),
sum(tdzr_2),
sum(tdzr_3),
sum(cyzr_1),
sum(cyzr_2),
sum(cyzr_3)
FROM(
SELECT
a.sfzmhm as sfzh,
a.qbzr,
a.zyzr,
a.tdzr,
a.cyzr,
case when b.zsrs>0 and a.qbzr=1 then 1 else 0 end as qbzr_1,
case when b.qsrs>0 and a.qbzr=1 then 1 else 0 end as qbzr_2,
case when b.zjccss>0 and a.qbzr=1 then 1 else 0 end as qbzr_3,
case when b.zsrs>0 and a.zyzr=1 then 1 else 0 end as zyzr_1,
case when b.qsrs>0 and a.zyzr=1 then 1 else 0 end as zyzr_2,
case when b.zjccss>0 and a.zyzr=1 then 1 else 0 end as zyzr_3,
case when b.zsrs>0 and a.tdzr=1 then 1 else 0 end as tdzr_1,
case when b.qsrs>0 and a.tdzr=1 then 1 else 0 end as tdzr_2,
case when b.zjccss>0 and a.tdzr=1 then 1 else 0 end as tdzr_3,
case when b.zsrs>0 and a.cyzr=1 then 1 else 0 end as cyzr_1,
case when b.qsrs>0 and a.cyzr=1 then 1 else 0 end as cyzr_2,
case when b.zjccss>0 and a.cyzr=1 then 1 else 0 end as cyzr_3
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
WHERE  datediff(current_date,substring(SGFSSJ,1,10)) < 365 )b
on a.sgbh=b.sgbh )c
where length(sfzh) >17 group by sfzh;

insert overwrite table t_acd_two
SELECT
sfzh,
sum(qbzr)+sum(zyzr)+sum(tdzr)+sum(cyzr) as acd_count,
(sum(qbzr_1)*100+sum(qbzr_2)*50+sum(qbzr_3)*20+sum(zyzr_1)*80+sum(zyzr_2)*40+sum(zyzr_3)*15+sum(tdzr_1)*50
+sum(tdzr_2)*30+sum(tdzr_3)*10+sum(cyzr_1)*20+sum(cyzr_2)*10+sum(cyzr_3)*5) as score,
sum(qbzr_1),
sum(qbzr_2),
sum(qbzr_3),
sum(zyzr_1),
sum(zyzr_2),
sum(zyzr_3),
sum(tdzr_1),
sum(tdzr_2),
sum(tdzr_3),
sum(cyzr_1),
sum(cyzr_2),
sum(cyzr_3)
FROM(
SELECT
a.sfzmhm as sfzh,
a.qbzr,
a.zyzr,
a.tdzr,
a.cyzr,
case when b.zsrs>0 and a.qbzr=1 then 1 else 0 end as qbzr_1,
case when b.qsrs>0 and a.qbzr=1 then 1 else 0 end as qbzr_2,
case when b.zjccss>0 and a.qbzr=1 then 1 else 0 end as qbzr_3,
case when b.zsrs>0 and a.zyzr=1 then 1 else 0 end as zyzr_1,
case when b.qsrs>0 and a.zyzr=1 then 1 else 0 end as zyzr_2,
case when b.zjccss>0 and a.zyzr=1 then 1 else 0 end as zyzr_3,
case when b.zsrs>0 and a.tdzr=1 then 1 else 0 end as tdzr_1,
case when b.qsrs>0 and a.tdzr=1 then 1 else 0 end as tdzr_2,
case when b.zjccss>0 and a.tdzr=1 then 1 else 0 end as tdzr_3,
case when b.zsrs>0 and a.cyzr=1 then 1 else 0 end as cyzr_1,
case when b.qsrs>0 and a.cyzr=1 then 1 else 0 end as cyzr_2,
case when b.zjccss>0 and a.cyzr=1 then 1 else 0 end as cyzr_3
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
WHERE  datediff(current_date,substring(SGFSSJ,1,10)) > 365 and datediff(current_date,substring(SGFSSJ,1,10)) < 730 )b
on a.sgbh=b.sgbh )c
where length(sfzh) >17 group by sfzh;

insert overwrite table t_acd_three
SELECT
sfzh,
sum(qbzr)+sum(zyzr)+sum(tdzr)+sum(cyzr) as acd_count,
(sum(qbzr_1)*100+sum(qbzr_2)*50+sum(qbzr_3)*20+sum(zyzr_1)*80+sum(zyzr_2)*40+sum(zyzr_3)*15+sum(tdzr_1)*50
+sum(tdzr_2)*30+sum(tdzr_3)*10+sum(cyzr_1)*20+sum(cyzr_2)*10+sum(cyzr_3)*5) as score,
sum(qbzr_1),
sum(qbzr_2),
sum(qbzr_3),
sum(zyzr_1),
sum(zyzr_2),
sum(zyzr_3),
sum(tdzr_1),
sum(tdzr_2),
sum(tdzr_3),
sum(cyzr_1),
sum(cyzr_2),
sum(cyzr_3)
FROM(
SELECT
a.sfzmhm as sfzh,
a.qbzr,
a.zyzr,
a.tdzr,
a.cyzr,
case when b.zsrs>0 and a.qbzr=1 then 1 else 0 end as qbzr_1,
case when b.qsrs>0 and a.qbzr=1 then 1 else 0 end as qbzr_2,
case when b.zjccss>0 and a.qbzr=1 then 1 else 0 end as qbzr_3,
case when b.zsrs>0 and a.zyzr=1 then 1 else 0 end as zyzr_1,
case when b.qsrs>0 and a.zyzr=1 then 1 else 0 end as zyzr_2,
case when b.zjccss>0 and a.zyzr=1 then 1 else 0 end as zyzr_3,
case when b.zsrs>0 and a.tdzr=1 then 1 else 0 end as tdzr_1,
case when b.qsrs>0 and a.tdzr=1 then 1 else 0 end as tdzr_2,
case when b.zjccss>0 and a.tdzr=1 then 1 else 0 end as tdzr_3,
case when b.zsrs>0 and a.cyzr=1 then 1 else 0 end as cyzr_1,
case when b.qsrs>0 and a.cyzr=1 then 1 else 0 end as cyzr_2,
case when b.zjccss>0 and a.cyzr=1 then 1 else 0 end as cyzr_3
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
WHERE  datediff(current_date,substring(SGFSSJ,1,10)) > 730 and datediff(current_date,substring(SGFSSJ,1,10)) < 1095 )b
on a.sgbh=b.sgbh )c
where length(sfzh) >17 group by sfzh;

use traffic;

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
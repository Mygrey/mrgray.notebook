use traffic;

insert overwrite  table zc_black_table
select jszh as sfzh,
1 as black_mark
from (
SELECT
a.jszh,
a.wfxw,
cast(if(b.level is NULL,1,b.level) as int) as jb
FROM(
SELECT
jszh,
wfxw
FROM
v_jg_vio_violation
WHERE datediff(current_date,substring(wfsj,1,10)) <= 1825
) a
LEFT JOIN v_jg_wf_info b
ON a.wfxw=b.code)c where jb=4 group by jszh
union all
select
sfzh,
1 as black_mark
from(
SELECT
sfzh,
sum(swrs) as swrs
FROM(
SELECT
a.sfzmhm as sfzh,
case when b.swrs is null or a.myzr=1 then 0 else b.swrs end as swrs
FROM
(SELECT
SGBH,
SFZMHM,
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
cast(if(SWRS30<0,0,SWRS30) as int) as swrs
FROM v_jg_acd_file
WHERE  datediff(current_date,substring(SGFSSJ,1,10)) <= 1825 )b
on a.sgbh=b.sgbh )c
where length(sfzh) >17 group by sfzh) f where swrs>0;
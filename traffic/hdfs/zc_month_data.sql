use traffic;

insert overwrite table zc_month_acd
select sfzh,
sum(m1) as acd_1,
sum(m2) as acd_2,
sum(m3) as acd_3
from (
SELECT
a.sfzmhm as sfzh,
if(b.m1 is null,0,1) as m1,
if(b.m2 is null,0,1) as m2,
if(b.m3 is null,0,1) as m3
FROM
(SELECT
SGBH,
SFZMHM
FROM v_jg_acd_filehuman
WHERE length(swsj) < 2
) a
LEFT JOIN
(SELECT
SGBH,
case when datediff(current_date,substring(SGFSSJ,1,10)) < 30 then 1 else 0 end as m1,
case when datediff(current_date,substring(SGFSSJ,1,10)) < 60 then 1 else 0 end as m2,
case when datediff(current_date,substring(SGFSSJ,1,10)) < 90 then 1 else 0 end as m3
FROM v_jg_acd_file
WHERE  datediff(current_date,substring(SGFSSJ,1,10)) < 90 )b
on a.sgbh=b.sgbh 
) c where length(sfzh)>16  group by sfzh;

insert overwrite table zc_month_vio
SELECT
jszh,
sum(m1) as vio_1,
sum(m2) as vio_2,
sum(m3) as vio_3
FROM(
SELECT
a.jszh,
cast(if(b.level is NULL,1,b.level) as int) as jb,
case when datediff(current_date,substring(a.wfsj,1,10)) < 30 then 1 else 0 end as m1,
case when datediff(current_date,substring(a.wfsj,1,10)) < 60 then 1 else 0 end as m2,
case when datediff(current_date,substring(a.wfsj,1,10)) < 90 then 1 else 0 end as m3
FROM(
SELECT
jszh,
wfsj,
wfxw
FROM
v_jg_vio_violation
WHERE datediff(current_date,substring(wfsj,1,10)) < 90
) a
LEFT JOIN v_jg_wf_info b
ON a.wfxw=b.code
) c where jb=1  group by jszh;

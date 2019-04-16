use traffic;

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


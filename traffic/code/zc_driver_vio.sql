use traffic;

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

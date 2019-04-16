use traffic;

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


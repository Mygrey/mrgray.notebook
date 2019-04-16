use traffic;

INSERT OVERWRITE TABLE zc_driver_train
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
a.sfty,
a.qbzr,
a.zyzr,
a.tdzr,
a.cyzr,
a.myzr,
a.wfrd,
a.swrs,
a.szrs,
a.zsrs,
a.qsrs,
a.zjccss,
b.level,
b.label
FROM
zc_driver_feature a
INNER JOIN  zc_driver_flag b
ON a.sfzh=b.sfzh;

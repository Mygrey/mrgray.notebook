TRUNCATE TABLE zc_weight_result;

INSERT INTO zc_weight_result
SELECT
sfzh,
jl_1+jl_2+jl_3+jl_4+jl_5 as jl,
zt_1+zt_2+zt_3+zt_4 as zt,
ryzt_1+ryzt_2 as ryzt,
wfxw_1+wfxw_2+wfxw_3+wfxw_4 as wfxw,
level1_1+ level1_2+ level1_3+ level1_4+ level1_5+level1_6 as level1_count,
level2_1+level2_2+level2_3+level2_4 as level2_count,
level3_1+level3_2+level3_3 as level3_count,
wfxwc_1+wfxwc_2+wfxwc_3+wfxwc_4+wfxwc_5+wfxwc_6 as wfxw_count,
wfjfs_m1+wfjfs_m2+wfjfs_m3 as max_wfjfs,
wfjfs_a1+wfjfs_a2+wfjfs_a3 as avg_wfjfs,
wfjfs_c1+wfjfs_c2+wfjfs_c3+wfjfs_c4 as wfjfs_count,
fkje_m1+fkje_m2+fkje_m3+fkje_m4+fkje_m5+fkje_m6 max_fkje,
fkje_a1+fkje_a2+fkje_a3+fkje_a4+fkje_a5+fkje_a6 avg_fkje,
fkje_c1+fkje_c2+fkje_c3+fkje_c4+fkje_c5 as fkje_count,
znj_m1+znj_m2+znj_m3+znj_m4+znj_m5 as max_znj,
znj_a1+znj_a2+znj_a3+znj_a4 as avg_znj,
znj_c1+znj_c2+znj_c3+znj_c4+znj_c5 as znj_count,
qzcs_1+qzcs_2+qzcs_3 as qzts,
cqts_1+cqts_2+cqts_3+cqts_4+cqts_5 as cqts,
sfty_1+sfty_2 as sfty,
qbzr_1+qbzr_2+qbzr_3 as qbzr,
zyzr_1+zyzr_2+zyzr_3 as zyzr,
tdzr_1+tdzr_2+tdzr_3 as tdzr,
cyzr_1+cyzr_2+cyzr_3 as cyzr,
myzr_1+myzr_2 as myzr,
wfrd_1+wfrd_2+wfrd_3 as wfrd,
swrs_1+swrs_2 as swrs,
szrs_1+szrs_2 as szrs,
zsrs_1+zsrs_2+zsrs_3 as zsrs,
qsrs_1+qsrs_2+qsrs_3+qsrs_4 as qsrs,
ccss_1+ccss_2+ccss_3+ccss_4+ccss_5 as ccss
FROM
(SELECT
a.sfzh as sfzh,
a.jl_1*b.jl_1 as jl_1,
a.jl_2*b.jl_2 as jl_2,
a.jl_3*b.jl_3 as jl_3,
a.jl_4*b.jl_4 as jl_4,
a.jl_5*b.jl_5 as jl_5,
a.zt_1*b.zt_1 as zt_1,
a.zt_2*b.zt_2 as zt_2,
a.zt_3*b.zt_3 as zt_3,
a.zt_4*b.zt_4 as zt_4,
a.ryzt_1*b.ryzt_1 as ryzt_1,
a.ryzt_2*b.ryzt_2 as ryzt_2,
a.wfxw_1*b.wfxw_1 as wfxw_1,
a.wfxw_2*b.wfxw_2 as wfxw_2,
a.wfxw_3*b.wfxw_3 as wfxw_3,
a.wfxw_4*b.wfxw_4 as wfxw_4,
a.level1_1*b.level1_1 as level1_1,
a.level1_2*b.level1_2 as  level1_2,
a.level1_3*b.level1_3 as  level1_3,
a.level1_4*b.level1_4 as  level1_4,
a.level1_5*b.level1_5 as  level1_5,
a.level1_6*b.level1_6 as level1_6,
a.level2_1*b.level2_1 as level2_1,
a.level2_2*b.level2_2 as level2_2,
a.level2_3*b.level2_3 as level2_3,
a.level2_4*b.level2_4 as level2_4,
a.level3_1*b.level3_1 as level3_1,
a.level3_2*b.level3_2 as level3_2,
a.level3_3*b.level3_3 as level3_3,
a.wfxwc_1*b.wfxwc_1 as wfxwc_1,
a.wfxwc_2*b.wfxwc_2 as wfxwc_2,
a.wfxwc_3*b.wfxwc_3 as wfxwc_3,
a.wfxwc_4*b.wfxwc_4 as wfxwc_4,
a.wfxwc_5*b.wfxwc_5 as wfxwc_5,
a.wfxwc_6*b.wfxwc_6 as wfxwc_6,
a.wfjfs_m1*b.wfjfs_m1 as wfjfs_m1,
a.wfjfs_m2*b.wfjfs_m2 as wfjfs_m2,
a.wfjfs_m3*b.wfjfs_m3 as wfjfs_m3,
a.wfjfs_a1*b.wfjfs_a1 as wfjfs_a1,
a.wfjfs_a2*b.wfjfs_a2 as wfjfs_a2,
a.wfjfs_a3*b.wfjfs_a3 as wfjfs_a3,
a.wfjfs_c1*b.wfjfs_c1 as wfjfs_c1,
a.wfjfs_c2*b.wfjfs_c2 as wfjfs_c2,
a.wfjfs_c3*b.wfjfs_c3 as wfjfs_c3,
a.wfjfs_c4*b.wfjfs_c4 as wfjfs_c4,
a.fkje_m1*b.fkje_m1 as fkje_m1,
a.fkje_m2*b.fkje_m2 as fkje_m2,
a.fkje_m3*b.fkje_m3 as fkje_m3,
a.fkje_m4*b.fkje_m4 as fkje_m4,
a.fkje_m5*b.fkje_m5 as fkje_m5,
a.fkje_m6*b.fkje_m6 as fkje_m6,
a.fkje_a1*b.fkje_a1 as fkje_a1,
a.fkje_a2*b.fkje_a2 as fkje_a2,
a.fkje_a3*b.fkje_a3 as fkje_a3,
a.fkje_a4*b.fkje_a4 as fkje_a4,
a.fkje_a5*b.fkje_a5 as fkje_a5,
a.fkje_a6*b.fkje_a6 as fkje_a6,
a.fkje_c1*b.fkje_c1 as fkje_c1,
a.fkje_c2*b.fkje_c2 as fkje_c2,
a.fkje_c3*b.fkje_c3 as fkje_c3,
a.fkje_c4*b.fkje_c4 as fkje_c4,
a.fkje_c5*b.fkje_c5 as fkje_c5,
a.znj_m1*b.znj_m1 as znj_m1,
a.znj_m2*b.znj_m2 as znj_m2,
a.znj_m3*b.znj_m3 as znj_m3,
a.znj_m4*b.znj_m4 as znj_m4,
a.znj_m5*b.znj_m5 as znj_m5,
a.znj_a1*b.znj_a1 as znj_a1,
a.znj_a2*b.znj_a2 as znj_a2,
a.znj_a3*b.znj_a3 as znj_a3,
a.znj_a4*b.znj_a4 as znj_a4,
a.znj_c1*b.znj_c1 as znj_c1,
a.znj_c2*b.znj_c2 as znj_c2,
a.znj_c3*b.znj_c3 as znj_c3,
a.znj_c4*b.znj_c4 as znj_c4,
a.znj_c5*b.znj_c5 as znj_c5,
a.qzcs_1*b.qzcs_1 as qzcs_1,
a.qzcs_2*b.qzcs_2 as qzcs_2,
a.qzcs_3*b.qzcs_3 as qzcs_3,
a.cqts_1*b.cqts_1 as cqts_1,
a.cqts_2*b.cqts_2 as cqts_2,
a.cqts_3*b.cqts_3 as cqts_3,
a.cqts_4*b.cqts_4 as cqts_4,
a.cqts_5*b.cqts_5 as cqts_5,
a.sfty_1*b.sfty_1 as sfty_1,
a.sfty_2*b.sfty_2 as sfty_2,
a.qbzr_1*b.qbzr_1 as qbzr_1,
a.qbzr_2*b.qbzr_2 as qbzr_2,
a.qbzr_3*b.qbzr_3 as qbzr_3,
a.zyzr_1*b.zyzr_1 as zyzr_1,
a.zyzr_2*b.zyzr_2 as zyzr_2,
a.zyzr_3*b.zyzr_3 as zyzr_3,
a.tdzr_1*b.tdzr_1 as tdzr_1,
a.tdzr_2*b.tdzr_2 as tdzr_2,
a.tdzr_3*b.tdzr_3 as tdzr_3,
a.cyzr_1*b.cyzr_1 as cyzr_1,
a.cyzr_2*b.cyzr_2 as cyzr_2,
a.cyzr_3*b.cyzr_3 as cyzr_3,
a.myzr_1*b.myzr_1 as myzr_1,
a.myzr_2*b.myzr_2 as myzr_2,
a.wfrd_1*b.wfrd_1 as wfrd_1,
a.wfrd_2*b.wfrd_2 as wfrd_2,
a.wfrd_3*b.wfrd_3 as wfrd_3,
a.swrs_1*b.swrs_1 as swrs_1,
a.swrs_2*b.swrs_2 as swrs_2,
a.szrs_1*b.szrs_1 as szrs_1,
a.szrs_2*b.szrs_2 as szrs_2,
a.zsrs_1*b.zsrs_1 as zsrs_1,
a.zsrs_2*b.zsrs_2 as zsrs_2,
a.zsrs_3*b.zsrs_3 as zsrs_3,
a.qsrs_1*b.qsrs_1 as qsrs_1,
a.qsrs_2*b.qsrs_2 as qsrs_2,
a.qsrs_3*b.qsrs_3 as qsrs_3,
a.qsrs_4*b.qsrs_4 as qsrs_4,
a.ccss_1*b.ccss_1 as ccss_1,
a.ccss_2*b.ccss_2 as ccss_2,
a.ccss_3*b.ccss_3 as ccss_3,
a.ccss_4*b.ccss_4 as ccss_4,
a.ccss_5*b.ccss_5 as ccss_5
FROM zc_driver_matrix a 
LEFT JOIN zc_feature_woe b
ON 1=1 )c;
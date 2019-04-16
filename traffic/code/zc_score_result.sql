truncate table zc_score_result;

INSERT INTO zc_score_result
SELECT
sfzh,
606.42-28.85*round(s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+
s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32,4) as score
FROM 
(SELECT
a.sfzh,
a.jl*b.jl as s2,
a.zt*b.zt as s3,
a.ryzt*b.ryzt as s4,
a.max_wfxw*b.max_wfxw as s5,
a.level1_count*b.level1_count as s6,
a.level2_count*b.level2_count as s7,
a.level3_count*b.level3_count as s8,
a.wfxw_count*b.wfxw_count as s9,
a.max_wfjfs*b.max_wfjfs as s10,
a.avg_wfjfs*b.avg_wfjfs as s11,
a.wfjfs_count*b.wfjfs_count as s12,
a.max_fkje*b.max_fkje as s13,
a.avg_fkje*b.avg_fkje as s14,
a.fkje_count*b.fkje_count as s15,
a.max_znj*b.max_znj as s16,
a.avg_znj*b.avg_znj as s17,
a.znj_count*b.znj_count as s18,
a.qzcs*b.qzcs as s19,
a.cqts*b.cqts as s20,
a.sfty*b.sfty as s21,
a.qbzr*b.qbzr as s22,
a.zyzr*b.zyzr as s23,
a.tdzr*b.tdzr as s24,
a.cyzr*b.cyzr as s25,
a.myzr*b.myzr as s26,
a.wfrd*b.wfrd as s27,
a.swrs*b.swrs as s28,
a.szrs*b.szrs as s29,
a.zsrs*b.zsrs as s30,
a.qsrs*b.qsrs as s31,
a.ccss*b.zjccss as s32
FROM zc_weight_result a 
LEFT JOIN zc_logic_result b 
ON 1=1)c; 
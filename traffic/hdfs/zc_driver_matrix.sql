use traffic;

INSERT OVERWRITE TABLE zc_driver_matrix
SELECT
sfzh,
if(jl>10,1,0) as jl_1,
if(jl>5 and jl<=10,1,0) as jl_2,
if(jl>3 and jl<=5,1,0) as jl_3,
if(jl>1 and jl<=3,1,0) as jl_4,
if(jl<=1,1,0) as jl_5,
if(zt=1,1,0) as zt_1,
if(zt=2,1,0) as zt_2,
if(zt=3,1,0) as zt_3,
if(zt=4,1,0) as zt_4,
if(ryzt=0,1,0) as ryzt_1,
if(ryzt=1,1,0) as ryzt_2,
if(max_wfxw=0,1,0) as wfxw_1,
if(max_wfxw=1,1,0) as wfxw_2,
if(max_wfxw=2,1,0) as wfxw_3,
if(max_wfxw=3,1,0) as wfxw_4,
if(level1_count=0,1,0) as level1_1,
if(level1_count>0 and level1_count<=5,1,0) as  level1_2,
if(level1_count>5 and level1_count<=10,1,0) as  level1_3,
if(level1_count>10 and level1_count<=20,1,0) as  level1_4,
if(level1_count>20 and level1_count<=50,1,0) as  level1_5,
if(level1_count>50,1,0) as level1_6,
if(level2_count=0,1,0) as level2_1,
if(level2_count>0 and level2_count<=5,1,0) as level2_2,
if(level2_count>5 and level2_count<=10,1,0) as level2_3,
if(level2_count>10,1,0) as level2_4,
if(level3_count=0,1,0) as level3_1,
if(level3_count>0 and level3_count<=3,1,0) as level3_2,
if(level3_count>3,1,0) as level3_3,
if(wfxw_count=0,1,0) as wfxwc_1,
if(wfxw_count>0 and wfxw_count<=5,1,0) as wfxwc_2,
if(wfxw_count>5 and wfxw_count<=10,1,0) as wfxwc_3,
if(wfxw_count>10 and wfxw_count<20,1,0) as wfxwc_4,
if(wfxw_count>20 and wfxw_count<=50,1,0) as wfxwc_5,
if(wfxw_count>50,1,0) as wfxwc_6,
if(max_wfjfs=0,1,0) as wfjfs_m1,
if(max_wfjfs>0 and max_wfjfs<=3,1,0) as wfjfs_m2,
if(max_wfjfs>3,1,0) as wfjfs_m3,
if(avg_wfjfs=0,1,0) as wfjfs_a1,
if(avg_wfjfs>0 and avg_wfjfs<=3,1,0) as wfjfs_a2,
if(avg_wfjfs>3,1,0) as wfjfs_a3,
if(wfjfs_count=0,1,0) as wfjfs_c1,
if(wfjfs_count>0 and wfjfs_count<=6,1,0) as wfjfs_c2,
if(wfjfs_count>6 and wfjfs_count<12,1,0) as wfjfs_c3,
if(wfjfs_count>=12,1,0) as wfjfs_c4,
if(max_fkje=0,1,0) as fkje_m1,
if(max_fkje>0 and max_fkje<=10,1,0) as fkje_m2,
if(max_fkje>10 and max_fkje<=100,1,0) as fkje_m3,
if(max_fkje>100 and max_fkje<=500,1,0) as fkje_m4,
if(max_fkje>500 and max_fkje<=1000,1,0) as fkje_m5,
if(max_fkje>1000,1,0) as fkje_m6,
if(avg_fkje=0,1,0) as fkje_a1,
if(avg_fkje>0 and avg_fkje<=10,1,0) as fkje_a2,
if(avg_fkje>10 and avg_fkje<=100,1,0) as fkje_a3,
if(avg_fkje>100 and avg_fkje<=500,1,0) as fkje_a4,
if(avg_fkje>500 and avg_fkje<=1000,1,0) as fkje_a5,
if(avg_fkje>1000,1,0) as fkje_a6,
if(fkje_count=0,1,0) as fkje_c1,
if(fkje_count>0 and fkje_count<=50,1,0) as fkje_c2,
if(fkje_count>50 and fkje_count<=500,1,0) as fkje_c3,
if(fkje_count>500 and fkje_count<=2000,1,0) as fkje_c4,
if(fkje_count>2000,1,0) as fkje_c5,
if(max_znj=0,1,0) as znj_m1,
if(max_znj>0 and max_znj<=10,1,0) as znj_m2,
if(max_znj>10 and max_znj<=50,1,0) as znj_m3,
if(max_znj>50 and max_znj<=100,1,0) as znj_m4,
if(max_znj>100,1,0) as znj_m5,
if(avg_znj=0,1,0) as znj_a1,
if(avg_znj>0 and avg_znj<=10,1,0) as znj_a2,
if(avg_znj>10 and avg_znj<=50,1,0) as znj_a3,
if(avg_znj>50,1,0) as znj_a4,
if(znj_count=0,1,0) as znj_c1,
if(znj_count>0 and znj_count<=50,1,0) as znj_c2,
if(znj_count>50 and znj_count<=200,1,0) as znj_c3,
if(znj_count>200 and znj_count<=500,1,0) as znj_c4,
if(znj_count>500,1,0) as znj_c5,
if(qzcs=0,1,0) as qzcs_1,
if(qzcs>0 and qzcs<=3,1,0) as qzcs_2,
if(qzcs>3,1,0) as qzcs_3,
if(cqts=0,1,0) as cqts_1,
if(cqts>0 and cqts<=10,1,0) as cqts_2,
if(cqts>10 and cqts<=20,1,0) as cqts_3,
if(cqts>20 and cqts<=30,1,0) as cqts_4,
if(cqts>30,1,0) as cqts_5,
if(sfty=0,1,0) as sfty_1,
if(sfty=1,1,0) as sfty_2,
if(qbzr=0,1,0) as qbzr_1,
if(qbzr>0 and qbzr<=3,1,0) as qbzr_2,
if(qbzr>3,1,0) as qbzr_3,
if(zyzr=0,1,0) as zyzr_1,
if(zyzr>0 and zyzr<=3,1,0) as zyzr_2,
if(zyzr>3,1,0) as zyzr_3,
if(tdzr=0,1,0) as tdzr_1,
if(tdzr>0 and tdzr<=3,1,0) as tdzr_2,
if(tdzr>3,1,0) as tdzr_3,
if(cyzr=0,1,0) as cyzr_1,
if(cyzr>0 and cyzr<=3,1,0) as cyzr_2,
if(cyzr>3,1,0) as cyzr_3,
if(myzr=0,1,0) as myzr_1,
if(myzr!=0,1,0) as myzr_2,
if(wfrd=0,1,0) as wfrd_1,
if(wfrd>0 and wfrd<=3,1,0) as wfrd_2,
if(wfrd>3,1,0) as wfrd_3,
if(swrs=0,1,0) as swrs_1,
if(swrs>0,1,0) as swrs_2,
if(szrs=0,1,0) as szrs_1,
if(szrs>0,1,0) as szrs_2,
if(zsrs=0,1,0) as zsrs_1,
if(zsrs>0 and zsrs<=3,1,0) as zsrs_2,
if(zsrs>3,1,0) as zsrs_3,
if(qsrs=0,1,0) as qsrs_1,
if(qsrs>0 and qsrs<=5,1,0) as qsrs_2,
if(qsrs>5 and qsrs<=10,1,0) as qsrs_3,
if(qsrs>10,1,0) as qsrs_4,
if(zjccss=0,1,0) as ccss_1,
if(zjccss>0 and zjccss<=100,1,0) as ccss_2,
if(zjccss>100 and zjccss<=1000,1,0) as ccss_3,
if(zjccss>1000 and zjccss<=10000,1,0) as ccss_4,
if(zjccss>10000,1,0) as ccss_5
FROM zc_driver_feature;

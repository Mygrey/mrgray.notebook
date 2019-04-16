use traffic;

insert overwrite table zc_driver_flag
SELECT
sfzh,
score,
rank,
num,
case when rank<=num*0.1 then 5
when rank>num*0.1 and rank<=num*0.2 then 4
when rank>num*0.2 and rank<=num*0.4 then 3
when rank>num*0.4 and rank<=num*0.8 then 2
else 1 end as level,
case when rank<=num*0.2 then 0 else 1 end as label
FROM(
SELECT
a.sfzh,
a.score,
b.num,
row_number() over (partition by b.num order by a.score) rank
FROM(
SELECT
sfzh,
(jl_1*3+
jl_2*2+
jl_3*2+
jl_4*2+
jl_5*1+
zt_1*5+
zt_2*-3+
zt_3*-5+
zt_4*-15+
ryzt_1*3+
ryzt_2*-5+
wfxw_1*3+
wfxw_2*2+
wfxw_3*-3+
wfxw_4*-5+
level1_1*3+
level1_2*2+
level1_3*-1+
level1_4*-2+
level1_5*-3+
level1_6*-5+
level2_1*2+
level2_2*-1+
level2_3*-3+
level2_4*-5+
level3_1*3+
level3_2*-3+
level3_3*-5+
wfxwc_1*3+
wfxwc_2*2+
wfxwc_3*0+
wfxwc_4*-1+
wfxwc_5*-2+
wfxwc_6*-3+
wfjfs_m1*2+
wfjfs_m2*1+
wfjfs_m3*-2+
wfjfs_a1*2+
wfjfs_a2*1+
wfjfs_a3*-2+
wfjfs_c1*2+
wfjfs_c2*1+
wfjfs_c3*-2+
wfjfs_c4*-3+
fkje_m1*2+
fkje_m2*0+
fkje_m3*-1+
fkje_m4*-2+
fkje_m5*-3+
fkje_m6*-4+
fkje_a1*1+
fkje_a2*0+
fkje_a3*-1+
fkje_a4*-2+
fkje_a5*-3+
fkje_a6*-4+
fkje_c1*2+
fkje_c2*0+
fkje_c3*-1+
fkje_c4*-2+
fkje_c5*-3+
znj_m1*3+
znj_m2*1+
znj_m3*-1+
znj_m4*-2+
znj_m5*-3+
znj_a1*3+
znj_a2*1+
znj_a3*-1+
znj_a4*-3+
znj_c1*2+
znj_c2*0+
znj_c3*-1+
znj_c4*-2+
znj_c5*-3+
qzcs_1*3+
qzcs_2*-1+
qzcs_3*-3+
cqts_1*2+
cqts_2*0+
cqts_3*-2+
cqts_4*-3+
cqts_5*-5+
sfty_1*1+
sfty_2*-5+
qbzr_1*3+
qbzr_2*-2+
qbzr_3*-3+
zyzr_1*3+
zyzr_2*-2+
zyzr_3*-3+
tdzr_1*3+
tdzr_2*-1+
tdzr_3*-2+
cyzr_1*3+
cyzr_2*0+
cyzr_3*-1+
myzr_1*3+
myzr_2*1+
wfrd_1*3+
wfrd_2*0+
wfrd_3*-2+
swrs_1*3+
swrs_2*-15+
szrs_1*3+
szrs_2*-15+
zsrs_1*3+
zsrs_2*-5+
zsrs_3*-10+
qsrs_1*2+
qsrs_2*-1+
qsrs_3*-5+
qsrs_4*-10+
ccss_1*2+
ccss_2*0+
ccss_3*-1+
ccss_4*-3+
ccss_5*-5)+ if(sfzh like '52%',0,-10) as score
FROM zc_driver_matrix )a
left join
(select count(0) as num from zc_driver_matrix)b
on 1=1)c;
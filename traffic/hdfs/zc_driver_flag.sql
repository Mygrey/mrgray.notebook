use traffic;

insert overwrite table zc_driver_flag
SELECT
sfzh,
score,
rank,
num,
case when rank<=num*0.2 then 1
when rank>num*0.2 and rank<=num*0.5 then 2
when rank>num*0.5 and rank<=num*0.8 then 3
when rank>num*0.8 and rank<=num*0.9 then 4
else 5 end as level,
case when rank>=num*0.9 then 0 else 1 end as label
FROM(
SELECT
a.sfzh,
a.score,
b.num,
row_number() over (partition by b.num order by a.score desc) rank
FROM(
select
sfzh,
500+(jl+zt+ryzt+max_wfxw+level1_count+level2_count+level3_count+wfxw_count+max_wfjfs+avg_wfjfs+wfjfs_count+max_fkje+avg_fkje+fkje_count+max_znj+avg_znj+znj_count+qzcs+cqts+sfty+qbzr+zyzr+tdzr+cyzr+myzr+wfrd+swrs+szrs+zsrs+qsrs+zjccss+local_score) as score
from (
select
sfzh,
case when jl<1 then 1
when jl>=1 and jl<3 then 2
when jl>=3 and jl<5 then 3
when jl>=5 and jl<10 then 4
else 5 end jl,
case when zt=1 then 5
when zt=2 then -3
when zt=3 then -10
else -15 end zt,
if(ryzt=0,3,-10) as ryzt,
case when max_wfxw=0 then 3
when max_wfxw=1 then 0
when max_wfxw=2 then -3
else -5 end max_wfxw,
level1_count*-1 as level1_count,
level2_count*-3 as level2_count,
level3_count*-5 as level3_count,
wfxw_count*-0.5 as wfxw_count,
max_wfjfs*-1 as max_wfjfs,
avg_wfjfs*-0.5 as avg_wfjfs,
wfjfs_count*-0.3 as wfjfs_count,
if(max_fkje>2000,-10,ceil(max_fkje/100.0)*-0.5)as max_fkje,
if(avg_fkje>2000,-10,ceil(avg_fkje/100.0)*-0.5) as avg_fkje,
if(fkje_count>6000,-10,ceil(fkje_count/200.0)*-0.3) as fkje_count,
if(max_znj>1000,-10,ceil(max_znj/50.0)*-0.5) as max_znj,
if(avg_znj>600,-10,ceil(avg_znj/30.0)*-0.5) as avg_znj,
if(znj_count>1500,-10,ceil(znj_count/50.0)*-0.3) as znj_count,
qzcs*-3 as qzcs,
if(cqts>100,-10,cqts*-0.1) as cqts,
if(sfty=1,-10,3) as sfty,
qbzr*-5 as qbzr,
zyzr*-4 as zyzr,
tdzr*-3 as tdzr,
cyzr*-2 as cyzr,
myzr*0.5 as myzr,
wfrd*-1 as wfrd,
swrs*-15 as swrs,
szrs*-10 as szrs,
zsrs*-5 as zsrs,
qsrs*-2 as qsrs,
case when zjccss>10000 then -10
else ceil(zjccss/100.0)*-0.1 end zjccss,
if(sfzh like '52%',5,0) as local_score
from zc_driver_feature
) d
 )a
left join
(select count(0) as num from zc_driver_matrix)b
on 1=1)c;
